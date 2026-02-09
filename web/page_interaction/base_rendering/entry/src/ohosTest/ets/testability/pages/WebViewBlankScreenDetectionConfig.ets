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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { Hypium } from '@ohos/hypium';
import { waitForExist} from '../../test/WaitTest.test';
import { AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { webview } from '@kit.ArkWeb';
import { pasteboard } from '@kit.BasicServicesKit';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testsuite from '../../test/List.test';
const EVENT_ID_SET_SUITE_KEY = 183117;
let driver = Driver.create();
const TAG = 'ContextMenu';

@Entry
@Component
struct webViewController {
  webcontroller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State blankScreenReasonArr:DetectedBlankScreenReason[] = [DetectedBlankScreenReason.NO_CONTENTFUL_NODES,DetectedBlankScreenReason.SUB_THRESHOLD_CONTENTFUL_NODES]
  @State flag: number = 1;



  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewBlankScreenDetectionConfigButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitWebViewBlankScreenDetectionConfig": {
              try {
                await waitForExist(()=>this.isPageEnd, 'emitWebViewBlankScreenDetectionConfig', 0);
                Utils.emitEvent('onDetectedBlankScreen', 20251110)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitDetectedBlankScreenReason01": {
              try {
                this.flag = 2;
                this.webcontroller.loadUrl($rawfile('1text.html'));
                await waitForExist(()=>this.isPageEnd, 'emitDetectedBlankScreenReason01', 0);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitDetectedBlankScreenReason02": {
              try {
                this.flag = 3;
                this.webcontroller.loadUrl($rawfile('kongbai.html'));
                await waitForExist(()=>this.isPageEnd, 'emitDetectedBlankScreenReason02', 0);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: $rawfile('1text.html'), controller: this.webcontroller })
        .onDetectedBlankScreen((event: BlankScreenDetectionEventInfo) =>{
          console.log(`Found blank screen on ${event.url}.`);
          if(this.flag == 2) {
            Utils.emitEvent(event.blankScreenReason == DetectedBlankScreenReason.SUB_THRESHOLD_CONTENTFUL_NODES, 20251207)
          } else if(this.flag == 3) {
            Utils.emitEvent(event.blankScreenReason == DetectedBlankScreenReason.NO_CONTENTFUL_NODES, 20251208)
          }

          console.log(`Found blank screen reason is ${this.blankScreenReasonArr[event.blankScreenReason]}.`);
          console.log(`Found blank screen blankScreenDetails is ${event.blankScreenDetails?.detectedContentfulNodesCount}.`);
        })
        .blankScreenDetectionConfig({
          enable:true,
          detectionTiming:[2,4,6,8],
          contentfulNodesCountThreshold:17,
          detectionMethods:[BlankScreenDetectionMethod.DETECTION_CONTENTFUL_NODES_SEVENTEEN]
        })
        .width('100%')
        .height('50%%')
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })

    }.width('100%').height('100%').backgroundColor('#F1F3F5')
  }
}

