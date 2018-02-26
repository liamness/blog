import svg4everybody from 'svg4everybody';

// apply svg symbol polyfill
svg4everybody();

const scrollArrow = document.querySelector('.scroll-arrow');

if (scrollArrow) {
  scrollArrow.addEventListener('click', () => {
    const scrollEnd = document.querySelector('.main-header').clientHeight;
    window.scrollTo(0, scrollEnd);
  });
}
