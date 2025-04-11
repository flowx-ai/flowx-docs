window.addEventListener('load', function() {
    var button = document.createElement('a');


    const currentPageUrl = window.location.href;
    const encodedCurrentUrl = encodeURIComponent(currentPageUrl);

    const entryId = "1135986991"; // Replace this with your actual entry ID


    button.href = 'https://docs.google.com/forms/d/e/1FAIpQLSewY4DAYCtfFZko4IqvivuaOMSgeBKi-iPqYTJP09k_3vxLXg/viewform?usp=pp_url&entry.' + entryId + '=' + encodedCurrentUrl;
    button.target = '_blank';
    button.textContent = 'Feedback';
    button.style.position = 'fixed';
    button.style.bottom = '30px';
    button.style.right = '30px';
    button.style.backgroundColor = '#fdb913';
    button.style.color = 'white';
    button.style.padding = '12px 20px';
    button.style.borderRadius = '50px';
    button.style.textDecoration = 'none';
    button.style.fontWeight = 'bold';
    button.style.zIndex = '9999';
    button.style.boxShadow = '0 2px 8px rgba(0,0,0,0.2)';
    
    button.onmouseover = function() {
        this.style.backgroundColor = '#e59f00'; // Slightly darker shade for hover
    };
    button.onmouseout = function() {
        this.style.backgroundColor = '#fdb913'; // Back to original color
    };
    
    // Add the button to the page
    document.body.appendChild(button);
  });