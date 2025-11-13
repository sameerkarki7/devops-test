# 🚀 DevOps Test Project

## 📝 Overview
This is a **simple Node.js app** with:  
- **Docker containerization** 🐳  
- **CI/CD using GitHub Actions** ⚙️  
- **Logging & monitoring with Loki + Grafana** 📊  
- **Automated deployment via Bash script** 💻  

---

## 🖥 Steps to Run Everything (Terminal Style)

```bash
# 🔹 1. Clone the repository
git clone https://github.com/sameerkarki7/devops-test.git
cd devops-test

# 🔹 2. Start the app + monitoring stack
docker-compose up -d --build
# 🟢 This will build the Docker image and start the Node app + Loki + Grafana

# 🔹 3. Check if the Node.js app is running
curl http://localhost:3000
# ✅ Output should be: Hello from DevOps Test!

# 🔹 4. Open Grafana to see logs & metrics
# URL: http://localhost:3001
# Login: admin / admin
# Add Loki as a data source: http://loki:3100
# Explore logs: filter by container_name=devops-test-app
# 📊 You should see logs like:
# "Server running on port 3000"
# "Request received on /"

# 🔹 5. Or deploy automatically using the Bash script
./deploy.sh       # Git Bash / WSL
bash deploy.sh    # PowerShell
# ⚡ Script will check Docker, build image, start containers, and confirm success

# 🔹 6. CI/CD Workflow
# Triggered automatically on push or PR to main branch
# Steps:
#   1️⃣ Build Docker image
#   2️⃣ Run a quick test:
curl http://localhost:3000
#   3️⃣ If successful, prints: Build and Test passed 🎉

📌 Key Notes
  ## Key Notes

- **Node.js App:** Simple Express server that responds with "Hello from DevOps Test!" and logs requests to console.

- **Docker & Docker Compose:**  
  - Dockerfile builds the Node.js app image.  
  - docker-compose.yml runs the app and monitoring stack in separate containers.  
  - Port mapping: app → 3000, Grafana → 3001.

- **Bash Deployment Script (deploy.sh):**  
  - Checks if Docker is installed.  
  - Builds the Docker image.  
  - Starts containers with `docker-compose up -d`.  
  - Waits and checks if the app container is running.  
  - Prints success or failure message.

- **Logging & Monitoring:**  
  - Promtail collects logs from the Node.js container.  
  - Loki stores logs for querying.  
  - Grafana visualizes logs and metrics.  
  - Logs track server start and HTTP requests.

- **CI/CD (GitHub Actions):**  
  - Trigger: push or pull request to main branch.  
  - Builds Docker image.  
  - Runs a test using `curl http://localhost:3000`.  
  - Prints “Build and Test passed” if successful.  
  - Ensures only working code is deployed.

- **Access & Verification:**  
  - Node.js app: `http://localhost:3000`  
  - Grafana dashboard: `http://localhost:3001`  
  - Check logs: `container_name=devops-test-app`

- **Challenges / Assumptions:**  
  - Bash script requires Git Bash or WSL on Windows.  
  - Docker Desktop must be running.


