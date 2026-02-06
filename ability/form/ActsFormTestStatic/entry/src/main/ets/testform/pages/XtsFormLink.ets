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

import { Text, Component, Entry, FormLink } from '@ohos.arkui.component';
import hilog from '@ohos.hilog';
import CommonEventManager from '@ohos.commonEventManager';


const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct XtsFormLink {
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormLink enter');
  }

  build() {
    FormLink({
      action: 'message',
      abilityName: 'EntryFormAbility',
    }) {
      Text('XTS FormLink').fontSize(20)
        .onAppear(() => {
          CommonEventManager.publish('XTS_FormLinkTest_commonEvent', () => {
            hilog.info(DOMAIN, TAG, 'FormLinkTest001 commonEvent publish');
          })
        })
    }
  }
}
