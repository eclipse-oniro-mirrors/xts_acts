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

import autoFillManager from '@ohos.app.ability.autoFillManager';
import router from '@ohos.router';
import hilog from '@ohos.hilog';
import AccountInfo from '../application/AccountInfo';
import type { UIContext } from '@ohos.arkui.UIContext';

let options: router.RouterOptions = {
  url: 'pages/LoggedInPage'
}
let account: AccountInfo = {
  id: 0,
  username: '',
  password: '',
  newPassword: ''
}

@Entry
@Component
struct Index {
  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Start }) {
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text("AutoFill 演示应用")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .margin({ bottom: 10 })

      // username container
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text($r('app.string.username'))
          .margin(10)
          .fontSize(18)
          .width('22%')
          .textAlign(TextAlign.Start)
          .fontColor(Color.Red)

        TextInput({ placeholder: "username", text: account.username })
          .type(InputType.USER_NAME)
          .fontSize(16)
          .onChange((value: string) => {
            account.username = value;
          })
          .enableAutoFill(true)
          .id("username_input")
      }
      .height(88)
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(16)
      .margin({ bottom: 5 })

      // password container
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text($r('app.string.password'))
          .margin(10)
          .fontSize(18)
          .width('22%')
          .textAlign(TextAlign.Start)
          .fontColor(Color.Red)

        TextInput({ placeholder: "password", text: account.password })
          .type(InputType.Password)
          .fontSize(16)
          .onChange((value: string) => {
            account.password = value;
          })
          .enableAutoFill(true)
          .id("password_input")

      }
      .height(88)
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(16)
      .margin({ bottom: 5 })

      // newPassword container
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        Text($r('app.string.newPassword'))
          .margin(10)
          .fontSize(18)
          .width('22%')
          .textAlign(TextAlign.Start)

        // must only contains characters and numbers, and be 8-20 digits long
        TextInput({ text: account.newPassword })
          .type(InputType.NEW_PASSWORD)
          .fontSize(16)
          .enabled(true)
          .enableAutoFill(true)
          .passwordRules("/^(?=.* [a-z]) (?=.* [A-Z]) (?=.*d) [a-zA-Zd] {8,20}$/")
          .id("new_password_input")
      }
      .height(88)
      .width('100%')
      .backgroundColor('#fff')
      .borderRadius(16)
      .margin({ bottom: 15 })

      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignContent: FlexAlign.SpaceBetween }) {
        Button("Save")
          .id("save_btn")
          .width('60%')
          .fontSize(20)
          .fontColor(Color.White)
          .type(ButtonType.Capsule)
          .onClick(() => {
            saveFunc();
          })

        Button("Login")
          .id("login_btn")
          .width('60%')
          .fontSize(20)
          .fontColor(Color.White)
          .type(ButtonType.Capsule)
          .onClick(() => {
            router.pushUrl(options, (err, data) => {
              hilog.info(0x0000, 'testTag', "back to Index page got err: %{public}s, and data: %{public}s",
                JSON.stringify(err), JSON.stringify(data));
            })
          })
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f1f3f5')
    .padding({
      left: 12,
      right: 12
    })
  }
}

function saveFunc() {
  console.log("send save request");
  let context = AppStorage.get<UIContext>("uiContext");
  console.log("UIContext: ", JSON.stringify(context));
  autoFillManager.requestAutoSave(context, {
    onSuccess: () => {
      console.log("save request on success");
    },
    onFailure: () => {
      console.log("save request on failure");
    }
  });
}