import React, { Component } from "react";
import { Row, Col, Button, Badge } from "reactstrap";
import { Link } from "react-router-dom";

const Home = () => {
	return (
		<Row>
			<Col xs={{ size: 8, offset: 2 }} className="content">
            <h3>Let's Get Started</h3>
            <p>
                Are you a <Link to="/driver"><strong>Driver?</strong></Link>
                {' '}Or a <strong>Dispatcher?</strong>
            </p>
            </Col>
		</Row>
	);
};

export default Home;
