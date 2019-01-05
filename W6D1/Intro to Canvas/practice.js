document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.width = 500;
    canvas.height = 500;

    const ctx = canvas.getContext('2d');
    ctx.fillStyle = "mediumaquamarine";
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(100, 100, 50, 0, 2 * Math.PI);
    ctx.strokeStyle = "slateblue";
    ctx.lineWidth = 2;
    ctx.stroke();
    ctx.fillStyle = "slateblue";
    ctx.fill();

    ctx.beginPath();
    ctx.arc(250, 450, 12, 0, 2 * Math.PI);
    ctx.fillStyle = "silver";
    ctx.fillRect(240, 375, 20, 50);
    ctx.fill();

    ctx.beginPath();
    ctx.arc(245, 350, 30, 1.715, 3, true);
    ctx.strokeStyle = "silver";
    ctx.lineWidth= 15;
    ctx.stroke();

    ctx.beginPath();
    ctx.arc(150, 450, 12, 0, 2 * Math.PI);
    ctx.fillStyle = "gold";
    ctx.fillRect(140, 375, 20, 50);
    ctx.fill();

    ctx.beginPath();
    ctx.arc(145, 350, 30, 1.715, 3, true);
    ctx.strokeStyle = "gold";
    ctx.lineWidth = 15;
    ctx.stroke();


    ctx.beginPath();
    ctx.arc(350, 450, 12, 0, 2 * Math.PI);
    ctx.fillStyle = "red";
    ctx.fillRect(340, 375, 20, 50);
    ctx.fill();

    ctx.beginPath();
    ctx.arc(345, 350, 30, 1.715, 3, true);
    ctx.strokeStyle = "red";
    ctx.lineWidth = 15;
    ctx.stroke();


});

