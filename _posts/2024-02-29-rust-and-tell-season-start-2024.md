---
title: "Rust and Tell - Season start 2024"
date: "2024-02-29 18:30:00 +0100"
categories: meetup
location: sap
links:
    "Meetup.com": https://www.meetup.com/rust-berlin/events/299190389/
talks:
- title: "Building a fast cross-platform package manager with Rust"
  speaker:
    name: Wolf
- title: "Panel: Rust @ SAP"
- title: "The importance of good hash codes in Rust's hashmap implementation"
  speaker:
    name: Jörn
---

We are delighted to announce the next edition of Rust and Tell Berlin!
We are grateful that SAP is hosting us this time!

**Line-Up**

_Building a fast cross-platform package manager with Rust_ by Wolf

We're betting the horse on Rust and are writing a really fast package manager in Rust that has the potential to replace homebrew, apt-get and winget.
The package manager – pixi – works on Windows, macOS and Linux and installs binary packages from the "conda"-ecosystem.
In the talk we'll go into package managers and some of the low-level crates that make pixi work (such as the SAT solver resolvo and the lower-level `rattler` crates).
We will also discuss what conda packages actually are (most people associate them with data science and Python, but they are actually far more general).
And lastly we'll look at some other cool emerging package managers that are written in Rust, like Orogene and uv.

_Panel: Rust @ SAP_

The three Rust teams within SAP Signavio present which problems they are solving with Rust

_The importance of good hash codes in Rust's hashmap implementation_ by Jörn

In this talks we will take a look into the implementation of hash tables in the rust standard library. The implementation fast, memory efficient and makes use of modern cpu features, but also has high expectations on the quality of the hash codes used. We will show an edge case where a custom hash code implementation lead to slow performance and how a single-line change improved the performance by about 50x

**Speaker Bios**

_Wolf_  
Wolf is the founder and CEO of prefix.dev, a startup in Berlin. He's been active in the conda ecosystem since ~4 years.
Before starting prefix.dev, he wrote the "mamba" package manager (another conda-compatible package manager, but written in C++).
Wolf also initiated and organized the PackagingCon conferences dedicated to the topic of software package management.
