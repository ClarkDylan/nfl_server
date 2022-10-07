const { Client } = require('pg');
const express = require('express');
const cors = require('cors');
const app = express();
app.use(express.json());
app.use(cors());

const config = require('./config.js')[process.env.NODE_ENV || "dev"]
const PORT = config.port;

const client = new Client({
  connectionString: config.connectionString
});

client.connect();

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}.`)
});


app.get('/api/players', (req, res) => {
  client.query("SELECT * FROM player_list")
    .then(result => {
      res.status(200).send(result.rows)
    })
})

app.get('/api/players/:id', (req, res) => {
  let playerId = req.params.id;
  client.query("SELECT * FROM player_list WHERE id =$1", [playerId])
    .then(result => {
      res.status(200).send(result.rows)
    })
})

app.get('/api/teams', (req, res) => {
  client.query("SELECT * FROM team_list")
    .then(result => {
      res.status(200).send(result.rows)
    })
})

app.post('/api/players/add', (req, res) => {
  let playerBody = req.body;
  client.query('INSERT INTO player_list (team_id, first_name, last_name, team, position, is_healthy) VALUES ($1, $2, $3, $4, $5, $6)', [playerBody.team_id, playerBody.first_name, playerBody.last_name, playerBody.team, playerBody.position, playerBody.is_healthy])
    .then(result => {
      res.status(201).send('New player has been created')
    })
})

app.delete('/api/players/delete/:id', (req, res) => {
  var playerId = req.params.id;
  client.query('DELETE FROM player_list WHERE id = $1', [playerId])
    .then(result => {
      res.status(200).send('Player removed successfully')
    })
})

app.patch('/api/players/update/:id', (req, res) => {
  var playerId = req.params.id;
  var first_name = req.body.first_name;
  var last_name = req.body.last_name;
  var team = req.body.team;
  var position = req.body.position;
  var is_healthy = req.body.is_healthy;

  client.query('UPDATE player_list SET first_name = COALESCE($1, first_name), last_name = COALESCE ($2, last_name), team = COALESCE ($3, team), position = COALESCE ($4, position), is_healthy = COALESCE($5, is_healthy) WHERE id = $6', [first_name, last_name, team, position, is_healthy, playerId])
    .then(res => {
      res.status(200).send('Player updated successfully')
    })
})