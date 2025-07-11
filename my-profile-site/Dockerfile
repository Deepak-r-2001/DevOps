# Use official nginx image
FROM nginx:alpine

# Remove default nginx index.html
RUN rm /usr/share/nginx/html/*

# Copy our html file to nginx's html folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
