// layouts/DefaultLayout.jsx
import React from 'react';
import GoogleFormsNPS from '../components/GoogleFormsNPS';

export default function DefaultLayout({ children }) {
  return (
    <div>
      {children}
      
      <div className="mt-16 mb-8 max-w-3xl mx-auto">
        <GoogleFormsNPS 
          formId="1FAIpQLSewY4DAYCtfFZko4IqvivuaOMSgeBKi-iPqYTJP09k_3vxLXg" // Replace with your actual form ID
          scoreEntryId="entry.100448289" // Replace with your actual entry ID
          feedbackEntryId="entry.1633526708" // Replace with your actual entry ID
          pageNameEntryId="entry.1135986991" // Replace with your actual entry ID
        />
      </div>
    </div>
  );
}