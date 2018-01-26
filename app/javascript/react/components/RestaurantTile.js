import React from 'react';

const RestaurantTile = (props) => {
  return(
    <div className="restaurant-tile">
      <h2> {props.name} </h2>
      <span> {props.address} </span>
      <span> {props.city} </span>
      <span> {props.state} </span>
      <span> {props.zip} </span>
      <p> {props.body} </p>
    </div>
  )
}

export default RestaurantTile;
