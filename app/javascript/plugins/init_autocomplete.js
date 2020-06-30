function initializeAutocomplete(id) {
  const element = document.getElementById(id);
  if (element) {
    const autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'], componentRestrictions: {country: 'fr'} });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  const place = this.getPlace();

  for (const i in place.address_components) {
    const component = place.address_components[i];
    for (const j in component.types) {
      const type_element = document.getElementById(component.types[j]);
      if (type_element) {
        type_element.value = component.long_name;
      }
    }
  }
}

function initAutocomplete() {
  initializeAutocomplete('autocomplete_address');
}

export { initAutocomplete }





