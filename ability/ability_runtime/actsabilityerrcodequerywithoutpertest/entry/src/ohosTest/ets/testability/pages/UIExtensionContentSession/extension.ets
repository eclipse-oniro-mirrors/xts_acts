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

import { UIExtensionContentSession } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';

let storage = LocalStorage.GetShared();
const tag: string = `UIExtensionProvider`;

@Entry(storage)
@Component
struct Extension {
  @State message: string = `UIExtension provider`;
  private session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session');

  onPageShow() {
    console.info(tag, 'show');
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)

        Button("send data")
          .width('80%')
          .type(ButtonType.Capsule)
          .margin({ top: 20 })
          .onClick(() => {
            this.session?.sendData({ "data": 543321 });
            console.info(tag, 'UIExtAbility session.sendData success');
          })
      }
    }
    .height('100%')
  }
}
