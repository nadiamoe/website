FROM nginx:1.27.3@sha256:fb197595ebe76b9c0c14ab68159fd3c08bd067ec62300583543f0ebda353b5be

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
