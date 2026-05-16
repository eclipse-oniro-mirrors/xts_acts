'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins // should be insert by ui-plugins
import {
  Button,
  ButtonAttribute,
  ClickEvent,
  Column,
  Component,
  Entry,
  Text,
  TextAttribute,
  TouchObject,
  TouchType
} from '@ohos.arkui.component' // TextAttribute should be insert by ui-plugins
import inspector from '@ohos.arkui.inspector';
import { sendTouchEvent } from '@ohos.arkui.Test';
import common from '@ohos.app.ability.common';

export default class Utils {
  static rect_left: number = 0;
  static rect_top: number = 0;
  static rect_right: number = 0;
  static rect_bottom: number = 0;
  static rect_value: RectValue = new RectValue();

  static getComponentRect(key: string) {
    let strJson: string = inspector.getInspectorByKey(key);
    let obj: Record<string, Object> =
      JSON.parse<Object>(strJson, Class.from<String>()) as Record<string, Object>;
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<Array<number>> =
      JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    Utils.rect_left = Number(rectInfo[0][0] ?? 0);
    Utils.rect_top = Number(rectInfo[0][1] ?? 0);
    Utils.rect_right = Number(rectInfo[1][0] ?? 0);
    Utils.rect_bottom = Number(rectInfo[1][1] ?? 0);
    return Utils.rect_value = {
      left: Utils.rect_left,
      top: Utils.rect_top,
      right: Utils.rect_right,
      bottom: Utils.rect_bottom
    }
  }

  static sleep(time: Int) {
    return new Promise<string>((resolve: (value: string) => void) => {
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
      type: TouchType.Up,
    }
    console.info('up touch started: ' + JSON.stringify(upPoint))
    sendTouchEvent(upPoint)
    Utils.sleep(500)
  }
}




