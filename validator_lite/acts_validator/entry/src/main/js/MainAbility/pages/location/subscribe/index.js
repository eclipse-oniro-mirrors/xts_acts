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
import geolocation from '@system.geolocation';

export default {
    data: {
        str: '',
        title: 'location(subscribe)',
        pass: 'true ;',
        fail: 'false;',
        todolist:[{
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        }],
    },

    onInit() {
        console.info('onInit');
    },

    subscribe() {
        let obj = this;
        geolocation.subscribe({
            success: function(data) {
                obj.todolist[0].title = '经 - 度: ' + data.longitude;
                obj.todolist[1].title = '纬 - 度: ' + data.latitude;
                obj.todolist[2].title = '海 - 拔: ' + data.altitude;
                obj.todolist[3].title = '精确度: ' + data.accuracy;
                obj.todolist[4].title = '时 - 间: ' + data.time;
                console.info('success get location data.latitude:' + data.longitude);
                console.info('success get location data.latitude:' + data.latitude);
                console.info('success get location data.altitude:' + data.altitude);
                console.info('success get location data.accuracy:' + data.accuracy);
                console.info('success get location data.time:' + data.time);
            },
            fail: function(data, code) {
                console.info('fail to subscribe code:' + code + ', data: ' + data);
            }
        });
    },

    unsubscribe() {
        geolocation.unsubscribe();
    },

    onDestroy() {
        console.info('unsubscribe');
        geolocation.unsubscribe();
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击订阅和取消按钮',
                result: '预期结果：点订阅时屏幕上显示位置信息订阅成功，取消后位置信息不会更新',
                url: 'pages/location/subscribe/index'
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
