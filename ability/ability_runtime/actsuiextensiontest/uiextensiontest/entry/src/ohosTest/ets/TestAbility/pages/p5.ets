/*
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

import hilog from '@ohos.hilog';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'testTag-P5';
const UI_EXTENSION_PAGE5_ON_ERROR: string = 'UIExtension_Page5_OnError';

@Entry
@Component
struct P5 {
  private myProxy: UIExtensionProxy | undefined = undefined;

  aboutToAppear() {
    hilog.info(0x0000, TAG, '%{public}s', 'TestAbility index aboutToAppear');
  }

  publishCb(err: BusinessError) {
    if (err) {
      console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
    } else {
      hilog.info(0x0000, TAG, '%{public}s', 'publish success');
    }
  }

  build() {
    Row() {
      Column() {
        UIExtensionComponent({
          bundleName: 'com.acts.uiextensionprovider4',
          abilityName: 'UIExtAbility',
          parameters: {
            'ability.want.params.uiExtensionType': 'sys/commonUI'
          }
        })
          .width('100%')
          .height('35%')
          .onRemoteReady((proxy) => {
            this.myProxy = proxy;
            hilog.info(0x0000, TAG, '%{public}s', 'onRemoteReady');
          })
          .onError((error) => {
            hilog.info(0x0000, TAG, '%{public}s', 'onError');
            try {
              commonEventManager.publish(UI_EXTENSION_PAGE5_ON_ERROR, this.publishCb);
            } catch (error) {
              let err: BusinessError = error as BusinessError;
              hilog.info(0x0000, TAG, 'publish failed %{public}s', JSON.stringify(err));
            }
          })
          .onReceive((data) => {
            hilog.info(0x0000, TAG, 'onReceive, data: %{public}s', JSON.stringify(data));
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
