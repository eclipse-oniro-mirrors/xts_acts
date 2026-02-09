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
import Util from '../../test/Util';
import events_emitter from '@ohos.events.emitter'
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  @State controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State emitKey: string = '';
  @State isReceive:number = -1
  @State isEnd:boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147011,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(){
    events_emitter.off(147011)
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
      Text('Main Page')
      Button('runJavaScript')
        .key('runJavaScript')
        .onClick(async (event: ClickEvent) => {
          await waitForExist(()=>this.isReceive, this.emitKey, true);
          await waitForExist(()=>this.isEnd, this.emitKey, true);
          console.info('key==>' + this.emitKey)
          switch (this.emitKey) {
            case 'runJavaScript': {
              console.log('isMainFrame ' + 'clicked!')
              await this.controller.runJavaScript('loadIframePage()')
              break;
            }
          }
        });
      Web({ src: $rawfile('main_page.html'), controller: this.controller })
        .javaScriptAccess(true)
        .onNavigationEntryCommitted((details) => {
          console.log('onNavigationEntryCommitted: [isMainFrame]= ' + details.isMainFrame +
            ', [isSameDocument]=' + details.isSameDocument +
            ', [didReplaceEntry]=' + details.didReplaceEntry +
            ', [navigationType]=' + details.navigationType +
            ', [url]=' + details.url);
          if (details.isMainFrame === false) {
            Util.emitEvent(details.isMainFrame, 147080);
          }
        })
        .onPageEnd(()=>{
          this.isEnd = true;
        })
    }
  }
}
