/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct TextAreaCallback {
  controller: TextAreaController = new TextAreaController()

  build() {
    Scroll() {
      Column() {
        Button('button')
          .tabIndex(1)
        TextArea({ placeholder: 'input your word', controller: this.controller })
          .placeholderColor("rgb(0,0,225)")
          .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
          .textAlign(TextAlign.Start)
          .caretColor(Color.Blue)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontFamily("sans-serif")
          .fontStyle(FontStyle.Normal)
          .fontColor(Color.Red)
          .onChange((value: string) => {
            this.controller.caretPosition(value.length)
          })
          .onClick(() => {
          })
          .onEditChange((isEditing) => {
            let event_id = 60201
            if (isEditing) {
              event_id = 60202
            }
            let eventData: events_emitter.EventData = {
              data: {
                "isEditing": isEditing
              }
            }
            let event: events_emitter.InnerEvent = {
              eventId: event_id,
              priority: events_emitter.EventPriority.LOW
            }
            events_emitter.emit(event, eventData)
          })
          .height(100)
          .width('80%')
          .tabIndex(2)
          .margin({ top: 5, bottom: 5 })
          .key('TextAreaCallback_TextArea1')

        TextArea({ placeholder: 'input your word', controller: this.controller })
          .placeholderColor("rgb(0,0,225)")
          .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
          .textAlign(TextAlign.Start)
          .caretColor(Color.Blue)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontFamily("sans-serif")
          .fontStyle(FontStyle.Normal)
          .fontColor(Color.Red)
          .onChange((value: string) => {
            this.controller.caretPosition(value.length)
          })
          .onClick(() => {
          })
          .onEditChange((isEditing) => {
          })
          .height(100)
          .width('80%')
          .tabIndex(3)
          .margin({ top: 5, bottom: 5 })
          .key('TextAreaCallback_TextArea2')

      }.width('100%')
    }
  }
}