import React, { Component } from 'react';
import logo from '../logo.png'
import '../App.css';

class Header extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Artifacts Front-End PoC</h1>
        </header>
      </div>
    );
  }
}

export default Header;
