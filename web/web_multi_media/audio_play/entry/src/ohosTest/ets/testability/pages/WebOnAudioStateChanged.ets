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
import webView from '@ohos.web.webview';

@Entry
@Component
struct WebOnAudioStateChanged {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State mediaPlayGestureAccess: boolean = true;
  @State statusResult: string = '';

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
        Button("audioStateTest").key('WebOnAudioStateChangedTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitAudioStatePlay": {
              try {
                this.statusResult = ''
                await Utils.clickComponent('OnAudioStateChangedWebView')
                await Utils.sleep(2000)
                this.controller.runJavaScript("isPlaying()", (error, result) => {
                  if (error) {
                    console.log(`The controller.isPlaying() return error is: ${error}`);
                  }
                  if (result) {
                    this.statusResult += (result + '_')
                    console.log(`The controller.isPlaying() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              await Utils.sleep(2000)
              Utils.emitEvent(this.statusResult, 60501)
              await Utils.clickComponent('OnAudioStateChangedWebView')
              await Utils.sleep(2000)
              break;
            }
            case "emitAudioStatePause": {
              try {
                this.statusResult = ''
                await Utils.clickComponent('OnAudioStateChangedWebView')
                await Utils.sleep(2000)
                await Utils.clickComponent('OnAudioStateChangedWebView')
                await Utils.sleep(2000)
                this.controller.runJavaScript("isPlaying()", (error, result) => {
                  if (error) {
                    console.log(`The controller.isPlaying() return error is: ${error}`);
                  }
                  if (result) {
                    this.statusResult += (result + '_')
                    console.log(`The controller.isPlaying() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              await Utils.sleep(2000)
              Utils.emitEvent(this.statusResult, 60503)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('audioTest.html'), controller: this.controller })
        .key('OnAudioStateChangedWebView')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .mediaPlayGestureAccess(this.mediaPlayGestureAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onAudioStateChanged(event => {
          this.statusResult += (event.playing + "_")
          console.log('onAudioStateChanged playing: ' + event.playing);
        })
    }
  }
}