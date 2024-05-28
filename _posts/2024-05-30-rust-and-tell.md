---
title: "Rust and Tell - It is not June yet"
date: "2024-05-30 18:30:00 +0200"
categories: meetup
location: hedwig-dohm-haus
links:
    "Meetup.com": https://www.meetup.com/rust-berlin/events/299288963/
talks:
- title: "ursund - an application for musical improvisation built in Rust"
  speaker:
    name: Johan Thelander Lövgren
- title: "Cijail: How to protect your CI/CD pipelines from supply chain attacks?"
  speaker:
    name: Ivan Gankevich
- title: "TBD"
  speaker:
    name: "TBD"
---

We are delighted to announce the next edition of Rust and Tell Berlin!
We are grateful, that the Hedwig-Dohm-Haus will feature us! Please note, that this event is not sponsored, which means drinks will not be free!

**Line-Up:**

_ursund - an application for musical improvisation built in Rust_ by Johan Thelander Lövgren

Building software for music making needs a delicate balance. The creative act wants to be free flowing and endlessly flexible, but computers wants things to be clearly defined - and ideally in advance. This contrast means that music technology often suffers from either too much control or too little - either requiring too many decisions be made beforehand at the cost of musical freedom, or allowing free improvisation but only within a narrow mode of working. The project started as a way to enable the way of working that I envisioned, and after many iterations i chose to build it all in rust - for the speed and portability. It has now gotten to a stable enough point where I can use it as my main musical tool and perform on stage with it. In my talk I would do a short demo, and talk about the concepts behind it as well as the technical decisions I made and those I am still considering.

_Cijail: How to protect your CI/CD pipelines from supply chain attacks?_ by Ivan Gankevich

Supply chain attacks are especially popular nowadays, and there is a good reason for that. Many build tools such as Cargo, Pip, Npm were not designed to protect from them. At the same time there are similar tools such as Nix and Guix build systems that are particularly successful in mitigating such attacks. These tools precisely control what files are downloaded over the network before the build starts and prohibit any network access during the build itself. In this talk I introduce a tool called Cijail that allows you to adopt similar rules for other build systems. This tool is based on Seccomp, can be run inside CI/CD pipelines, and does not require superuser privileges. It protects from data exfiltration via DNS and via other means effectively limiting the damage supply chain attacks can cause to a single computer or even an application container. The tool is open source and written in Rust.
