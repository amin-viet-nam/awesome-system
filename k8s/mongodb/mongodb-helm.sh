# https://github.com/bitnami/charts/tree/master/upstreamed/mongodb/#installing-the-chart
helm install --namespace mongodb --name awesome-mongodb -f ./values.yaml stable/mongodb