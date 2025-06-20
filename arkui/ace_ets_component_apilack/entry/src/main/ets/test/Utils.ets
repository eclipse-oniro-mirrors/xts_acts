/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

  static sleep(time: number) {
    return new Promise((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  //获取组件所占矩形区域坐标
  static getComponentRect(key: string) {
    let strJson = getInspectorByKey(key);
    let obj: Record<string, Object> = JSON.parse(strJson);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<string> = JSON.parse('[' + obj.$rect + ']')
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    Utils.rect_left = JSON.parse('[' + rectInfo[0] + ']')[0]
    Utils.rect_top = JSON.parse('[' + rectInfo[0] + ']')[1]
    Utils.rect_right = JSON.parse('[' + rectInfo[1] + ']')[0]
    Utils.rect_bottom = JSON.parse('[' + rectInfo[1] + ']')[1]
    return Utils.rect_value = {
      left: Utils.rect_left, top: Utils.rect_top, right: Utils.rect_right, bottom: Utils.rect_bottom
    }
  }

  static async swipe(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to swipe')
    Utils.drags(downX, downY, upX, upY, steps, 0)
  }

  static async drag(downX: number, downY: number, upX: number, upY: number, steps: number) {
    console.info('start to drag')
    Utils.drags(downX, downY, upX, upY, steps, 1)
  }

  static async drags(downX: number, downY: number, upX: number, upY: number, steps: number, drag: number) {
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
    console.info('move step is: ' + 'xStep: ' + xStep + '    yStep: ' + yStep);
    let rect = Utils.getComponentRect('onTouch');
    let downPonit: TouchObject = {
      id: 1,
      x: downX,
      y: downY,
      type: TouchType.Down,
      screenX: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的水平方向坐标，API10已废弃，采用windowX替代
      screenY: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的垂直方向坐标，API10已废弃，采用windowY替代
      windowX: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的水平方向坐标
      windowY: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的垂直方向坐标
      displayX: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的水平方向坐标
      displayY: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的垂直方向坐标
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
        screenX: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的水平方向坐标，API10已废弃，采用windowX替代
        screenY: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的垂直方向坐标，API10已废弃，采用windowY替代
        windowX: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的水平方向坐标
        windowY: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的垂直方向坐标
        displayX: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的水平方向坐标
        displayY: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的垂直方向坐标
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
      screenX: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的水平方向坐标，API10已废弃，采用windowX替代
      screenY: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的垂直方向坐标，API10已废弃，采用windowY替代
      windowX: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的水平方向坐标
      windowY: rect.left + (rect.right - rect.left) / 2, // 相对于应用窗口左上角的垂直方向坐标
      displayX: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的水平方向坐标
      displayY: rect.left + (rect.right - rect.left) / 2, // 相对于设备屏幕左上角的垂直方向坐标
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    await Utils.sleep(500)
  }
}




