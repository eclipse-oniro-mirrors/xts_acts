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
const TAG = 'ets_apiLack_add';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct GestureSetDirection {
   @State offsetX: number = 10
   @State offsetY: number = 10
   @State directionV: PanDirection = PanDirection.Vertical
   @State directionH: PanDirection = PanDirection.Horizontal
   @State numberDistance: number = 5.0
   @State numberFingers: number = 1
   @State panDirection: PanDirection = PanDirection.Horizontal
   panGesture: PanGestureOptions = new PanGestureOptions({direction:this.directionV, distance:10})
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear GestureSetDirection start`)
  }

  aboutToDisappear(){
    Log.showInfo(TAG, `aboutToDisAppear GestureSetDirection end`)
  }

  build(){
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center,justifyContent:FlexAlign.Center }){

      Text("gesture-SetDirection")
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
        PanGesture({options: PanGestureOptions=> {
        }})
          .key('setDirectionPanGesture')
          .onClick(()=>{
            this.panDirection = PanDirection.Vertical
            options.setDirection(this.panDirection)
            try {
              var backData = {
                data: {
                  "STATUS": this.panDirection
                }
              }
              let backEvent = {
                eventId: 60204,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("setDirectionPanGesture onClick start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("setDirectionPanGesture onClick emit action state err: " + JSON.stringify(err.message))
            }
          })
        )
        .key("setDirectionText")

      Text("gesture-SetDistance")
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
        PanGesture({options: PanGestureOptions=> {
        }})
          .key('setDistancePanGesture')
          .onClick(()=>{
            this.numberDistance = 4.0
          options.setDistance(this.numberDistance)
          try {
            var backData = {
              data: {
                "STATUS": this.numberDistance
              }
            }
            let backEvent = {
              eventId: 60205,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onClick start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onClick emit action state err: " + JSON.stringify(err.message))
          }
        })
        )
        .key("setDistanceText")

      Text("gesture-SetFingers")
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
        PanGesture({options: PanGestureOptions=> {
        }})
          .key('setFingersPanGesture')
          .onClick(()=>{
            this.numberFingers = 2
            options.setFingers(this.numberFingers)
            try {
              var backData = {
                data: {
                  "STATUS": this.numberFingers
                }
              }
              let backEvent = {
                eventId: 60206,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("onClick start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("onClick emit action state err: " + JSON.stringify(err.message))
            }
          })
        )
        .key("setFingersText")
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Text('PanGesture offset:\nX: ' + this.offsetX + '\n' + 'Y: ' + this.offsetY)
    }
    .key('panDirection').height(100).width(200).padding(20).border({ width: 1 }).margin(80)
      .translate({ x: this.offsetX, y: this.offsetY, z: 5 })
      .gesture(
      PanGesture(this.panGesture)
        .onActionStart((event: GestureEvent) => {
          console.info('Pan start')
        })
        .onActionUpdate((event: GestureEvent) => {
          this.offsetX = event.offsetX
          this.offsetY = event.offsetY
        })
        .onActionEnd(() => {
          console.info('Pan end')
          this.panGesture.setDistance(10)
          this.panGesture.setDirection(this.directionH)
          this.panGesture.setFingers(1)
        })
      )
    }.width("100%").height("100%")
  }
}

