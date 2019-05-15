mongodump -h 127.0.0.1 -u root -p ltmBb9bzg0 -d awesome -o awesome --authenticationDatabase admin
mongorestore -h 127.0.0.1 -u root -p ltmBb9bzg0 -d awesome awesome --authenticationDatabase admin