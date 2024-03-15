## Configurando a aplicação
Realizando o build da imagem.
```
docker-compose build
```
Realizar o setup da aplicação.
```
docker-compose run --rm app bin/setup
```
### Running Application
Subindo a aplicação
```
docker-compose up
```
A aplicação está rodando no localhost porta 3000

## Endpoints
Get /categories
```
curl http://localhost:3000/categories
```
![image](https://github.com/penhalver02/quiz-api/assets/55254573/4defc433-27de-413e-9bd8-f295867c0523)

POST /rounds
```
curl -XPOST -H "Content-type: application/json" -d "{\"round\":{\"player_name\":\"Lucas\",\"category_id\":1}}" http://localhost:3000/rounds
```
![image](https://github.com/penhalver02/quiz-api/assets/55254573/bc4ebaa6-5f31-474e-982e-8e2723a8f9dc)


GET /round/id
```
curl -XGET 'http://localhost:3000/rounds/1'
```

![image](https://github.com/penhalver02/quiz-api/assets/55254573/a351ce64-ba0d-40f3-915f-13429aad8489)

GET/round/id/result
```
curl -XGET 'http://localhost:3000/rounds/1/result'
```

![image](https://github.com/penhalver02/quiz-api/assets/55254573/a94dee33-ed3c-4617-9b5b-26991a0ef7ac)


POST /round/id/answer
```
curl -XPOST -H "Content-type: application/json" -d "{\"answer\":{\"question_id\":2,\"option_id\":4}}" http://localhost:3000/rounds/4/answers
```
![image](https://github.com/penhalver02/quiz-api/assets/55254573/4cda6547-d9e6-49b9-a733-e8a39bdd0d22)


## Rodando os testes
```
docker-compose run --rm -e RAILS_ENV=test app rspec
```
