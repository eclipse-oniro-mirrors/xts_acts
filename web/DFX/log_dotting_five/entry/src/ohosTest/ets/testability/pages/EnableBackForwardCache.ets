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
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { JSON } from '@kit.ArkTS';


@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  controller1: webview.WebviewController = new webview.WebviewController();
  @State str: string = ''
  @State incognitoMode: boolean = true
  @State src: string | Resource = $rawfile('index.html')

  onPageShow(): void{
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData.data != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build(){
    Column() {
      Button('Options')
        .key('setBackForwardCacheOptions')
        .onClick((event: ClickEvent) => {
            switch (this.str) {
              case 'SUB_ACE_WEB_BFCACHE_SDK_00015':
                try {
                  let options = new webview.BackForwardCacheOptions();
                  options.size = 1;
                  options.timeToLive = 30;
                  this.controller1.setBackForwardCacheOptions(options)
                } catch (e) {
                  console.log('err:' + e.code + e.message)
                  Utils.emitEvent(e.code + e.message, 210)
                }
                break;
            }
          })
      
      Web({ src: this.src, controller: this.controller, incognitoMode: this.incognitoMode })
        .javaScriptAccess(true)
    }
  }
}