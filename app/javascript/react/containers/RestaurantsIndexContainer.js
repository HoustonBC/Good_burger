import React, { Component } from 'react';
import RestaurantTile from '../components/RestaurantTile';
// import RestaurantFormContainer from '../containers/RestaurantFormContainer';

class RestaurantsIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      restaurants: [],
      searchText: '',
      searchResults: []
    }
    this.searchTextChange = this.searchTextChange.bind(this)
    this.formSubmit = this.formSubmit.bind(this)
  }

  searchTextChange(event) {
    this.setState({searchText: event.target.value});
  }

  formSubmit(event) {
    event.preventDefault()
    this.setState({searchResults: []})
    let previousSearch = [];
    let resultsOfSearch = [];
    this.state.restaurants.map(restaurant => {
      if (restaurant.name.startsWith(this.state.searchText)){
        previousSearch = resultsOfSearch
        resultsOfSearch = previousSearch.concat(restaurant)
      }
    })
    this.setState({searchResults: resultsOfSearch})
  }

  componentDidMount() {
  fetch('/api/restaurants')
    .then(response => response.json())
    .then(body => {
      let jsonRestaurants = body
      this.setState({ restaurants: jsonRestaurants })
    })
  }



  render() {
    let searchBy;
    if (this.state.searchResults.length == 0){
      searchBy = this.state.restaurants
    }else {
      searchBy = this.state.searchResults
    }
    let searchResults = searchBy.map(restaurant => {
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

    let searchBar = (
          <form onSubmit={this.formSubmit} className='search'>
            <label> Search Restaurants
              <input
                name="searchText"
                type="text"
                value={this.state.searchText}
                onChange={this.searchTextChange}
                placeholder="Case Sensative"
              />
            </label>
            <input className="button" type="submit" value="Submit"/>
          </form>
        )

    return(
      <div className="row">
        <div className="large- 12 small-12 small-centered columns">
          <h2> Restaurants </h2>
          <div>{searchBar}</div>
          <h1>{searchResults}</h1>
          <a className="rlink" href="/restaurants/new"> Add New Restaurant </a>
        </div>
      </div>
    )
  }
}

export default RestaurantsIndexContainer;
