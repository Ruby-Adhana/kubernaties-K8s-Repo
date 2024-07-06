sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=192.168.0.0
kubeadm init --apiserver-advertise-address=192.168.0.0 --pod-network-cidr=192.168.0.0/16 
kubeadm init --apiserver-advertise-address=10.0.0.4 --pod-network-cidr=192.168.0.0/16  --ignore-preflight-errors=all   
kubeadm init --pod-network-cidr=192.168.0.0/16  --ignore-preflight-errors=all   

mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-cert-extra-sans=kubeadmclstr.esatasia.cloudapp.azure.com --control-plane-endpoint=104.214.186.103


You can now join any number of control-plane nodes by copying certificate authorities
and service account keys on each node and then running the following as root:

  kubeadm join 104.214.186.103:6443 --token wt03qy.luhl3346z8xrexb8 \
        --discovery-token-ca-cert-hash sha256:8a9320bf21c07f9c46c30590b60c524ab9b04c319d66859c107a89f383a5e105 \
        --control-plane 

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 104.214.186.103:6443 --token wt03qy.luhl3346z8xrexb8 \
        --discovery-token-ca-cert-hash sha256:8a9320bf21c07f9c46c30590b60c524ab9b04c319d66859c107a89f383a5e105 
