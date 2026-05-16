/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import web_webview from '@ohos.web.webview'
import { BusinessError } from '@kit.BasicServicesKit';
import { common, Want } from '@kit.AbilityKit';

@Entry
@Component
struct WebComponent {
  private context = getContext(this) as common.UIAbilityContext;
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  private jsStr: string =
    "document.body.setAttribute('style','background: linear-gradient(45deg, black, transparent);height: 60% !important;overscroll-behavior: contain !important;overscroll-behavior-y: contain !important;');document.body.childNodes[1].setAttribute('style','height: 40% !important;overscroll-behavior: auto !important;overscroll-behavior-y: auto !important;')";
  @State scripts: Array<ScriptItem> = [
    { script: this.jsStr, scriptRules: ["*"] }
  ];
  aboutToAppear(): void {
    console.log("abc")
  }

  build() {
    Column() {
      Text("abc")
      Web({ src: 'https://www.baidu.com', controller: this.controller })
        .domStorageAccess(true)
        .onRenderExited((event) => {
          console.log('reason:' + event?.renderExitReason || '')
        })
      Button("jumpAbility")
        .onClick(() => {
          // context为Ability对象的成员，在非Ability对象内部调用需要
          // 将Context对象传递过去
          let wantInfo: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.myapplication',
            moduleName: 'entry', // moduleName非必选
            abilityName: 'EntryWNMAbility',
            parameters: {},
          };

          // context为调用方UIAbility的UIAbilityContext
          this.context.startAbility(wantInfo).then(() => {
            console.info('startAbility success.');
            this.context.terminateSelf((err) => {
              if (err.code) {
                console.error(`Failed to terminate self. Code is ${err.code}, message is ${err.message}`);
                return;
              }
            });
          }).catch((error: BusinessError) => {
            console.error(`startAbility failed.message is ${error.message}`);
          });

        })

    }
  }
}