/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { UIPickerComponentModifier } from '@ohos.arkui.modifier'

@Entry
@Component
struct onScrollStopModifierTest {
  @State index: number = 0;
  @State selectedIndex: number = 0;
  private fontSize: number | string | Resource = '25vp';
  private monthArray: string[] = [];
  @State color: string = '#ffff00'
  @State modifier: UIPickerComponentModifier = new UIPickerComponentModifier()
    .onScrollStop((index: number | number[]) => {
      console.info('Picker :onScrollStop, value: ' + ', index: ' + index)
      this.color = '#ff00ff'
    })

  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Column({ space: 20 }) {
      UIPickerComponent({
        selectedIndex: this.selectedIndex,
      }) {
        ForEach(this.monthArray, (item: string) => {
          Text(item)
            .fontSize(this.fontSize)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
        })
      }
      .width('15%')
      .id('picker1')
      .canLoop(true)
      .attributeModifier(this.modifier)
      .height('50%')
      .backgroundColor(this.color)
    }
    .height('100%')
    .width('100%')
  }
}
