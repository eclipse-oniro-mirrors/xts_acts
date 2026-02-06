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
// import screen from '@ohos.screen';
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

  static sleep(time: int) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getComponentRect(key: string): RectValue {
    let strJson = inspector.getInspectorByKey(key);
    let obj: Record<string, undefined|null|Object> =
      JSON.parse<Object>(strJson, Class.from<String>()) as Record<string, undefined|null|Object>;
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<Array<number>> =
      JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    console.info("windowRect Left: " + AppStorage.get<number>("winLeft") + ',' +
      "windowRect Top: " +
    AppStorage.get<number>("winTop"));
    CommonFunc.rect_left = Number(rectInfo[0][0] ?? 0);
    CommonFunc.rect_top = Number(rectInfo[0][1] ?? 0);
    CommonFunc.rect_right = Number(rectInfo[1][0] ?? 0);
    CommonFunc.rect_bottom = Number(rectInfo[1][1] ?? 0);
    return CommonFunc.rect_value = {
      "left": CommonFunc.rect_left,
      "top": CommonFunc.rect_top,
      "right": CommonFunc.rect_right,
      "bottom": CommonFunc.rect_bottom
    }
  }

  static getComponentRectOnScreen(key: string): RectValue {
    let strJson = inspector.getInspectorByKey(key);
    let obj: Record<string, undefined|null|Object> =
      JSON.parse<Object>(strJson, Class.from<String>()) as Record<string, undefined|null|Object>;
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<Array<number>> =
      JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    console.info("windowRect Left: " + AppStorage.get<number>("winLeft") + ',' +
      "windowRect Top: " +
    AppStorage.get<number>("winTop"));
    CommonFunc.rect_left =
      Number(Number(rectInfo[0][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
    CommonFunc.rect_top =
      Number(Number(rectInfo[0][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
    CommonFunc.rect_right =
      Number(Number(rectInfo[1][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
    CommonFunc.rect_bottom =
      Number(Number(rectInfo[1][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
    return CommonFunc.rect_value = {
      "left": CommonFunc.rect_left,
      "top": CommonFunc.rect_top,
      "right": CommonFunc.rect_right,
      "bottom": CommonFunc.rect_bottom
    }
  }

  // static setScreenOrientation(orientation: screen.Orientation) {
  //   screen.getAllScreens()
  //     .then((data: Array<screen.Screen>) => {
  //       console.log('Succeeded in getting all screens. Data:' + JSON.stringify(data));
  //       return data[0] as screen.Screen;
  //     })
  //     .then((screenClass: screen.Screen) => {
  //       return screenClass.setOrientation(orientation);
  //     })
  //     .then(() => {
  //       console.log('Succeeded in setting the vertical orientation.');
  //     })
  //     .catch((err: Error) => {
  //       console.error('Failed to set the vertical orientation. Cause: ' + err.toString());
  //     });
  // }
}