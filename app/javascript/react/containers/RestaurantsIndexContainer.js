import React, { Component } from 'react';
// import RestaurantTile from '../components/RestaurantTile';
// import RestaurantFormContainer from '../containers/RestaurantFormContainer';

class RestaurantsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurant: []
    }
    this.addNewRestaurant = this.addNewRestaurant.bind(this)
  }

  componentDidMount() {
  fetch('/api/restaurant')
    .then(response => response.json())
    .then(body => {
      let jsonRestaurants = body
      this.setState({ restaurant: jsonRestaurants })
    })
  }

  // addNewRestaurant(formPayload) {
  //   fetch('/api/restaurant', {
  //     method: 'POST',
  //     body: JSON.stringify(formPayload)
  //   })
  //   .then(response => response.json())
  //   .then(responseData => {
  //     this.setState({ restaurant: [...this.state.restaurant, responseData] })
  //   })
  // }


  render() {
    // let restaurant = this.state.restaurant.map(restaurant => {
    //   return(
    //     <RestaurantTile
    //       key={restaurant.id}
    //       id={restaurant.id}
    //       name={restaurant.name}
    //       address={restaurant.address}
    //       city={restaurant.city}
    //       state={restaurant.state}
    //       zip={restaurant.zip}
    //       picture={restaurant.picture}
    //       body={restaurant.body}
    //     />
    //   )
    // })

    return(
      <div className="row">
        <div className="small-8 small-centered columns">
          <h1>My Blog!</h1>
        </div>
      </div>
    )
  }
}

export default RestaurantsIndexContainer;
