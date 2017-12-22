FROM base-image as parent
RUN apk add pkg
FROM child-image
COPY --from=parent x y
