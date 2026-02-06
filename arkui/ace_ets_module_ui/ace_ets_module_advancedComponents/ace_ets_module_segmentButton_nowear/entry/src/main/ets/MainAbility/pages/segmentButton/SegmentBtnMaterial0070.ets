/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import uiMaterial from '@ohos.arkui.uiMaterial';
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@ohos.arkui.advanced.SegmentButton';
import { CapsuleSegmentButtonV2, SegmentButtonV2Items, TabSegmentButtonV2 } from '@ohos.arkui.advanced.SegmentButtonV2';

@Entry
@Component
struct SegmentBtnMaterial0070 {
  @State isUndefined: boolean = true
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '首页' }, { text: '视频' }, { text: '我的' }] as ItemRestriction<SegmentButtonTextItem>,
    backgroundSystemMaterial: undefined
  });
  @State capsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '首页' }, { text: '视频' }, { text: '我的' }] as ItemRestriction<SegmentButtonTextItem>,
    backgroundSystemMaterial: undefined
  });
  @State selectedIndexes: number[] = [1];

  build() {
    Column({ space: 10 }) {
      Button('change')
        .id('btnMaterial0070')
        .onClick(() => {
          this.isUndefined = this.isUndefined ? false : true
          this.tabOptions.backgroundSystemMaterial = this.isUndefined ? undefined :
            new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT } as uiMaterial.MaterialOptions)
          this.capsuleOptions.backgroundSystemMaterial = this.isUndefined ? undefined :
            new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT } as uiMaterial.MaterialOptions)
        })
      SegmentButton({
        options: this.tabOptions,
        selectedIndexes: $selectedIndexes
      })
      SegmentButton({
        options: this.capsuleOptions,
        selectedIndexes: $selectedIndexes
      })
      SegmentButtonV2Material0070({ isUndefined: this.isUndefined, selectedIndex: this.selectedIndexes[0] })
    }
  }
}

@ComponentV2
struct SegmentButtonV2Material0070 {
  @Local textItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '首页' },
    { text: '视频' },
    { text: '我的' }
  ]);
  @Require @Param selectedIndex: number
  @Local imageItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { icon: $r('sys.media.ohos_ic_public_device_phone') },
    { icon: $r('sys.media.ohos_ic_public_device_pad') },
    { icon: $r('sys.media.ohos_ic_public_device_matebook') }
  ]);
  @Require @Param isUndefined: boolean

  build() {
    Column({ space: 10 }) {
      TabSegmentButtonV2({
        items: this.textItems,
        selectedIndex: this.selectedIndex!!,
        backgroundSystemMaterial: this.isUndefined ? undefined :
          new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT } as uiMaterial.MaterialOptions)
      })
      CapsuleSegmentButtonV2({
        items: this.imageItems,
        selectedIndex: this.selectedIndex!!,
        backgroundSystemMaterial: this.isUndefined ? undefined :
          new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT } as uiMaterial.MaterialOptions)
      })
    }
  }
}