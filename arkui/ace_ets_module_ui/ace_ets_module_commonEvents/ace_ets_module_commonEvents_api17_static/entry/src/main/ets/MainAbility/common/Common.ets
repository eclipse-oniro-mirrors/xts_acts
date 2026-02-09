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
// import screen from '@ohos.screen';
import { BusinessError } from '@ohos.base';
import RectValue from './Rect';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

// export class RectValue {
//   left: number = 0;
//   top: number = 0;
//   right: number = 0;
//   bottom: number = 0;
// }

export default class CommonFunc {
  static rect_left: number = 0;
  static rect_top: number = 0;
  static rect_right: number = 0;
  static rect_bottom: number = 0;
  static rect_value: RectValue = new RectValue();

  // static sleep(time: number) {
  //   return new Promise<string>((resolve: (value: string) => void) => {
  //     setTimeout(() => {
  //       resolve("ok")
  //     }, time)
  //   }).then(() => {
  //     console.info(`sleep ${time} over...`)
  //   })
  // }

  static async sleep(time:Int) : Promise<Int> {
    return new Promise<Int>((resolve, reject) => {
      setTimeout(() => {
        console.info(`sleep ${time} over...`)
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
      return part.split(",").map((item: string):double => parseFloat(item.trim()));
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
    let obj1 = JSON.parseJsonElement(strJson)
    const str = obj1.getString("$rect")
    let parts = str.substring(1, str.length - 1).split("],[");
    let rectInfo = parts.map((part: string) => {
      return part.split(",").map((item: string):double => parseFloat(item.trim()));
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

  // static setScreenOrientation(orientation: screen.Orientation) {
  //   screen.getAllScreens().then((data: Array<screen.Screen>) => {
  //     console.log('Succeeded in getting all screens. Data:'+ JSON.stringify(data));
  //     return data[0] as screen.Screen;
  //   }).then((screenClass: screen.Screen) => {
  //     return screenClass.setOrientation(orientation);
  //   }).then(() => {
  //     console.log('Succeeded in setting the vertical orientation.');
  //   }).catch((err: Error) => {
  //     console.error('Failed to set the vertical orientation. Cause: ' + err.toString());
  //   });
  // }
}




