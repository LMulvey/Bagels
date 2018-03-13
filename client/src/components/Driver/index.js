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
            selectedDriver: false
        }
    }

    componentDidMount() {
        if(this.state.drivers.length === 0) {
            API.fetch(`drivers`)
            .then(drivers => this.setState({ drivers }))
        }
}

    componentDidUpdate() {
        console.log(this.state.selectedDriver);
        if(this.state.selectedDriver && this.state.tickets.length === 0) {
            API.fetch(`drivers/${this.state.selectedDriver.id}/tickets`)
            .then(tickets => this.setState({ tickets }))
        }
    }

    componentWillUnmount() {
        document.body.classList.toggle('driver', false);
    }

    selectDriver(driver) {
        this.setState({ selectedDriver: driver })
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
                    {this.state.selectedDriver &&
                    <TicketList 
                        tickets={this.state.tickets}
                        selectedDriver={this.state.selectedDriver} /> }

                </Col>
            </Row>
        );
    }
};

export default Driver;