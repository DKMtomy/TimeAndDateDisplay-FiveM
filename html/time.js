const TimeAndDate = document.getElementById('TimeAndDate');

window.addEventListener('message', (event) => {
  // Ensure that the event data is an object with the expected properties
  if (typeof event.data === 'object' && event.data.action === 'setTimeAndDate' && typeof event.data.time === 'string') {
    try {
      // Set the text content of the TimeAndDate element to the time property
      TimeAndDate.innerText = `${event.data.time}`;
    } catch (error) {
      // Handle any unexpected errors
      console.error('Error setting time and date:', error);
    }
  }
});
