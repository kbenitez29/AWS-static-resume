# AWS Static Portfolio Website

A personal portfolio website hosted on AWS using a serverless static hosting architecture.

The goal of this project was to gain hands-on experience with cloud infrastructure, Infrastructure as Code and content delivery services while building a real website that can be publicly deployed.

---
## Live Demo

https://portfolio.kevin-benitez-t.workers.dev/

---
## Current Architecture 

```text
User
  ↓
Cloudflare Pages (CDN)
  ↓
Static Website
```

Now the website is hosted in Cloudflare Pages due to cost-efficient static hosting strategies.

---

## Architecture (Previously)

```text
User
  ↓
CloudFront
  ↓
Private S3 Bucket
```

The website was stored in a private Amazon S3 and delivered through CloudFront over HTTPS.

CloudFront acts as the public entry point and securely accesses the bucket through Origin Access Control (OAC).

---

## AWS Version (Learning Project)

* Static website hosting
* HTTPS delivery through CloudFront
* Private S3 bucket
* Origin Access Control (OAC)
* Infrastructure managed with Terraform
* IAM-based access control


---

## Screenshots

### Homepage

![Homepage](screenshots/home.png)

### Projects Section

![Projects](screenshots/projects.png)


---


## Future Improvements

* Custom domain using Route 53
* Automated deployments through GitHub Actions
* Additional Terraform modules
* Expanded portfolio content
