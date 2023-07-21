$(document).ready(function() {
  $('.slider-content').slick();
});

$(document).ready(function() {
  $('.slider-content2').slick({
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
  });
});

var thumbnails = document.querySelector('.slider');
var thumbnailItems = thumbnails.querySelectorAll('.thumbnail');
var mainDiv = document.getElementById('main-div');

thumbnailItems[0].classList.add('selected');
mainDiv.innerHTML = `<img src="${thumbnailItems[0].querySelector('img').getAttribute('src')}" alt="">`;

thumbnails.addEventListener('click', function (event) {
  var target = event.target;
  if (target.tagName === 'IMG') {
    thumbnailItems.forEach(function (item) {
      item.classList.remove('selected');
    });

    var thumbnail = target.parentElement;
    thumbnail.classList.add('selected');

    var src = target.getAttribute('src');
    mainDiv.innerHTML = `<img src="${src}" alt="">`;
  }
});

var sizeRadios = document.querySelectorAll('input[name="size"]');

sizeRadios.forEach(function (radio) {
  radio.addEventListener('change', function () {
    var selectedSize = document.querySelector('input[name="size"]:checked').value;
    console.log('Seçdiyiniz ölçü: ' + selectedSize);
  });
});



