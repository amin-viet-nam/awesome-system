kubectl create configmap awesome-api-nginx-conf \
	--from-file=`dirname $0`/awesome.conf \
	-n default \
	--dry-run -o yaml | kubectl apply -f -
