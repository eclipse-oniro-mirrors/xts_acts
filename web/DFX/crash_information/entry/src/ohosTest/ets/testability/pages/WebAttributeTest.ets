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

@Entry
@Component
struct WebAttributeTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = ""
  @State flag:boolean = false

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
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
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build() {
    Row() {
      Column() {
        Button("web click")
          .key('WebAttributeTestButton')
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case "emitOnRenderExited": {
                try {
                  await Utils.sleep(2000)
                  this.controller.loadUrl('chrome://crash/')
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitRenderExitReasonProcessCrashed": {
                console.log("RenderExitReason0", RenderExitReason.ProcessAbnormalTermination)
                console.log("RenderExitReason1", RenderExitReason.ProcessWasKilled)
                console.log("RenderExitReason2", RenderExitReason.ProcessCrashed)
                console.log("RenderExitReason3", RenderExitReason.ProcessOom)
                console.log("RenderExitReason4", RenderExitReason.ProcessExitUnknown)
                this.flag = true;
                await Utils.sleep(2000)
                this.controller.loadUrl("chrome://crash/")
                await Utils.sleep(2000)
                break;
              }
            }
          })

        Web({ src: $rawfile('index.html'), controller: this.controller })
          .key('webView')
          .onRenderExited((event) => {
            if (event) {
                if(!this.flag) {
                    console.info("onRenderExited==>" + event.renderExitReason);
                    this.controller.loadUrl("resource://rawfile/index.html");
                    Utils.emitEvent(event.renderExitReason, 60106);
                }else {
                    console.info("onRenderExited==>" + event.renderExitReason);
                    this.controller.loadUrl("resource://rawfile/index.html");
                    Utils.emitEvent(event.renderExitReason, 901);
                }
            }
          })
      }
    }
  }
}