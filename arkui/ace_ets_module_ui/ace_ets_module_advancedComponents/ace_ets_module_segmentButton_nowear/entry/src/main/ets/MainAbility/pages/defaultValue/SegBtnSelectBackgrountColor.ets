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
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonTextItem
} from '@kit.ArkUI';

@Entry
@Component
struct SegBtnSelectBackgrountColor {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' }, {
      text: '页签按钮3'
    }] as ItemRestriction<SegmentButtonTextItem>,
    selectedBackgroundColor: undefined,
  });
  @State tabOptions1: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签按钮1' }, { text: '页签按钮2' }, {
      text: '页签按钮3'
    }] as ItemRestriction<SegmentButtonTextItem>,
  });
  @State capsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '单选按钮1' }, { text: '单选按钮2' }, {
      text: '单选按钮3'
    }] as ItemRestriction<SegmentButtonTextItem>,
    selectedBackgroundColor: undefined
  });
  @State capsuleOptions1: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '单选按钮1' }, { text: '单选按钮2' }, {
      text: '单选按钮3'
    }] as ItemRestriction<SegmentButtonTextItem>,
  });
  @State tabSelectedIndexes: number[] = [1];
  aboutToAppear(): void {
    const resourceManager = this.getUIContext().getHostContext()?.resourceManager;
    AppStorage.setOrCreate<string>('selectedBackgroundColor_1', '#' + resourceManager?.getColorSync($r('sys.color.ohos_id_color_foreground_contrary').id).toString(16).toUpperCase())
    AppStorage.setOrCreate<string>('selectedBackgroundColor_2', '#' + resourceManager?.getColorSync($r('sys.color.ohos_id_color_emphasize').id).toString(16).toUpperCase())
  }
  build() {
    Column({ space: 25 }) {
      SegmentButton({
        options: this.tabOptions,
        selectedIndexes: $tabSelectedIndexes
      })
      SegmentButton({
        options: this.tabOptions1,
        selectedIndexes: $tabSelectedIndexes
      })
      SegmentButton({
        options: this.capsuleOptions,
        selectedIndexes: $tabSelectedIndexes
      })
      SegmentButton({
        options: this.capsuleOptions1,
        selectedIndexes: $tabSelectedIndexes
      })
    }
    .height('90%')
    .padding('10%')

  }
}