/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { webview } from '@kit.ArkWeb';
import { URL } from '../../test/Config';
import Utils from '../../test/Util';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();

  build(){
    Column() {
      Button('Test setUrl with null')
        .key('response')
        .onClick(() => {
          let response = new webview.WebSchemeHandlerResponse();
          try {
            response.setUrl(null);
            response.setStatus(401);
            response.setStatusText('Parameter error. Possible causes: 1. Incorrect parameter types.');
            response.setMimeType('text/html');
            response.setEncoding('utf-8');
            console.log('[schemeHandler] getUrl:' + response.getUrl());
            console.log('[schemeHandler] getStatus:' + response.getStatus());
            console.log('[schemeHandler] getStatusText:' + response.getStatusText());
            console.log('[schemeHandler] getMimeType:' + response.getMimeType());
            console.log('[schemeHandler] getEncoding:' + response.getEncoding());
            console.log('[schemeHandler] getHeaderByValue:' + response.getHeaderByName('header1'));
            console.log('[schemeHandler] getNetErrorCode:' + response.getNetErrorCode());
          } catch (error) {
            Utils.emitEvent(error.code + error.message, 5011);
          }
        });
      Web({ src: URL, controller: this.controller });
    }
  }
}