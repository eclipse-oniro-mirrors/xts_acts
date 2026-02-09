/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import formAgent from '@ohos.app.form.formAgent';
import Want from '@ohos.app.ability.Want';
import { BusinessError, RecordData } from '@ohos.base';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formAgentTest';

@Entry
@Component
struct XtsFormAgent {
  @State stateVar: string = 'state var';
  message: string = 'var';
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormAgent enter');
  }

  build() {
    Column(undefined) {
      Text('XTS XtsFormAgent').fontSize(20)

      //requestPublishForm
      Button('requestPublishForm cb').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'requestPublishForm start');
        let want: Want = {
          bundleName: 'com.example.actsformtest.static',
          abilityName: 'EntryFormAbility',
          parameters: {
            'ohos.extra.param.key.form_dimension': 2,
            'ohos.extra.param.key.form_name': 'widget',
            'ohos.extra.param.key.module_name': 'entry'
          } as Record<string, RecordData>
        };
        try {
          formAgent.requestPublishForm(want, (error: BusinessError|null, data: string|undefined) => {
            if (error?.code !== 0) {
              hilog.error(DOMAIN, TAG, `formAgent requestPublishForm callback error, code: ${error?.code}, message: ${error?.message})`);
              return;
            }
            hilog.info(DOMAIN, TAG, `formAgent requestPublishForm success`);
          });
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formAgent requestPublishForm catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formAgentTest001 end');
      });

      //requestPublishForm promise
      Button('requestPublishForm promise').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formAgentTest002 start');
        let want: Want = {
          bundleName: 'com.example.actsformtest.static',
          abilityName: 'EntryFormAbility',
          parameters: {
            'ohos.extra.param.key.form_dimension': 2,
            'ohos.extra.param.key.form_name': 'widget',
            'ohos.extra.param.key.module_name': 'entry'
          } as Record<string, RecordData>
        };
        try {
          formAgent.requestPublishForm(want).then((data: string) => {
            hilog.info(DOMAIN, TAG, `formAgent requestPublishForm success`);
          }).catch((error: Error) => {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            hilog.error(DOMAIN, TAG, `formAgent requestPublishForm promise error, code: ${code}, message: ${message})`);
          });
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formAgent requestPublishForm catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'requestPublishForm end');
      });
    }
  }
}


















