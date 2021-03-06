import React, { Component } from 'react';
import {  Card, CardDeck, CardBody,
    CardTitle, CardSubtitle } from 'reactstrap';

class DriverList extends Component {
    render() {
        let renderDrivers = this.props.drivers.map(driver => {
            return(
                <div 
                    className="driver-card" 
                    onClick={() => this.props.selectDriver(driver)}
                    key={Math.random()} >
                    <Card className="text-center">
                        <CardBody>
                            <i className="fas fa-user fa-2x"></i>
                            <CardTitle>{driver.first_name} {driver.last_name.charAt(0)}</CardTitle>
                            <CardSubtitle>Driver for Yuval's Bagels</CardSubtitle>
                        </CardBody>
                    </Card>
                </div>
            );
        });

        return (
            <CardDeck>
                {renderDrivers}
            </CardDeck>
        );
    }
}

export default DriverList;
