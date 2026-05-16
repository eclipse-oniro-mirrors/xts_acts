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

import Log from '../../common/Log.ets';
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
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  AlertDialogParamWithConfirm,
  DialogAlignment,
  AlertDialogParamWithButtons
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct AlertDialogCenterStart {
  uiContext: UIContext = this.getUIContext()

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear AlertDialogCenterStart start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear AlertDialogCenterStart end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("alertDialog-CenterStart")
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
        .key("CenterStartText")

      Text("alertDialog-CenterEnd")
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
        .key("CenterEndText")

      Button('one button dialog')
        .key("CenterStartButton")
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              message: 'text',
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              alignment: DialogAlignment.CenterStart
            } as AlertDialogParamWithConfirm
          )
          try {
            let backData: emitter.EventData = {
              data: {
                "Result": true
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 81601,
              priority: emitter.EventPriority.LOW
            }
            console.info("CenterStart start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("CenterStart emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .backgroundColor(0x317aff)

      Button('two button dialog')
        .key("CenterEndButton")
        .onClick((e: ClickEvent) => {
          this.uiContext.showAlertDialog(
            {
              title: 'title',
              message: 'text',
              primaryButton: {
                value: 'cancel',
                action: () => {
                  console.info('Callback when the first button is clicked')
                }
              },
              secondaryButton: {
                value: 'ok',
                action: () => {
                  console.info('Callback when the second button is clicked')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              alignment: DialogAlignment.CenterEnd
            } as AlertDialogParamWithButtons
          )
          try {
            let backData: emitter.EventData = {
              data: {
                "Result": true
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 81602,
              priority: emitter.EventPriority.LOW
            }
            console.info("CenterEnd start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("CenterEnd emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        }).backgroundColor(0x317aff)

    }.width("100%").height("100%")
  }
}

