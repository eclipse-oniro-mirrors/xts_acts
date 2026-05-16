'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Log from '../../common/Log';
import { Entry, Column, Component, Text, Alignment, TextAlign, TextOverflow, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
// import { PanelMode , bindSheet, PanelType } from '@ohos.arkui.component';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct PanelBackgroundMask {
  // @State mode: PanelMode = PanelMode.Full

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear PanelBackgroundMask start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear PanelBackgroundMask end`)
  }

  build() {
    Column() {

      Text("panel-OnHeightChange")
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
        .key("onHeightChangeText")
        .onClick((e: ClickEvent) => {
          // this.mode = PanelMode.Half
        })

      // bindSheet(true) {  //等 PanelMode 交付，放开尝试
      //   Column() {
      //     Text("panel-BackgroundMask").fontSize(30)
      //   }
      // }
      // .key("panel")
      // .mode(this.mode)
      // .backgroundColor('green')
      // .type(PanelType.Foldable)
      // .dragBar(false)
      // .halfHeight(300)
      // .onChange((width: number, height: number, mode: PanelMode) => {
      //   Log.showInfo(TAG, `width:${width},height:${height},mode:${mode}`)
      // })
      // .backgroundMask('red')
      // .onHeightChange((value: number) => {
      //   Log.showInfo(TAG, 'onHeightChange: ' + value)
      //   try {
      //     let backData: emitter.EventData = {
      //       data: {
      //         "result": "success"
      //       }as Record<String, undefined|null|Object>
      //     }
      //     let backEvent: emitter.InnerEvent = {
      //       eventId: 10111,
      //       priority: emitter.EventPriority.LOW
      //     }
      //     console.info("onHeightChange start to emit action state")
      //     emitter.emit(backEvent, backData)
      //   } catch (err) {
      //     console.info("testpanelOnHeightChange0002 emit action state err: " + JSON.stringify((err as Error)?.message))
      //   }
      // })

    }.width("100%").height("100%")
  }
}
