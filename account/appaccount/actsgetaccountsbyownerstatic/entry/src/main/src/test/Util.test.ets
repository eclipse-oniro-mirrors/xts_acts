/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { Component, Driver, ON, MatchPattern, UIElementInfo } from '@ohos.UiTest';

let tag: string = 'utilsTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default class Utils {

  static async msSleep(count: int): Promise<int> {
    hilog.info(0x0000, tag, `====>msSleep start, sleep ${count} ms`);
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }

  static async clickRequestPermission(mess: string): Promise<void> {
    hilog.info(0x0000, tag, "====>clickRequestPermission start");
    try {
      let driver: Driver = Driver.create();
      let permissionButton: Component | null = await driver.waitForComponent(ON.text(mess, MatchPattern.EQUALS), 2000);
      if (permissionButton != null) {
        await permissionButton.click();
        hilog.info(0x0000, tag, "====>clickRequestPermission end");
      }
    } catch (err) {
      err = err as BusinessError;
      hilog.info(0x0000, tag, "====>clickRequestPermission get err:" + err);
    }
  }
}