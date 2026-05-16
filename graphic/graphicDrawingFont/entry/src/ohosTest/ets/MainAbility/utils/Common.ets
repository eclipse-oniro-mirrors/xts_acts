/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export default class CommonFunc {
  static rect_left:ESObject
  static rect_top:ESObject;
  static rect_right:ESObject;
  static rect_bottom:ESObject;
  static rect_value:ESObject

  static sleep(time:number) : Promise<void> {
    return new Promise((resolve)=>{
      setTimeout(()=>{
        resolve()
      },time)
    })
  }
  
 static getComponentRect(key:string) {
    let strJson = getInspectorByKey(key);
    let obj:ESObject = JSON.parse(strJson);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo:ESObject = JSON.parse('[' + obj.$rect + ']')
    console.info("[getInspectorByKey] rectInfo is: " + rectInfo);
    CommonFunc.rect_left = JSON.parse('[' + rectInfo[0] + ']')[0]
    CommonFunc.rect_top = JSON.parse('[' + rectInfo[0] + ']')[1]
    CommonFunc.rect_right = JSON.parse('[' + rectInfo[1] + ']')[0]
    CommonFunc.rect_bottom = JSON.parse('[' + rectInfo[1] + ']')[1]
    return CommonFunc.rect_value = {
      left: CommonFunc.rect_left,
      top: CommonFunc.rect_top,
      right: CommonFunc.rect_right,
      bottom: CommonFunc.rect_bottom
    }
  }

  static setScreenOrientation(orientation:screen.Orientation) {
      // 1 -- 2 |
       let screenClass: screen.Screen | null = null;
       screen.getAllScreens().then(data => {
           screenClass = data[0];
          console.log('Succeeded in getting all screens. Data:' + JSON.stringify(data));
             
       }).catch((err: BusinessError) => {
             console.log('Failed to get all screens. Cause: ' + JSON.stringify(err));
       }); 
       try {
          screenClass!.setOrientation(orientation, (err: BusinessError) => {
           const errCode: number = err.code;
           if (errCode) {
               console.error('Failed to set the vertical orientation. Code: ' + JSON.stringify(err));
              return;
            }
          console.info('Succeeded in setting the vertical orientation.');
          });
       } catch (exception) {
        console.error('Failed to set the vertical orientation. Code: ' + JSON.stringify(exception));
     };
  }
}