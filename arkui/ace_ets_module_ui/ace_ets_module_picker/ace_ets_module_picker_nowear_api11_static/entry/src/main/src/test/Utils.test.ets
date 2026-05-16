'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// import componentRect from '@ohos.arkui.componentUtils'
import componentUtils from '@ohos.arkui.componentUtils'
import { ComponentUtils } from '@ohos.arkui.UIContext'
import RectValue from '../../ets/MainAbility/common/Rect';


export default class Utils {
  static rect_width: number;
  static rect_height: number;
  static rect_localOffsetX: number;
  static rect_localOffsetY: number;
  static rect_windowOffsetX: number;
  static rect_windowOffsetY: number;
  static rect_screenOffsetX: number;
  static rect_screenOffsetY: number;
  // static rect_value: RectValue;
  static rect_value: RectValue = new RectValue();

  static sleep(time: int) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  // static getComponentRect(key: string) {
  //   // let strJson: componentRect.ComponentInfo = componentRect.getRectangleById(key);
  //   let strJson: componentUtils.ComponentInfo = new ComponentUtils().getRectangleById(key);
  //   Utils.rect_width = strJson.size.width
  //   Utils.rect_height = strJson.size.height
  //   Utils.rect_localOffsetX = strJson.localOffset.x
  //   Utils.rect_localOffsetY = strJson.localOffset.y
  //
  //   Utils.rect_windowOffsetX = strJson.windowOffset.x
  //   Utils.rect_windowOffsetY = strJson.windowOffset.y
  //
  //   Utils.rect_screenOffsetX = strJson.screenOffset.x
  //   Utils.rect_screenOffsetY = strJson.screenOffset.y
  //
  //
  //   return Utils.rect_value = {
  //     width: Utils.rect_width,
  //     height: Utils.rect_height,
  //     localOffsetX: Utils.rect_localOffsetX,
  //     localOffsetY: Utils.rect_localOffsetY,
  //     windowOffsetX: Utils.rect_windowOffsetX,
  //     windowOffsetY: Utils.rect_windowOffsetY,
  //     screenOffsetX: Utils.rect_screenOffsetX,
  //     screenOffsetY: Utils.rect_screenOffsetX
  //   }
  // }
}