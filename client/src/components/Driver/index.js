import React, { Component } from 'react';
import { Row, Col, Button, Badge } from "reactstrap";
import { withRouter } from 'react-router-dom';
import './style.css';

class Driver extends Component {
    constructor(props) {
        super(props);
    }

    componentWillUnmount() {
        document.body.classList.toggle('driver', false);
    }

    render() {
        document.body.classList.toggle('driver', true);
        return (
            <Row>
                <Col xs={{ size: 8, offset: 2 }} className="content">
                <h3>Driver Dashboard</h3>
                
                </Col>
            </Row>
        );
    }
};

export default withRouter(Driver);