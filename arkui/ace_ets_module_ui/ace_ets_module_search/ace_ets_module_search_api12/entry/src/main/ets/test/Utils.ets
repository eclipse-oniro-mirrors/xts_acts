/**
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

export default class Utils {
  static async swipe(downX, downY, upX, upY, steps) {
    console.info('start to swipe')
    this.drags(downX, downY, upX, upY, steps, false)
  }

  static async drag(downX, downY, upX, upY, steps) {
    console.info('start to drag')
    this.drags(downX, downY, upX, upY, steps, true)
  }

  static async drags(downX, downY, upX, upY, steps, drag) {
    var xStep;
    var yStep;
    var swipeSteps;
    var ret;
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
    var downPonit: TouchObject = {
      id: 1,
      x: downX,
      y: downY,
      type: TouchType.Down,
    }
    console.info('down touch started: ' + JSON.stringify(downPonit))
    sendTouchEvent(downPonit);
    console.info('start to move')
    if (drag) {
      await this.sleep(500)
    }
    for (var i = 1; i <= swipeSteps; i++) {
      var movePoint: TouchObject = {
        id: 1,
        x: downX + (xStep * i),
        y: downY + (yStep * i),
        type: TouchType.Move,
      }
      console.info('move touch started: ' + JSON.stringify(movePoint))
      ret = sendTouchEvent(movePoint)
      if (ret == false) {
        break;
      }
      await this.sleep(5)
    }
    console.info('start to up')
    if (drag) {
      await this.sleep(100)
    }
    var upPoint: TouchObject = {
      id: 1,
      x: upX,
      y: upY,
      type: TouchType.Up,
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    await this.sleep(500)
  }
}




