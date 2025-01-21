/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import UIAbility from '@ohos.app.ability.UIAbility';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct webViewSetAudioMuted {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitSetAudioMuted";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State mutedResult: string = "false";
  @State checkResult: string = "";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewSetAudioMuted page valueChangeCallBack");
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
        Button("setMutedTest").key('webViewSetAudioMuted').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitSetAudioMuted": {
              try {
                this.controller.runJavaScript("enableMute()", (error, result) => {
                  this.mutedResult = result
                  console.log(`The controller.enableMute() return value is: ${result}`);
                  Utils.emitEvent(this.mutedResult, 405)
                })
                this.controller.runJavaScript("checkMute()", (error, result) => {
                  this.checkResult = result
                  console.log(`The controller.checkMute() return value is: ${result}`);
                  Utils.emitEvent(this.checkResult, 406)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitSetAudioDisMuted": {
              try {
                this.controller.runJavaScript("disableMute()", (error, result) => {
                  this.mutedResult = result
                  console.log(`The controller.disableMute() return value is: ${result}`);
                  Utils.emitEvent(this.mutedResult, 407)
                })
                this.controller.runJavaScript("checkMute()", (error, result) => {
                  this.checkResult = result
                  console.log(`The controller.checkMute() return value is: ${result}`);
                  Utils.emitEvent(this.checkResult, 408)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('audioTest.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
    }
  }
}