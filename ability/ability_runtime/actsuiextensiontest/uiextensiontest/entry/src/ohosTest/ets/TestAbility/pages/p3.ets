/*
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

import hilog from '@ohos.hilog';
import commonEventManager from '@ohos.commonEventManager'

const TAG: string = '[P3]'

@Entry
@Component
struct P1 {
  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }
  build() {
    Row() {
      Column() {
        UIExtensionComponent({
          bundleName: 'com.acts.uiextensionprovider',
          abilityName: 'UIExtAbility',
          parameters:{
            'ability.want.params.uiExtensionType': 'sys/commonUI'
          }
        }).width('100%').height('35%')
        UIExtensionComponent({
          bundleName: 'com.acts.uiextensionprovider2',
          abilityName: 'UIExtAbility',
          parameters:{
            'ability.want.params.uiExtensionType': 'sys/commonUI'
          }
        }).width('100%').height('35%')
      }
      .width('100%')
    }
    .height('100%')
  }
}