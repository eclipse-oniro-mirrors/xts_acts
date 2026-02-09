/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

import { uiObserver } from '@kit.ArkUI';
import router from '@ohos.router';

class MyButtonModifier implements GestureModifier {
  supportDoubleTap: boolean = true

  applyGesture(event: UIGestureEvent): void {
    if (this.supportDoubleTap) {
      event.addGesture(
        new PanGestureHandler({
          distanceMap: new Map([
            [SourceTool.Finger, 5],
            [SourceTool.Pen, 1],
            [SourceTool.MOUSE, 1],
            [SourceTool.TOUCHPAD, 1]
          ])
        }).onActionStart((event) => {
          console.log("PanGestureHandler:" + event.offsetX + "," + event.offsetY)
        })
      )
    } else {
      event.addGesture(
        new PanGestureHandler()
          .onActionStart(() => {
            console.log("Pan start");
          })
      )
    }
  }
}

@Entry
@Component
struct distance {
  @State getDis: number | null = null
  @State getDis1: number | null = null
  @State getmap: string = ""
  @State modifier: MyButtonModifier = new MyButtonModifier()

  build() {
    Column() {

      Column() {
        Text("distance:" + this.getDis).key('distance')
        Text("distance1:" + this.getDis1).key('distance1')
        Text("map:" + this.getmap).key('map')
        Text("map:" + this.getmap).key('modifierMap')
      }.margin({ top: '10%' })

      Row()
        .id('getDistance')
        .width("50%")
        .height("25%")
        .borderWidth(3)
        .backgroundColor(Color.Yellow)
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          recognizers: Array<GestureRecognizer>) => {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            this.getDis = (current as PanRecognizer).getDistance();
            this.getDis1 = (current as PanRecognizer).getPanGestureOptions().getDistance();
            this.getmap = "Unknown:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.Unknown) +
              "Finger:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.Finger) +
              "Pen:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.Pen) +
              "MOUSE:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.MOUSE) +
              "TOUCHPAD:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.TOUCHPAD) +
              "JOYSTICK:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.JOYSTICK)
          }
          return GestureJudgeResult.CONTINUE
        })
        .gesture(
          PanGesture({
            direction: PanDirection.All,
            fingers: 1,
            distance: 5,
            distanceMap: new Map(
              [
                [SourceTool.Unknown, 1],
                [SourceTool.Finger, 5],
                [SourceTool.Pen, 1],
                [SourceTool.MOUSE, 1],
                [SourceTool.TOUCHPAD, 1]
              ])
          })
            .onActionStart((event: GestureEvent) => {
            })
            .onActionUpdate((event: GestureEvent) => {
            })
            .onActionEnd((event: GestureEvent) => {
            })
        )
      Row()
        .id('modifierGetDistance')
        .width("50%")
        .height("25%")
        .borderWidth(3)
        .backgroundColor(Color.Blue)
        .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
          recognizers: Array<GestureRecognizer>) => {
          if (current.getType() == GestureControl.GestureType.PAN_GESTURE) {
            this.getDis = (current as PanRecognizer).getDistance();
            this.getDis1 = (current as PanRecognizer).getPanGestureOptions().getDistance();
            this.getmap = "Unknown:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.Unknown) +
              "Finger:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.Finger) +
              "Pen:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.Pen) +
              "MOUSE:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.MOUSE) +
              "TOUCHPAD:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.TOUCHPAD) +
              "JOYSTICK:" + (current as PanRecognizer).getDistanceMap().get(SourceTool.JOYSTICK)
          }
          return GestureJudgeResult.CONTINUE
        })
        .gestureModifier(this.modifier)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Center)
  }
}
