FROM nginx:alpine
COPY index.html style.css /usr/share/nginx/html/
EXPOSE 80
EOFcat > Dockerfile << 'EOF'
FROM nginx:alpine
COPY index.html style.css /usr/share/nginx/html/
EXPOSE 80
