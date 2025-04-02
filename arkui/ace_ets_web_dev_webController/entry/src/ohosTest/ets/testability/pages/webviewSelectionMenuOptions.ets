/*
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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview'
import { Driver, ON, On } from '@ohos.UiTest';

@Entry
@Component
struct webviewSelectionMenuOptions {
  
  @State str: string = "emitSelectionMenuOptions0100";
  @State userAgentPC:string = '';
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  @State menuOptionArray: Array<ExpandedMenuItemOptions> = [
    {content: 'Apple', action: (selectedText) => {
      console.info('select Apple info ' + selectedText.toString());
      Utils.emitEvent(1, 5400)
    }},
    {content: 'Banana', action: (selectedText) => {
      console.info('select Banana info ' + selectedText.toString());
    }}
  ];

  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnSslError page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('SelectionMenuOptions').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitSelectionMenuOptions0100": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 5400)
                  break;
                }else if((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(1, 5400)
                  break;
                }
                this.controller.loadUrl($rawfile("indexdemotwo.html"))
                await Utils.sleep(12000);
                let driver: Driver = Driver.create();
                let buttonCenter = await driver.findComponent(ON.id('webCenter'));
                await buttonCenter.longClick()
                await Utils.sleep(4000);
                let buttonOne = await driver.findComponent(ON.text('Please'));
                await buttonOne.longClick()
                await Utils.sleep(4000);
                let buttontwo = await driver.findComponent(ON.text('Apple'));
                await buttontwo.click();
                await Utils.sleep(1000);
                
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexdemotwo.html'), controller: this.controller })
      .selectionMenuOptions(this.menuOptionArray)
      .id('webCenter')
    }
  }
}