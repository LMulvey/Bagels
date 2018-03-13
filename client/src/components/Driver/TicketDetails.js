import React, { Component } from "react";
import {
	ListGroup,
	ListGroupItem,
	ListGroupItemHeading,
	ListGroupItemText,
	Badge,
	Button,
	Row,
	Col
} from "reactstrap";

export default class TicketDetails extends Component {
	render() {
		const { ticket } = this.props;
		let renderEvents = this.props.ticket.events
			.sort((a, b) => b.id < a.id)
			.filter(item => item.event_type !== "start" && item.event_type !== "stop")
			.map(ticket_event => {
				return (
					<ListGroupItem key={Math.random()}>
						<Row>
							<Col xs={10}>
								<ListGroupItemHeading>
									EVENT:{" "}
									{ticket_event.event_type.replace(/\b\w/g, l =>
										l.toUpperCase()
									)}
								</ListGroupItemHeading>
								<ListGroupItemText>
									<Badge style={{ marginRight: 15 }} color="primary">
										ID #{ticket_event.id}
									</Badge>
									<ul>
										<li>
											<strong>Address:</strong> {ticket_event.address}
										</li>
										<li>
											<strong>Description:</strong> {ticket_event.description}
										</li>
										<li>
											<strong>
												Created on{" "}
												{new Date(ticket_event.created_at).toLocaleString()}
											</strong>
										</li>
									</ul>
								</ListGroupItemText>
							</Col>
							<Col xs={2} className="float-right" style={{paddingLeft: 0}}>
								{ticket_event.start_time && (
									<Button color="info" size="sm">
										{ticket.event_type.replace(/\b\w/g, l => l.toUpperCase())} Completed
									</Button>
								)}
								{!ticket_event.start_time && (
									<Button
										id={ticket_event.event_type}
										onClick={this.props.handleEventComplete}
										color="success"
										size="sm" >
										Complete {ticket_event.event_type.replace(/\b\w/g, l => l.toUpperCase())}
									</Button>
								)}
							</Col>
						</Row>
					</ListGroupItem>
				);
			});
		return (
			<div>
				<Row style={{ marginBottom: 25 }}>
					<Col xs={10}>
						<h2
							style={{
								padding: 5,
								backgroundColor: "#F24153",
								color: "white",
								borderRadius: 6
							}}>
							Ticket #{ticket.id}
						</h2>
					</Col>
					<Col xs={2} className="right">
						<Button
							color="primary"
							size="lg"
							className="float-right"
							onClick={() => this.props.selectTicket(false)}>
							Back
						</Button>
					</Col>
				</Row>
				<ListGroup>{renderEvents}</ListGroup>
			</div>
		);
	}
}
