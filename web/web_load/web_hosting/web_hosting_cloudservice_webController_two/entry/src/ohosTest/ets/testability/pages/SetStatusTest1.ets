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
import { WebNetErrorList } from '@ohos.web.netErrorList';
import { LocalContext } from '../../test/GloablConfig';
import { URL } from '../../test/Config';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  responseWeb: WebResourceResponse = new WebResourceResponse();
  htmlData: string = '<html><body bgcolor="white">Source:<pre>source</pre></body></html>';

  build(){
    Column() {
      Web({ src: URL, controller: this.controller })
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest,
              resourceHandler: webview.WebResourceHandler) => {
              console.log('[schemeHandler] onRequestStart');

              let response = new webview.WebSchemeHandlerResponse();
              try {
                response.setNetErrorCode(WebNetErrorList.NET_OK);
                response.setStatus(-12);
                response.setStatusText('OK');
                response.setMimeType('text/html');
                response.setEncoding('utf-8');
                response.setHeaderByName('header1', 'value1', false);
                console.log('[schemeHandler] onRequestStart', response.getStatus().toString());
                LocalContext.context.eventHub.emit('SetStatusTest1', response.getStatus().toString())
              } catch (error) {
              }

              return true;
            })

            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {

            });

            this.controller.setWebSchemeHandler('https', this.schemeHandler);
          } catch (error) {
          }
        })
        .javaScriptAccess(true)
        .domStorageAccess(true)
    }
  }
}