'use static';
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
  UIPickerComponentAttribute, LocalizedBorderRadiuses, AttributeModifier,
  PickerIndicatorStyle, Optional} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

class IndicatorPickerModifier implements AttributeModifier<UIPickerComponentAttribute> {
  private style: Optional<PickerIndicatorStyle> = undefined

  constructor(style?: Optional<PickerIndicatorStyle>) {
    this.style = style
  }

  applyNormalAttribute(instance: UIPickerComponentAttribute): void {
    instance.selectionIndicator(this.style)
  }
}
class MyModifier2 implements AttributeModifier<UIPickerComponentAttribute> {
  applyNormalAttribute(instance: UIPickerComponentAttribute): void {
    instance.selectionIndicator({type: PickerIndicatorType.DIVIDER,
      strokeWidth: LengthMetrics.vp(5),
      dividerColor: Color.Red,
      startMargin: LengthMetrics.vp(30),
      endMargin: LengthMetrics.vp(30)})
  }
}

@Entry
@Component
struct UIPickerIndicatorModifier {
  @State myModifier1: MyModifier2 = new MyModifier2();
  @State selectedIndex: Int = 0;
  startBorderStyle: LocalizedBorderRadiuses = {
    topStart: LengthMetrics.vp(10),
    bottomStart: LengthMetrics.vp(10),
    topEnd: LengthMetrics.vp(10),
    bottomEnd: LengthMetrics.vp(10)
  }
  startBorderStyle1: LocalizedBorderRadiuses = {
    topStart: LengthMetrics.vp(-1),
    bottomStart: LengthMetrics.vp(-1),
    topEnd: LengthMetrics.vp(-1),
    bottomEnd: LengthMetrics.vp(-1)
  }
  private fontSize: Double  =  20.0;
  private monthArray: string[] = [] as string[];
  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Column() {
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
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.DIVIDER,
          strokeWidth: LengthMetrics.vp(2),
          dividerColor: Color.Blue,
          startMargin: LengthMetrics.vp(2),
          endMargin: LengthMetrics.vp(2)
        }))

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
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.DIVIDER,
          strokeWidth: LengthMetrics.vp(-1),
          dividerColor: Color.Red,
          startMargin: LengthMetrics.vp(-1),
          endMargin: LengthMetrics.vp(-1)
        }))

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
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: {
            topLeft: 2,
            topRight: 2,
            bottomLeft: 2,
            bottomRight: 2
          }
        }))

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
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: LengthMetrics.vp(2)
        }))

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
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: this.startBorderStyle
        }))

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
        .id('picker6')
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: {
            topLeft: -1,
            topRight: -1,
            bottomLeft: -1,
            bottomRight: -1
          }
        }))
      }
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
        .id('picker7')
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: Color.Blue,
          borderRadius: LengthMetrics.vp(-1)
        }))

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
        .id('picker8')
        .attributeModifier(new IndicatorPickerModifier(
          { type: PickerIndicatorType.BACKGROUND,
            backgroundColor: Color.Blue,
            borderRadius: this.startBorderStyle1
          }))

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
        .id('picker9')
        .attributeModifier(new IndicatorPickerModifier(undefined))

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
        .id('picker10')

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
        .id('picker11')
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.BACKGROUND,
          backgroundColor: undefined,
          borderRadius: this.startBorderStyle1
        }))

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
        .id('picker12')
        .attributeModifier(new IndicatorPickerModifier({
          type: PickerIndicatorType.DIVIDER,
          strokeWidth: LengthMetrics.vp(-1),
          dividerColor: undefined,
          startMargin: LengthMetrics.vp(-1),
          endMargin: LengthMetrics.vp(-1)
        }))
      }
    }.width('100%').height('100%')
  }
}