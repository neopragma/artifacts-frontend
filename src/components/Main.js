import React, { Component } from 'react';
import { Switch, Route } from 'react-router-dom';
import '../App.css';
import Repositories from './Repositories'
import BrowseRepository from './BrowseRepository'

class Main extends Component {
  
  render() {
    return (
      <main>
        <Switch>
          <Route exact path='/' component={Repositories} />
          <Route path='/repository/:name' component={BrowseRepository} />
        </Switch>
      </main>  
    );
  }
}

export default Main;
