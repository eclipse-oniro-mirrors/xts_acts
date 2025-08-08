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
import RectValue from './Rect';

export default class Utils {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

  static getComponentRect(key: string) {
    let strJson: string = getInspectorByKey(key);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(JSON.parse(strJson)));
    console.info("[getInspectorByKey] rectInfo is: " + JSON.parse('[' + JSON.parse(strJson).$rect + ']'));
    Utils.rect_left = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[0]
    Utils.rect_top = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[0] + ']')[1]
    Utils.rect_right = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[0]
    Utils.rect_bottom = JSON.parse('[' + JSON.parse('[' + JSON.parse(strJson).$rect + ']')[1] + ']')[1]
    return Utils.rect_value = {
      left: Utils.rect_left, top: Utils.rect_top, right: Utils.rect_right, bottom: Utils.rect_bottom
    }
  }

  static sleep(time: number) {
    return new Promise((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }


  static async drag(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to drag')
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
    let downPoint: TouchObject = {
      id: 1,
      x: downX,
      y: downY,
      displayX: downX,
      displayY: downY,
      windowX: downX,
      windowY: downY,
      screenX: downX,
      screenY: downY,
      type: TouchType.Down
    }
    console.info('down touch started: ' + JSON.stringify(downPoint))
    sendTouchEvent(downPoint);
    console.info('start to move')
    if (true) {
      Utils.sleep(500)
    }
    for (let i = 1; i <= swipeSteps; i++) {
      let movePoint: TouchObject = {
        id: 1,
        x: downX + (xStep * i),
        y: downY + (yStep * i),
        displayX: downX + (xStep * i),
        displayY: downY + (yStep * i),
        windowX: downX + (xStep * i),
        windowY: downY + (yStep * i),
        screenX: downX + (xStep * i),
        screenY: downY + (yStep * i),
        type: TouchType.Move,
      }
      console.info('move touch started: ' + JSON.stringify(movePoint))
      ret = sendTouchEvent(movePoint)
      if (ret == false) {
        break;
      }
      Utils.sleep(5)
    }
    console.info('start to up')
    if (true) {
      Utils.sleep(100)
    }
    let upPoint: TouchObject = {
      id: 1,
      x: upX,
      y: upY,
      displayX: upX,
      displayY: upY,
      windowX: upX,
      windowY: upY,
      screenX: upX,
      screenY: upY,
      type: TouchType.Up,
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    Utils.sleep(500)
  }

    static performTouchComponentCenter(id: string, type: TouchType): boolean {
    console.info('performTouchComponent id : ' + id);
    return Utils.performTouchRectCenter(0, 0, Utils.getComponentRect(id), type);
  }


  static performTouchRectCenter(rootX: number, rootY: number, rect: RectValue, type: TouchType): boolean {
    console.info('performTouchRectCenter parentX : ' + rootX);
    console.info('performTouchRectCenter parentY : ' + rootY);
    console.info('performTouchRectCenter rect.left : ' + rect.left);
    console.info('performTouchRectCenter rect.top : ' + rect.top);
    console.info('performTouchRectCenter rect.right : ' + rect.right);
    console.info('performTouchRectCenter rect.bottom : ' + rect.bottom);

    let screenX = (rect.right + rect.left) * 0.5;
    let screenY = (rect.bottom + rect.top) * 0.5;
    let x = (rect.right + rect.left) * 0.5 - rootX;
    let y = (rect.bottom + rect.top) * 0.5 - rootY;

    return Utils.performTouch(screenX, screenY, x, y, type);
  }

  static performTouch(screenX: number, screenY: number, x: number, y: number, type: TouchType): boolean {
    console.info('performTouch type : ' + type);
    console.info('performTouch screenX : ' + screenX);
    console.info('performTouch screenY : ' + screenY);
    console.info('performTouch x : ' + x);
    console.info('performTouch y : ' + y);

    let result = sendTouchEvent({
      windowX: screenX,
      windowY: screenX,
      displayX: screenX,
      displayY: screenX,
      type: type,
      id: 0,
      screenX: screenX,
      screenY: screenX,
      x: x,
      y: y,
    })

    console.info('performTouch result : ' + result);

    return result;
  }
}




