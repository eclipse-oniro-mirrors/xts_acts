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

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct UnitsModuleName {
  @State textHeight: number = 50

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear UnitsModuleName start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear UnitsModuleName end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("units-ModuleName")
        .width(320)
        .height(this.textHeight)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("moduleNameText")
        .onClick(() => {
          console.log($r('app.string.MainAbility_label').bundleName)
          try {
            var backData = {
              data: {
                "ModuleName": ($r('app.string.MainAbility_label').bundleName != null)
              }
            }
            let backEvent = {
              eventId: 60310,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("ModuleName start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("ModuleName emit action state err: " + JSON.stringify(err.message))
          }
        })

      Text("units-GlobalPosition")
        .width(320)
        .height(this.textHeight)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("globalPositionText")
        .onClick(() => {
          this.textHeight = 100
        })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          console.info(`oldValue.globalPosition: ${JSON.stringify(oldValue.globalPosition)}`)
          console.info(`newValue.globalPosition: ${JSON.stringify(newValue.globalPosition)}`)
          try {
            var backData = {
              data: {
                "Result": true
              }
            }
            let backEvent = {
              eventId: 60311,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("GlobalPosition start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("GlobalPosition emit action state err: " + JSON.stringify(err.message))
          }
        })


      Text("units-MinWidth")
        .width(100)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("minWidthText")
        .constraintSize({
          minWidth: 200
        })

      Text("units-MaxWidth")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("maxWidthText")
        .constraintSize({
          maxWidth: 200
        })

      Text("units-MinHeight")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("minHeightText")

        .constraintSize({
          minHeight: 100
        })

      Text("units-MaxHeight")
        .width(320)
        .height(200)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("maxHeightText")
        .constraintSize({
          maxHeight: 100
        })

    }.width("100%").height("100%")
  }
}

