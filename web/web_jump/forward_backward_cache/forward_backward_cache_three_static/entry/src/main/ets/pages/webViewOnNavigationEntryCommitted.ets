/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import webview from '@ohos.web.webview';
import {LoadCommittedDetails, Entry, Component, Column, Row, Button, ClickEvent, Web } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import web_webview from '@ohos.web.webview'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import emitter from '@ohos.events.emitter';

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct webViewOnNavigationEntryCommitted {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()//测试白屏
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State str:string = ""

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewOnNavigationEntryCommittedButton')
          .onClick( (e:ClickEvent) => {
            console.info('key==>' + this.stringObj.str)

            switch (this.stringObj.str) {

              case 'emitWebViewOnNavigationEntryCommitted01': {
                try {
                  this.controller.loadUrl('https://www.weibo.com')
                } catch (error:BusinessError) {
                  let e:BusinessError = error as BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }

            }
          })
      }
      Web({ src: 'https://www.baidu.com', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onNavigationEntryCommitted((event:LoadCommittedDetails) => {
          console.log('onNavigationEntryCommitted: [isMainFrame]= ' + event.isMainFrame +
            ', [isSameDocument]=' + event.isSameDocument +
            ', [didReplaceEntry]=' + event.didReplaceEntry +
            ', [navigationType]=' + event.navigationType +
            ', [url]=' + event.url);
          if (event.isMainFrame===true||event.isMainFrame===false) {
            Utils.emitEvent('success', 8009);
          }
        } as Callback<LoadCommittedDetails>)
    }
  }
}
