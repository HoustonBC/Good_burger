import React from 'react';

const RestaurantTile = (props) => {
  let restaurantLink = "/restaurants/" + props.id
  return(
    <a href={restaurantLink}>
      <div className="restaurant-tile">
        <h2> {props.name} </h2>
        <span> {props.address} </span>
        <span> {props.city} </span>
        <span> {props.state} </span>
        <span> {props.zip} </span>
        <p> {props.body} </p>
      </div>
    </a>
  )
}
export default RestaurantTile;
