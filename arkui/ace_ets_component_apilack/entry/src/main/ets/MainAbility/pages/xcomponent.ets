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
struct XcomponentGetXComponentContext {
  xcomponentController: XComponentController = new XComponentController()

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear XcomponentGetXComponentContext start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear XcomponentGetXComponentContext end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("xcomponent-GetXComponentContext")
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
        .key("getXComponentContextText")
        .onClick(() => {
          try {
            Log.showInfo(TAG, 'xcomponentController.getXComponentContext' + JSON.stringify(this.xcomponentController.getXComponentContext()))
            var result = (this.xcomponentController.getXComponentContext() != null)
            var backData = {
              data: {
                "STATUS": "callBackSuccess"
              }
            }
            let backEvent = {
              eventId: 60228,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("xcomponentController start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("xcomponentController emit action state err: " + JSON.stringify(err.message))
          }
        })

      Text("xcomponent-SetXComponentSurfaceSize")
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
        .key("setXComponentSurfaceSizeText")
        .onClick(() => {
          this.xcomponentController.setXComponentSurfaceSize({
            surfaceWidth: 200,
            surfaceHeight: 200
          })
        })

    }.width("100%").height("100%")
  }
}
