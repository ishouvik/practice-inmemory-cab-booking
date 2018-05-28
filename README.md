# Fuber

Book cabs from a fleet of go and pink cabs. The HTTP server runs on `sinatra`

## Dependencies

- Bundler
- Ruby

## Usage

- Install gems: `bundle install`
- CLI: `ruby run.rb`
- HTTP Server: `ruby server.rb`
- Test: `rspec spec/<dirname>/<filename>_spec.rb`

## HTML Response

- `http://localhost:4567`

## JSON API Response

| Type        | End point    | Params  | Description
| ----------- |--------------| --------| -----|
|  GET | `/api/cabs.json`      | - | Get count of available pink and go cabs |
| POST | `/api/bookings/:cab_type/new.json` | pickup_lat:float , pickup_long:float, drop_lat:float, drop_long:float, type:string (go/pink) | Create a new booking
| POST | `/api/bookings/:id/delete.json`    | type:string (go/pink) | Deletes booking, ends journey and releases cab
