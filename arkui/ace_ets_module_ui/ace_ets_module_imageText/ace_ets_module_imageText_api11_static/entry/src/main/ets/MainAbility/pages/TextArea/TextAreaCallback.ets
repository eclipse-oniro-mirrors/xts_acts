'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Entry,
  Component,
  Scroll,
  Column,
  Button,
  TextArea,
  FontStyle,
  ClickEvent,
  Margin,
  TextAreaController,
  TextAlign,
  Color,
  FontWeight
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

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
          .onChange((value: string) :void=> {
            this.controller.caretPosition(value.length)
          })
          .onClick((e:ClickEvent) => {
          })
          .onEditChange((isEditing:boolean)=> {
            let event_id = 60201
            if (isEditing) {
              event_id = 60202
            }
            let eventData: emitter.EventData = {
              data: {
                "isEditing": isEditing
              } as Record<String,RecordData>
            }
            let event: emitter.InnerEvent = {
              eventId: event_id,
              priority: emitter.EventPriority.LOW
            }
            emitter.emit(event, eventData)
          })
          .height(100)
          .width('80%')
          .tabIndex(2)
          .margin({ top: 5, bottom: 5 } as Margin)
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
          .onChange((value: string) :void=> {
            this.controller.caretPosition(value.length)
          })
          .onClick((e:ClickEvent) => {
          })
          .onEditChange((isEditing:boolean)=> {
          })
          .height(100)
          .width('80%')
          .tabIndex(3)
          .margin({ top: 5, bottom: 5 }  as Margin)
          .key('TextAreaCallback_TextArea2')

      }.width('100%')
    }
  }
}