---
title: "Rust and Tell - Rust for the web"
date: "2024-04-23 19:00:00 +0200"
categories: meetup
location: betahaus
links:
    "Meetup.com": https://www.meetup.com/rust-berlin/events/300047151/
talks:
- title: "SpinKube: WebAssembly and the Web"
  speaker:
    name: "Ryan Levick"
- title: "Faster continuous integration runs for Rust"
  speaker:
    name: "Jonas Dohse"
- title: "Panel Discussion"
  speaker:
    name: "Luca Palmieri, Ryan Levick, and Jonas Dohse"
---

Rust Berlin and [Mainmatter] are excited to welcome you to a special “Rust for the web” event!

We'll be joined again by Ryan Levick, former co-host of this meetup!
Our second speaker will be Jonas Dohse and Luca Palmieri will guide through the evening.  
Details about the talks will be published in the next few days.

Hang out, listen to the talks and have some drinks after the event.

**Line-Up**

_SpinKube: WebAssembly and the Web_ by Ryan Levick

WebAssembly has been touted as the next big thing in server-side development for many years,
but it has arguably so far failed to reach the mainstream.
The past 6 months, however, have started to see this status quo change.
The latest developments in the WebAssembly ecosystem have made the promise of
small, fast, and secure-by-default server-side workloads feel much more real and concrete.
In this talk, we'll get you caught up on the latest in the WebAssembly ecosystem with a focus on the WASI HTTP specification and SpinKube.
By the end, you should have a clearer idea of how WebAssembly may change the way you architect your server-side deployments in the future.

_Faster continuous integration runs for Rust_ by Jonas Dohse

Rust's reputation for long compile times is unfortunately not completely unwarranted.
In our project we eventually ended up with 15 minutes to create and run a debug build.
That's way too long.
Long feedback times reduce the utility of continuous integration,
delay critical bug fixes and increase the stress of operating a production system.

In this talk I want to show what we did to reduce our CI run times and how effective this was.
This includes an overview of factors that drive compile times and how to analyze
as well as dependency caching and choice of build tools.
I will also touch on test organization to improve test runtime and alternative test runners.
This will also apply to local builds.

At the end of the talk you should have a good idea about how to improve build times.


**Speaker Bios**

_Ryan Levick_  
Ryan is a principal engineer at Fermyon where he works on Spin and upstream WebAssembly tooling.
He is also a member of the Rust Foundation Board.
In his free time he enjoys running, singing, cooking, travelling and exploring Berlin where he lives.

_Jonas Dohse_  
Jonas is Tech Lead at SAP, supporting a team building an in-memory analytics database in Rust.

[mainmatter]: https://mainmatter.com/
