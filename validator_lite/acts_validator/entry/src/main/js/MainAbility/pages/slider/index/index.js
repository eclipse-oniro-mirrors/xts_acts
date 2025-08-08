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
        sliderValue: '',
        dynamicValue: 150,
        str: '',
        title: 'slider',
        pass: 'true ;',
        fail: 'false;'
    },

    clickSlider() {
        console.log('onClick called...');
        this.sliderValue = 'slider clicked';
    },

    valueChange(value) {
        console.log('valueChange called... this.dynamicValue = ' + this.dynamicValue);
        this.sliderValue = 'slider changed';
        this.dynamicValue = value.progress;
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：拖动或点击滑动条',
                result: '预期结果：滑动条值跟随变化并显示操作状态',
                url: 'pages/slider/index/index',
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
