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
        value: 0,
        str: '',
        title: 'onBodyState',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('unsubscribeOnBodyState');
        this.unsubscribeOnBodyState();
    },

    subscribeOnBodyState() {
        let obj = this;
        sensor.subscribeOnBodyState({
            success: function (ret) {
                obj.value = ret.value;
                console.info('get on-body state value:' + ret.value);
            },
            fail: function (data, code) {
                console.info('Subscription faild. code: ' + code + '; Data: ' + data);
            }
        });
    },

    unsubscribeOnBodyState() {
        sensor.unsubscribeOnBodyState();
    },

    getOnBodyState() {
        let obj = this;
        sensor.getOnBodyState({
            success: function (ret) {
                obj.value = ret.value;
                console.info('on body state:' + ret.value);
            },
            fail: function (data, code) {
                console.info('Subscription faild. code: ' + code + '; Data: ' + data);
            }
        });
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击订阅佩戴和取消订阅，佩戴状态',
                result: '预期结果：订阅佩戴会实时更新当前佩戴状态，取消订阅后佩戴状态不再更新，佩戴状态显示当前的佩戴状态',
                url: 'pages/sensor/onBodyState/index'
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
