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

@Entry
@Component
struct webOnAudioStateChanged {
  controller: WebController = new WebController();
  @State str: string = "emitAudioStatePlayWebc";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
  @State playing: boolean = false
  @State checkResult: string = "";
  @State firstId: number = 501;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnAudioStateChanged page valueChangeCallBack");
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
        Button("audioStateTest").key('webOnAudioStateChanged').onClick(() => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitAudioStatePlayWebc": {
              try {
                this.controller.requestFocus();
                this.controller.runJavaScript({
                  script: "play()", callback: (result) => {
                    this.checkResult = result
                    console.log(`The controller.play() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript({
                script: "test()", callback: (res) => {
                  Utils.emitEvent(this.checkResult, 502)
                }
              })
              break;
            }
            case "emitAudioStatePauseWebc": {
              try {
                this.controller.requestFocus();
                this.firstId = 503;
                this.controller.runJavaScript({
                  script: "pause()", callback: (result) => {
                    this.checkResult = result
                    console.log(`The controller.pause() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript({
                script: "test()", callback: (res) => {
                  Utils.emitEvent(this.checkResult, 504)
                }
              })
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
        .onAudioStateChanged(event => {
          this.playing = event.playing
          console.log('onAudioStateChanged playing: ' + this.playing + this.firstId);
          Utils.emitEvent(this.playing, this.firstId)
        })
    }
  }
}