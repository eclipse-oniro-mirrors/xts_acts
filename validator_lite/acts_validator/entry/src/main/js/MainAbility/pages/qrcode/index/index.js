/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';

export default {
    data: {
        itemIndex: -1,
        qrColor: '#87ceeb',
        qrBackgroundColor: '#f0ffff',
        qrValue: 'value',
        str: '',
        title: 'qrcode',
        pass: 'true ;',
        fail: 'false;'
    },
    clickAction() {
        console.log('trigger click');
    },
    swipeAction() {
        console.log('trigger swipe');
    },

    changeColor() {
        if (this.qrColor === '#87ceeb') {
            this.qrColor = '#fa8072';
        } else {
            this.qrColor = '#87ceeb';
        }
    },
    changeBackgroundColor() {
        if (this.qrBackgroundColor === '#f0ffff') {
            this.qrBackgroundColor = '#fff000';
        } else {
            this.qrBackgroundColor = '#f0ffff';
        }
    },
    changeValue() {
        console.info('change value');
        if (this.qrValue !== 'value') {
            this.qrValue = 'value';
        } else {
            this.qrValue += 'qrcode';
        }
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击值，颜色，背景色按钮',
                result: '预期结果：值时二维码会变化，颜色时二维码颜色变化，背景色时背景颜色变化',
                url: 'pages/qrcode/index/index',
                itemIndex: this.itemIndex
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({
            uri: 'pages/second-compent/index',
            params: {
                itemIndex: this.itemIndex
            }
        });
    },

    changeResult(result) {
        getApp().data.keyList[this.title] = result;
        this.back();
    },
};
