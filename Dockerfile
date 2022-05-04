FROM node:14.18.1-alpine
ADD discover-nodejs-memory-limit.js .
CMD ["sh"]
ENTRYPOINT ["node", "discover-nodejs-memory-limit.js"]
# ENTRYPOINT ["node", "--max-old-space-size=200", "discover-nodejs-memory-limit.js"]
# ⬆️ Node.js has a GC race condition, but setting `--max-old-space-size` to lower than the container limit doesn't appear to help.
