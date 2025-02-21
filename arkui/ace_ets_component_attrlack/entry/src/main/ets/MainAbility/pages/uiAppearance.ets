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


import uiAppearance from '@ohos.uiAppearance';
import Log from '../common/Log.ets';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';

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
        .onClick(() => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, (err: BusinessError) => {
            console.info(`${err}`);
          })
          let darkMode: ESObject = uiAppearance.getDarkMode();
          try {
            let backData: events_emitter.EventData = {
              data: {
                "Mode": darkMode
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60308,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("AlwaysDark start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("AlwaysDark emit action state err: " + JSON.stringify(err.message))
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
        .onClick(() => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, (err: BusinessError) => {
            console.info(`${err}`);
          })
          let darkMode: ESObject = uiAppearance.getDarkMode();
          try {
            let backData: events_emitter.EventData = {
              data: {
                "Mode": darkMode
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60309,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("AlwaysLight start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("AlwaysLight emit action state err: " + JSON.stringify(err.message))
          }
        })

    }.width("100%").height("100%")
  }
}

