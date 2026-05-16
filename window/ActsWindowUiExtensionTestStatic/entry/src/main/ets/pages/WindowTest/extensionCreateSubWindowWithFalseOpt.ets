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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, Row } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import window from '@ohos.window';

import { UIExtensionContentSession } from '@kit.AbilityKit';
import uiExtension from '@ohos.arkui.uiExtension';
import { BusinessError } from '@kit.BasicServicesKit';

async function msSleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}


@Entry
@Component
struct extensionCreateSubWindowWithFalseOpt {

  @State clickNum: number = 0
  @State longPressNum: number = 0
  @State message: string = ''
  private storage: LocalStorage | undefined = this.getUIContext()?.getSharedLocalStorage();

  build() {
    Column() {

      Row(){
        Text('错误码验证结果 ：')
        Text(this.message + '')
          .id('errorMessage')
          .fontSize(20)
          
      }

      Button('createSubWindowWithOptionsFalse')
        .id('createSubWindowWithOptionsFalse')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            const subWindowConfig: window.SubWindowOptions = {
              title: 'This is a subwindow',
              decorEnabled: false,
              maximizeSupported:true,
              outlineEnabled:true
            };
            // 创建子窗口
            extensionWindow!.createSubWindowWithOptions('createSubWindowWithOptionsFalse', subWindowConfig, false).then((data: window.Window) => {
              console.log('success in page')
              this.message = 'success'
              this.message = 'success'
              data!.resize(300, 300);
              data!.setUIContent("pages/index2");
              data!.showWindow();
            }).catch((err: Error) => {
              console.log('testCreateSubWindowWithOptionsFollowFalse err in page, err : ' + JSON.stringify(err))
              this.message = err.code + ''
            })

            setTimeout(() => {
              const subWindowConfig1: window.SubWindowOptions = {
                title: 'This is a subwindow',
                decorEnabled: false,
                maximizeSupported:true,
                outlineEnabled:true,
                isModal: true,
                modalityType: window.ModalityType.WINDOW_MODALITY
              };
              extensionWindow!.createSubWindowWithOptions('createSubWindowWithOptionsFalse', subWindowConfig1, false).then((data: window.Window) => {
                data!.destroyWindow()
              })
            }, 500)

            setTimeout(() => {
              const subWindowConfig2: window.SubWindowOptions = {
                title: 'This is a subwindow',
                decorEnabled: false,
                maximizeSupported:true,
                outlineEnabled:true,
                isModal: true,
                modalityType: window.ModalityType.APPLICATION_MODALITY
              };
              extensionWindow!.createSubWindowWithOptions('createSubWindowWithOptionsFalse', subWindowConfig2, false).then((data: window.Window) => {
                data!.destroyWindow()
              })
            }, 1000)

          } catch (err) {
            console.log('testCreateSubWindowWithOptionsFollowFalse err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

    }.width('100%').height('100%')
  }
}