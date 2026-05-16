'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@kit.ArkUI'

@Entry
@Component
struct getSizeLimitationStatic {
  @State text1: string = 'no run';

  build() {
    Column() {
      Button('getSizeLimitationButton')
        .width('50%')
        .height('20%')
        .id('getSizeLimitationTestButton')
        .onClick(() => {
          let componentSnapshot = this.getUIContext().getComponentSnapshot();
          let limitation = componentSnapshot.getSizeLimitation();
          if (limitation.maxWidth > 0 && limitation.maxHeight > 0) {
            this.text1 = 'getSizeLimitation success';
          } else {
            this.text1 = 'getSizeLimitation failed';
          }
        })
      Text(this.text1).id('getSizeLimitationText')
    }
    .width('100%')
  }
}