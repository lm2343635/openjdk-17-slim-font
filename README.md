# openjdk-17-slim-font

Java 17 runtime for OA PDF invoice rendering, retaining the existing Chinese font packages and Ghostscript.

## Security update

The `17.0.21.1-2` and `latest` tags use Eclipse Temurin **17.0.21.1+2** on Ubuntu Jammy, fixing **CVE-2026-114938 (Java4Shell)**. See [Adoptium's advisory](https://adoptium.net/news/2026/11/temurin-november-2026-cspu-java4shell).

CI builds the image, checks the exact JVM runtime version and installed font packages, then pushes that same verified image to Docker Hub. Existing font packages and Ghostscript are preserved.

Updating this base does not patch previously built OA images or running containers. Rebuild API, consumer and batch from the updated base and redeploy every instance. Prefer the published digest when selecting the base for a release.
