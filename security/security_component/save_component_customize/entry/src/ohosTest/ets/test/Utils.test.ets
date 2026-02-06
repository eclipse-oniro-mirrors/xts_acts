/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use Utils file except in compliance with the License.
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
  static rect_left:number;
  static rect_top:number;
  static rect_right:number;
  static rect_bottom:number;
  static rect_value:ESObject;

  static sleep(time:number) {
    return new Promise<void>((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }


  static getComponentRect(key:string) {
    let strJson = getInspectorByKey(key);
    let obj : ESObject = JSON.parse(strJson);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo:ESObject = JSON.parse('[' + obj.$rect + ']')
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    Utils.rect_left = JSON.parse('[' + rectInfo[0] + ']')[0]
    Utils.rect_top = JSON.parse('[' + rectInfo[0] + ']')[1]
    Utils.rect_right = JSON.parse('[' + rectInfo[1] + ']')[0]
    Utils.rect_bottom = JSON.parse('[' + rectInfo[1] + ']')[1]
    return Utils.rect_value = {
      "left": Utils.rect_left, "top": Utils.rect_top, "right": Utils.rect_right, "bottom": Utils.rect_bottom
    }
  }
}




