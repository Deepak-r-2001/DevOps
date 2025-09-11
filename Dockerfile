# Build a tiny static web image using nginx
FROM nginx:stable-alpine
LABEL maintainer="your-name@example.com"

# Remove default nginx content and copy our static site
RUN rm -rf /usr/share/nginx/html/*
COPY ./app /usr/share/nginx/html

EXPOSE 80

# Keep nginx foregrounded
CMD ["nginx", "-g", "daemon off;"]
