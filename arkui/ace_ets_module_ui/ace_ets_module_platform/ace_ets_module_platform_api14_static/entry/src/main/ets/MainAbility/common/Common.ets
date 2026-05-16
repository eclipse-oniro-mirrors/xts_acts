'use static';
/*
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

import { BusinessError } from '@ohos.base';
import RectValue from './Rect';
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement'

export default class CommonFunc {
  static rect_left: number;
  static rect_top: number;
  static rect_right: number;
  static rect_bottom: number;
  static rect_value: RectValue = new RectValue();

  static async sleep(time: int) : Promise<int>  {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, time)
    })
  }

  static getComponentRect(key: string): RectValue {
    let strJson = inspector.getInspectorByKey(key);
    let obj1 = JSON.parseJsonElement(strJson)
    const str = obj1.getString("$rect")
    let parts = str.substring(1, str.length - 1).split("],[");
    let rectInfo = parts.map((part: string) => {
      return part.split(",").map((item: string): double => parseFloat(item.trim()));
    });
    console.info("windowRect Left: " + AppStorage.get<number>("winLeft") + ',' +
      "windowRect Top: " + AppStorage.get<number>("winTop"));
    return {
      "left": Number(rectInfo[0][0] ?? 0),
      "top": Number(rectInfo[0][1] ?? 0),
      "right": Number(rectInfo[1][0] ?? 0),
      "bottom": Number(rectInfo[1][1] ?? 0)
    } as RectValue
  }

  static getComponentRectOnScreen(key: string): RectValue {
    let strJson = inspector.getInspectorByKey(key);
    let obj: Record<string, Object> =
      JSON.parse<Object>(strJson, Class.from<String>()) as Record<string, Object>;
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<Array<number>> =
      JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    console.info("windowRect Left: " + AppStorage.get<number>("winLeft") + ',' + "windowRect Top: " +
    AppStorage.get<number>("winTop"));
    CommonFunc.rect_left = Number(Number(rectInfo[0][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
    CommonFunc.rect_top = Number(Number(rectInfo[0][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
    CommonFunc.rect_right = Number(Number(rectInfo[1][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
    CommonFunc.rect_bottom = Number(Number(rectInfo[1][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
    return CommonFunc.rect_value = {
      "left": CommonFunc.rect_left,
      "top": CommonFunc.rect_top,
      "right": CommonFunc.rect_right,
      "bottom": CommonFunc.rect_bottom
    }
  }

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
