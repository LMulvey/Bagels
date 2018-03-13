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

export default class TicketList extends Component {
	render() {
		const { first_name, last_name } = this.props.selectedDriver;
		let renderTickets = this.props.tickets.map(ticket => {
			return (
				<ListGroupItem 
					key={Math.random()}
					onClick={() => this.props.selectTicket(ticket)}>
					<Row>
						<Col xs={10}>
							<ListGroupItemHeading>{ticket.description}</ListGroupItemHeading>
							<ListGroupItemText>
								<Badge style={{marginRight: 15}} color="primary">ID #{ticket.id}</Badge>
								{new Date(ticket.created_at).toLocaleString()}
							</ListGroupItemText>
						</Col>
						<Col xs={2}>
							<Badge
								style={{ float: "right", fontSize: 18 }}
								color={ticket.status === "active" ? "warning" : "success"}
								pill>
								{ticket.status.replace(/\b\w/g, l => l.toUpperCase())}
							</Badge>
						</Col>
					</Row>
				</ListGroupItem>
			);
		});
		return (
			<div>
				<Row style={{ marginBottom: 25 }}>
					<Col xs={10}>
						<h2 style={{
                                    padding: 5,
                                    backgroundColor: "#F24153",
                                    color: "white",
                                    borderRadius: 6
                                }}>
							Tickets Assigned to {first_name} {last_name}
						</h2>
					</Col>
					<Col xs={2} className="right">
						<Button
							color="primary"
							size="lg"
							className="float-right"
							onClick={() => this.props.selectDriver(false)}>
							Back
						</Button>
					</Col>
				</Row>
				<ListGroup>{renderTickets}</ListGroup>
			</div>
		);
	}
}
