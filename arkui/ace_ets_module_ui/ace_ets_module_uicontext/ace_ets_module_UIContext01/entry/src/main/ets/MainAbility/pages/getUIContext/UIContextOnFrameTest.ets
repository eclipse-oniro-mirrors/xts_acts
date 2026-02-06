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

  onFrame(frameTimeNanos: number) {
    console.info('FrameTimeNanosOnframe ' + this.tag + ' ' + frameTimeNanos.toString());
    AppStorage.SetOrCreate('FrameTimeNanosOnframe', frameTimeNanos);
  }
}

@Entry
@Component
struct OnFrameIndex {
  build() {
    Column() {
      Button('点击触发postFrameCallback 0')
        .id('btn_postFrameCallback0')
        .height('10%')
        .width('100%')
        .onClick(() => {
          new MyFrameCallback('normTask')?.onFrame(0);
        })
      Button('点击触发postFrameCallback -1')
        .id('btn_postFrameCallback_n1')
        .height('10%')
        .width('100%')
        .onClick(() => {
          new MyFrameCallback('normTask')?.onFrame(-1);
        })
    }
    .height('100%')
  }
}