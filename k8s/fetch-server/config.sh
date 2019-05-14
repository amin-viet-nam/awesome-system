kubectl create secret generic fetch-server-env --from-env-file=`dirname $0`/fetch-server.env \
	--dry-run -o yaml | kubectl apply -f -
