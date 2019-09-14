mongodump -h 127.0.0.1 -u root -p ltmBb9bzg0 -d awesome -o awesome --authenticationDatabase admin
mongorestore -h 127.0.0.1 -u root -p ltmBb9bzg0 -d awesome awesome --authenticationDatabase admin

mongo -u root -p ltmBb9bzg0

db.getCollection('content').update({},{$set : {"status":"published", "published_at": new Date()}},{upsert:false,multi:true})

docker run --name awesome-cms -p 8080:80 -v /Users/minh/Desktop/awesome/awesome-cms-webpage/dist:/usr/share/nginx/html:ro -d nginx



# config mongodb -> use awesome
mongo --port 27017 -u "root" -p "ltmBb9bzg0" --authenticationDatabase "admin"

db.createUser(
  {
    user: 'admin',
    pwd: 'ltmBb9bzg0',
    roles: [ { role: 'root', db: 'awesome' } ]
  }
);

db.grantRolesToUser('admin', [{ role: 'root', db: 'admin' }])

db.grantRolesToUser('admin', [{ role: 'readWrite', db: 'awesome' }])
db.grantRolesToUser('admin', [{ role: 'userAdminAnyDatabase', db: 'admin' }])

<!-- db.grantRolesToUser("admin", ["readWrite"]) -->