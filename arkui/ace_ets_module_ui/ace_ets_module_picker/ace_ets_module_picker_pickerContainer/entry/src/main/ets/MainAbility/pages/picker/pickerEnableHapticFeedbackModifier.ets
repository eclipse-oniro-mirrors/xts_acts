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
import { MessageManager, Callback } from '../../common/MessageManager';

class EnabledPickerModifier implements AttributeModifier<UIPickerComponentAttribute> {
  private enabled: Optional<boolean> = undefined

  constructor(enable?: Optional<boolean>) {
    this.enabled = enable
  }

  applyNormalAttribute(instance: UIPickerComponentAttribute): void {
    instance.enableHapticFeedback(this.enabled)
  }
}

@Entry
@Component
struct PickerEnableHapticFeedbackModifierPage {
  @State index: number = 0;
  @State selectedIndex: number = 0;
  private fontSize: number | string | Resource = '25vp';
  private monthArray: string[] = [];

  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Row() {
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
      .attributeModifier(new EnabledPickerModifier(true))
      .onChange((index: number) => {
        console.info('Picker :onChange ' + 'index: ' + JSON.stringify(index));
        if (typeof index === 'number') {
          this.selectedIndex = index;
        }
      })

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
      .id('picker2')
      .attributeModifier(new EnabledPickerModifier(false))
      .onChange((index: number) => {
        console.info('Picker :onChange ' + 'index: ' + JSON.stringify(index));
        if (typeof index === 'number') {
          this.selectedIndex = index;
        }
      })

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
      .id('picker3')
      .attributeModifier(new EnabledPickerModifier(undefined))
      .onChange((index: number) => {
        console.info('Picker :onChange ' + 'index: ' + JSON.stringify(index));
        if (typeof index === 'number') {
          this.selectedIndex = index;
        }
      })

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
      .id('picker4')
      .attributeModifier(new EnabledPickerModifier(null))
      .onChange((index: number) => {
        console.info('Picker :onChange ' + 'index: ' + JSON.stringify(index));
        if (typeof index === 'number') {
          this.selectedIndex = index;
        }
      })

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
      .id('picker5')
      .onChange((index: number) => {
        console.info('Picker :onChange ' + 'index: ' + JSON.stringify(index));
        if (typeof index === 'number') {
          this.selectedIndex = index;
        }
      })
    }
  }
}
