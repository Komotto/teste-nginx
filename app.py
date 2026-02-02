from flask import Flask, redirect, request, session, url_for
import requests

app = Flask(__name__)
app.secret_key = "segredo-super-simples"

KEYCLOAK_URL = "http://192.168.122.66:8080"
REALM = "python-realm"
CLIENT_ID = "python-app"

AUTH_URL = f"{KEYCLOAK_URL}/realms/{REALM}/protocol/openid-connect/auth"
TOKEN_URL = f"{KEYCLOAK_URL}/realms/{REALM}/protocol/openid-connect/token"
USERINFO_URL = f"{KEYCLOAK_URL}/realms/{REALM}/protocol/openid-connect/userinfo"

REDIRECT_URI = "http://192.168.122.66:5000/callback"


@app.route("/")
def home():
    if "user" not in session:
        return '<h2>Você não está logado</h2><a href="/login">Login</a>'
    return f"""
        <h2>Olá {session['user']['preferred_username']}</h2>
        <a href="/logout">Logout</a>
    """


@app.route("/login")
def login():
    return redirect(
        f"{AUTH_URL}"
        f"?client_id={CLIENT_ID}"
        f"&response_type=code"
        f"&scope=openid"
        f"&redirect_uri={REDIRECT_URI}"
    )


@app.route("/callback")
def callback():
    code = request.args.get("code")

    if not code:
        return "Erro: code não recebido", 400

    token_response = requests.post(
        TOKEN_URL,
        data={
            "grant_type": "authorization_code",
            "client_id": CLIENT_ID,
            "code": code,
            "redirect_uri": REDIRECT_URI,
        },
        headers={
            "Content-Type": "application/x-www-form-urlencoded"
        }
    )

    # 🔎 DEBUG
    print("TOKEN STATUS:", token_response.status_code)
    print("TOKEN BODY:", token_response.text)

    if token_response.status_code != 200:
        return f"Erro ao obter token:<br>{token_response.text}", 400

    token = token_response.json()

    userinfo_response = requests.get(
        USERINFO_URL,
        headers={
            "Authorization": f"Bearer {token['access_token']}"
        }
    )

    print("USERINFO STATUS:", userinfo_response.status_code)
    print("USERINFO BODY:", userinfo_response.text)

    if userinfo_response.status_code != 200:
        return f"Erro ao obter userinfo:<br>{userinfo_response.text}", 400

    session["user"] = userinfo_response.json()
    return redirect(url_for("home"))


@app.route("/logout")
def logout():
    session.clear()
    return redirect("/")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

