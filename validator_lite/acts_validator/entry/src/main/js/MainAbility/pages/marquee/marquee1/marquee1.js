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
    text: 'Hello JS, we are friends.',
    speed: 1,
    flag: true,
    str: '',
    title: 'marquee',
    pass: 'true ;',
    fail: 'false;'
  },
  changeSpeed() {
    if (this.flag) {
      this.speed = 5;
      this.flag = false;
    } else {
      this.speed = 50;
      this.flag = true;
    }
  },

  help() {
    router.replace({
      uri: 'pages/help/index',
      params: {
        step: '操作步骤：点击红色的跑马灯',
        result: '预期结果：红色跑马灯速度发生变化',
        url: 'pages/marquee/marquee1/marquee1'
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