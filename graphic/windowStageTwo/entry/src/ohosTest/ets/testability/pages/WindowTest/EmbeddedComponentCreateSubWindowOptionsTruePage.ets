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

@Entry
@Component
struct EmbeddedComponentPage {
  @State message: string = 'Message: '
  private want: Want = {
    bundleName: 'com.example.myapplication',
    abilityName: 'EmbeddedCreateSubWindowTrueAbility',
    parameters: {
      'ohos.extension.processMode.hostInstance': 'true',
      'reason': 'back'
    }
  }
  @State visible: Visibility = Visibility.Hidden;

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize(30)
        Button()
          .id('changeVisibleBtn')
          .onClick(() => {
            this.visible = Visibility.Visible;
          })
        EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .visibility(this.visible)
          .width('500px')
          .height('500px')
          .onTerminated((info)=>{
            this.message = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
          })
          .onError((error)=>{
            this.message = 'Error: code = ' + error.code;
            console.log('testCreateSubWindowWithOptionsFollowTrue : onError ' + JSON.stringify(error))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}