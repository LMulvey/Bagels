import React, { Component } from "react";
import { Row, Col, Button, Container } from "reactstrap";
import API from "../../store/API";
import DriverList from "./DriverList";
import TicketList from "./TicketList";
import TicketDetails from "./TicketDetails";
import "./style.css";

class Driver extends Component {
	constructor(props) {
		super(props);
		this.state = {
			drivers: [],
            tickets: [],
            selectedTicket: false,
			selectedDriver: false
		};
	}

	componentDidMount() {
		if (this.state.drivers.length === 0) {
			API.get(`drivers`).then(drivers => this.setState({ drivers }));
		}
	}

	componentDidUpdate(prevProps, prevState) {
        let { selectedDriver } = this.state;
		if (selectedDriver && (selectedDriver !== prevState.selectedDriver))  {
			API.get(`drivers/${this.state.selectedDriver.id}/tickets`).then(
				tickets => this.setState({ tickets })
			);
        }
	}

	componentWillUnmount() {
		document.body.classList.toggle("driver", false);
	}

	selectDriver(driver) {
		this.setState({ selectedDriver: driver });
    }
    
    selectTicket(ticket) {
		this.setState({ selectedTicket: ticket });
    }
    
    handleEventComplete(e) {
        let type = e.target.id;
        let data = { event: { start_time: new Date().toLocaleString() } };

        let selectedTicket = this.state.selectedTicket;
        let this_event_id = this.state.selectedTicket.events
            .filter(item => item.event_type === type)[0].id;
        let start_id = this.state.selectedTicket.events
            .filter(item => item.event_type === 'start')[0].id;
        let stop_id = this.state.selectedTicket.events
            .filter(item => item.event_type === 'stop')[0].id;

        console.log('hey', this_event_id)

        let post_urls = [];

        switch(type) {
            case 'pickup':
                post_urls.push(`events/${this_event_id}`);
                post_urls.push(`events/${start_id}`);
                break;
            case 'delivery':
                post_urls.push(`events/${this_event_id}`);
                post_urls.push(`events/${stop_id}`);
                break;
            default:
                break;
        }

        API.put(post_urls[0], data);
        API.put(post_urls[1], data)
        .then(this.setState({ selectedTicket: selectedTicket}))
    }

	render() {
		document.body.classList.toggle("driver", true);
		return (
			<Container className="content">
                {!this.state.selectedDriver && 
                    <Row style={{ marginBottom: 25 }}>
                        <Col xs={{size: 8, offset: 1}}>
                            <h2
                                style={{
                                    padding: 5,
                                    backgroundColor: "#F24153",
                                    color: "white",
                                    borderRadius: 6
                                }}>
                                Driver's Dashboard
                            </h2>
                        </Col>
                        <Col xs={2} className="right">
                            <Button
                                color="primary"
                                size="lg"
                                className="float-right"
                                onClick={() => this.props.history.push("/")}>
                                Back
                            </Button>
                        </Col>
                            </Row> }
				<Row>
					<Col xs={{size: 10, offset: 1}}>
						{!this.state.selectedDriver && (
							<DriverList
								selectDriver={this.selectDriver.bind(this)}
								drivers={this.state.drivers}
							/>
						)}
						{(this.state.selectedDriver && !this.state.selectedTicket) && (
							<TicketList
                                selectDriver={this.selectDriver.bind(this)}
                                selectTicket={this.selectTicket.bind(this)}
								tickets={this.state.tickets}
								selectedDriver={this.state.selectedDriver}
							/>
                        )}
                        {this.state.selectedTicket && (
                            <TicketDetails
                                selectTicket={this.selectTicket.bind(this)}
                                ticket={this.state.selectedTicket}
                                selectedDriver={this.state.selectedDriver}
                                handleEventComplete={this.handleEventComplete.bind(this)}
                            />
                        )}
					</Col>
				</Row>
			</Container>
		);
	}
}

export default Driver;
