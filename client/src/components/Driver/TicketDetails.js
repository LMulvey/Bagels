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
		const { first_name, last_name } = this.props.selectedDriver;
		const { ticket } = this.props;
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
			</div>
		);
	}
}
