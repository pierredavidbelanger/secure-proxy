server {
  listen 443 ssl;
  ssl_certificate /var/lib/cert/cert.pem;
  ssl_certificate_key /var/lib/cert/key.pem;
  location / {
    proxy_buffer_size 128k;
    proxy_buffers 4 256k;
    proxy_busy_buffers_size 256k;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_pass http://{TARGET_HOST};
  }
}