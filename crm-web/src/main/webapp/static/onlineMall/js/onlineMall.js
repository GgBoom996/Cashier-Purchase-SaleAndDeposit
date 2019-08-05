var timer = null,
    index = 0,
    pics = document.getElementsByClassName("banner-slide"),
    lis = document.getElementsByTagName("li");


//封装一个代替getElementById()的方法
function byId(id){
    return typeof(id) === "string"?document.getElementById(id):id;
}

function slideImg() {
    var main = byId("main");
    var banner = byId("banner");
    main.onmouseover = function(){
        stopAutoPlay();
    }
    main.onmouseout = function(){
        startAutoPlay();
    }
    main.onmouseout();

    //点击导航栏切换图片
    for(var i=0;i<pics.length;i++){
        lis[i].id = i;
        //给每个li项绑定点击事件
        lis[i].onclick = function(){
            //获取当前li项的index值
            index = this.id;
            changeImg();
        }
    }
}
//开始播放轮播图
function startAutoPlay(){
    timer = setInterval(function(){
        index++;
        if(index>2){
            index = 0;
        }
        changeImg();
    },3000);
}
//暂停播放
function stopAutoPlay(){
    if (timer) {
        clearInterval(timer);
    }
}
//改变轮播图
function changeImg(){
    for(var i=0;i<pics.length;i++){
        pics[i].style.display = "none";
        lis[i].className = "";
    }
    pics[index].style.display = "block";
    lis[index].className = "changeColor";
}
slideImg();
$(function () {
    var mySwiper = new Swiper ('.main', {
        loop: true,
        effect : 'slide',//slide的切换效果，默认为"slide"（位移切换），可设置为'slide'（普通切换、默认）,"fade"（淡入）"cube"（方块）"coverflow"（3d流）"flip"（3d翻转）。
        autoplay : {
            delay:3000,
            disableOnInteraction: false,//用户操作swiper之后，是否禁止autoplay。默认为true：停止。
        },
        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
            clickable :true,//此参数设置为true时，点击分页器的指示点分页器会控制Swiper切换。
        },
        // 如果需要前进后退按钮
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    })
})