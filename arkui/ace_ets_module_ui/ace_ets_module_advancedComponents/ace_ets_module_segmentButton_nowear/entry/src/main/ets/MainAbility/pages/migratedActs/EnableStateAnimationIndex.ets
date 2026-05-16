/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonTextItem,
  TabSegmentButtonV2,
  CapsuleSegmentButtonV2,
  SegmentButtonV2Items,
} from '@kit.ArkUI';

export const ENABLE_STATE_ANIMATION_INDEX_PAGE: string = 'MainAbility/pages/migratedActs/EnableStateAnimationIndex';

@Component
export struct EnableStateAnimationTestContent {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '页签1' }, { text: '页签2' }, { text: '页签3' }
    ] as ItemRestriction<SegmentButtonTextItem>
  });

  @State selectedIndexes: number[] = [0];
  @State enableStateAnimationProp: boolean = true;
  @State enableStateAnimationParam1: boolean = true;
  @State enableStateAnimationParam2: boolean = true;

  build() {
    Column({ space: 30 }) {
      Text('SegmentButton (@Prop)').fontSize(18).fontWeight(FontWeight.Bold)

      SegmentButton({
        options: this.tabOptions,
        selectedIndexes: this.selectedIndexes,
        enableStateAnimation: this.enableStateAnimationProp
      })
      .key('segmentButton_prop')

      Text('TabSegmentButtonV2 (@Param)').fontSize(18).fontWeight(FontWeight.Bold)
      TabSegmentButtonV2({
        items: this.tabOptions.buttons as SegmentButtonV2Items,
        selectedIndex: this.selectedIndexes[0] ?? 0,
        enableStateAnimation: this.enableStateAnimationParam1,
        $selectedIndex: (index: number) => {
          this.selectedIndexes = [index];
        }
      })
      .key('tabSegmentButton_param')

      Text('CapsuleSegmentButtonV2 (@Param)').fontSize(18).fontWeight(FontWeight.Bold)
      CapsuleSegmentButtonV2({
        items: this.tabOptions.buttons as SegmentButtonV2Items,
        selectedIndex: this.selectedIndexes[0] ?? 0,
        enableStateAnimation: this.enableStateAnimationParam2,
        $selectedIndex: (index: number) => {
          this.selectedIndexes = [index];
        }
      })
      .key('capsuleSegmentButton_param')

      Row({ space: 12 }) {
        Text(this.enableStateAnimationProp ? '1' : '0')
          .key('mirror_enable_segment')
          .fontSize(10)
        Text(this.enableStateAnimationParam1 ? '1' : '0')
          .key('mirror_enable_tab')
          .fontSize(10)
        Text(this.enableStateAnimationParam2 ? '1' : '0')
          .key('mirror_enable_capsule')
          .fontSize(10)
      }

      Row({ space: 20 }) {
        Button('true')
          .key('btn_enable_all_true')
          .onClick(() => {
            this.enableStateAnimationProp = true;
            this.enableStateAnimationParam1 = true;
            this.enableStateAnimationParam2 = true;
          })

        Button('false')
          .key('btn_enable_all_false')
          .onClick(() => {
            this.enableStateAnimationProp = false;
            this.enableStateAnimationParam1 = false;
            this.enableStateAnimationParam2 = false;
          })
      }
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@Component
struct EnableStateAnimationIndex {
  build() {
    Column() {
      EnableStateAnimationTestContent()
    }
    .width('100%')
    .height('100%')
  }
}
