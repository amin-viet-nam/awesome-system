kubectl create secret generic cms-api-env --from-env-file=`dirname $0`/cms_server.env \
	--dry-run -o yaml | kubectl apply -f -
