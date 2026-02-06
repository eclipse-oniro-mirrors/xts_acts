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
import emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Alignment,
  TextAlign,
  TextOverflow,
  AlertDialogParamWithConfirm,
  DialogAlignment
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct stageAlertDialog {
  build() {
    Row() {
      Column() {
        Text("AlertDialog1")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("AlertDialog1")
          .onClick((e: ClickEvent) => {
            try {
              AppStorage.get<UIContext>('uiContent')!.showAlertDialog(
                {
                  title: 'title',
                  message: 'text',
                  autoCancel: true,
                  alignment: DialogAlignment.Bottom,
                  offset: { dx: 0, dy: -20 },
                  gridCount: 3,
                  confirm: {
                    value: 'button',
                    action: () => {
                      console.info('Button-clicking callback')
                    }
                  },
                  cancel: () => {
                    console.info('Closed callbacks')
                  }
                } as AlertDialogParamWithConfirm
              )
              let backData: emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<String,RecordData>
              }
              let backEvent: emitter.InnerEvent = {
                eventId: 60220,
                priority: emitter.EventPriority.LOW
              }
              console.info("showDialog start to emit action state")
              emitter.emit(backEvent, backData)
            } catch (error) {
              console.error("showToast emit action state err:" + JSON.stringify(error.message));
            }
            ;
          })

        Text("AlertDialog2")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("AlertDialog2")
          .onClick((e: ClickEvent) => {
            try {
              AppStorage.get<UIContext>('uiContent')!.showAlertDialog(
                {
                  title: 'title',
                  message: 'text',
                  autoCancel: true,
                  alignment: DialogAlignment.Bottom,
                  offset: { dx: 0, dy: -20 },
                  gridCount: 3,
                  confirm: {
                    value: 'button',
                    action: () => {
                      console.info('Button-clicking callback')
                    }
                  },
                  cancel: () => {
                    console.info('Closed callbacks')
                  }
                } as AlertDialogParamWithConfirm
              )

              let backData1: emitter.EventData = {
                data: {
                  "STATUS": 10
                } as Record<String,RecordData>
              }
              let backEvent1: emitter.InnerEvent = {
                eventId: 60221,
                priority: emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              emitter.emit(backEvent1, backData1)
            } catch (error) {

            }
            ;
          })

        Text("AlertDialog3")
          .width(100)
          .height(70)
          .fontSize(20)
          .opacity(1)
          .align(Alignment.TopStart)
          .fontColor(0xCCCCCC)
          .lineHeight(25)
          .border({ width: 1 })
          .padding(10)
          .textAlign(TextAlign.Center)
          .textOverflow({ overflow: TextOverflow.None })
          .key("AlertDialog3")
          .onClick((e: ClickEvent) => {
            try {

              AppStorage.get<UIContext>('uiContent')!.showAlertDialog(
                {
                  title: 'title',
                  message: 'text',
                  autoCancel: true,
                  alignment: DialogAlignment.Bottom,
                  offset: { dx: 0, dy: -20 },
                  gridCount: 3,
                  confirm: {
                    value: 'button',
                    action: () => {
                      console.info('Button-clicking callback')
                    }
                  },
                  cancel: () => {
                    console.info('Closed callbacks')
                  }
                } as AlertDialogParamWithConfirm
              )
              let backData2: emitter.EventData = {
                data: {
                  "STATUS": "STATUS"
                } as Record<String,RecordData>
              }
              let backEvent2: emitter.InnerEvent = {
                eventId: 60222,
                priority: emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              emitter.emit(backEvent2, backData2)
            } catch (error) {
              console.error(`showActionMenu args error code is ${error.code}, message is ${error.message}`);
            }
          })
      }
      .height('100%')
    }
  }
}