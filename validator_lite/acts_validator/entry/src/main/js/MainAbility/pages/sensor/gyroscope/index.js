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
import sensor from '@system.sensor';

export default {
    data: {
        itemIndex: -1,
        speedX: 0,
        speedY: 0,
        speedZ: 0,
        states: '',
        str: '',
        title: 'gyroscope',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('onDestroy');
        this.unsubscribeGyroscope();
    },

    subscribeGyroscope() {
        let obj = this;
        this.states = 'normal';
        sensor.subscribeGyroscope({
            interval: 'normal',
            success: function (ret) {
                obj.speedX = ret.x;
                obj.speedY = ret.y;
                obj.speedZ = ret.z;
                console.info('X-axis data:' + ret.x);
                console.info('Y-axis data:' + ret.y);
                console.info('Z-axis data:' + ret.z);
            },
            fail: function (data, code) {
                console.info('Subscription faild. code: ' + code + '; Data: ' + data);
            }
        });
    },

    unsubscribeGyroscope() {
        sensor.unsubscribeGyroscope();
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击订阅陀螺仪和取消订阅',
                result: '预期结果：订阅陀螺仪后会实时更新当前x,y,z值，取消订阅后数据不再更新',
                url: 'pages/sensor/gyroscope/index',
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
