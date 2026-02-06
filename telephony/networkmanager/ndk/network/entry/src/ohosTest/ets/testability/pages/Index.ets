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
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct Index {
  @State webTag: string = 'web1211';
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    web_webview.WebviewController.setWebDebuggingAccess(true);
  }
 @State message: string = 'Hello Worldxx'
   build() {
         Row() {
           Column() {
             Text(this.message)
               .fontSize(50)
               .fontWeight(FontWeight.Bold)
             Button() {
               Text('next page')
                 .fontSize(20)
                 .fontWeight(FontWeight.Bold)
             }.type(ButtonType.Capsule)
             .margin({
               top: 20
             })
             .backgroundColor('#0D9FFB')
             .width('35%')
             .height('5%')
             .onClick(()=>{
             })
             Web({ src: 'https' +
               '://www.baidu.com', controller: this.controller })
               .domStorageAccess(true)
               .databaseAccess(true)
               .imageAccess(true)
               .onlineImageAccess(true)
               .zoomAccess(true)
               .javaScriptAccess(true)
               .overviewModeAccess(true)
               .pinchSmooth(true)
               .fileAccess(true)
           }
             .width('100%')
         }
             .height('100%')
   }
 }