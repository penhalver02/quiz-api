## Configurando a aplicação
`docker-compose build`
`docker-compose run --rm app bin/setup`
### Running Application
`docker-compose up`
A aplicação está rodando no localhost

## Endpoints
Get /categories
`curl http://localhost:3000/categoriesi`

POST /rounds
`curl -XPOST -H "Content-type: application/json" -d "{\"round\":{\"player_name\":\"Lucas\",\"category_id\":1}}" http://localhost:3000/rounds`

GET /round/id
`curl -XGET 'http://localhost:3000/rounds/1'`

GET/round/id/result
`curl -XGET 'http://localhost:3000/rounds/1/result'`

POST /round/id/answer
`curl -XPOST -H "Content-type: application/json" -d "{\"answer\":{\"question_id\":2,\"option_id\":4}}" http://localhost:3000/rounds/4/answers`

## Rodando os testes
`docker-compose run --rm -e RAILS_ENV=test app rspec`
