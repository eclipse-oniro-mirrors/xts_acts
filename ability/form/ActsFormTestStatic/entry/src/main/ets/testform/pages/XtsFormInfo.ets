/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Text, Component, Button, ClickEvent, Entry } from '@ohos.arkui.component';
import hilog from '@ohos.hilog';
import formInfo from '@ohos.app.form.formInfo';


const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct XtsFormInfo {
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormInfo enter');
  }

  build() {
    Text('XTS FormInfo').fontSize(20)
    Button('123').onClick((event: ClickEvent) => {
      hilog.info(DOMAIN, TAG, 'XtsFormInfo Button 123');
      let extraData: Record<string, object> = {
        'abc1': '123',
        'abc2': '123',
        'abc3': '123',
      }
      let runningFormInfoFo: formInfo.RunningFormInfo = {
        formId: 'formId',
        bundleName: 'bundleName',
        hostBundleName: 'hostBundleName',
        formLocation: formInfo.FormLocation.DESKTOP,
        visibilityType: formInfo.VisibilityType.FORM_VISIBLE,
        moduleName: 'moduleName',
        abilityName: 'abilityName',
        formName: 'formName',
        dimension: 123,
        formUsageState: formInfo.FormUsageState.UNUSED,
        formDescription: 'formDescription',
        extraData: extraData,
      }
      hilog.info(DOMAIN, TAG, 'XtsFormInfo Button 123456');
    })
  }
}
