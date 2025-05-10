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

import { commonFunc } from '../../../common/js/event';
import { saveTxtData } from '../../../common/js/saveData';
import router from '@system.router';

export default {
  data: {
    color: '#5265ef',
    flag: false,
    pointX: 0,
    pointY: 0,
    timeStamp: 0,
    str: '',
    title: 'longpress',
    pass: 'true ;',
    fail: 'false;'
  },
  longPressEvent(e) {
    console.info('press start');
    commonFunc(this, e);
    console.info('press stop');
  },

  help() {
    router.replace({
      uri: 'pages/help/index',
      params: {
        step: '操作步骤：长按彩色区域',
        result: '预期结果：x、y、timeStamp、彩色区颜色随长按事件变化而变化',
        url: 'pages/event/longpress/index'
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
