/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { UIExtensionContentSession } from '@kit.AbilityKit';
import { uiExtension, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
let storage = LocalStorage.getShared()

@Entry(storage)
@Component
struct Extension {

  @State message: boolean = false

  build() {
    Column() {
      Text(this.message + '')
        .id('HelloWorld')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Button("获取组件大小")
        .id('button')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>("session");
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          let rect = extensionWindow?.properties.uiExtensionHostWindowProxyRect;
          console.info(`testUIExtensionHostWindowProxyRect rect: ${JSON.stringify(rect)}`);
          this.message = (rect?.width == 500 && rect?.height == 500)
        })
    }.width('100%').height('100%')
  }
}