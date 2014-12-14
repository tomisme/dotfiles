function secrets
	sudo swapoff -a
tomb open secrets.tomb -k secrets.tomb.key
end
