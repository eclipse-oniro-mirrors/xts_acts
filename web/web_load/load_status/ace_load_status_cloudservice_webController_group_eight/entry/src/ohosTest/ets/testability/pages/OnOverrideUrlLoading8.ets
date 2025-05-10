/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { URL } from '../../test/Config';
import { LocalContext } from '../../test/GloablConfig';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State flg: boolean  = false;

  aboutToAppear(): void {
    LocalContext.context.eventHub.emit('onOverrideUrlLoading0008')
    this.flg = true
  }

  build(){
    Column() {
      if (this.flg) {
        Web({ src: 'resource://rawfile/iframeLoadAbout.html', controller: this.controller })
          .onOverrideUrlLoading((webResourceRequest: WebResourceRequest) => {
            console.info('onOverrideUrlLoading12 RequestUrl.', webResourceRequest.getRequestUrl())
            LocalContext.context.eventHub.emit('onOverrideUrlLoading0008')
            return false;
          })
          .onPageBegin(() => {
            console.info('onOverrideUrlLoading11 onPageBegin.')
          })
          .javaScriptAccess(true)
          .domStorageAccess(true)
          .fileAccess(true)
          .imageAccess(true)
          .onlineImageAccess(true)
      }
    }
  }
}