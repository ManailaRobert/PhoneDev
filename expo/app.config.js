import appJson from './app.json';
import 'dotenv/config';

export default ({ config }) => ({
  ...appJson.expo,
  ...config,
  android: {
    ...appJson.expo.android,
    config: {
      ...appJson.expo.android?.config,
      googleMaps: {
        apiKey: process.env.GOOGLE_MAPS_API_KEY,
      },
    },
  },
});