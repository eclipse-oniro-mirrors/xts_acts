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

import { saveTxtData } from '../../../common/js/saveData';
import router from '@system.router';
import brightness from '@system.brightness';

export default {
    data: {
        value: 0,
        getValue : 0,
        str: '',
        title: 'brightness(value)',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('onInit');
    },

    getBrightnessValue() {
        let obj = this;
        brightness.getValue({
            success: function (data) {
                obj.getValue = data.value;
                this.value = this.getValue;
                console.info('success get brightness value:' + data.value);
            },
            fail: function (data, code) {
                console.info('get brightness fail, code: ' + code + ', data: ' + data);
            }
        });
    },

    clickSlider() {
        this.setBrightness(this.value);
    },

    valueChange(value) {
        this.value = value.progress;
        this.setBrightness(this.value);
    },

    setBrightness(value) {
        let obj = this;
        brightness.setValue({
            value: value,
            success: function () {
                console.info('set brightness success value: ' + value);
            },
            fail: function (data, code) {
                console.error('set brightness success value fail, code: ' + code + ', data: ' + data);
            }
        });
    },

    onDestroy() {
        console.info('onDestroy');
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击获取亮度、拖动滑动条',
                result: '预期结果：获取亮度时显示当前屏幕的亮度值，调节滑动条时看到屏幕有明暗变化',
                url: 'pages/brightness/value/index'
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({ uri: 'pages/second-api/index' });
    },

    changeResult(result) {
        saveTxtData(this, result);
    },
};
