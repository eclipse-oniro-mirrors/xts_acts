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

import Log from '../../common/Log.ets';
import events_emitter from '@ohos.events.emitter';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct AlertDialogCenterStart {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear AlertDialogCenterStart start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear AlertDialogCenterStart end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("alertDialog-CenterStart")
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
        .key("CenterStartText")

      Text("alertDialog-CenterEnd")
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
        .key("CenterEndText")

      Button('one button dialog')
        .key("CenterStartButton")
        .onClick(() => {
          AlertDialog.show(
            {
              title: 'title',
              message: 'text',
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              alignment: DialogAlignment.CenterStart
            }
          )
          try {
            let backData: events_emitter.EventData = {
              data: {
                "Result": true
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 81601,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("CenterStart start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("CenterStart emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .backgroundColor(0x317aff)

      Button('two button dialog')
        .key("CenterEndButton")
        .onClick(() => {
          AlertDialog.show(
            {
              title: 'title',
              message: 'text',
              primaryButton: {
                value: 'cancel',
                action: () => {
                  console.info('Callback when the first button is clicked')
                }
              },
              secondaryButton: {
                value: 'ok',
                action: () => {
                  console.info('Callback when the second button is clicked')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              alignment: DialogAlignment.CenterEnd
            }
          )
          try {
            let backData: events_emitter.EventData = {
              data: {
                "Result": true
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 81602,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("CenterEnd start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("CenterEnd emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        }).backgroundColor(0x317aff)

    }.width("100%").height("100%")
  }
}

