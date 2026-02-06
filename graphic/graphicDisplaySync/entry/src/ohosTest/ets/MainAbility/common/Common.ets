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

export default class CommonFunc {
  static rectLeft: any;
  static rectTop: any;
  static rectRight: any;
  static rectBottom: any;
  static rectValue: any;

  static sleep(time: number){
    return new Promise((resolve,reject)=>{
      setTimeout(()=>{
        resolve('ok')
      },time)
    }).then(()=>{
      console.info(`sleep ${time} over...`)
    })
  }

  static getComponentRect(key: string) {
    let strJson = getInspectorByKey(key);
    let obj = JSON.parse(strJson);
    console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
    let rectInfo = JSON.parse('[' + obj.$rect + ']');
    this.rectLeft = JSON.parse('[' + rectInfo[0] + ']')[0];
    this.rectTop = JSON.parse('[' + rectInfo[0] + ']')[1];
    this.rectRight = JSON.parse('[' + rectInfo[1] + ']')[0];
    this.rectBottom = JSON.parse('[' + rectInfo[1] + ']')[1];
    this.rectValue = {
      "left": this.rectLeft, "top": this.rectTop, "right": this.rectRight, "bottom": this.rectBottom
    };
    console.info(JSON.stringify(this.rectValue));
    return this.rectValue;
  }
}
