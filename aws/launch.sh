ansible-playbook -i hosts key.yml -vvv
sleep 10
ansible-playbook -i hosts deploy.yml -vvv
sleep 20

