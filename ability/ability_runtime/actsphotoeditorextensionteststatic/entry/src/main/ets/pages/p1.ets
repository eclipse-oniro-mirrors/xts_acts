/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { UIExtensionComponent, UIExtensionProxy, Entry, Text, TextAttribute, Column,
  Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { wantConstant } from '@kit.AbilityKit'
import commonEventManager from '@ohos.commonEventManager'
import { BusinessError, RecordData } from '@ohos.base'

const TAG = 'ACTS_PhotoEditorExtension';

@Entry
@Component
struct MyStateSample {
  aboutToAppear() {
    hilog.info(0x0000, TAG, '%{public}s', 'TestAbility index aboutToAppear');
  }

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      UIExtensionComponent({
        bundleName: 'com.example.actsphotoeditorextensiontest.static',
        abilityName: 'MuseEditorExtensionAbility',
        flags: wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION,
        parameters: {
          'ability.params.stream':
            'file://com.wh.photoeditorcaller/data/storage/el2/base/haps/entry/files/source-1722067686453.jpg',
          'ability.want.params.uiExtensionType': 'photoEditor'
        } as Record<String, RecordData>
      }).width('100%').height('100%')
        .onRemoteReady((data : UIExtensionProxy): void => {
          hilog.info(0x0000, TAG, '%{public}s', 'onRemoteReady start');
          let onResultEvent: string = 'ACTS_PhotoEditorExtension_OnRemoteReady';
          let options: commonEventManager.CommonEventPublishData = {
            parameters: {
              'result': data
            } as Record<String, RecordData>
          }

          try {
              commonEventManager.publish(onResultEvent, options, (err: BusinessError|null) => {
                  if (err) {
                    hilog.info(0x0000, TAG, '%{public}s',
                      `Failed to publish common event. Code is ${err?.code}, message is ${err?.message}`);
                  }
                hilog.info(0x0000, TAG, '%{public}s', `Succeeded in publishing common event.`);
              });
          } catch (err) {
              err = err as BusinessError;
              hilog.info(0x0000, TAG, '%{public}s',
                `Failed to publish common event. Code is ${err?.code}, message is ${err?.message}`);
              }
        })
        .onError((error : BusinessError):void => {
          hilog.info(0x0000, TAG, '%{public}s', 'UIExtensionComponent Error: code = ' + error.code +
            ', message:' + error.message +', name:' + error.name);
        })
    }
  }
}

