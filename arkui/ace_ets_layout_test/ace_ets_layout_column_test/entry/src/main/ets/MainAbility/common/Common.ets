/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

export default class CommonFunc {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue;

  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
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
    let rectInfo: Array<string> = JSON.parse('[' + obj.$rect + ']');
    CommonFunc.rect_left = JSON.parse('[' + rectInfo[0] + ']')[0];
    CommonFunc.rect_top = JSON.parse('[' + rectInfo[0] + ']')[1];
    CommonFunc.rect_right = JSON.parse('[' + rectInfo[1] + ']')[0];
    CommonFunc.rect_bottom = JSON.parse('[' + rectInfo[1] + ']')[1];
    return CommonFunc.rect_value = {
      left: CommonFunc.rect_left, top: CommonFunc.rect_top, right: CommonFunc.rect_right, bottom: CommonFunc.rect_bottom
    }
  }
}


