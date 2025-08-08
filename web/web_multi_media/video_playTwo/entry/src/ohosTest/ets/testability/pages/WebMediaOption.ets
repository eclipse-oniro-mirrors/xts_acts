/**
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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct WebMediaOption {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 " +
    "(KHTML, like Gecko) Chrome/99.0.4844.88 Mobile Safari/537.36";
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

  build() {
    Column() {
      Row() {
        Button("mediaOptionTest").key('webViewMediaOptionTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitMediaOptions001": {
              try {
                this.controller.requestFocus();
                this.controller.runJavaScript("play()", (error, result) => {
                  if (error) {
                    console.log(`The controller.play() return error is: ${error}`);
                  }
                  if (result) {
                    console.log(`The controller.play() return value is: ${result}`);
                  }
                })
                await Utils.sleep(3000);
                this.controllerTwo.requestFocus();
                this.controllerTwo.runJavaScript("play()", (error, result) => {
                  if (error) {
                    console.log(`The controller.play() return error is: ${error}`);
                  }
                  console.log(`The controllerTwo.play() return value is: ${result}`);
                })
                await Utils.sleep(3000);
                this.controller.runJavaScript("checkState()", (error, result) => {
                  if (error) {
                    console.log(`The controller.checkState() return error is: ${error}`);
                  }
                  if (result) {
                    this.checkResult = result
                    console.log(`The controller.checkState() return value is: ${result}`);
                  }
                })
                this.controllerTwo.runJavaScript("checkState()", (error, result) => {
                  if (error) {
                    console.log(`The controller.checkState() return error is: ${error}`);
                  }
                  if (result) {
                    this.checkResultTwo = result
                    console.log(`The controllerTwo.checkState() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", () => {
                Utils.emitEvent((this.checkResult == this.checkResultTwo), this.firstId)
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('videoTest.html'), controller: this.controller })
        .height('30%')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .mediaPlayGestureAccess(false)
        .userAgent(this.userAgent)
        .mediaOptions(this.options)
        .onAudioStateChanged(event => {
          this.playing = event.playing
          console.log('onAudioStateChanged playing: ' + this.playing + this.firstId);
        })
      Web({ src: $rawfile('audioTest.html'), controller: this.controllerTwo })
        .height('30%')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .mediaPlayGestureAccess(false)
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