FROM scratch
EXPOSE 8080
ADD whoa /whoa
ENTRYPOINT ["/whoa"]
