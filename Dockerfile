FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:latest

ARG INSTALL_COMPONENTS=google-cloud-sdk-pubsub-emulator

RUN gcloud config set project lab-workspace-318620

CMD ["gcloud", "beta", "emulators", "pubsub", "start"]

EXPOSE 8085
