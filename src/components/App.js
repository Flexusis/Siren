import React, { Component } from 'react';
import MenuBar from './MenuBar.react'
import './App.css';
import './_comp.css';

export default class App extends Component {
  render() {
    return (
      <div>
        <MenuBar />
        {this.props.children}
      </div>
    );
  }
}
