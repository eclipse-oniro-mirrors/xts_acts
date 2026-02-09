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
import { hilog } from '@kit.PerformanceAnalysisKit';
import web_webview from '@ohos.web.webview'
// import testNapi from 'libentry.so';
import testNapi from 'libentry.so';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  webTag: string = 'ArkWeb1';
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);

  aboutToAppear() {
    console.info("aboutToAppear")
    //初始化web ndk
    testNapi.nativeWebInit(this.webTag);
  }
  build() {
    Column() {
      Row() {
        Button('baidu')
          .fontSize(12)
          .onClick(() => {
            this.controller.loadUrl("https://www.baidu.com");
            // web_webview.WebviewController.initializeWebEngine()
          })

      }.height('20%')
      Button('change').onClick(() => {
        // testNapi.setScrollCallback(this.scrollCallback);
      })

      Row() {
        Web({ src: $rawfile('keyboardAvoid.html'), controller: this.controller })
          .javaScriptAccess(true)
          .fileAccess(true)
          .borderRadius(10)
      }.height('80%')
    }
  }
}

