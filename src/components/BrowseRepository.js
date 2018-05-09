import React, { Component } from 'react';
import { Link } from 'react-router-dom';

const artifacts = [
  [ 'SOW 18-09-01', 'sow180901', 'gold' ],
  [ 'Assessment 18-10-01', 'assess181001', 'dev' ],
  [ 'Assessment 18-09-15',  'assess180915', 'gold' ],
  [ 'Inventory 18-09-15', 'invent180915', 'gold' ],
  [ 'Inventory 18-02-03', 'invent180203', 'deprecated' ],
  [ 'Agile Intro Deck 18-09-15',  'intro180915', 'gold' ]
]

class BrowseRepository extends Component {
  componentWillMount = () => {
    this.selectedCheckboxes = new Set();
  }

  render() {
    // faking some sort of database lookup to get the displayable name of the repository
    let displayNames = Object.create(null);
    Object.defineProperties(displayNames, {
      'gold-standard': {
        value: 'Gold Standard'
      },
      'amway': {
        value: 'Amway'
      },
      'ford-credit': {
        value: 'Ford Credit'
      },
      'ford-cv': {
        value: 'Ford CV'
      },
      'greensky': {
        value: 'Greensky'
      }
    });

    const toggleCheckbox = label => {
      if (this.selectedCheckboxes.has(label)) {
        this.selectedCheckboxes.delete(label);
      } else {
        this.selectedCheckboxes.add(label);
      }
    }


    return (
      <div>
      <Link to='/'>Top</Link>
      <h2>Repository: {displayNames[this.props.match.params.name]}</h2>
      <h3>Mark or view details</h3>
      <ul>
        {artifacts.map(function(listValue, i) {
            return (
              <li key={i}><input type="checkbox" name="{listValue[1]}" value="{listValue[0]}"
                onChange={toggleCheckbox}/><a href={"/view/:artifactId" + listValue[1]}>{listValue[0]} ({listValue[2]})</a></li>
            )  
        })}
      </ul>  
      </div>
    )

  }
}

export default BrowseRepository;