import consumer from "./consumer";

const initChatroomCable = () => {
  const btnEnvoyer = document.getElementById("envoie");
  if (btnEnvoyer){
    btnEnvoyer.scrollDown = btnEnvoyer.scrollHeight;
    const messagesElement = document.getElementById('messages')
    const messagesContainer = document.getElementById('new_message');
    if (messagesContainer) {
      const receiverId = document.getElementById('current_user').dataset.id
      const id = messagesElement.dataset.chatroomId;

      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          console.log(data)

          const divElement = document.createElement('div');
          divElement.insertAdjacentHTML('beforeend', data);
          const senderId = divElement.querySelector('#sender').dataset.id;

          if (senderId !== receiverId) {
            messagesContainer.insertAdjacentHTML('beforebegin', data);
          }
        },
      });
    }
  }
}
export { initChatroomCable }

