# docker_proxy

1. Clone repo inside the folder where docker-compose.yml is
    ```bash
    git clone git@github.com:erielmejias99/docker_proxy.git
    ```
 
2. Put this iniside like another service inside docker-compose.yml
      ```yml
      service:
        proxy: 
          container_name: docker_proxy
          build:
            context: ./docker_proxy
            dockerfile: Dockerfile
          ports:
            - "80:80"   # http: Not allowed, always returns 101 - UPDATE PROTOCOL
            - "443:443" # https
      ```
      
3. Go inside the foler of the repo open file default.conf and start adding prothing path to your services!
   ```nginx configuration file
    # Sevices url mappgin goes here:
    location /user {
        include /etc/nginx/includes/proxy.conf;
        proxy_pass http://user_service:4000;
    }
   ```

4. Update the Domain name you want to use in the same replazing ficrypt.com and www.ficrypt.com by your domain:
   ```nginx configuration file
   server {
    listen 443 ssl;
    server_name ficrypt.com www.ficrypt.com;
   ```
   
5. Add the same domain from stepp 4 in your /etc/hosts file.
    ```nginx configuration file
    # Host addresses
    127.0.0.1  localhost
    127.0.0.1  www.ficrypt.com  # Local will take priority over remote real domain.

    ::1        localhost ip6-localhost ip6-loopback
    ff02::1    ip6-allnodes
    ff02::2    ip6-allrouters
    ```
    
6. Enjoy!! 
