FROM node:15

LABEL maintainer "mikoto2000 <mikoto2000@gmail.com>"
LABEL version="v11.7.6"
LABEL description "textlint: 11.7.6, textlint-rule-prh, textlint-rule-preset-ja-technical-writing, textlint-rule-preset-jtf-style"

RUN npm install -g textlint \
    && npm install -g @textlint/textlint-plugin-markdown \
    && npm install -g prh \
    && npm install -g textlint-rule-prh \
    && npm install -g textlint-rule-preset-ja-technical-writing \
    && npm install -g textlint-rule-preset-jtf-style

CMD ["bash"]
