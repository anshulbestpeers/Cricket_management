
document.addEventListener('DOMContentLoaded', function() {
  const consumer = createConsumer();
  const channel = consumer.subscriptions.create('ScoreUpdatesChannel', {
    received(data) {
      // Handle received updates, e.g., update the UI
      console.log('Received score update:', data);
    },
  });

  // Add event listeners to update scores and send updates to the server
  // ...

  function createConsumer() {
    return ActionCable.createConsumer('/cable');
  }
});
