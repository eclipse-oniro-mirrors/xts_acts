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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, Row, LongPressGesture } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import window from '@ohos.window';

import { UIExtensionContentSession } from '@kit.AbilityKit';
import uiExtension from '@ohos.arkui.uiExtension';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct ExtensionErrorCode {

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

    
      Button('createSubWindowWithOptions1')
        .id('createSubWindowWithOptions1')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            const subWindowConfig: window.SubWindowOptions = {
              title: 'This is a subwindow',
              decorEnabled: false,
              isModal: true,
              modalityType: window.ModalityType.APPLICATION_MODALITY,
              maximizeSupported: true,
              outlineEnabled: true
            };
            extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptions1', subWindowConfig)
            console.log('success in page')
            this.message = 'success'
          } catch (err) {
            console.log('testUIExtensionHostOccupyEvents err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })
      Button('createSubWindowWithOptions2')
        .id('createSubWindowWithOptions2')
        .width('90%').margin({ top: 5, bottom: 5 }).fontSize(16).onClick(() => {
          let session: UIExtensionContentSession | undefined = this.storage?.get < UIExtensionContentSession > ('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            const subWindowConfig: window.SubWindowOptions = {
              title: 'This is a subwindow',
              decorEnabled: true,
              isModal: false,
              modalityType: window.ModalityType.WINDOW_MODALITY,
              maximizeSupported: false,
              outlineEnabled: false
            };
            extensionWindow?.createSubWindowWithOptions('createSubWindowWithOptions2', subWindowConfig).then(() => {
              console.log('testUIExtensionHostCreateSubWindowWithOptions2 success in createSubWindowWithOptions')
              console.log('success in page')
              this.message = 'success'
            }).catch((err: Error) => {
              console.log('testUIExtensionHostCreateSubWindowWithOptions2 err in page, err : ' + err.code + err.message)
              this.message = err.code + ''
            })
          } catch (err) {
            console.log('testUIExtensionHostCreateSubWindowWithOptions2 err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

      Button('按钮')
        .id('clickBtn')
        .onClick(() => { this.clickNum++ })
        .gesture(
          LongPressGesture({ repeat: true })
            .onAction((event) => {
              if (event) {
                if (event.repeat) {
                  this.longPressNum++
                }
              }
            })
        )

    }.width('100%').height('100%')
  }
}