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
struct webViewMediaOption {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitMediaOptionTrue";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State playing: boolean = false
  @State checkResult: string = "";
  @State checkResultTwo: string = "";
  @State firstId: number = 415;
  @State options: WebMediaOptions = { resumeInterval: 2, audioExclusive: true }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewMediaOption page valueChangeCallBack");
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
        Button("mediaOptionTest").key('webViewMediaOption').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitMediaOptionTrue": {
              try {
                await Utils.sleep(3000);
                this.controller.requestFocus();
                this.controller.runJavaScript("play()", (error, result) => {
                  console.log(`The controller.play() return value is: ${result}`);
                })
                this.controllerTwo.requestFocus();
                this.controllerTwo.runJavaScript("play()", (error, result) => {
                  console.log(`The controllerTwo.play() return value is: ${result}`);
                })
                await Utils.sleep(3000);
                this.controller.runJavaScript("checkState()", (error, result) => {
                  this.checkResult = result
                  console.log(`The controller.checkState() return value is: ${result}`);
                })
                this.controllerTwo.runJavaScript("checkState()", (error, result) => {
                  this.checkResultTwo = result
                  console.log(`The controllerTwo.checkState() return value is: ${result}`);
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent((this.checkResult == this.checkResultTwo), this.firstId)
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('videoTest.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .mediaOptions(this.options)
        .onAudioStateChanged(event => {
          this.playing = event.playing
          console.log('onAudioStateChanged playing: ' + this.playing + this.firstId);
        })
      Web({ src: $rawfile('videoTest.html'), controller: this.controllerTwo })
        .id('2')
        .key('web2')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .mediaOptions(this.options)
        .onAudioStateChanged(event => {
          this.playing = event.playing
          console.log('onAudioStateChangedTwo playing: ' + this.playing + this.firstId);
        })
    }
  }
}