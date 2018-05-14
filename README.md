# Fuber

Book cabs from a fleet of go and pink cabs. The HTTP server runs on `sinatra`

## Dependencies

- Bundler
- Ruby

## Usage

- Install gems: `bundle install`
- CLI: `ruby run.rb`
- HTTP Server: `ruby server.rb`

## HTML Response

- `http://localhost:4567`

## JSON API Response

- Get count of cabs: GET `localhost:4567/api/cabs.json`
- Book a new pink cab: POST `localhost:4567/api/cabs/book/pink.json`
- Book a new go cab: POST `localhost:4567/api/cabs/book/go.json`
