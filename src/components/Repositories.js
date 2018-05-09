import React, { Component } from 'react';

// faking some sort of database lookup
const items = [
  [ 'Gold Standard', 'gold-standard' ],
  [ 'Amway',  'amway' ],
  [ 'Ford CV', 'ford-cv' ],
  [ 'Ford Credit', 'ford-credit' ],
  [ 'Greensky',  'greensky' ]
]

class Repositories extends Component {
  render() {
    return (
      <div>
      <h3>Choose a repository to browse</h3>
      <ul>
        {items.map(function(listValue, i) {
          return <li key={i}><a href={"/repository/" + listValue[1] + "/repositoryName/" + listValue[0]}>{listValue[0]}</a></li>
        })}
      </ul>  
      </div>
    )

  }
}

export default Repositories;