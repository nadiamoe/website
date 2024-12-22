FROM nginx:1.27.3-alpine@sha256:41523187cf7d7a2f2677a80609d9caa14388bf5c1fbca9c410ba3de602aaaab4

WORKDIR /usr/share/nginx/html/

# Renovate updates the URLs below.
ADD --chmod=0555 https://matcha.mizu.sh/v/3.0.0/matcha.css .
ADD --chmod=0555 \
  https://cdn.jsdelivr.net/npm/simple-icons-font@v13.21.0/font/simple-icons.min.css \
  https://cdn.jsdelivr.net/npm/simple-icons-font@v13.21.0/font/SimpleIcons.woff \
  https://cdn.jsdelivr.net/npm/simple-icons-font@v13.21.0/font/SimpleIcons.woff2 \
  https://cdn.jsdelivr.net/npm/simple-icons-font@v13.21.0/font/SimpleIcons.otf \
  ./fonts/

COPY . ./
