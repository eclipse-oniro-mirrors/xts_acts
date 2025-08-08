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

import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import business_error from '@ohos.base';

@Entry
@Component
struct WebInitTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State webInit: boolean = false
  @State webCreated: boolean = false
  @State interceptUrl: string = ''
  @State consoleMsg: string = ''
  @State consoleCorsError: boolean = false
  @State flag: boolean = false
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Row() {
      Column() {
        Button('WebInitTestButton')
          .key('WebInitTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            webView.WebviewController.setRenderProcessMode(webView.RenderProcessMode.SINGLE);
            this.controller.refresh();
            await Utils.sleep(2000);
            switch (this.str) {
              case 'emitWebViewGetAndSetRenderProcessMode03': {
                try {
                  webView.WebviewController.setRenderProcessMode(webView.RenderProcessMode.SINGLE);
                  this.controller.refresh();
                  await Utils.sleep(2000);
                  let oldMode = webView.WebviewController.getRenderProcessMode();
                  console.log('oldMode===>'+oldMode)
                  webView.WebviewController.setRenderProcessMode(webView.RenderProcessMode.MULTIPLE);
                  await Utils.sleep(2000);
                  let newMode = webView.WebviewController.getRenderProcessMode();
                  console.log('newMode===>'+newMode)
                  if (oldMode===0&&newMode === 1) {
                    Utils.emitEvent('success', 62904);
                  } else {
                    Utils.emitEvent('fail', 62904);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewGetAndSetRenderProcessMode04': {
                try {
                  webView.WebviewController.setRenderProcessMode(webView.RenderProcessMode.SINGLE);
                  this.controller.refresh();
                  await Utils.sleep(2000);
                  let oldMode = webView.WebviewController.getRenderProcessMode();
                  console.log('oldMode===>'+oldMode)
                  webView.WebviewController.setRenderProcessMode(null);
                  await Utils.sleep(2000);
                  let newMode = webView.WebviewController.getRenderProcessMode();
                  console.log('newMode===>'+newMode)
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                  if (e.code == 401) {
                    Utils.emitEvent('success', 62905);
                  }
                }
                break;
              }
              case 'emitWebViewOnRenderProcessResponding': {
                this.flag = true
                this.controller.refresh()
                this.controller.loadUrl($rawfile('common_index.html'))
                await Utils.sleep(1000)
                this.controller.runJavaScript('jumpPageCaton()', (error, result) => {
                  console.error(`The jumpPageCaton() return error is: ${error}`);
                  console.log(`The jumpPageCaton() return value is: ${result}`);
                })
                await Utils.sleep(15000)
                Utils.emitEvent(true,1336)
                break;
              }
              case 'emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT': {
                this.flag = true
                this.controller.refresh()
                this.controller.loadUrl($rawfile('common_index.html'))
                await Utils.sleep(1000)
                this.controller.runJavaScript('jumpPageCaton()', (error, result) => {
                  console.error(`The jumpPageCaton() return error is: ${error}`);
                  console.log(`The jumpPageCaton() return value is: ${result}`);
                })
                await Utils.sleep(15000)
                Utils.emitEvent(true,1338)
                break;
              }
              
            }
          })

        Web({ src: $rawfile('common_index.html'), controller: this.controller })
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onRenderProcessResponding(() => {
            console.log('onRenderProcessResponding again');
            if (this.flag){
              Utils.emitEvent(true,1336)
              this.flag = false
            }
          })
          .onRenderProcessNotResponding(async (data) => {
            if(this.flag){
              console.log('onRenderProcessNotResponding: [jsStack]= ' + data.jsStack +
              ', [process]=' + data.pid + ', [reason]=' + data.reason);

              await Utils.sleep(1000)
              this.controller.runJavaScript('stopBlockJs()', (error, result) => {
                console.error(`The stopBlockJs() return error is: ${error}`);
                console.log(`The stopBlockJs() return value is: ${result}`);
              })
              if(RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT.toString() === '1'){
                Utils.emitEvent(true,1338)
              }
              this.flag = false
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}