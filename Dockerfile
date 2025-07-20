# Use official NGINX lightweight image
FROM nginx:alpine

# Remove default NGINX website (optional)
RUN rm -rf /usr/share/nginx/html/*

# Copy your built static files into NGINX directory
COPY dist/ /usr/share/nginx/html

EXPOSE 80