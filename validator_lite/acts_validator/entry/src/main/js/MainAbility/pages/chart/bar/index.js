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

export default {
    data: {
        str: '',
        title: 'chart(bar)',
        pass: 'true ;',
        fail: 'false;',
        barData: [
            {
                fillColor: '#f07826',
                data: [763, 550, 551, 554, 731, 654, 525, 696, 595, 628],
            },
            {
                fillColor: '#cce5ff',
                data: [535, 776, 615, 444, 694, 785, 677, 609, 562, 410],
            },
            {
                fillColor: '#ff88bb',
                data: [673, 500, 574, 483, 702, 583, 437, 506, 693, 657],
            },
        ],
        barOps: {
            xAxis: {
                min: 0,
                max: 20,
                display: false,
                axisTick: 10
            },
            yAxis: {
                min: 0,
                max: 1000,
                display: false,
            },
        },
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('onDestroy');

    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：无需操作',
                result: '预期结果：柱状图正常显示',
                url: 'pages/chart/bar/index'
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({ uri: 'pages/second-compent/index' });
    },

    changeResult(result) {
        saveTxtData(this, result);
    },

};
