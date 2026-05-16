/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { Want } from '@kit.AbilityKit';
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, Row, EmbeddedComponent, EmbeddedType } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'

@Entry
@Component
struct EmbeddedComponentPage {
  @State message: string = 'Message: '

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        EmbeddedComponent({
          bundleName: 'com.example.actswindowtest.static',
          abilityName: 'ExampleEmbeddedAbility',
        } as Want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('500px')
          .height('500px')
          .onTerminated((info)=>{
            this.message = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error)=>{
            this.message = 'Error: code = ' + error.code;
            console.log('testUIExtensionHostWindowProxyRectTest : onError ' + error.code + error.message)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}