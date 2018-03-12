import React, { Component } from 'react';
import { Row, Col, Button, Badge } from "reactstrap";
import API from '../../store/API';
import DriverList from "./DriverList";
import TicketList from "./TicketList";
import './style.css';

class Driver extends Component {
    constructor(props) {
        super(props);
        this.state = {
            drivers: [],
            tickets: [],
            selectedDriver: null
        }
    }

    componentWillMount() {
        let type = (this.state.selectedDriver) 
            ? `drivers/${this.state.selectedDriver}/tickets`
            : `drivers`;

        if(type === 'drivers') {
            API.fetch(type)
            .then(drivers => this.setState({ drivers }))
        } else {
            API.fetch(type)
            .then(tickets => this.setState({ tickets }))
        }
        
    }

    componentWillUnmount() {
        document.body.classList.toggle('driver', false);
    }

    selectDriver(id) {
        this.setState({ selectedDriver: id })
    }

    render() {
        document.body.classList.toggle('driver', true);
        return (
            <Row>
                <Col xs={{ size: 10, offset: 1 }} className="content">
                    <h3 style={{marginBottom: 25}} className="hug">Driver Dashboard</h3>

                    {!this.state.selectedDriver &&
                    <DriverList 
                        selectDriver={this.selectDriver.bind(this)} 
                        drivers={this.state.drivers} /> }
                    <TicketList tickets={this.state.tickets} />

                </Col>
            </Row>
        );
    }
};

export default Driver;