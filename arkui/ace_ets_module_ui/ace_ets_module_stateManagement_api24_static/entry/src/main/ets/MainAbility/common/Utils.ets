'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { TouchObject, TouchType } from '@ohos.arkui.component';
import { sendTouchEvent } from '@ohos.arkui.Test';

export default class Utils {
  public static rect_left: number;
  public static rect_top: number;
  public static rect_right: number;
  public static rect_bottom: number;
  public static rectValue: RectValue = new RectValue();

  /** 委托 CommonFunc.getInspectorByKey + parseJsonElement，避免 JSON.parse 旧接口在 Evolution 下 ESE0087。 */
  public static getComponentRect(key: string): RectValue {
    let r: RectValue = CommonFunc.getComponentRect(key);
    CommonFunc.rect_left = r.left;
    CommonFunc.rect_top = r.top;
    CommonFunc.rect_right = r.right;
    CommonFunc.rect_bottom = r.bottom;
    CommonFunc.rectValue = r;
    Utils.rect_left = r.left;
    Utils.rect_top = r.top;
    Utils.rect_right = r.right;
    Utils.rect_bottom = r.bottom;
    Utils.rectValue = r;
    return r;
  }

  /** 与 CommonFunc.sleep 一致：本工具链对 Promise 空值的 resolve 较严，用 string 占位。 */
  public static sleep(time: int): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve('ok');
      }, time);
    }).then(() => {
      console.info(`sleep ${time} over...`);
      return 'ok';
    });
  }

  public static async drag(downX: number, downY: number, upX: number, upY: number, steps: number) {
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