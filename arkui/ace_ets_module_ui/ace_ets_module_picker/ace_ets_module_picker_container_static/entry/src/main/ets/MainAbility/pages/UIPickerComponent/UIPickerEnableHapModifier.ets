'use static'
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
import { Entry, Scroll, Column, Component, Button, $r, Row,Color,
  Text, ClickEvent,TextAlign,FlexAlign, PickerIndicatorType,
  Resource, UIPickerComponent, ForEach, UIPickerComponentOptions, LengthMetrics,
  UIPickerComponentAttribute, AttributeModifier, Optional} from '@ohos.arkui.component';

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
struct UIPickerEnableHapModifier {
  private fontSize: Double  =  20.0;
  private monthArray: string[] = [] as string[];

  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Column(undefined) {
      Row() {
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('enableHapM1')
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('enableHapM2')
        .attributeModifier(new EnabledPickerModifier(true))
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('enableHapM3')
        .attributeModifier(new EnabledPickerModifier(false))
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('enableHapM4')
        .attributeModifier(new EnabledPickerModifier(undefined))
      }
    }.width('100%').height('100%')
  }
}