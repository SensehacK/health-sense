import React, { Component, Fragment } from 'react';
import './App.css';
import Header from './components/header';

export default class extends Component {
  render() {
    return (
      <Fragment>
          <Header />

        <div className="App">

          <header className="App-header">
            <p>Health Sense</p>
          </header>
        </div>
      </Fragment>
    );

  }
}