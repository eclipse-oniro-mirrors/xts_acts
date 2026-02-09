/*
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
import commonEventManager from '@ohos.commonEventManager';

const TAG = 'LaunchPage';

@Entry
@Component
struct LaunchPage {
  aboutToAppear() {
    hilog.info(0x0000, TAG, 'aboutToAppear');
  }

  build() {
    Row() {
      Column() {
        UIExtensionComponent({
          bundleName: 'com.acts.liveformextensiontest',
          abilityName: 'LiveFormExtAbility',
          parameters: {
            'ability.want.params.uiExtensionType': 'liveForm',
            'extraInfo': {
              'formInfo': {
                'formId': 'testFormId',
                'rect': { 
                  'left': 0,
                  'top': 0,
                  'width': 158,
                  'height': 158
                },
                'borderRadius': 15
              }
            }
          }
        })
          .width('100%')
          .height('100%')
          .onRemoteReady((data) => {
            let onResultEvent: string = 'ACTS_LiveFormExtension_OnRemoteReady';
            let options: commonEventManager.CommonEventPublishData = {
              parameters: {
                'result': data
              }
            }
            commonEventManager.publish(onResultEvent, options, (err) => {
              hilog.info(0x0000, TAG, 'ACTS_LiveFormExtension_OnRemoteReady');
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}