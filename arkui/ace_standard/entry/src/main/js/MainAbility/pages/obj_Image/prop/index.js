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
    },
    props1() {
        const el =this.$refs.canvas1
        var ctx = el.getContext('2d');
        var img = new Image();
        img.src = 'common/images/image.png';
        img.onload = function() {
            console.log('Image load success');
            ctx.drawImage(img, 0, 0, 300, 100);
            prompt.showToast({
                message: 'Image load success: width=' + img.width + ',height=' + img.height
            });
        };
        img.onerror = function() {
            console.log('Image load fail');
        };
    },
    props2() {
        const el =this.$refs.canvas2
        var ctx = el.getContext('2d');
        var img = new Image();
        img.src = 'common/images/image.png';
        img.onload = function() {
            console.log('Image load success');
            ctx.drawImage(img, 0, 0, 200, 100);
            prompt.showToast({
                message: 'Image load success: width=' + img.width + ',height=' + img.height
            });
        };
        img.onerror = function() {
            console.log('Image load fail');
        };
    },
    props3() {
        const el =this.$refs.canvas3
        var ctx = el.getContext('2d');
        var img = new Image();
        img.src = 'common/images/image.png';
        img.onload = function() {
            console.log('Image load success');
            ctx.drawImage(img, 0, 0, 300, 50);
            prompt.showToast({
                message: 'Image load success: width=' + img.width + ',height=' + img.height
            });
        };
        img.onerror = function() {
            console.log('Image load fail');
        };
    },
    props4() {
        const el =this.$refs.canvas4
        var ctx = el.getContext('2d');
        var img = new Image();
        img.src = 'common/images/image.png';
        img.onload = function() {
            console.log('Image load success');
            ctx.drawImage(img, 0, 0, 300, 100);
            prompt.showToast({
                message: 'onload: Image load success: width=' + img.width + ',height=' + img.height
            });
        };
        img.onerror = function() {
            console.log('Image load fail');
        };
    },
    props5() {
        const el =this.$refs.canvas5
        var ctx = el.getContext('2d');
        var img = new Image();
        img.src = 'common/images/image.png';
        img.onload = function() {
            console.log('Image load success');
            ctx.drawImage(img, 0, 0, 300, 100);
            prompt.showToast({
                message: 'Image load success: width=' + img.width + ',height=' + img.height
            });
        };
        img.onerror = function() {
            console.log('onerror: Image load fail');
        };
    },

}