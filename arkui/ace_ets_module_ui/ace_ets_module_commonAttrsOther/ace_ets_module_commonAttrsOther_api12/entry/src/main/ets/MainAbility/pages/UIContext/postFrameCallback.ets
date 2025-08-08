/**
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
import {
  PresetSplitRatio,
  ExtraRegionPosition,
  ExpandedRegionLayoutOptions,
} from '@ohos.arkui.advanced.FoldSplitContainer';
class MyFrameCallback {
  private tag: string;

  constructor(tag: string) {
    this.tag = tag;
  }

  onFrame(frameTimeNanos: number) {
    console.info('MyFrameCallback ' + this.tag + ' ' + frameTimeNanos.toString());
  }
}

@Entry
@Component
struct Index {
  @State status: boolean = true
  @State expandedRegionLayoutOptions: ExpandedRegionLayoutOptions = {
    horizontalSplitRatio: PresetSplitRatio.LAYOUT_3V2,
    verticalSplitRatio: PresetSplitRatio.LAYOUT_1V1,
    isExtraRegionPerpendicular: this.status,
    extraRegionPosition: ExtraRegionPosition.TOP
  };
  @State mText1: string = 'init'
  build() {
    Row() {
      Column() {
        Column({ space: 12 }) {
          Text(this.mText1).id('postFrameCallback')
          Text(this.status + '').id('isExtraRegionPerpendicular')
        }.margin(30)
        Button('点击触发postFrameCallback')
          .onClick(() => {
            this.mText1 = 'postFrameCallback'
            this.status = false
          }).id('btn1')
      }.width('100%')
    }.height('100%')
  }
}