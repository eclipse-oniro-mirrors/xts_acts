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

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct GestureSetDirection {
  @State offsetX: number = 10
  @State offsetY: number = 10
  @State directionV: PanDirection = PanDirection.Left
  @State directionH: PanDirection = PanDirection.Right
  @State numberDistance: number = 5.0
  @State numberFingers: number = 1
  @State panDirection: PanDirection = PanDirection.Right
  private panOption: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left | PanDirection.Right, distance: 10 })

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear GestureSetDirection start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear GestureSetDirection end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("gesture-SetDirection")
        .key('setDirectionPanGesture')
        .onClick(() => {
          this.panDirection = PanDirection.Left
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": this.panDirection
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60204,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("setDirectionPanGesture onClick start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("setDirectionPanGesture onClick emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
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
        .gesture(
          PanGesture(this.panOption)
            .onActionStart((event: GestureEvent) => {
              this.panDirection = PanDirection.Left
              this.panOption.setDirection(this.panDirection)
              console.info('Pan start')
            })
            .onActionEnd(() => {
              console.info('Pan end')
            })
        )

      Text("gesture-SetDistance")
        .key('setDistancePanGesture')
        .onClick(() => {
          this.numberDistance = 4.0
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": this.numberDistance
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60205,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onClick start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onClick emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
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
        .gesture(
          PanGesture(this.panOption)
            .onActionStart((event: GestureEvent) => {
              this.numberDistance = 4.0
              this.panOption.setDistance(this.numberDistance)
              console.info('Pan start')
            })
            .onActionEnd(() => {
              console.info('Pan end')
            })
        )


      Text("gesture-SetFingers")
        .key('setFingersPanGesture')
        .onClick(() => {
          this.numberFingers = 2
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": this.numberFingers
              }
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60206,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onClick start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onClick emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
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
        .gesture(
          PanGesture(this.panOption)
            .onActionStart((event: GestureEvent) => {
              this.numberFingers = 2
              this.panOption.setFingers(this.numberFingers)
              console.info('Pan start')
            })
            .onActionEnd(() => {
              console.info('Pan end')
            })
        )

      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Text('PanGesture offset:\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
      }
      .key('panDirection')
      .height(100)
      .width(200)
      .padding(20)
      .border({ width: 1 })
      .margin(80)
      .translate({ x: this.offsetX, y: this.offsetY, z: 5 })
      .gesture(
        PanGesture(this.panOption)
          .onActionStart((event: GestureEvent) => {
            console.info('Pan start')
          })
          .onActionUpdate((event: GestureEvent) => {
            this.offsetX = event.offsetX
            this.offsetY = event.offsetY
          })
          .onActionEnd(() => {
            console.info('Pan end')
            this.panOption.setDistance(10)
            this.panOption.setDirection(this.directionH)
            this.panOption.setFingers(1)
          })
      )
    }.width("100%").height("100%")
  }
}

