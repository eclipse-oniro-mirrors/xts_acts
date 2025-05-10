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
import sensor from '@system.sensor';

export default {
    data: {
        pressure: 0,
        str: '',
        title: 'barometer',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('subscribeBarometer');
    },

    onDestroy() {
        console.info('unsubscribeBarometer');
        this.unsubscribeBarometer();
    },

    subscribeBarometer() {
        let obj = this;
        sensor.subscribeBarometer({
            success: function (ret) {
                obj.pressure = ret.pressure;
                console.info('get pressure value:' + ret.pressure);
            },
            fail: function (data, code) {
                console.info('Subscription faild. code: ' + code + '; Data: ' + data);
            }
        });
    },

    unsubscribeBarometer() {
        sensor.unsubscribeBarometer();
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击订阅气压和取消订阅',
                result: '预期结果：订阅气压后会实时更新当前气压，取消订阅后气压值不再更新',
                url: 'pages/sensor/barometer/index'
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
