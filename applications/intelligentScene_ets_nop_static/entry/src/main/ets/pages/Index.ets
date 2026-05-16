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
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';

  aboutToAppear() {
    hilog.info(DOMAIN, TAG, `Index enter`);
  }

  changeValue() {
    hilog.info(DOMAIN, TAG, 'changeValue enter');
    this.stateVar+='~'
  }

  build() {
    Column(undefined) {
      Text('Hellooooooooooooooooooo World').fontSize(20)

      Text(this.stateVar).fontSize(20)
      Child({ stateVar: this.stateVar } as __Options_Child)
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
