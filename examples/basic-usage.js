const ItWhip = require('@itwhip/instant-ride-sdk');

async function main() {
  const client = new ItWhip({
    apiKey: process.env.ITWHIP_API_KEY,
    hotelId: 'HOTEL123'
  });

  const status = await client.testConnection();
  console.log('Status:', status);
  
  const analytics = await client.analytics.getRevenue();
  console.log('Monthly revenue potential:', analytics.missedOpportunity);
}

main().catch(console.error);
