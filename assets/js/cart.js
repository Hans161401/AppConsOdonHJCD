
// Cart functionality - guarda carrito en localStorage
function getCart(){
    return JSON.parse(localStorage.getItem('miTiendaCart') || '[]');
}
function saveCart(c){ localStorage.setItem('miTiendaCart', JSON.stringify(c)); }

function addToCart(name, price){
    const cart = getCart();
    const existing = cart.find(i=>i.name===name);
    if(existing) existing.quantity++;
    else cart.push({name: name, price: Number(price), quantity:1});
    saveCart(cart);
    renderCart();
    alert(name + " agregado al carrito");
}

function renderCart(){
    let cart = getCart();
    let win = document.getElementById('cart-widget');
    if(!win){
        win = document.createElement('div');
        win.id = 'cart-widget';
        document.body.appendChild(win);
    }
    if(cart.length===0){ win.innerHTML = '<div class="cart-empty">Carrito vacío</div>'; return; }
    let html = '<h3>Tu carrito</h3><ul>';
    let total = 0;
    cart.forEach((it,idx)=>{
        html += `<li>${it.name} x${it.quantity} - $${it.price.toLocaleString()}</li>`;
        total += it.price * it.quantity;
    });
    html += `</ul><div class="cart-total">Total: $${total.toLocaleString()}</div>`;
    html += `<div class="cart-actions"><button id="checkout-btn">Pagar</button><button id="clear-cart">Vaciar</button></div>`;
    win.innerHTML = html;
    document.getElementById('checkout-btn').onclick = checkout;
    document.getElementById('clear-cart').onclick = ()=>{
        localStorage.removeItem('miTiendaCart'); renderCart();
    };
}

function checkout(){
    const cart = getCart();
    if(cart.length===0){ alert('Tu carrito está vacío'); return; }
    const buyer = prompt('Nombre para el pedido:','Cliente');
    if(!buyer) return;
    fetch('order.php', {
        method: 'POST',
        headers: {'Content-Type':'application/json'},
        body: JSON.stringify({buyer: buyer, cart: cart, date: new Date().toISOString()})
    }).then(r=>r.json()).then(data=>{
        if(data.success){
            alert('Pedido creado, ID: ' + data.id + '. Gracias!');
            localStorage.removeItem('miTiendaCart');
            renderCart();
        } else alert('Error al crear pedido');
    }).catch(e=>{ alert('Error de red o servidor'); });
}

// Al cargar, enlazar botones Comprar con addToCart
document.addEventListener('DOMContentLoaded', ()=>{
    document.querySelectorAll('button.buy-btn').forEach(btn=>{
        btn.addEventListener('click', ()=>{
            const name = btn.getAttribute('data-name') || btn.closest('.product-card')?.querySelector('h3')?.innerText || 'Producto';
            const price = btn.getAttribute('data-price') || btn.closest('.product-card')?.querySelector('p')?.innerText.replace(/[^0-9]/g,'') || '0';
            addToCart(name, price);
        });
    });
    // render widget initially
    renderCart();
});
