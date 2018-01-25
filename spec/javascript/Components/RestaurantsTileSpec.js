import RestaurantTile from '../../../app/javascript/react/components/RestaurantTile';

describe('RestaurantsTile', () => {
  let name,
    address,
    city,
    state,
    zip,
    picture,
    body,
    wrapper;

  beforeEach(() => {
    wrapper = mount(
      <RestaurantTile
        name="MaineLeanBurgers"
        address="500 Summer Street"
        city="Boston"
        state="Maine"
        zip="02123"
        picture="This.url"
        body="expense but tasty burger"
      />
    )
  });

  it('renders a header tag with the restaurant title', () => {
    expect(wrapper.find('h2')).toIncludeText("MaineLeanBurgers");
  })
  it('renders a div tag', () => {
    expect(wrapper.find('div')).toBePresent();
  })
})
