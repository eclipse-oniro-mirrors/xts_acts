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
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { appManager } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
import abilityManager from '@ohos.app.ability.abilityManager'

@Entry
@Component
struct ShareAcquireShareDataIndex {
  @State killProcessResult: string = 'killProcessResult';
  @State clearUpResult: string = 'clearUpResult';
  @State acquireShareResult: string = 'acquireShareResult';

  build() {
    Row() {
      Column() {
        Text('ShareAcquireShareDataIndex')
          .fontSize(5)

        Button('停止自己')
          .size({ width: '1%', height: '1%' })
          .id('SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2200')
          .onClick(() => {
            let bundleName = 'com.test.actsshareacquiresharedatarely';
            let TAG = 'SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2200_button';
            appManager.killProcessesByBundleName(bundleName).then((data) => {
              hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName success.', TAG);
              this.killProcessResult = `killProcessResult. success.`
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'result': this.killProcessResult
                }
              };
              commonEventManager.publish('button_onClick_event', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, TAG, '[%{public}s] Publish success', TAG);
                }
              });
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, '[%{public}s] killProcessesByBundleName fail, err: %{public}s', TAG, JSON.stringify(err));
              this.killProcessResult = `killProcessResult. code: ${err.code}, message: ${err.message}`;
              hilog.info(0x0000, TAG, '[%{public}s] killProcessResult: %{public}s', TAG, JSON.stringify(this.killProcessResult));
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'result': this.killProcessResult
                }
              };
              commonEventManager.publish('button_onClick_event', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, TAG, '[%{public}s] Publish success', TAG);
                }
              });
            });
          })
        Text(this.killProcessResult)

        Button('清理自己')
          .size({ width: '1%', height: '1%' })
          .id('SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2300')
          .onClick(() => {
            let bundleName = 'com.test.actsshareacquiresharedatarely';
            let TAG = 'SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_2300_button';
            appManager.clearUpApplicationData(bundleName).then((data) => {
              hilog.info(0x0000, TAG, '[%{public}s] clearUpApplicationData success.', TAG);
              this.clearUpResult = `clearUpResult. success.`
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'result': this.clearUpResult
                }
              };
              commonEventManager.publish('button_onClick_event', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, TAG, '[%{public}s] Publish success', TAG);
                }
              });
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, '[%{public}s] clearUpApplicationData fail, err: %{public}s', TAG, JSON.stringify(err));
              this.clearUpResult = `clearUpResult. code: ${err.code}, message: ${err.message}`;
              hilog.info(0x0000, TAG, '[%{public}s] clearUpResult: %{public}s', TAG, JSON.stringify(this.clearUpResult));
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'result': this.clearUpResult
                }
              };
              commonEventManager.publish('button_onClick_event', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, TAG, '[%{public}s] Publish success', TAG);
                }
              });
            });
          })
        Text(this.clearUpResult)

        Button('acquireShare')
          .size({ width: '1%', height: '1%' })
          .id('SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_3100')
          .onClick(() => {
            let bundleName = 'com.test.actsshareacquiresharedatarely';
            let TAG = 'SUB_Ability_AbilityRuntime_AppManager_ShareAcquireShareData_3100_button';
            abilityManager.acquireShareData(1).then((wantParam: Record<string, Object>) => {
              hilog.info(0x0000, TAG, '[%{public}s] acquireShareData success.', TAG);
              this.acquireShareResult = `acquireShareResult. success.`
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'result': this.acquireShareResult
                }
              };
              commonEventManager.publish('button_onClick_event', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, TAG, '[%{public}s] Publish success', TAG);
                }
              });
            }).catch((err: BusinessError) => {
              hilog.info(0x0000, TAG, '[%{public}s] acquireShareData fail, err: %{public}s', TAG, JSON.stringify(err));
              this.acquireShareResult = `acquireShareResult. code: ${err.code}, message: ${err.message}`;
              hilog.info(0x0000, TAG, '[%{public}s] acquireShareResult: %{public}s', TAG, JSON.stringify(this.acquireShareResult));
              let options: commonEventManager.CommonEventPublishData = {
                code: 1,
                parameters: {
                  'result': this.acquireShareResult
                }
              };
              commonEventManager.publish('button_onClick_event', options, (err: BusinessError) => {
                if (err) {
                  hilog.info(0x0000, TAG, '[%{public}s] PublishCallBack err: %{public}s', TAG, JSON.stringify(err));
                } else {
                  hilog.info(0x0000, TAG, '[%{public}s] Publish success', TAG);
                }
              });
            });
          })
        Text(this.acquireShareResult)

      }
      .width('100%')
    }
    .height('100%')
  }
}