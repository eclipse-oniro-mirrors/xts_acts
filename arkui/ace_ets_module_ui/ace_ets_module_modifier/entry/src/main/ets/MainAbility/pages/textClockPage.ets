/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { TextClockModifier } from "@ohos.arkui.modifier";

class CustomModifier extends TextClockModifier {
  applyNormalAttribute(instance: TextClockAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.fontSize(15)
  }
}

@Entry
@Component
struct TextClockPage {
  @State accumulateTime: number = 0
  @State timeZoneOffset: number = -8
  @State format: string = 'hms'
  @State status: string = 'run'
  @State change: string = 'no change'
  @State customModifier: TextClockModifier = new CustomModifier()
    .format('hh:mm:ss')
    .fontColor('#FF123456')
    .fontSize(15)
    .fontWeight(FontWeight.Normal)
    .fontFamily("cursive")
    .fontStyle(FontStyle.Italic)
  // 导入对象
  controller: TextClockController = new TextClockController()

  build() {
    Column({ space: 5 }) {
    Button("change value").onClick(() => {
      (this.customModifier as CustomModifier).onChange1();
    }).key("changeButton")
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Current milliseconds is ' + this.accumulateTime)
        .fontSize(20)
        .key('accumulateTime')

      TextClock({ timeZoneOffset: this.timeZoneOffset, controller: this.controller })
        .margin(20)
        .key('TextClockKey1')
        .attributeModifier(this.customModifier as CustomModifier)
        .onDateChange((value: number) => {
          this.change = 'change'
          this.accumulateTime = value
        })
      Button("start TextClock")
        .margin({ bottom: 10 })
        .onClick(() => {
          this.controller.start()
          this.status = 'start'
        })
      Button("stop TextClock")
        .onClick(() => {
          // 停止文本时钟
          this.controller.stop()
          this.status = 'stop'
          this.change = 'no change'
        })
      Text(this.status + ' success').fontSize(20).key('operation')
      Text(this.change + ' success').fontSize(20).key('change')
    }
    .width('100%')
    .height('100%')
    }
    .margin({ top: 5 })
  }
}