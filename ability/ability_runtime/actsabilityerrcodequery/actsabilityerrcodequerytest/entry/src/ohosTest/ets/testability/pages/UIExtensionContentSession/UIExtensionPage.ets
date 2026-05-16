/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { router } from '@kit.ArkUI';

let tag = 'UIExtensionPage'

class MyRouterParam {
  constructor(from: string) {
    this.fromPage = from;
  }
  public fromPage: string = "";
}
@Entry
@Component
struct UIExtensionPage {
  @State message: string = 'UIExtension User';
  private myProxy: UIExtensionProxy | undefined = undefined;
  public params:string = ''

  aboutToAppear(): void {
    this.params = (router.getParams() as MyRouterParam).fromPage;
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .size({ width: '100%', height: '50' })
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)

        EmbeddedComponent(
          {
            bundleName: 'com.test.actsabilityerrcodequerytest',
            abilityName: 'UIExtensionProvider',
            moduleName: 'entry_test',
            action:this.params,
          }, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .focusable(true)
          .offset({ x: 0, y: 30 })
          .size({ width: 300, height: 300 })
          .border({ width: 5, color: 0x317AF7, radius: 10, style: BorderStyle.Dotted })

        Button("sendData")
          .id('userSendData')
          .type(ButtonType.Capsule)
          .offset({ x: 0, y: 60 })
          .width('1%')
          .height('1%')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .onClick(() => {
            this.myProxy?.send({
              "data": 123456,
              "message": "data from component"
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
