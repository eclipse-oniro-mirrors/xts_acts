/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import screen from '@ohos.screen';
import { BusinessError } from '@ohos.base';

export class RectValue {
  left: number = 0;
  top: number = 0;
  right: number = 0;
  bottom: number = 0;
}

export default class CommonFunc {
  public static rectLeft: number;
  public static rectTop: number;
  public static rectRight: number;
  public static rectBottom: number;
  public static rectValue: RectValue;
  
  static sleep(time: number) {
    return new Promise((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }
  
 static getComponentRect(key: string): RectValue {
    let strJson = getInspectorByKey(key);
    let obj: Record<string, Object> = JSON.parse(strJson);
    console.info('[getInspectorByKey] current component obj is: ' + JSON.stringify(obj));
    let rectInfo: string[] = JSON.parse('[' + obj.$rect + ']')
    console.info('[getInspectorByKey] rectInfo is: ' + rectInfo);
    CommonFunc.rectLeft = JSON.parse('[' + rectInfo[0] + ']')[0]
    CommonFunc.rectTop = JSON.parse('[' + rectInfo[0] + ']')[1]
    CommonFunc.rectRight = JSON.parse('[' + rectInfo[1] + ']')[0]
    CommonFunc.rectBottom = JSON.parse('[' + rectInfo[1] + ']')[1]
    return CommonFunc.rectValue = {
      'left': CommonFunc.rectLeft, 'top': CommonFunc.rectTop, 'right': CommonFunc.rectRight, 'bottom': CommonFunc.rectBottom
    }
  }

  static setScreenOrientation(orientation: number) {
    screen.getAllScreens().then(data => {
        console.log('Succeeded in getting all screens. Data:'+ JSON.stringify(data));
        return data[0];
    }).then(screenClass => {
        return screenClass.setOrientation(orientation);
    }).then(() => {
        console.log('Succeeded in setting the vertical orientation.');
    }).catch((err: BusinessError) => {
        console.error('Failed to set the vertical orientation. Cause: ' + err.toString());
    });
  }

}




