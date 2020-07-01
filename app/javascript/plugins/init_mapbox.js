import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  mapboxgl.accessToken = 'pk.eyJ1IjoieWFubjE3MjIiLCJhIjoiY2thczk1aXFsMDV0YTJ4bzM2ZWE5dGwyMiJ9.HI2yIj_FFj0antefS11O3Q';
    const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11'
});}

export { initMapbox };
