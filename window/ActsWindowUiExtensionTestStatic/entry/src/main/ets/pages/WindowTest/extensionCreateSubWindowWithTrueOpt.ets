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

import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent, Row, Visibility } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import window from '@ohos.window';

import { UIExtensionContentSession } from '@kit.AbilityKit';
import uiExtension from '@ohos.arkui.uiExtension';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct extensionCreateSubWindowWithTrueOpt {

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

      Button('createSubWindowWithOptionsTrue')
        .id('createSubWindowWithOptionsTrue')
        .width('90%').margin({top: 5, bottom: 5}).fontSize(16).onClick((e: ClickEvent) => {
          let session: UIExtensionContentSession | undefined = this.storage?.get<UIExtensionContentSession>('session1');
          let extensionWindow: uiExtension.WindowProxy | undefined = session?.getUIExtensionWindowProxy();
          try {
            const subWindowConfig: window.SubWindowOptions = {
              title: 'This is a subwindow',
              decorEnabled: true,
              maximizeSupported:false,
              outlineEnabled:false
            };
            // 创建子窗口
            extensionWindow!.createSubWindowWithOptions('createSubWindowWithOptionsTrue', subWindowConfig, true).then((data: window.Window) => {
              console.log('success in page')
              this.message = 'success'
              data!.resize(300, 300);
              data!.setUIContent("pages/index2");
              data!.showWindow();
            }).catch((err: Error) => {
              console.log('testCreateSubWindowWithOptionsFollowTrue err in page, err : ' + JSON.stringify(err))
              this.message = err.code + ''
            })
          } catch (err) {
            console.log('testCreateSubWindowWithOptionsFollowTrue err in page, err : ' + JSON.stringify(err))
            this.message = err.code + ''
          }
        })

    }.width('100%').height('100%')
  }
}