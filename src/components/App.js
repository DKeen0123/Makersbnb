import React from 'react';


class Hello extends React.Component {
  render() {
    return (
      <div className="hello">
        Hello, {this.props.name}!
      </div>
    );
  }
}

global.Hello = Hello;
export default Hello;
