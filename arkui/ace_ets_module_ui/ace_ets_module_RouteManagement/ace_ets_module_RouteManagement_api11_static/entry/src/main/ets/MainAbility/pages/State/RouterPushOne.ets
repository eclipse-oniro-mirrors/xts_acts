'use static';
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

import hilog from '@ohos.hilog';
import router from '@ohos.router';
import { Entry,Component,Column,Margin,Text, Button, ButtonType, ClickEvent, Scroll, FontWeight } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext'
export interface RouterParams {
  view: string;
}
@Entry
@Component
struct RouterPushOne {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');

  }
  @State message: string = 'RouterPushUrlOne'
  @State messageUI: string = 'UIRouterPushUrlOne'

  build() {
    Scroll() {
      Column() {
        Text(this.message)
        Text("RouterPushThree " + JSON.stringify(this.getUIContext().getRouter().getParams()))
          .fontSize(20)
          .id("Text_RouterPushThree_Params")
        Button("turn_RouterPushUrlTwo_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushUrlTwo_noParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_RouterPushUrlTwo_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushUrlTwo_hasParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })

        Button("turn_RouterPushReplace_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushReplace_noParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_RouterPushReplace_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_RouterPushReplace_hasParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })

        Text(this.messageUI)
        Button("turn_UIRouterPushUrlTwo_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushUrlTwo_noParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_UIRouterPushUrlTwo_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushUrlTwo_hasParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })

        Button("turn_UIRouterPushReplace_noParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushReplace_noParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo'
            })
          })
        Button("turn_UIRouterPushReplace_hasParms")
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          } as Margin)
          .id("turn_UIRouterPushReplace_hasParms")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushTwo',
              params: {
                view: "params"
              } as RouterParams
            })
          })
      }
    }
  }
}
