const ItWhip = require('../src/index');

describe('ItWhip SDK Tests', () => {
  it('should connect to API', async () => {
    const client = new ItWhip({
      apiKey: 'test_key',
      hotelId: 'TEST001'
    });
    
    const result = await client.testConnection();
    expect(result.status).toBe('connected');
  });
});
