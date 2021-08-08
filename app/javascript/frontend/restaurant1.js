import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  let likeBtn = document.querySelector('#like-btn')


  if (likeBtn) {
    let ax = axios.create()

    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token

    likeBtn.addEventListener('click', e => {
      // console.log(token);

      let btn = e.target
      let id = btn.dataset['id']
      // console.log(id);

      ax.post(`/restaurants/${id}/pocket_list`) //promise
        .then(res => {
          // console.log(res.data);
          if (res.data.status == 'added') {
            btn.classList.add('like-btn-favorited')
          } else {
            btn.classList.remove('like-btn-favorited')
          }
        })
        .catch(err => {
          console.log(err);
        })


      // console.log(123);
      // 送資料 POST → ?
      // POST /restaurants/2/pocket_list
      // GET X
      // POST → create
      // PUT/PATCH → edit / update
    })
  }
})

