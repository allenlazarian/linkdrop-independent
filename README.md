# LinkDrop Independent
Standalone mobile-friendly video downloader with an independent Python/FastAPI backend.

## Deployment
The application source is shipped in `deploy.tar.xz` and extracted by the Dockerfile at build time. This repository powers a free-tier Render web service. Open the website in Safari and use your own access key when prompted.

This is separate from AppDeploy. Public and embeddable video downloads are best-effort; DRM, login restrictions, private videos and blocked datacenter traffic are not bypassed. No paid download API is included.

## Security
The hosted downloader uses a private `LINKDROP_ACCESS_KEY` set in Render. Never put the key into GitHub. Video files expire after 40 minutes. Free Render instances sleep when idle and have resource/bandwidth limits. Avoid paid upgrades or overages.

## Local dev
Extract the archive with `tar -xJf deploy.tar.xz`, install `requirements.txt`, then run `uvicorn linkdrop.server:app --host 0.0.0.0 --port 8765`.
