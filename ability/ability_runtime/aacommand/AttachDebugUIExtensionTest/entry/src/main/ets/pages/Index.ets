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

import Want from '@ohos.app.ability.Want';
import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import common from '@ohos.app.ability.common';

let context = getContext(this) as common.UIExtensionContext;


let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Index {
  @State message: string = 'UIExtAbility has been started'
  private session = storage.get<UIExtensionContentSession>('session');

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontStyle(FontStyle.Italic)

        Button('TerminateSelf')
          .type(ButtonType.Capsule)
          .margin({ top: 30 })
          .backgroundColor('#87CEEB')
          .width('70%')
          .height('6%')
          .onClick(() => {
            this.session.terminateSelf((err) => {
              console.info('Terminate service extension: ' + JSON.stringify(err));
            })
            storage.clear();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}