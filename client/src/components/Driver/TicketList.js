import React, { Component } from 'react';
import { ListGroup, ListGroupItem, Badge } from 'reactstrap';

export default class TicketList extends Component {
  render() {
      let renderTickets = this.props.tickets.map(ticket => {
          console.log(ticket)
        return (
            <ListGroupItem key={Math.random()} >
                {ticket.description}
                <Badge color="success" pill>
                    {ticket.status}
                </Badge>
            </ListGroupItem>
        );
      });
    return (
      <ListGroup>
        {renderTickets}
      </ListGroup>
    );
  }
}