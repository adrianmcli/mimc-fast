# Based on https://github.com/DazWilkin/do-apps-rust
FROM rust:1.52 as builder
WORKDIR /app
ADD . ./
RUN echo "fn main() { println!(\"Hello, world!\");}" > ./mimc-fast/src/main.rs
RUN cargo build --release
COPY ./mimc-fast/src/main.rs ./mimc-fast/src/main.rs
RUN rm /app/target/release/deps/mimc_fast*
RUN cargo build --release

FROM debian:buster-slim as runtime
WORKDIR /bin
COPY --from=builder /app/target/release/mimc-fast ./server

RUN apt-get update \
    && apt-get install -y ca-certificates tzdata \
    && rm -rf /var/lib/apt/lists/*

ENV TZ=Etc/UTC \
    USER=appuser

RUN groupadd ${USER} \
    && useradd -g ${USER} ${USER} && \
    chown -R ${USER}:${USER} /bin

USER ${USER}
EXPOSE 8000

ENTRYPOINT ["RUST_LOG=info ./server"]
