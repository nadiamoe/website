FROM --platform=${BUILDPLATFORM} alpine:3.23.3@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659 AS build

WORKDIR /build

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
  https://raw.githubusercontent.com/nadiamoe/owo.cafe/refs/heads/main/assets/owocafe-88x31.gif \
  ./images/88x31/buttons/

COPY images/ images/
COPY index.html ad.html robots.txt ./

ARG GIT_REF=main
RUN <<EOF
  git_ref_short=$(printf "%.8s" ${GIT_REF})
  sed -i "s/__GIT_REF__/${GIT_REF}/g" index.html
  sed -i "s/__GIT_REF_SHORT__/${git_ref_short}/g" index.html
EOF

# Fix folder permissions, which apparently docker now creates without the exec bit.
RUN find -type d -perm -004 -print0 | xargs -0 chmod +rx

FROM nginx:1.29.7-alpine@sha256:e7257f1ef28ba17cf7c248cb8ccf6f0c6e0228ab9c315c152f9c203cd34cf6d1

COPY nginx.conf /etc/nginx/
COPY --from=build /build /usr/share/nginx/html/
