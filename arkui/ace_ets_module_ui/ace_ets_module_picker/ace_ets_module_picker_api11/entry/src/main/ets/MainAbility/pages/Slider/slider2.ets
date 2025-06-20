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

import Log from '../../common/Log';
import Utils from '../../common/Utils';
import events_emitter from '@ohos.events.emitter';
import RectValue from '../../common/Rect';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SliderMoving {
  @State outSetValue: number = 40;
  @State move: SliderChangeMode = SliderChangeMode.Moving;

  slide() {
    let rect: RectValue = Utils.getComponentRect("Slider")
    Utils.drag(rect.left, rect.top, rect.right, rect.bottom, 20)
  }

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear SliderMoving start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SliderMoving end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("slider-Moving")
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
        .key("MovingText")

      Slider({
        value: this.outSetValue,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet
      })
        .key("Slider")
        .blockColor(Color.Blue)
        .trackColor(Color.Gray)
        .selectedColor(Color.Blue)
        .showSteps(true)
        .showTips(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          Log.showInfo(TAG, 'SliderChangeMode.Moving: ' + SliderChangeMode.Moving.toString())
          Log.showInfo(TAG, 'value:' + value + 'mode:' + mode.toString())
          try {
            let backData: events_emitter.EventData = {
              data: {
                "Mode": 0
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60307,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("Slider start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("Slider emit action state err: " + JSON.stringify((err as Error).message))
          }
        })
        .onClick(() => {
          this.slide()
        })

    }.width("100%").height("100%")
  }
}

