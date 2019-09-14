#/usr/bin/env sh
EXECUTE_DIR=$(pwd)/certs-anhminhltd.com
CONFIG_DIR=`dirname $0`


# use this to renew let's encrypt ssl for *.anhminhltd.com
brew install certbot

# use this to create certificate
# certbot certonly --manual \
# 	--preferred-challenges dns \
# 	--email developer@anhminhltd.com \
# 	--server https://acme-v02.api.letsencrypt.org/directory \
# 	--agree-tos \
# 	--config-dir $EXECUTE_DIR \
# 	--work-dir $EXECUTE_DIR \
# 	--logs-dir $EXECUTE_DIR \
# 	-d *.anhminhltd.com

certbot renew \
	--config-dir $EXECUTE_DIR \
	--work-dir $EXECUTE_DIR \
	--logs-dir $EXECUTE_DIR \

cp $EXECUTE_DIR/live/anhminhltd.com-0001/fullchain.pem anhminhltd.com.crt
cp $EXECUTE_DIR/live/anhminhltd.com-0001/privkey.pem anhminhltd.com.key

kubectl create secret generic istio-ingressgateway-certs \
	--from-file=$CONFIG_DIR/anhminhltd.com.crt \
	--from-file=$CONFIG_DIR/anhminhltd.com.key \
	-n istio-system \
	--dry-run -o yaml | kubectl apply -f -