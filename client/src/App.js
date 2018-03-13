import React, { Component } from "react";
import { Container } from "reactstrap";
import { Header } from "./components/partials";
import { Switch, BrowserRouter as Router, Route } from "react-router-dom";

import Home from './components/Home';
import Driver from './components/Driver';

class App extends Component {
	componentWillUnmount() {
		document.body.classList.toggle('home', false);
    }

    render() {
        document.body.classList.toggle('home', true);
		return (
			<Container>
				<Header />
				<Router>
					<Switch>
						<Route exact path="/" component={Home} />
						<Route path="/driver" component={Driver} />
					</Switch>
				</Router>
			</Container>
		);
	}
}

export default App;
