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

import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { Entry,Component,Column,Margin,Text, Button, ButtonType, ClickEvent, Scroll, FontWeight } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RouterPushThree {

  build() {
    Scroll() {
      Column() {
        Text("RouterThree")
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Button("turn_RouterPushUrlOne_null")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_null")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              // params: null
            })
          })

        Button("turn_RouterPushUrlOne_string_number")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_number")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: {
                data1: {
                  data2: "message",
                  data3: 12345
                }
              } as JsonObject
            })
          })

        Button("turn_RouterPushThree_stringArray")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushThree_stringArray")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: {
                data1: {
                  data2: ["message", "message1"]
                }
              } as JsonObject
            })
          })

        Button("turn_RouterPushUrlOne_string_number1")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_number1")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: {
                data1: "message",
                data2: 12345
              } as JsonObject2
            })
          })

        Button("turn_RouterPushUrlOne_string_numArray")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_numArray")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.replaceUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: {
                data1: "message",
                data2: [1, 2, 3, 4, 5]
              } as JsonObject2
            })
          })

        Button("turn_RouterPushUrlOne_string_number_push")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_string_number_push")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              params: {
                data1: {
                  data2: "message",
                  data3: 12345
                }
              } as JsonObject
            })
          })

        Button("turn_RouterPushUrlOne_null_push")
          .type(ButtonType.Capsule)
          .margin({
            top: 10
          } as Margin)
          .id("turn_RouterPushUrlOne_null_push")
          .onClick((e: ClickEvent) => {
            AppStorage.get<Router>("router")!.pushUrl({
              url: 'MainAbility/pages/State/RouterPushOne',
              // params: null
            })
          })
      }
    }
  }
}
class JsonObject {
  data1: JsonObject1 = new JsonObject1()
}
class JsonObject1 {
  data2: string | string[] = '';
  data3?: int = 0;
}
class JsonObject2 {
  data1: string = '';
  data2: int | int[] = 0;
}