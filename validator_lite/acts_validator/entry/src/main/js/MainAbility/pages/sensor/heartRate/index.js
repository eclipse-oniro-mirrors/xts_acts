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
        heartRate: 0,
        str: '',
        title: 'heartRate',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('subscribeHeartRate');

    },

    onDestroy() {
        console.info('unsubscribeHeartRate');
        sensor.unsubscribeHeartRate();
    },

    subscribeHeartRate() {
        let obj = this;
        sensor.subscribeHeartRate({
            success: function (ret) {
                obj.heartRate = ret.heartRate;
                console.info('get heartRate value:' + ret.heartRate);
            },
            fail: function (data, code) {
                console.info('Subscription faild. code: ' + code + '; Data: ' + data);
            }
        });
    },

    unsubscribeHeartRate() {
        sensor.unsubscribeHeartRate();
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击订阅心率和取消订阅',
                result: '预期结果：订阅心率后会实时更新当前心率值，取消订阅后心率不再更新',
                url: 'pages/sensor/heartRate/index',
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
