# Somtomorrow

Somtomorrow is a Somtoday client that's actually good. It interfaces with Somtoday via the [Somtoday API](https://github.com/MJTSgamer/somtoday-api-docs), and provides a nicer, more responsive interface with additional features.

## Features

- Notifications when the schedule changes
- Linking the schedule to your phones calendar
- Refresh button on the schedule
- Sensible layout for the schedule, showing breaks and gaps like the site does
- Fancy animations and better color palette

## It's not real (yet)

This project started of more than a year ago as a Rust project. I decided to rewrite in Phoenix because I actually know how to use it LOL.

I don't have a lot of time, so I work on this now and then. At this point, the frontend is mostly done design wise, but the backend is still non-existant. This is the roadmap at the moment:

- [x] Finish design
- [ ] Write a nice wrapper around the Somtoday REST API
- [ ] Authentication (somehow?)
  - [ ] Handle refreshing token properly in a GenServer
- [ ] Schedule notifications (look into how this works on iOS)
- [ ] Link the frontend to the backend
- [ ] Use PubSubs to have live updates

Authentication especially is hard, because we don't have a return URL for the OAuth flow, and PWAs cannot register URL schemes (yet?). At the moment I'm using a quick and dirty python script to obtain an access and refresh tokens.

## How to run?

Open clone the project and run this:

```bash
mix deps.get
mix phx.server
```

You'll then be able to access the demo at <http://localhost:4000/>.
