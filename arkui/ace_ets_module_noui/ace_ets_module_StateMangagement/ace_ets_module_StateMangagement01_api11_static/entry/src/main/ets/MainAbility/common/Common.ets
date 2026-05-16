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
import screen from '@ohos.screen';
import { BusinessError } from '@ohos.base';
import RectValue from './Rect';
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

export default class CommonFunc {
  static rect_left: number = 0;
  static rect_top: number = 0;
  static rect_right: number = 0;
  static rect_bottom: number = 0;
  static rect_value: RectValue = new RectValue();

  static sleep(time: int) {
    return new Promise<string>((resolve: (value: string) => void) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  static getComponentRect(key: string): RectValue {
    let strJson: string = inspector.getInspectorByKey(key);
    let obj: Record<string, Object> = JSON.parse<Object>(strJson, Class.from<String>()) as Record<string, Object>;
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<Array<number>> = JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    CommonFunc.rect_left = Number(rectInfo[0][0] ?? 0);
    CommonFunc.rect_top = Number(rectInfo[0][1] ?? 0);
    CommonFunc.rect_right = Number(rectInfo[1][0] ?? 0);
    CommonFunc.rect_bottom = Number(rectInfo[1][1] ?? 0);
    return CommonFunc.rect_value = {
      left: CommonFunc.rect_left, top: CommonFunc.rect_top, right: CommonFunc.rect_right, bottom: CommonFunc.rect_bottom
    }
  }

  static getComponentRectOnScreen(key: string): RectValue {
    let strJson = inspector.getInspectorByKey(key);
    let obj: Record<string, Object> = JSON.parse<Object>(strJson, Class.from<String>()) as Record<string, Object>;
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo: Array<Array<number>> = JSON.parse<Object>('[' + obj["$rect"]! + ']', Class.from<String>()) as Array<Array<number>>;
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    console.info("windowRect Left: " + AppStorage.get<number>("winLeft") + ',' + "windowRect Top: " + AppStorage.get<number>("winTop") );
    CommonFunc.rect_left = Number(Number(rectInfo[0][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
    CommonFunc.rect_top = Number(Number(rectInfo[0][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
    CommonFunc.rect_right = Number(Number(rectInfo[1][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
    CommonFunc.rect_bottom = Number(Number(rectInfo[1][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
    return CommonFunc.rect_value = {
      "left": CommonFunc.rect_left, "top": CommonFunc.rect_top, "right": CommonFunc.rect_right, "bottom": CommonFunc.rect_bottom
    }
  }

  // Instead of CommonFunc.getType
  // Function.call is not supported (arkts-no-func-apply-call)
  // Prototype assignment is not supported (arkts-no-prototype-assignment)
  static getType<T>( value: T ):string{
    let result: string;
    if ( value === undefined ) {
      result = '[object Undefined]';
    } else if ( value === null ) {
      result = '[object Null]';
    } else {
      result =  (value as Object).toString()
      if (value instanceof Array) {
        console.log('this.Array 是数组类型');
        result = '[object Array]';
      }else if(value instanceof Boolean){
        console.log('this.Array 是布尔类型');
        result = '[object Boolean]';
      }else if(value instanceof Date){
        console.log('this.Array 是日期');
        result = '[object Date]';
      }else if(value instanceof Int || value instanceof Double){
        console.log('this.Array 是number');
        result = '[object Number]';
      }else if(value instanceof String){
        console.log('this.Array String');
        result = '[object String]';
      }else if(value instanceof Object){
        console.log('this.Array Object');
        result = '[object Object]';
      }else{
        result = '';
      }
      // const o: ObjectWithToString = Object(value);
      // const origin = o.toObjectString;
      // o.toObjectString = (new BaseObject()).toString;
      // result = o.toObjectString() ?? '';
      // o.toObjectString = origin;
      // result = '';
    }
    return result;
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

interface ObjectWithToString {
  toObjectString?: () => string
}

class BaseObject {}


