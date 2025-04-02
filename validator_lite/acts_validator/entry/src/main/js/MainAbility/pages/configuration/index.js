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

import { saveTxtData } from '../../common/js/saveData';
import router from '@system.router';
import configuration from '@system.configuration';

export default {
    data: {
        localeInfo: '',
        str: '',
        title: 'configuration',
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
        }
        ],
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('onDestroy');
    },

    getInfo() {
        let info = configuration.getLocale();
        console.log(JSON.stringify(info));
        this.todolist[0].title = '语言: ' + info.language;
        this.todolist[1].title = '国家: ' + info.countryOrRegion;
        this.todolist[2].title = '文字布局方向: ' + info.dir;
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击获取信息',
                result: '预期结果：获取信息按钮正确显示应用当前的语言和地区',
                url: 'pages/configuration/index'
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
