from flask import Flask, redirect, request, session, url_for
import requests
import jwt
import os

app = Flask(__name__)
app.secret_key = "super-secret-session-key"

# =========================
# CONFIGURAÇÕES KEYCLOAK
# =========================

KEYCLOAK_BASE_URL = "http://192.168.122.66:8080"
REALM = "python-realm"
CLIENT_ID = "python-app"
CLIENT_SECRET = "SEU_CLIENT_SECRET_AQUI"

REDIRECT_URI = "http://192.168.122.66:5000/callback"

AUTH_URL = f"{KEYCLOAK_BASE_URL}/realms/{REALM}/protocol/openid-connect/auth"
TOKEN_URL = f"{KEYCLOAK_BASE_URL}/realms/{REALM}/protocol/openid-connect/token"
LOGOUT_URL = f"{KEYCLOAK_BASE_URL}/realms/{REALM}/protocol/openid-connect/logout"

# =========================
# ROTAS
# =========================

@app.route("/")
def index():
    if "user" in session:
        user = session["user"]
        return f"""
        <h1>Usuário logado</h1>
        <pre>{user}</pre>
        <a href="/logout">Logout</a>
        """
    return '<a href="/login">Login com Keycloak</a>'


@app.route("/login")
def login():
    return redirect(
        f"{AUTH_URL}"
        f"?client_id={CLIENT_ID}"
        f"&response_type=code"
        f"&scope=openid profile email"
        f"&redirect_uri={REDIRECT_URI}"
    )


@app.route("/callback")
def callback():
    code = request.args.get("code")

    if not code:
        return "Erro: código de autorização não encontrado", 400

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
        },
    )

    # 🔎 DEBUG OBRIGATÓRIO
    print("STATUS:", token_response.status_code)
    print("BODY:", token_response.text)

    if token_response.status_code != 200:
        return f"Erro ao obter token:<br>{token_response.text}", 400

    token = token_response.json()
    access_token = token["access_token"]

    user_info = jwt.decode(
        access_token,
        options={"verify_signature": False, "verify_aud": False},
    )

    session["user"] = user_info
    session["access_token"] = access_token

    return redirect(url_for("index"))

    # =========================
    # TROCA CODE → TOKEN
    # =========================
  #  token_response = requests.post(

        TOKEN_URL,
        data={
            "grant_type": "authorization_code",
            "client_id": CLIENT_ID,
            "client_secret": CLIENT_SECRET,
            "code": code,
            "redirect_uri": REDIRECT_URI,
        },
        headers={"Content-Type": "application/x-www-form-urlencoded"},
    )

    if token_response.status_code != 200:
        return f"Erro ao obter token: {token_response.text}", 400

    token = token_response.json()
    access_token = token["access_token"]

    # =========================
    # DECODIFICA ACCESS TOKEN
    # (sem validar assinatura – DEV ONLY)
    # =========================
    user_info = jwt.decode(
        access_token,
        options={"verify_signature": False, "verify_aud": False},
    )

    session["user"] = user_info
    session["access_token"] = access_token

    return redirect(url_for("index"))


@app.route("/logout")
def logout():
    session.clear()

    return redirect(
        f"{LOGOUT_URL}"
        f"?client_id={CLIENT_ID}"
        f"&post_logout_redirect_uri=http://192.168.122.66:5000/"
    )


# =========================
# START APP
# =========================
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

