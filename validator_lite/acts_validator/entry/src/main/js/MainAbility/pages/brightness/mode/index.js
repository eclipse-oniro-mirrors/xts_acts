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
import brightness from '@system.brightness';

export default {
    data: {
        itemIndex: -1,
        modeType: '',
        modeStr: ['手动调', '自动调'],
        keepScreen: true,
        str: '',
        title: 'brightness(mode)',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('onInit');
    },

    getBrightnessMode() {
        let obj = this;
        brightness.getMode({
            success: function (data) {
                obj.modeType = obj.modeStr[data.mode];
                console.info('success get brightness mode:' + data.mode);
            },
            fail: function (data, code) {
                console.info('get brightness fail, code: ' + code + ', data: ' + data);
            }
        });
    },

    setBrightnessMode(mode) {
        let obj = this;
        brightness.setMode({
            mode: mode,
            success() {
                console.info('set mode success mode: ' + mode);
                obj.getBrightnessMode();
            },
            fail(data, code) {
                console.error('set brightness success value fail, code: ' + code + ', data: ' + data);
            }
        });
    },

    keepScreenChange() {
        this.keepScreen = !this.keepScreen;
        let obj = this;
        brightness.setKeepScreenOn({
            keepScreenOn: obj.keepScreen,
            success() {
                console.info('set keep screen on success');
            },
            fail(data, code) {
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
                step: '操作步骤：点击获取模式、模式类型，常亮开关',
                result: '预期结果：显示亮度模式，切换模式后亮度模式随之变化，常亮开关开启屏幕常亮',
                url: 'pages/brightness/mode/index',
                itemIndex: this.itemIndex
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({
            uri: 'pages/second-api/index',
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
