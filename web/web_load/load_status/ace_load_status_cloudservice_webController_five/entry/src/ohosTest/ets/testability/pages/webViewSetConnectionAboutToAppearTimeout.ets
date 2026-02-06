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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';

@Entry
@Component
struct webViewSetConnectionAboutToAppearTimeout {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isFrameResourceType: boolean = false
  aboutToAppear(): void {
    webview.WebviewController.setConnectionTimeout(5);
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewSetConnectionAboutToAppearTimeoutButton')
          .onClick(async () => {
            console.info('key==>' + this.emitKey)
            this.controller.refresh()
          })
      }
      Web({ src: 'www.weibo111xxxbbb.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onErrorReceive((event: ErrorReceiveEventType) => {
          console.log('onErrorReceive start')
          if (event) {
            console.log('onErrorReceive start001')
            console.log('getErrorInfo:' + event.error.getErrorInfo())
            console.log('getErrorCode:' + event.error.getErrorCode())
            Utils.emitEvent('Time_out', 14083);
            console.log('onErrorReceive start002')
          }
        })
    }
  }
}

interface ErrorReceiveEventType {
  request: WebResourceRequest;
  error: WebResourceError;
}