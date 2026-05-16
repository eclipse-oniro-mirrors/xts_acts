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
        str: '',
        title: 'chart(line)',
        pass: 'true ;',
        fail: 'false;',
        lineData: [
            {
                strokeColor: '#0081ff',
                fillColor: '#cce5ff',
                data: [763, 550, 551, 554, 731, 654, 525, 696, 595, 628, 791, 505, 613, 575, 475, 553, 491, 680, 657, 716],
                gradient: false,
            }
        ],
        lineOps: {
            xAxis: {
                min: 0,
                max: 20,
                display: false,
            },
            yAxis: {
                min: 0,
                max: 1000,
                display: false,
            },
            series: {
                lineStyle: {
                    width: '5px',
                    smooth: true,
                },
                headPoint: {
                    shape: 'circle',
                    size: 10,
                    strokeWidth: 5,
                    fillColor: '#ffffff',
                    strokeColor: '#007aff',
                    display: true,
                },
                loop: {
                    margin: 2,
                    gradient: true,
                }
            }
        },
    },

    onInit() {
        console.info('onInit');
    },

    addData() {
        this.$refs.linechart.append({
            serial: 0,
            data: [Math.floor(Math.random() * 400) + 400]
        });
    },

    onDestroy() {
        console.info('onDestroy');

    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击Add data按钮',
                result: '预期结果：折线会随之变化',
                url: 'pages/chart/line/index',
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
