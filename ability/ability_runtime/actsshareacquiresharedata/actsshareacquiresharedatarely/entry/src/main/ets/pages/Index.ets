/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { appManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = 'actsAbilityRunTimeTest-Page ';

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'EntryAbility index aboutToAppear');
  }

  onPageShow(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'EntryAbility index onPageShow');
  }

  build() {
    Row() {
      Column() {
        Text('Hello')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('停止其他包')
          .size({ width: '1%', height: '1%' })
          .margin({top: 10})
          .id('SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2200')
          .onClick(() => {
            let bundleName = 'com.example.helloworld';
            let TAG = 'SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2200_button';
            try {
              appManager.killProcessesByBundleName(bundleName).then((data) => {
                hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName success.', TAG);
              }).catch((err: BusinessError) => {
                hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName fail, err: %{public}s', TAG, JSON.stringify(err));
              });
            } catch (paramError) {
              let code = (paramError as BusinessError).code;
              let message = (paramError as BusinessError).message;
              hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName paramError.code: %{public}s, message: %{public}s', TAG, code, message);
            }
          })

        Button('停止自己')
          .size({ width: '1%', height: '1%' })
          .margin({top: 10})
          .id('SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2200')
          .onClick(() => {
            let bundleName = 'com.test.actsshareacquiresharedatarely';
            let TAG = 'SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2200_button';
            try {
              appManager.killProcessesByBundleName(bundleName).then((data) => {
                hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName success.', TAG);
              }).catch((err: BusinessError) => {
                hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName fail, err: %{public}s', TAG, JSON.stringify(err));
              });
            } catch (paramError) {
              let code = (paramError as BusinessError).code;
              let message = (paramError as BusinessError).message;
              hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName paramError.code: %{public}s, message: %{public}s', TAG, code, message);
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}