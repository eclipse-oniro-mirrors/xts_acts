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
        title: 'location(info)',
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

    getLocationInfo() {
        let obj = this;
        geolocation.getLocation({
            success: function (data) {
                obj.todolist[0].title = '经 - 度: ' + data.longitude;
                obj.todolist[1].title = '纬 - 度: ' + data.latitude;
                obj.todolist[2].title = '海 - 拔: ' + data.altitude;
                obj.todolist[3].title = '精确度: ' + data.accuracy;
                obj.todolist[4].title = '时 - 间: ' + data.time;
            },
            fail: function (data, code) {
                console.info('fail to get location code:' + code + ', data: ' + data);
            }
        });
    },

    getLocationType() {
        let obj = this;
        geolocation.getLocationType({
            success: function (data) {
                obj.todolist[5].title = '定位类型： ' + data.types[0];
                console.info('success get location type:' + data.types[0]);
            },
            fail: function (data, code) {
                console.info('fail to get location type code:' + code + ', data: ' + data);
            }
        });
    },

    getSupportedCoordType() {
        let types = geolocation.getSupportedCoordTypes();
        this.todolist[6].title = '坐标系： ' + '[';
        for (let i = 0; i < types.length; i++) {
            this.todolist[6].title += types[i];
            if (i < types.length - 1) {
                this.todolist[6].title += ',';
            }
        }
        this.todolist[6].title += ']';
    },

    onDestroy() {
        console.info('unsubscribe');
        geolocation.unsubscribe();
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击获取，类型，坐标系',
                result: '预期结果：屏幕上出现位置信息，定位类型信息，坐标系信息',
                url: 'pages/location/info/index'
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
