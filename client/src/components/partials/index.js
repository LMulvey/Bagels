import React, { Component } from "react";
import { Row, Col } from "reactstrap";

const Header = () => {
	return (
		<Row>
			<Col xs={12} className="text-center">
				<h1 className="brand">Yuval's</h1>
			</Col>
		</Row>
	);
};

export { Header };
