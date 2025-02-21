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
import RectValue from './Rect';

export default class Utils {
  static async swipe(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to swipe')
    Utils.drags(downX, downY, upX, upY, steps, false)
  }

  static async drag(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to drag')
    Utils.drags(downX, downY, upX, upY, steps, true)
  }

  static async drags(downX: number, downY: number, upX: number, upY: number, steps: number, drag: boolean) {
    let xStep: number;
    let yStep: number;
    let swipeSteps: number;
    let ret: boolean;
    xStep = 0;
    yStep = 0;
    ret = false;
    swipeSteps = steps;
    if (swipeSteps == 0) {
      swipeSteps = 1;
    }
    xStep = (upX - downX) / swipeSteps;
    yStep = (upY - downY) / swipeSteps;
    console.info('move step is: ' + 'xStep: ' + xStep + '    yStep: ' + yStep)
    let downPonit: TouchObject = {
      id: 1,
      x: downX,
      y: downY,
      type: TouchType.Down,
      screenX: 0,
      screenY: 0,
      windowX: 0,
      windowY: 0,
      displayX: 0,
      displayY: 0
    }
    console.info('down touch started: ' + JSON.stringify(downPonit))
    sendTouchEvent(downPonit);
    console.info('start to move')
    if (drag) {
      await Utils.sleep(500)
    }
    for (let i = 1; i <= swipeSteps; i++) {
      let movePoint: TouchObject = {
        id: 1,
        x: downX + (xStep * i),
        y: downY + (yStep * i),
        type: TouchType.Move,
        screenX: 0,
        screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      console.info('move touch started: ' + JSON.stringify(movePoint))
      ret = sendTouchEvent(movePoint)
      if (ret == false) {
        break;
      }
      await Utils.sleep(5)
    }
    console.info('start to up')
    if (drag) {
      await Utils.sleep(100)
    }
    let upPoint: TouchObject = {
      id: 1,
      x: upX,
      y: upY,
      type: TouchType.Up,
      screenX: 0,
      screenY: 0,
      windowX: 0,
      windowY: 0,
      displayX: 0,
      displayY: 0
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    await Utils.sleep(500)
  }
}