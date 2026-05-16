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


import uiAppearance from '@ohos.uiAppearance';
import Log from '../../common/Log';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';
import {
  $rawfile,
  Alignment,
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
  TextOverflow,
  TouchType,
  Visibility
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';
uiAppearance.DarkMode.ALWAYS_DARK

@Entry
@Component
struct UiAppearanceALWAYS_DARK {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear UiAppearanceALWAYS_DARK start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear UiAppearanceALWAYS_DARK end`);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("uiAppearance-ALWAYS_DARK")
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
        .key("ALWAYS_DARKText")
        .onClick((e: ClickEvent) => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, (err) => {
            console.info(`${err}`);
          })
          let darkMode = uiAppearance.getDarkMode();
          try {
            let backData: emitter.EventData = {
              data: {
                "Mode": darkMode
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 60308,
              priority: emitter.EventPriority.LOW
            }
            console.info("AlwaysDark start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err: Error) {
            console.info("AlwaysDark emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

      Text("uiAppearance-ALWAYS_LIGHT")
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
        .key("ALWAYS_LIGHTText")
        .onClick((e: ClickEvent) => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, (err) => {
            console.info(`${err}`);
          })
          let darkMode = uiAppearance.getDarkMode();
          try {
            let backData: emitter.EventData = {
              data: {
                "Mode": darkMode
              } as Record<String,RecordData>
            }
            let backEvent: emitter.InnerEvent = {
              eventId: 60309,
              priority: emitter.EventPriority.LOW
            }
            console.info("AlwaysLight start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err: Error) {
            console.info("AlwaysLight emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

    }.width("100%").height("100%")
  }
}

