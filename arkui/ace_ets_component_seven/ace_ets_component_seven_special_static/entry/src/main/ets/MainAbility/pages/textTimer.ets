'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, AttributeModifier, TextTimerAttribute, TextTimerController, Column, Color, FontWeight, FontStyle,
  Button, TextTimer, Row, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

class TextTimerModifier1 implements AttributeModifier<TextTimerAttribute> {
  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance
      .fontSize(20)
      .fontColor(Color.Pink)
      .format('mm:ss.SS')
      .fontWeight(FontWeight.Normal)
      .fontFamily("cursive")
      .fontStyle(FontStyle.Italic)
  }
}

@Entry
@Component
struct TextTimerExample {
  @State textTimerModifier: TextTimerModifier1 = new TextTimerModifier1()
  textTimerController: TextTimerController = new TextTimerController()

  build() {
    Column() {
      Button('Log Json Data')
        .onClick((e: ClickEvent) => {
          console.log(inspector.getInspectorByKey('TextTimerKey1'))
        })
      TextTimer({ isCountDown: true, count: 30000, controller: this.textTimerController })
        .key('TextTimerKey1')
        .attributeModifier(this.textTimerModifier)
        .onTimer((utc: long, elapsedTime: long) => {
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
      Row() {
        Button("start").onClick((e: ClickEvent) => {
          this.textTimerController.start()
        })
        Button("pause").onClick((e: ClickEvent) => {
          this.textTimerController.pause()
        })
        Button("reset").onClick((e: ClickEvent) => {
          this.textTimerController.reset()
        })
      }
    }
  }
}
