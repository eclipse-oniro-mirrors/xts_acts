/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import appS from '@system.app';
import events_emitter from '@ohos.events.emitter';

import Log from '../common/Log.ets';

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
        .onClick(() => {
          try {
            let versionCode = appS.getInfo().versionCode;
            let backData: events_emitter.EventData = {
              data: {
                "Code": appS.getInfo().versionCode
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60302,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("versionCode start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("versionCode emit action state err: " + JSON.stringify(err.message))
          }
        })

    }.width("100%").height("100%")
  }
}

