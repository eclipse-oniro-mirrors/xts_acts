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

import Log from '../common/Log.ets';
import events_emitter from '@ohos.events.emitter';

let varA = AppStorage.Link('varA')

//Environment.EnvProp("accessibilityEnabled", "default")
PersistentStorage.PersistProp("highScore", 0)
const TAG = 'ets_apiLack_add';

@Entry
@Component
struct Common_ts_ets_apiStaticClear {
  @StorageLink('varA') varA: number = 2
  private label: string = 'count'
  @StorageLink('highScore') highScore: number = 0

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear Common_ts_ets_apiStaticClear start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear Common_ts_ets_apiStaticClear end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text(`${this.label}: ${this.varA}`)
        .width(320)
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
        .key("labelA")
        .onClick(() => {
          AppStorage.Set<number>('varA', AppStorage.Get<number>('varA') + 1)
        })

      Text("common_ts_ets_api-StaticClear")
        .width(320)
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
        .key("staticClearText")
        .onClick(() => {
          AppStorage.Clear()
        })

      Text("common_ts_ets_api-EnvProp")
        .width(320)
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
        .key("EnvPropText")
        .onClick(() => {
          var enable = AppStorage.Get("accessibilityEnabled");
          try {
            var backData = {
              data: {
                "Result": (enable != null)
              }
            }
            let backEvent = {
              eventId: 60231,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("PersistProp start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("PersistProp emit action state err: " + JSON.stringify(err.message))
          }

        })

      Text(`common_ts_ets_api-PersistProp : ${this.highScore}`)
        .width(320)
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
        .key("PersistPropText")
        .onClick(() => {
          this.highScore = this.highScore + 1
          try {
            var backData = {
              data: {
                "Score": "Score"
              }
            }
            let backEvent = {
              eventId: 60230,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("PersistProp start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("PersistProp emit action state err: " + JSON.stringify(err.message))
          }
        })
      Text("common_ts_ets_api-clear")
        .width(320)
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
        .key("staticClearText")
        .onClick(() => {
          AppStorage.Clear()
        })


    }.width("100%").height("100%")
  }
}

