kubectl create secret generic api-env --from-env-file=`dirname $0`/api.env \
	--dry-run -o yaml | kubectl apply -f -
