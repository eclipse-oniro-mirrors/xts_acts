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
struct extensionCreateSubWindowWithTrueOpt {

  @State clickNum: number = 0
  @State longPressNum: number = 0
  @State message: string = ''

  build() {
    Column() {

      Row(){
        Text('错误码验证结果 ：')
        Text(this.message + '')
          .id('errorMessage')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }

      Button('createSubWindowWithOptionsTrue')
        .id('createSubWindowWithOptionsTrue')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(async () => {
          let session: UIExtensionContentSession | undefined = storage.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            const subWindowConfig: window.SubWindowOptions = {
              title: 'This is a subwindow',
              decorEnabled: true,
            };
            // 创建子窗口
            await extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptionsTrue', subWindowConfig, true)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testCreateSubWindowWithOptionsFollowTrue err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

    }.width('100%').height('100%')
  }
}