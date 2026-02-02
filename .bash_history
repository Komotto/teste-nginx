history 
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo docker run hello-world
docker images
firewall-cmd --list-ports 
firewall-cmd --add-port=6443/tcp --permanent 
firewall-cmd --reload
curl -sfL https://get.k3s.io | sh -
sudo k3s kubectl get nodes
history 
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --type=NodePort --port=80
kubectl get svc
sudo cat /var/lib/rancher/k3s/server/node-token
curl -sfL https://get.k3s.io | K3S_URL=https://IP_MASTER:6443 K3S_TOKEN=TOKEN sh -
sudo k3s kubectl get nodes
kubectl run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:latest start-dev
kubectl run --help
history 
docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:latest start-dev
vim docker-compose.yaml
docker compose up -d
ip a
sudo dnf update -y
dnf install python
mkdir python-keycloak
cd python-keycloak
python3 -m venv venv
source venv/bin/activate
vim requirements.txt
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
vim app.py
python app.py
sudo firewall-cmd --add-port=5000/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports 
history 
vim app.py
python app.py
vim app.py
history 
vim app.py
python app.py
vim docker-compose.yaml 
vim app.py
sudo firewall-cmd --add-port=5000/tcp --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
ps aux | grep app.py
ss -tulnp | grep 5000
python app.py
sudo pip install flask requests
sudo dnf install flask requests
dnf install flask requests
python app.py
curl http://127.0.0.1:5000
curl http://192.168.122.66:5000
ss -tulnp | grep 5000
getenforce
firewall-cmd --list-ports
ip a
dnf install -y python3-pip
pip3 --version
pip install flask requests
mkdir -p /root/python-keycloak
cd /root/python-keycloak
python3 -m venv venv
source venv/bin/activate
pip install flask requests
pip list
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
python app.py
vim app.py 
> app.py 
vim app.py 
python app.py
pip install flask requests pyjwt
pip install --upgrade pip
python app.py
vim app.py 
python app.py
ll
python app.py
ll
vim docker-compose.yaml 
docker compose up -d
docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:latest start-dev
systemctl status docker
systemctl status k3s
docker image
docker image ls

ll
vim app.py 
python app.py 
vim app.py 
ll
vim docker-compose.yaml 
cd python-keycloak/
ll
vim app.py 
ll
cd venv/
ll
cd
ll
vim app.py 
cp app.py app.py.bkp
ll
> app.py 
vim app.py 
python app.py
> app.py
vim app.py.bkp 
cp app.py.bkp app.py
vim app.py
python app.py
vim app.py.bkp 
> app.py
vim app.py
python app.py
vim app.py
python app.py
vim app.py
python app.py
vim app.py
cd python-keycloak/
ll
vim app.py 
ll
cd venv/
ll
cd ..
vim app.py 
cd
python app.py
history grep cp
history | grep cp
cp app.py.bkp app.py
python app.py
vim app.py 
cd python-keycloak/
ll
vim app.py 
python app.py
cd
python app.py
vim app.py
python app.py
vim app.py
python app.py
ll
cd python-keycloak/
ll
vim requirements.txt 
vim app.py 
cd 
cd python-keycloak/
cd venv/
ll
cd
keyctl --version
docker ps
docker inspect keycloak | grep Image
ll
bin/kc.sh export   --realm nome-do-realm   --file realm-export.json
cd python-keycloak/
ll
cd venv/
ll
bin/kc.sh export   --realm nome-do-realm   --file realm-export.json
cd bin/
ll
cd
cat docker-compose.yaml
docker ps
ip a
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get nodes
docker exec keycloak   /opt/keycloak/bin/kc.sh export   --realm nome-do-realm   --file /opt/keycloak/data/import/realm.json
docker ps
ll
python app.py
history | grep docker
 docker compose up -d
docker ps
docker exec keycloak   /opt/keycloak/bin/kc.sh export   --realm nome-do-realm   --file /opt/keycloak/data/realm-export.json
docker exec keycloak   /opt/keycloak/bin/kc.sh export   --realm python-realm   --file /opt/keycloak/data/realm-export.json
docker cp keycloak:/opt/keycloak/data/realm-export.json .
cat docker-compose.yaml
ls -lh realm-export.json
head realm-export.json
docker exec keycloak   /opt/keycloak/bin/kc.sh import   --file /opt/keycloak/data/realm-export.json
start --import-realm
ll
cd python-keycloak/
ll
vim app.py 
docker cp keycloak:/opt/keycloak/data/realm-export.json .
docker cp keycloak:/opt/keycloak/data/realm-export.json 10.250.61.145
docker cp keycloak:/opt/keycloak/data/realm-export.json 10.250.61.145:Downloads
docker cp keycloak:/opt/keycloak/data/realm-export.json 
cd
ll
vim realm-export.json 
kubectl get pods -n keycloak
docker ps
systemctl status k3s
kubectl get pods -n keycloak
systemctl start k3s
systemctl status k3s
journalctl -u k3s -xe --no-pager
journalctl -u k3s -n 100 --no-pager
ss -lntp | grep 6444
pkill -f k3s
systemctl stop k3s
ss -lntp | grep 6444
systemctl status k3s
systemctl start k3s
systemctl status k3s
ps aux | grep kube-apiserver
systemctl status k3s
mkdir -p /etc/rancher/k3s
vim /etc/rancher/k3s/config.yaml
systemctl stop k3s
pkill -f k3s
sleep 2
ss -lntp | grep -E '6443|6444|6445'
systemctl start k3s
ip a
systemctl status k3s
docker ps
firewall-cmd --list-ports 
systemctl status k3s
systemctl status docker
ll
vim docker-compose.yaml 
vim app.py
dnf remove k3s-selinux
dnf remove k3s
dnf remove k3s-selinux
dnf install k3s-selinux
systemctl status k3s
ll
vim realm-export.json 
vim docker-compose.yaml 
cd python-keycloak/
ll
vim app.py 
kubectl get nodes
systemctl status k3s
cd
ll
docker ps
curl -sfL https://get.k3s.io | sh -
systemctl status k3s
sudo kubectl get nodes
firewall-cmd --list-ports 
docker container ps
docker container ls
kubectl create namespace argocd
kubectl cluster-info
dnf install kubernetes1.3
dnf install kubernetes1.30
systemctl status kubelet.service 
systemctl enable kubelet.service 
systemctl start kubelet.service 
systemctl status kubelet.service 
journalctl -u kubelet -xe --no-pager | tail -n 50
swapon --show
swapoff -a
vim /etc/fstab 
systemctl restart kubelet
systemctl status kubelet.service 
systemctl status containerd
containerd config dump | grep SystemdCgroup
containerd config default > /etc/containerd/config.toml
vi /etc/containerd/config.toml
vim /etc/containerd/config.toml
systemctl restart containerd kubelet
ls /etc/kubernetes/manifests
systemctl status containerd
systemctl status kubelet.service 
systemctl status k3s
systemctl enable k3s
systemctl status k3s
systemctl start k3s
systemctl status k3s
systemctl status kubelet.service 
systemctl restart containerd kubelet
systemctl status kubelet.service 
systemctl stop k3s
systemctl status kubelet.service 
systemctl stop kubelet
systemctl disable kubelet
rm -rf /etc/kubernetes
rm -rf /var/lib/kubelet
rm -rf /etc/systemd/system/kubelet.service.d
systemctl daemon-reload
systemctl status kubelet
/usr/local/bin/k3s-uninstall.sh
rm -rf /etc/rancher /var/lib/rancher /var/lib/kubelet
/usr/local/bin/k3s-uninstall.sh
curl -sfL https://get.k3s.io | sh -
journalctl -u k3s -f
kubectl get nodes
systemctl status k3s
kubectl create namespace argocd
kubectl apply -n argocd   -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get pods -n argocd
kubectl port-forward svc/argocd-server -n argocd 8080:443
firewall-cmd --add-port=90/tcp --permanent 
firewall-cmd --reload
kubectl port-forward svc/argocd-server -n argocd 9090:443
ss -lntp | grep -E '8080|9090|90'
firewall-cmd --add-port=70/tcp --permanent 
firewall-cmd --reload
kubectl port-forward svc/argocd-server -n argocd 7070:443
kubectl -n argocd patch svc argocd-server   -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -n argocd argocd-server
ip a
kubectl get secret argocd-initial-admin-secret   -n argocd -o jsonpath="{.data.password}" | base64 -d
ll
mkdir gitopstest
cd gitopstest/
mkdir apps
cd apps/
mkdir myapp
cd myapp/
mkdir base
mkdir overlays
cd base/
vim deployment.yaml
vim service.yaml
vim kustomization.yaml
cd ..
ll
cd overlays/
ll
mkdir dev
cd dev/
vim kustomization.yaml
cd ..
mkdir prod
cd ..
ll
vim application.yaml
kubectl apply -f apps/myapp/application.yaml
kubectl apply -f application.yaml
systemctl status k3s
docker ps
history 
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
$ chmod 700 get_helm.sh
$ ./get_helm.sh
cd
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
$ chmod 700 get_helm.sh
$ ./get_helm.sh
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4 | bash
sudo dnf install helm
$ helm repo add bitnami https://charts.bitnami.com/bitnami
helm install 
helm install bitnami
helm install  ll
ll
docker ps
