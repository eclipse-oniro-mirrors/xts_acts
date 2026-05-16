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

import { imageFrames as frames } from '../../../common/js/general';
import router from '@system.router';

export default {
  data: {
    itemIndex: -1,
    frames,
    state: null,
    str: '',
    title: 'image-animator',
    pass: 'true ;',
    fail: 'false;',
  },

  onShow() {
    const animator = this.$refs.animator;
    this.state = animator.getState();
  },
  handleStart() {
    const animator = this.$refs.animator;
    animator.start();
    this.state = animator.getState();
  },
  handlePause() {
    const animator = this.$refs.animator;
    animator.pause();
    this.state = animator.getState();
  },
  handleResume() {
    const animator = this.$refs.animator;
    animator.resume();
    this.state = animator.getState();
  },
  handleStop() {
    const animator = this.$refs.animator;
    animator.stop();
    this.state = animator.getState();
  },
  logStop() {
    console.log('Stopped');
  },

  help() {
    router.replace({
      uri: 'pages/help/index',
      params: {
        step: '操作步骤：点击播放，暂停，恢复，停止按钮',
        result: '预期结果：动画随操作步骤播放或停止，播放状态随之对应变化',
        url: 'pages/image-animator/04/index',
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