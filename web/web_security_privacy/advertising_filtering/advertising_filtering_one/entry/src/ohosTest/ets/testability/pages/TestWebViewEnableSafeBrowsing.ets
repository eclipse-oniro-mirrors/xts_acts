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

import events_emitter from '@ohos.events.emitter'
import { webview } from '@kit.ArkWeb';
import Utils from '../../test/Utils';
import { BusinessError } from '@kit.BasicServicesKit';
import { WebNetErrorList } from '@ohos.web.netErrorList';
import {waitForExist} from '../../test/WaitTest';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State uri1: string = 'https:'
  @State uri2: string = '//www.zubo662.com:30473'
  @State uri: string = this.uri1 + this.uri2
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 161210,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(161210)
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build(){
    Column() {
      Button('enableSafeBrowsing')
        .key('enableSafeBrowsing')
        .onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.emitKey, 0);
          await waitForExist(() => this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          console.info('[TAO]key==>' + this.emitKey)
           try {
             this.controller.enableSafeBrowsing(true);
             console.log('enableSafeBrowsing: true');
             let result = this.controller.isSafeBrowsingEnabled();
             console.log('result: ' + result);
             if(result){
              Utils.emitEvent('policy=0', 161220);
             } else {
                 Utils.emitEvent(false, 161220);
             }

           } catch (error) {
             console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              Utils.emitEvent('', 161220);
           }
        })
      Web({ src: this.uri, controller: this.controller })
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
    }
  }
}