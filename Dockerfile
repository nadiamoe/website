FROM nginx:1.27.3-alpine@sha256:4efa432b751239898e576a2178702fb156fc483f6d456e0ad5899b3bf5c0445a

WORKDIR /usr/share/nginx/html/

# Renovate updates the URLs below.
ADD --chmod=0444 \
  https://matcha.mizu.sh/v/3.0.0/matcha.css \
  https://raw.githubusercontent.com/Templarian/MaterialDesign-Webfont/refs/tags/v7.4.47/css/materialdesignicons.min.css \
  https://unpkg.com/xp.css@0.2.3/dist/XP.css \
  https://unpkg.com/xp.css@0.2.3/dist/ms_sans_serif.woff \
  https://unpkg.com/xp.css@0.2.3/dist/ms_sans_serif.woff2 \
  ./css/
ADD --chmod=0444 \
  https://raw.githubusercontent.com/Templarian/MaterialDesign-Webfont/refs/tags/v7.4.47/fonts/materialdesignicons-webfont.eot \
  https://raw.githubusercontent.com/Templarian/MaterialDesign-Webfont/refs/tags/v7.4.47/fonts/materialdesignicons-webfont.ttf \
  https://raw.githubusercontent.com/Templarian/MaterialDesign-Webfont/refs/tags/v7.4.47/fonts/materialdesignicons-webfont.woff \
  https://raw.githubusercontent.com/Templarian/MaterialDesign-Webfont/refs/tags/v7.4.47/fonts/materialdesignicons-webfont.woff2 \
  ./fonts/

ADD --chmod=0444 \
  https://gravatar.com/avatar/38174e9a695ed75df73d0862dfc2239796d4942d347b963ceea66e53d0c40447?s=256 \
  ./images/gravatar.png
ADD --chmod=0444 \
  https://raw.githubusercontent.com/nadiamoe/owo.cafe/refs/heads/main/assets/owocafe-88x31.gif \
  ./images/88x31/buttons/

COPY nginx.conf /etc/nginx/
COPY images/ images/
COPY index.html ad.html robots.txt ./
