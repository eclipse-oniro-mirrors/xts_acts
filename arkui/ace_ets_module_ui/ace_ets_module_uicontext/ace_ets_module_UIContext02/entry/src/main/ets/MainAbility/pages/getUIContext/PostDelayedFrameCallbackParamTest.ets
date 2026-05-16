/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {FrameCallback } from '@ohos.arkui.UIContext';

class MyFrameCallback extends FrameCallback {
  private tag: string;

  constructor(tag: string) {
    super()
    this.tag = tag;
  }

  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
    AppStorage.setOrCreate('onFrameTest1Mes', 'onFrame')
  }
}

@Entry
@Component
struct postDelayedFrameCallbackIndex1 {
  build() {
    Row() {
      Column() {
        Button('postDelayedFrameCallback -1')
          .id('postDelayedFrameCallback_id1')
          .onClick(() => {
            this.getUIContext().postDelayedFrameCallback(new MyFrameCallback('delayTask'), -1);
            console.info('MyFrameCallback -1');
            AppStorage.setOrCreate('postDelayedFrameCallback1', 'success')
          })
        Button('postDelayedFrameCallback 0')
          .id('postDelayedFrameCallback_id2')
          .onClick(() => {
            this.getUIContext().postDelayedFrameCallback(new MyFrameCallback('delayTask'), 0);
            console.info('MyFrameCallback 0');
            AppStorage.setOrCreate('postDelayedFrameCallback2', 'success')
          })
        Button('postDelayedFrameCallback 100000000')
          .id('postDelayedFrameCallback_id3')
          .onClick(() => {
            this.getUIContext().postDelayedFrameCallback(new MyFrameCallback('delayTask'), 100000000);
            console.info('MyFrameCallback 100000000');
            AppStorage.setOrCreate('postDelayedFrameCallback3', 'success')
          })
        Button('postDelayedFrameCallback 100000001')
          .id('postDelayedFrameCallback_id4')
          .onClick(() => {
            this.getUIContext().postDelayedFrameCallback(new MyFrameCallback('delayTask'), 100000001);
            console.info('MyFrameCallback 100000001');
            AppStorage.setOrCreate('postDelayedFrameCallback4', 'success')
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}