/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {FrameCallback } from '@kit.ArkUI';

class MyFrameCallback extends FrameCallback {
  private tag: string;

  constructor(tag: string) {
    super();
    this.tag = tag;
  }

  onIdle(timeLeftInNano: number) {
    console.info('FrameTimeNanosOnIdle ' + this.tag + ' ' + timeLeftInNano.toString());
    AppStorage.SetOrCreate('FrameTimeNanosOnIdle', timeLeftInNano);
  }
}

@Entry
@Component
struct OnIdleIndex {
  build() {
    Column() {
      Button('点击触发onIdle 0')
        .id('btn_FrameCallbackOnIdle0')
        .height('10%')
        .width('100%')
        .onClick(() => {
          new MyFrameCallback('normTask')?.onIdle(0);
        })
      Button('点击触发onIdle -1')
        .id('btn_FrameCallbackOnIdle_n1')
        .height('10%')
        .width('100%')
        .onClick(() => {
          new MyFrameCallback('normTask')?.onIdle(-1);
        })
    }
    .height('100%')
  }
}