FROM ghcr.io/cdowin/claude-code-docker:latest

ARG GODOT_VERSION=4.6.2
ARG GODOT_RELEASE=stable
ARG TARGETARCH

# Install Godot headless binary (arch-aware)
RUN GODOT_ARCH=$([ "$TARGETARCH" = "arm64" ] && echo "arm64" || echo "x86_64") \
  && curl -fsSL "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}-${GODOT_RELEASE}/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux.${GODOT_ARCH}.zip" -o /tmp/godot.zip \
  && apt-get update && apt-get install -y --no-install-recommends unzip \
  && unzip /tmp/godot.zip -d /tmp \
  && mv /tmp/Godot_v${GODOT_VERSION}-${GODOT_RELEASE}_linux.${GODOT_ARCH} /usr/local/bin/godot \
  && chmod +x /usr/local/bin/godot \
  && rm /tmp/godot.zip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install GDScript tooling
RUN apt-get update && apt-get install -y --no-install-recommends python3-pip \
  && pip3 install --break-system-packages gdtoolkit \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify installation
RUN godot --version --headless
