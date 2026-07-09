const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const clearBtn = document.getElementById("clear");

const gravity = 0.9;
const bounce = 1.1;
const maxBalls = 100000;

const balls = [];

function showTime() {
	document.getElementById('currentTime').innerHTML = new Date().toUTCString();
}

function resolveCollision(b1, b2){
  const dx = b2.x - b1.x;
  const dy = b2.y - b1.y;
  const distance = Math.hypot(dx, dy);
  const minDist = b1.radius + b2.radius;
  
  if(distance < minDist){ // Colidiu
    // Normal
    const nx = dx / distance;
    const ny = dy / distance;
    
    // Velocidade Relativa
    const rvx = b2.vx - b1.vx;
    const rvy = b2.vy - b1.vy;
    
    const velAlonNormal = rvx * nx + rvy * ny;
    if(velAlonNormal > 0) return;
    
    const restitution = 0.9;
    const impulse = -(1 + restitution) * velAlonNormal / (1 / b1.mass + 1 / b2.mass);
    
    const ix = impulse * nx;
    const iy = impulse * ny;
    
    b1.vx -= ix / b1.mass;
    b1.vy -= iy / b1.mass;
    b2.vx += ix / b2.mass;
    b2.vy += iy / b2.mass;
    
    // Correção de sobreposição
    const overlap = minDist - distance;
    b1.x -= nx * overlap / 2;
    b1.y -= ny * overlap / 2;
    b2.x += nx * overlap / 2;
    b2.y += ny * overlap / 2;
  }
}

function update(){
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  
  // Atualiza o vetor balls
  balls.forEach(ball => {
    ball.vy += gravity;
    ball.x += ball.vx;
    ball.y += ball.vy;
    
    // Colisão com as paredes
    if(ball.x - ball.radius < 0 || ball.x + ball.radius > canvas.width){
      ball.vx *= -bounce;
    }
    
    // Teto e base
    if(ball.y + ball.radius > canvas.height || ball.y - ball.radius < 0){
      ball.y = canvas.height - ball.radius;
      ball.vy *= -bounce;
    }
  });
  
  // Colisão entre bolas
  for(let i = 0; i < balls.length; i++){
    for(let j = i + 1; j < balls.length; j++){
      resolveCollision(balls[i], balls[j]);
    }
  }
  
  // Desenho
  balls.forEach(ball => {
    ctx.beginPath();
    ctx.arc(ball.x, ball.y, ball.radius, 0, Math.PI * 2);
    ctx.fillStyle = "dodgerblue";
    ctx.fill();
  });
  
  requestAnimationFrame(update);
}

canvas.addEventListener("click", (e) => {
  console.log("Click");
  if(balls.length >= maxBalls) return;
  
  const rect = canvas.getBoundingClientRect();
  const x = e.clientX - rect.left;
  const y = e.clientY - rect.top;
  console.log("x:" + Math.floor(x), "Y" + Math.floor(y));
  
  balls.push({
    x,
    y,
    radius: 15,
    vx: (Math.random() - 0.5) * 4,
    vy: 0,
    mass: 1
  });
});

clearBtn.addEventListener("click", () => {
  balls.length = 0;
});

showTime();
setInterval(function () {
	showTime();
}, 1000);

console.log("Tudo certo!");
update();
