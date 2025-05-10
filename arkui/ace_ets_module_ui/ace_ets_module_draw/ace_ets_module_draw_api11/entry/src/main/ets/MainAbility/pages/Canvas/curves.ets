/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import Log from '../../common/Log';
import events_emitter from '@ohos.events.emitter';
import Curves from '@ohos.curves'

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CurvesSteps {
  @State curveApi: string = "success"
  @State curve1: ICurve = Curves.springMotion(0.40, 0.99, 0)
  @State curve2: ICurve = Curves.responsiveSpringMotion(0.40, 0.99, 0);

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CurvesSteps start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CurvesSteps end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text("curves-Steps")
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
        .key("stepsText")
        .onClick(() => {
          try {
            let curve = Curves.steps(1, true)
            console.info("curve is" + curve)
            this.curveApi = "callBackSuccess"
          } catch (err) {
            console.info("curve onClick err: " + JSON.stringify((err as Error)?.message))
            this.curveApi = "callBackFail"
          }
          try {
            let backData: events_emitter.EventData = {
              data: {
                "curveApi": this.curveApi,
                "curveSpringMotion": this.curve1,
                "curveResSpringMotion": this.curve2
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60229,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("curveApi onClick start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("curveApi onClick emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
    }.width("100%").height("100%")
  }
}

