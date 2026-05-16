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

const EVENT_ID_SET_SUITE_KEY = 176701;
const driver = Driver.create();

@Entry
@Component
struct webviewSelectionMenuOptions {
  
  @State str: string = "emitSelectionMenuOptions0100";
  @State userAgentPC:string = '';
  controller: web_webview.WebviewController = new web_webview.WebviewController()
  @State menuOptionArray: Array<ExpandedMenuItemOptions> = [
    {content: 'Apple', startIcon: $r('app.media.icon'), action: (selectedText) => {
      console.info('select Apple info ' + selectedText.toString());
      Utils.emitEvent(1, 176710)
    }},
    {content: 'Banana', startIcon: $r('app.media.icon'), action: (selectedText) => {
      console.info('select Banana info ' + selectedText.toString());
    }}
  ];

  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
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
        this.isReceive = 1;
      }
    }
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('SelectionMenuOptions').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitSelectionMenuOptions0100": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 176710)
                  break;
                }else if((this.userAgentPC).includes("Tablet")){
                  Utils.emitEvent(1, 176710)
                  break;
                }
                let buttonCenter = await driver.findComponent(ON.id('webCenter'));
                await buttonCenter.longClick()
                await Utils.waitForReleaseDriver(this.str,driver)
                let buttonOne = await driver.findComponent(ON.text('Please'));
                await buttonOne.longClick()
                await Utils.waitForReleaseDriver(this.str,driver)
                let buttontwo = await driver.waitForComponent(ON.text('Apple'), 10000);
				        //点击菜单栏的扩展项
                if(!buttontwo) {
                  let buttonThree = await driver.waitForComponent(ON.type('SymbolGlyph'),10000);
                  console.log('hhaaaaa' + buttonThree)
                  await buttonThree.click();
                }
				        console.log('999buttontwo' + buttontwo)
			          //然后再点Apple
				        let buttonFour = await driver.waitForComponent(ON.text('Apple'),10000);
                console.log('999buttontwo3333' + buttonFour)
                await buttonFour.click();
                await Utils.waitForReleaseDriver(this.str,driver)
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
      .onPageEnd((event) => {
        console.log('onPageEnd url:' + event.url);
        this.isPageEnd = 1;
      })

    }
  }
}