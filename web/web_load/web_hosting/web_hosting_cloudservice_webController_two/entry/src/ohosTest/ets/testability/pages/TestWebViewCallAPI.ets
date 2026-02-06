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
import { waitForExist } from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter'

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State emitKey: string = '';
  @State isReceive:number = -1
  @State isEnd:boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147021,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(){
    events_emitter.off(147021)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0
      }
    }
  }
  build(){
    Column() {
      Button('Test setUrl with null')
        .key('response')
        .onClick(async () => {
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          console.info('key==>' + this.emitKey)
          switch (this.emitKey) {
            case 'response': {
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
                Utils.emitEvent(error.code + error.message, 147090);
              }
              break;
            }
          }
        });
      Web({ src: URL, controller: this.controller });
    }
  }
}