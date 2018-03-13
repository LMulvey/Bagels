import React, { Component } from "react";
import { ListGroup, ListGroupItem, Badge } from "reactstrap";

export default class TicketList extends Component {
	render() {
        const { first_name, last_name } = this.props.selectedDriver;
		let renderTickets = this.props.tickets.map(ticket => {
			console.log(ticket);
			return (
				<ListGroupItem key={Math.random()}>
					{ticket.description}
					<Badge color="success" pill>
						{ticket.status}
					</Badge>
				</ListGroupItem>
			);
		});
		return (
			<div>
				<h3>Tickets Assigned to {first_name} {last_name}</h3>
				<ListGroup>{renderTickets}</ListGroup>
			</div>
		);
	}
}
