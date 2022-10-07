let listOfResults = document.getElementById('results')
let playerBtn = document.getElementById('playersBtn')
let teamsBtn = document.getElementById('teamsBtn')
let addBtn = document.getElementById('addBtn')


function loadPlayers() {
  listOfResults.innerHTML = "";
  fetch('http://localhost:8000/api/players')
    .then((data) => data.json())
    .then((players) => {
      players.forEach(player => {
        let newPlayer = document.createElement('li');
        newPlayer.innerText = `${player.first_name} ${player.last_name} \n Position: ${player.position} \n Team: ${player.team}`
        listOfResults.append(newPlayer);
      })
    })
}

function loadTeams() {
  listOfResults.innerHTML = "";
  fetch('http://localhost:8000/api/teams')
    .then((data) => data.json())
    .then((teams) => {
      teams.forEach(team => {
        let newTeam = document.createElement('li');
        newTeam.innerText = `${team.name} \n Conference: ${team.conference} \n Head Coach: ${team.head_coach}`
        listOfResults.append(newTeam);
      })
    })
}

function addPlayer() {
  listOfResults.innerHTML = "";
  let playerData = {
    "team_id": null,
    "first_name": null,
    "last_name": null,
    "team": null,
    "position": null,
    "is_healthy": null
  }
  userInputTeamId = prompt("Enter team ID")
  userInputFirstName = prompt("Enter player first name")
  userInputLastName = prompt("Enter player last name")
  userInputTeam = prompt("Enter player team name ex: Buccaneers")
  userInputPosition = prompt("Enter player position ex: QB1")
  userInputIsHealthy = prompt("Enter true/false for players health status")

  playerData.team_id = parseInt(userInputTeamId);
  playerData.first_name = userInputFirstName;
  playerData.last_name = userInputLastName;
  playerData.team = userInputTeam;
  playerData.position = userInputPosition;
  playerData.is_healthy = userInputIsHealthy;
  fetch('http://localhost:8000/api/players/add', {
    method: "POST",
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(playerData)
  })
}

function deletePlayer() {
  listOfResults.innerHTML = "";
  userInputDelete = prompt("ID of Player to be deleted")

  fetch(`http://localhost:8000/api/players/delete/${parseInt(userInputDelete)}`, {
    method: "DELETE"
  })
    .then(alert('Player deleted successfully'))
}

playerBtn.addEventListener('click', loadPlayers);
teamsBtn.addEventListener('click', loadTeams);
addBtn.addEventListener('click', addPlayer);
deleteBtn.addEventListener('click', deletePlayer);
