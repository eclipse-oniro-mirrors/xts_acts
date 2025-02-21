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
import componentRect from '@ohos.arkui.componentUtils'


export default class Utils {

  static rect_width;
  static rect_height;

  static rect_localOffsetX;
  static rect_localOffsetY;

  static rect_windowOffsetX;
  static rect_windowOffsetY;

  static rect_screenOffsetX;
  static rect_screenOffsetY;

//  static rect_matrix4X;
//  static rect_matrix4Y;
//  static rect_matrix4Z;

  static rect_value;

  static getComponentRect(key) {
    let strJson = componentRect.getRectangleById(key);

    this.rect_width = strJson.size.width
    this.rect_height = strJson.size.height
    this.rect_localOffsetX = strJson.localOffset.x
    this.rect_localOffsetY = strJson.localOffset.y

    this.rect_windowOffsetX = strJson.windowOffset.x
    this.rect_windowOffsetY = strJson.windowOffset.y

    this.rect_screenOffsetX = strJson.screenOffset.x
    this.rect_screenOffsetY = strJson.screenOffset.y

//    this.rect_matrix4X = strJson.matrix4.x
//    this.rect_matrix4Y = strJson.matrix4.y
//    this.rect_matrix4Z = strJson.matrix4.z

    return this.rect_value = {
      "width": this.rect_width, "height": this.rect_height,
      "localOffsetX": this.rect_localOffsetX, "localOffsetY": this.rect_localOffsetY,
      "windowOffsetX": this.rect_windowOffsetX, "windowOffsetY": this.rect_windowOffsetY,
      "screenOffsetX": this.rect_screenOffsetX, "screenOffsetY": this.rect_screenOffsetX
//    ,
//      "matrix4X": this.rect_matrix4X, "matrix4Y": this.rect_matrix4Y,
//      "matrix4Z": this.rect_matrix4Z
    }
  }

}