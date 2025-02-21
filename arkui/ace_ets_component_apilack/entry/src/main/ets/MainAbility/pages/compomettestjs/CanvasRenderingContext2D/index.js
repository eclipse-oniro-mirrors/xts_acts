/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

 import prompt from '@system.prompt';
 export default {
     data:{
         left:0,
         top:0,
     },
     onShow(){
         // 屬性
         this.props1()
         this.props2()
         this.props3()
         this.props4()
         this.props5()
         this.props6()
         this.props7()
         this.props8()
         this.props9()
         this.props10()
         this.props11()
         this.props12()
 
         // 方法
         this.functionTouch1()
         this.functionTouch2()
         this.functionTouch3()
         this.functionTouch4()
         this.functionTouch5()
         this.functionTouch6()
         this.functionTouch7()
         this.functionTouch8()
         this.functionTouch9()
         this.functionTouch10()
         this.functionTouch11()
         this.functionTouch12()
         this.functionTouch13()
         this.functionTouch14()
         this.functionTouch15()
         this.functionTouch16()
         this.functionTouch17()
         this.functionTouch18()
         this.functionTouch19()
         this.functionTouch20()
         this.functionTouch21()
         this.functionTouch22()
 
 
     },
     props1() {
         const el = this.$refs.canvas1;
         const ctx = el.getContext('2d');
         ctx.fillStyle = '#0000ff';
         ctx.fillRect(0, 0, 100, 30);
     },
     props2() {
         const el = this.$refs.canvas2;
         const ctx = el.getContext('2d');
         ctx.lineWidth = 10;
         ctx.strokeStyle = '#0000ff';
         ctx.lineCap = 'round';
         ctx.strokeRect(0, 0, 100, 30);
     },
     props3() {
         const el = this.$refs.canvas3;
         const ctx = el.getContext('2d');
         ctx.lineWidth = 8;
         ctx.beginPath();
         ctx.lineCap = 'round';
         ctx.moveTo(10, 10);
         ctx.lineTo(100, 10);
         ctx.stroke();
     },
     props4() {
         const el = this.$refs.canvas4;
         const ctx = el.getContext('2d');
         ctx.beginPath();
         ctx.lineWidth = 5;
         ctx.lineJoin = 'miter';
         ctx.moveTo(10, 10);
         ctx.lineTo(80, 30);
         ctx.lineTo(10, 50);
         ctx.stroke();
     },
     props5() {
         const el =this.$refs.canvas5;
         const ctx = el.getContext('2d');
         ctx.lineWidth = 5;
         ctx.lineJoin = 'miter';
         ctx.miterLimit = 3;
         ctx.moveTo(10, 10);
         ctx.lineTo(60, 15);
         ctx.lineTo(10, 40);
         ctx.stroke();
     },
     props6() {
         const el =this.$refs.canvas6;
         const ctx = el.getContext('2d');
         ctx.font = '20px sans-serif';
         ctx.fillText("Hello World", 10, 20);
     },
     props7() {
         const el =this.$refs.canvas7;
         const ctx = el.getContext('2d');
         ctx.fillStyle = 'rgb(255,0,0)';
         ctx.fillRect(0, 0, 40, 40);
         ctx.globalAlpha = 0.4;
         ctx.fillStyle = 'rgb(0,0,255)';
         ctx.fillRect(40, 40, 40, 40);
 
     },
     props8() {
         const el =this.$refs.canvas8;
         const ctx = el.getContext('2d');
         ctx.arc(50, 40, 30, 0, 6.28);
         ctx.setLineDash([10,20]);
         ctx.lineDashOffset = 10.0;
         ctx.stroke();
     },
     props9() {
         const el =this.$refs.canvas9;
         const ctx = el.getContext('2d');
         ctx.fillStyle = 'rgb(255,0,0)';
         ctx.fillRect(10, 10, 30, 30);
         ctx.globalCompositeOperation = 'source-over';
         ctx.fillStyle = 'rgb(0,0,255)';
         ctx.fillRect(25, 25, 30, 30);
         // Start drawing second example
         ctx.fillStyle = 'rgb(255,0,0)';
         ctx.fillRect(70, 10, 30, 30);
         ctx.globalCompositeOperation = 'destination-over';
         ctx.fillStyle = 'rgb(0,0,255)';
         ctx.fillRect(85, 25, 30, 30);
     },
     props10() {
         const el =this.$refs.canvas10;
         const ctx = el.getContext('2d');
         ctx.shadowBlur = 30;
         ctx.shadowColor = 'rgb(0,0,0)';
         ctx.fillStyle = 'rgb(255,0,0)';
         ctx.fillRect(20, 20, 70, 50);
     },
     props11() {
         const el =this.$refs.canvas11;
         const ctx = el.getContext('2d');
         ctx.shadowBlur = 10;
         ctx.shadowOffsetX = 20;
         ctx.shadowOffsetY = 20;
         ctx.shadowColor = 'rgb(0,0,0)';
         ctx.fillStyle = 'rgb(255,0,0)';
         ctx.fillRect(10, 0, 70, 50);
     },
     props12() {
         const el =this.$refs.canvas12;
         const ctx = el.getContext('2d');
         var img = new Image();
         img.src = 'common/images/image.png';
         img.onload = function() {
             ctx.imageSmoothingEnabled = false;
             ctx.drawImage(img, 10, 0, 100, 60);
         };
     },
 
     functionTouch1() {
         const el =this.$refs.function1;
         const ctx = el.getContext('2d');
         ctx.fillStyle = 'rgb(0,0,255)';
         ctx.fillRect(0, 0, 100, 40);
         ctx.clearRect(20, 10, 60, 20);
     },
     functionTouch2() {
         const el =this.$refs.function2;
         const ctx = el.getContext('2d');
         ctx.font = '18px sans-serif';
         ctx.strokeText("Hello World!", 0, 20);
     },
     functionTouch3() {
         const el =this.$refs.function3;
         const ctx = el.getContext('2d');
         ctx.font = '16px sans-serif';
         var txt = 'Hello World';
         ctx.fillText("width:" + ctx.measureText(txt).width, 0, 10);
         ctx.fillText(txt, 0, 25);
     },
     functionTouch4() {
         const el =this.$refs.function4;
         const ctx = el.getContext('2d');
         ctx.beginPath();
         ctx.moveTo(5, 5);
         ctx.lineTo(70, 5);
         ctx.lineTo(40, 60);
         ctx.closePath();
         ctx.stroke();
     },
     functionTouch5() {
         const el =this.$refs.function5;
         const ctx = el.getContext('2d');
         var img = new Image();
         img.src = 'common/images/sun.png';
         var pat = ctx.createPattern(img, 'repeat');
         ctx.fillStyle = pat;
         ctx.fillRect(20, 0, 60, 50);
     },
     functionTouch6() {
         const el =this.$refs.function6;
         const ctx = el.getContext('2d');
         ctx.beginPath();
         ctx.moveTo(10, 10);
         ctx.bezierCurveTo(20, 40, 80, 40, 100, 10);
         ctx.stroke();
     },
     functionTouch7() {
         const el =this.$refs.function7;
         const ctx = el.getContext('2d');
         ctx.beginPath();
         ctx.moveTo(10, 10);
         ctx.quadraticCurveTo(50, 50, 100, 10);
         ctx.stroke();
     },
     functionTouch8() {
         const el =this.$refs.function8;
         const ctx = el.getContext('2d');
         ctx.moveTo(30, 20);
         ctx.arcTo(70, 10, 70, 20, 30); // Create an arc
         ctx.stroke();
     },
     functionTouch9() {
         const el =this.$refs.function9;
         const ctx = el.getContext('2d');
         ctx.beginPath();
         ctx.ellipse(50, 50, 30, 60, Math.PI * 0.25, Math.PI * 0.5, Math.PI, 1);
         ctx.stroke();
     },
     functionTouch10() {
         const el =this.$refs.function10;
         const ctx = el.getContext('2d');
         ctx.rect(10, 0, 60, 60); // Create a 100*100 rectangle at (20, 20)
         ctx.fill(); // Draw it in default setting
     },
     functionTouch11() {
         const el =this.$refs.function11;
         const ctx = el.getContext('2d');
         ctx.rect(10, 0, 50, 50);
         ctx.stroke();
         ctx.clip();
         // Draw red rectangle after clip
         ctx.fillStyle = "rgb(255,0,0)";
         ctx.fillRect(0, 0, 40, 40);
     },
     functionTouch12() {
         const el =this.$refs.function12;
         const ctx = el.getContext('2d');
         ctx.rotate(45 * Math.PI / 180); // Rotate the rectangle 45 degrees
         ctx.fillRect(20, 0, 20, 20);
     },
     functionTouch13() {
         const el =this.$refs.function13;
         const ctx = el.getContext('2d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.scale(1.5, 1.5);// Scale to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch14() {
         const el =this.$refs.function14;
         const ctx = el.getContext('2d');
         ctx.fillStyle = 'rgb(0,0,0)';
         ctx.fillRect(0, 0, 30, 30)
         ctx.transform(1, 0.5, -0.5, 1, 3, 3);
         ctx.fillStyle = 'rgb(255,0,0)';
         ctx.fillRect(0, 0, 30, 30);
         ctx.transform(1, 0.5, -0.5, 1, 3, 3);
         ctx.fillStyle = 'rgb(0,0,255)';
         ctx.fillRect(0, 0, 30, 30);
     },
     functionTouch15() {
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.translate(50, 10);
         ctx.fillRect(10, 10, 30, 30);
     },
 
     functionTouch16() {
         const el =this.$refs.function16;
         const ctx = el.getContext('3d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.scale3d(1.5, 1.5, 1.5);// scale3d to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch17() {
         const el =this.$refs.function17;
         const ctx = el.getContext('2d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.scaleX(1.5);// scaleX to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch18() {
         const el =this.$refs.function18;
         const ctx = el.getContext('2d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.scaleY(1.5);// scaleY to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch19() {
         const el =this.$refs.function19;
         const ctx = el.getContext('2d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.scaleZ(1.5);// scaleZ to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch20() {
         const el =this.$refs.function20;
         const ctx = el.getContext('2d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.skew(1.5, 1.5);// skew to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch21() {
         const el =this.$refs.function21;
         const ctx = el.getContext('2d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.skewX(1.5);// skew to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch22() {
         const el =this.$refs.function22;
         const ctx = el.getContext('2d');
         ctx.strokeRect(10, 10, 25, 25);
         ctx.skewY(1.5);// skew to 200%
         ctx.strokeRect(10, 10, 20, 20);
     },
     functionTouch23() {
        const el =this.$refs.function22;
        const ctx = el.getContext('2d');
        ctx.strokeRect(10, 10, 25, 25);
        ctx.perspective(1.5);// perspective to 200%
        ctx.strokeRect(10, 10, 20, 20);
    },
    functionTouch24() {
        const el =this.$refs.function15;
        const ctx = el.getContext('2d');
        ctx.fillRect(10, 10, 30, 30);
        ctx.translateX(50);
        ctx.fillRect(10, 10, 30, 30);
    },
    functionTouch25() {
        const el =this.$refs.function15;
        const ctx = el.getContext('2d');
        ctx.fillRect(10, 10, 30, 30);
        ctx.translateY(10);
        ctx.fillRect(10, 10, 30, 30);
    },
    functionTouch26() {
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.translateY(10);
         ctx.fillRect(10, 10, 30, 30);
    },
    functionTouch27() {
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.rotate3d(10,10,10);
         ctx.fillRect(10, 10, 30, 30);
     },
     functionTouch28() {
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.rotateX(10);
         ctx.fillRect(10, 10, 30, 30);
     },
     functionTouch29() {
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.rotateY(10);
         ctx.fillRect(10, 10, 30, 30);
     },
     functionTouch30() {
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.rotateZ(10);
         ctx.fillRect(10, 10, 30, 30);
     },
	 functionTouch30() {
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.rotateZ(10);
         ctx.fillRect(10, 10, 30, 30);
     },
	 functionTouch31() { 
		 let mat = new Matix2D();
		 mat.multiply();
		 let stack = new StackAttribute();
		 stack.alignContent();
         const el =this.$refs.function15;
         const ctx = el.getContext('2d');
         ctx.fillRect(10, 10, 30, 30);
         ctx.multiply();
         ctx.fillRect(10, 10, 30, 30);
     },
	 functionTouch32() {
        const el =this.$refs.function15;
        const ctx = el.getContext('2d');
        ctx.fillRect(10, 10, 30, 30);
        ctx.translateZ(50);
        ctx.fillRect(10, 10, 30, 30);
    },


 }