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

import prompt from '@ohos.prompt'
import Log from '../../common/Log';
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
  Builder,
  FlexDirection,
  FlexAlign,
  ItemAlign,
  TextAlign,
  Divider,
  Alignment,
  TextOverflow
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct PromptShowDialog {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PromptShowDialog start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PromptShowDialog end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("prompt-ShowDialog")
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
        .key("showDialogText")
        .onClick((e: ClickEvent) => {
          try {
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
          } catch (err) {
            console.info("showDialog emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

      Text("prompt-ShowActionMenu")
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
        .key("showActionMenuText")
        .onClick((e: ClickEvent) => {
          try {
            let backData1: emitter.EventData = {
              data: {
                "STATUS": true
              } as Record<String,RecordData>
            }
            let backEvent1: emitter.InnerEvent = {
              eventId: 60221,
              priority: emitter.EventPriority.LOW
            }
            console.info("showActionMenu start to emit action state")
            emitter.emit(backEvent1, backData1)
          } catch (err) {
            console.info("showActionMenu emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

    }.width("100%").height("100%")
  }
}

