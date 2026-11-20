# openjdk-21-slim-font

Java 21 runtime for OA PDF invoice rendering, retaining the existing Chinese font packages and Ghostscript.

## Security update

The `21.0.13.1-2` and `latest` tags use Eclipse Temurin **21.0.13.1+2** on Ubuntu Jammy, fixing **CVE-2026-114938 (Java4Shell)**. See [Adoptium's advisory](https://adoptium.net/news/2026/11/temurin-november-2026-cspu-java4shell).

The official fixed JRE binary is installed with a pinned SHA-256 because the matching official container tag is not yet available. The image retains its existing `linux/amd64` publishing platform.

CI builds the image, checks the exact JVM runtime version and installed font packages, then pushes that same verified image to Docker Hub. Existing font packages and Ghostscript are preserved.

Updating this base does not patch previously built OA images or running containers. Rebuild API, consumer and batch from the updated base and redeploy every instance. Prefer the published digest when selecting the base for a release.

The GitHub source repository retains its historical name. Java 21 is published to the separate `lm2343635/openjdk-21-slim-font` Docker Hub repository. Existing Java 17 tags are preserved.
