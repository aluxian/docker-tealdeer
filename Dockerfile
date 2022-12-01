FROM rust:slim AS base
RUN cargo install tealdeer
FROM debian:buster-slim
COPY --from=base /etc/ssl/certs /etc/ssl/certs
COPY --from=base /usr/local/cargo/bin/tldr /bin/tldr
RUN /bin/tldr --update
ENTRYPOINT ["/bin/tldr"]
