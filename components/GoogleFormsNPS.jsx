// components/GoogleFormsNPS.jsx
import { useState } from 'react';

export default function GoogleFormsNPS({
  formId = '1FAIpQLSewY4DAYCtfFZko4IqvivuaOMSgeBKi-iPqYTJP09k_3vxLXg',
  scoreEntryId = 'entry.10044828', 
  feedbackEntryId = 'entry.1633526708', 
  pageNameEntryId = 'entry.1135986991', 
  pageName = window.location.pathname,
  title = "Help us improve our documentation"
}) {
  const [score, setScore] = useState(null);
  const [feedback, setFeedback] = useState('');
  const [submitted, setSubmitted] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    if (score === null) {
      setError('Please select a score');
      return;
    }
    
    try {
      const formUrl = `https://docs.google.com/forms/d/e/${formId}/formResponse`;
      
      const formData = new FormData();
      formData.append(scoreEntryId, score);
      formData.append(feedbackEntryId, feedback);
      
      if (pageNameEntryId) {
        formData.append(pageNameEntryId, pageName);
      }
      
      const iframe = document.createElement('iframe');
      iframe.name = 'hidden_iframe';
      iframe.id = 'hidden_iframe';
      iframe.style.display = 'none';
      document.body.appendChild(iframe);
      
      const form = document.createElement('form');
      form.method = 'POST';
      form.action = formUrl;
      form.target = 'hidden_iframe';
      
      formData.forEach((value, key) => {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = key;
        input.value = value;
        form.appendChild(input);
      });
      
      document.body.appendChild(form);
      form.submit();
      
      setTimeout(() => {
        document.body.removeChild(form);
        document.body.removeChild(iframe);
      }, 1000);
      
      setSubmitted(true);
      setError('');
      
    } catch (err) {
      setError('Failed to submit feedback. Please try again.');
      console.error('Submission error:', err);
    }
  };

  if (submitted) {
    return (
      <div className="mt-8 p-4 bg-green-50 rounded-lg text-center">
        <h3 className="text-lg font-medium text-green-800">Thank you for your feedback!</h3>
        <p className="text-green-600">Your input helps us improve our documentation.</p>
      </div>
    );
  }

  return (
    <div className="mt-8 p-6 border border-gray-200 rounded-lg">
      <h3 className="text-xl font-semibold mb-4">{title}</h3>
      
      <form onSubmit={handleSubmit}>
        <div className="mb-6">
          <p className="font-medium mb-3">How likely are you to recommend our documentation to a colleague?</p>
          <div className="flex flex-wrap gap-2 justify-between">
            {[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((value) => (
              <button
                key={value}
                type="button"
                onClick={() => setScore(value)}
                className={`w-10 h-10 rounded-md flex items-center justify-center transition-colors
                  ${score === value 
                    ? 'bg-primary text-white' 
                    : 'bg-gray-100 hover:bg-gray-200'}`}
              >
                {value}
              </button>
            ))}
          </div>
          <div className="flex justify-between mt-1 text-sm text-gray-500">
            <span>Not likely at all</span>
            <span>Extremely likely</span>
          </div>
        </div>
        
        <div className="mb-6">
          <label htmlFor="feedback" className="block font-medium mb-2">
            What could we do to improve your experience?
          </label>
          <textarea
            id="feedback"
            rows="3"
            value={feedback}
            onChange={(e) => setFeedback(e.target.value)}
            className="w-full px-3 py-2 border border-gray-300 rounded-md"
            placeholder="Your feedback is valuable to us..."
          ></textarea>
        </div>
        
        {error && <p className="text-red-500 mb-4">{error}</p>}
        
        <button
          type="submit"
          className="px-4 py-2 bg-primary text-white rounded-md hover:bg-primary-dark transition-colors"
        >
          Submit Feedback
        </button>
      </form>
    </div>
  );
}