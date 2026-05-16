'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  Flex,
  Text,
  ClickEvent,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import appS from '@system.app';
import emitter from '@ohos.events.emitter';

import Log from '../../common/Log.ets';
import { RecordData } from '@ohos.base';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct AppVersionCode {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear AppVersionCode start：`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear AppVersionCode end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("app-VersionCode")
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
        .key("versionCodeText")
        .onClick((e:ClickEvent) => {
          try {
            console.info("versionCode start to emit action state0")
            let versionCode = appS.getInfo().versionCode; // 11.7 app died，等新版本复测
            console.info("versionCode start to emit action state1")
            let backData: emitter.EventData = {
              data: {
                "Code": versionCode
              } as Record<String,RecordData>
            } as emitter.EventData
            let backEvent: emitter.InnerEvent = {
              eventId: 60302,
              priority: emitter.EventPriority.LOW
            }
            console.info("versionCode start to emit action state2")
            console.info("versionCode start to emit action state")
            emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("versionCode emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })

    }.width("100%").height("100%")
  }
}

