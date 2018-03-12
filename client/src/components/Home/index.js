import React, { Component } from "react";
import { Row, Col, Button, Badge } from "reactstrap";
import { Link } from "react-router-dom";

const Home = () => {
	return (
		<Row>
            <Col xs={{ size: 3, offset: 2 }} className="content driver text-center">
            <i class="fal fa-car fa-5x"></i>
            <p>Are you a <Link to="/driver"><strong>Driver?</strong></Link></p>
            </Col>
            <Col xs={{ size: 3, offset: 2 }} className="content dispatcher text-center">
            <i class="fal fa-bullhorn fa-5x"></i>
            <p>Or a <Link to="/dispatcher"><strong>Dispatcher?</strong></Link></p>
            </Col>
		</Row>
	);
};

export default Home;
