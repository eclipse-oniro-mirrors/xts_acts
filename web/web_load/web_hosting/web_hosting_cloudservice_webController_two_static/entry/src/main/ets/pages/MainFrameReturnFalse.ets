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

import webView from '@ohos.web.webview';
import { Entry, Component, Column, Row, Button, ClickEvent, Text,Web, LoadCommittedDetails} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webview from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'

class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebComponent {
  stringObj: StringFields  = new StringFields ();
  @State controller: webview.WebviewController = new webview.WebviewController(undefined);
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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build(){
    Column() {
      Text('Main Page')
      Button('runJavaScript')
        .key('runJavaScript')
        .onClick( (e:ClickEvent) => {
          console.log('key==> ' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'LoadCommittedDetails' : {
              this.controller.loadUrl('www.baidu.com');
              console.log('isMainFrame ' + 'clicked!');
            }
          }
        });
      Web({ src: 'resource://rawfile/main_page.html', controller: this.controller })
        .onNavigationEntryCommitted((details:LoadCommittedDetails) :void=> {
          console.log('onNavigationEntryCommitted: [isMainFrame]= ' + details.isMainFrame +
            ', [isSameDocument]=' + details.isSameDocument +
            ', [didReplaceEntry]=' + details.didReplaceEntry +
            ', [navigationType]=' + details.navigationType +
            ', [url]=' + details.url);
          if (details.isMainFrame === true) {
            Utils.emitEvent(details.isMainFrame, 5010);
          }
        })
    }
  }
}
