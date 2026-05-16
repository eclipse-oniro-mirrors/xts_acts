'use static';
/**
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

import emitter from '@ohos.events.emitter'
import { PromptAction, Router, UIContext } from '@ohos.arkui.UIContext';
import {
  $rawfile,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  CustomBuilder,
  DragItemInfo,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  ItemAlign,
  Margin,
  Padding,
  Row,
  Text,
  TextAlign,
  TextArea,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct AppearExample {
  @State isShow: boolean = true
  @State appearFlag: string = "appearStatusOff"
  @State disAppearFlag: boolean = false
  private changeAppear: string = 'Hide Text'
  private myText: string = 'Text for onAppear'

  onPageShow() {
    console.info('[appear] page show called');
    let stateChangeEvent: emitter.InnerEvent = {
      eventId: 58,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Button(this.changeAppear)
        .key('appear')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
          try {
            let backData: emitter.EventData = {
              data: {
                "ACTION": this.isShow,
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 58,
              priority: emitter.EventPriority.LOW
            }
            console.info("appearFlag start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("appearFlag emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .margin(3)
        .backgroundColor('0x2788D9')
      if (this.isShow) {
        Text(this.myText)
          .onAppear(() => {
            this.appearFlag = "appearStatusOn"
            this.changeAppear = 'Show Text'
            console.info('appearFlag current action state is: ' + this.appearFlag);
            let uiContext: UIContext = this.getUIContext()
            const prompt: PromptAction = uiContext.getPromptAction()
            prompt.showToast({ message: 'The text is shown', duration: 2000 })
            try {
              let backData2: emitter.EventData = {
                data: {
                  "APPEAR": this.appearFlag,
                } as Record<String,RecordData>
              }
              let backEvent2: emitter.InnerEvent = {
                eventId: 59,
                priority: emitter.EventPriority.LOW
              }
              console.info("appearFlag start to emit action state")
              emitter.emit(backEvent2, backData2)
            } catch (err) {
              console.info("appearFlag emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
          .onDisAppear(() => {
            this.disAppearFlag = true
            this.changeAppear = 'Hide Text'
            console.info('disAppearFlag current action state is: ' + this.disAppearFlag);
            let uiContext: UIContext = this.getUIContext()
            const prompt: PromptAction = uiContext.getPromptAction()
            prompt.showToast({ message: 'The text is hidden', duration: 2000 })
            try {
              let backData1: emitter.EventData = {
                data: {
                  "ACTION": this.disAppearFlag,
                } as Record<String,RecordData>
              }
              let backEvent1: emitter.InnerEvent = {
                eventId: 60,
                priority: emitter.EventPriority.LOW
              }
              console.info("disAppearFlag start to emit action state")
              emitter.emit(backEvent1, backData1)
            } catch (err) {
              console.info("disAppearFlag emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
      }
    }
    .padding(30)
    .width('100%')
  }

  private stateChangCallBack: (eventData: emitter.EventData) => void = (eventData: emitter.EventData) => {
    console.info("[appear] page stateChangCallBack");
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("[appear] page state change called:" + JSON.stringify(eventData));
      if (data['isShow'] != null) {
        this.isShow = data['isShow'] as boolean;
      }
    }
  }
}