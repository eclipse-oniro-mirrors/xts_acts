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
    listData: [],
    str: '',
    title: 'list-item',
    pass: 'true ;',
    fail: 'false;'
  },
  onInit() {
    for (let i = 0; i < 10; i++) {
      this.listData.push('common/left.png');
      this.listData.push('common/right.png');
      this.listData.push('common/music_prev.png');
      this.listData.push('common/music_next.png');
      this.listData.push('common/music_play.png');
      this.listData.push('common/goAhead.png');
    }
  },
  help() {
    router.replace({
      uri: 'pages/help/index',
      params: {
        step: '操作步骤：在方框内上下滑动',
        result: '预期结果：方框中的元素随滑动变化',
        url: 'pages/list-item/item5/item5'
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

  scrollEnd(endState, endComponentIndex) {
    console.log(
      'list onscrollend is triggered, end component index=' + endComponentIndex
    );
  },
  listClick() {
    console.log('list onclick is triggered');
  }
};