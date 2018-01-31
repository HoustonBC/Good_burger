import React, { Component } from 'react';
import RestaurantTile from '../components/RestaurantTile';
// import RestaurantFormContainer from '../containers/RestaurantFormContainer';

class RestaurantsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurant: [],
      searchText: '',
      searchResults: []
    }
    this.searchTextChange = this.searchTextChange.bind(this)
  }

  searchTextChange(event) {
    this.setState({searchText: event.target.value});
  }

  componentDidMount() {
  fetch('/api/restaurants')
    .then(response => response.json())
    .then(body => {
      let jsonRestaurants = body
      this.setState({ restaurant: jsonRestaurants })
    })
  }



  render() {
    let restaurant = this.state.restaurant.map(restaurant => {
      return(
        <RestaurantTile
          key={restaurant.id}
          id={restaurant.id}
          name={restaurant.name}
          address={restaurant.address}
          city={restaurant.city}
          state={restaurant.state}
          zip={restaurant.zip}
          picture={restaurant.picture}
          body={restaurant.body}
        />
      )
    })

    let searchBar = {
      return(
          <form>
            <label> Search Restaurants:
              <input
                name="searchText"
                type="text"
                value={this.state.searchText}
                onChange={this.searchTextChange}
              />
            </label>
          </form>
      )
    }

    return(
      <div className="row">
        <div className="small-8 small-centered columns">
          <a href="/restaurants/new"> Add New Restaurant </a>
          <div>{searchBar}</div>
          <h1>{restaurant}</h1>
        </div>
      </div>
    )
  }
}

export default RestaurantsIndexContainer;
