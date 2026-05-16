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
import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebMediaPlayGestureAccess {
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
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isEnd: number = -1;
  @State isMediaConfigReady: number = -1; // -1：未生效，0：已生效
  @State isAudioChanged:number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 300710,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(300710)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("audioStateTest").key('WebMediaPlayGestureAccessTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(()=>this.isReceive,  this.str + 'IsReceive', 0);
          await waitForExist(()=>this.isPageEnd, this.str + 'IsPageEnd', 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitMediaPlayGestureAccessTrue": {
              try {
                this.statusResult = ''
                this.mediaPlayGestureAccess = true;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, this.str, 0);
                this.controller.requestFocus();
                this.controller.runJavaScript("play()")
                await Utils.sleep(1000)
                this.controller.runJavaScript("pause()")
                await Utils.sleep(1000)
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
              this.controller.runJavaScript("test()", () => {
                Utils.emitEvent(this.statusResult, 300720)
              })
              break;
            }
            case "emitMediaPlayGestureAccessFalsePlay": {
              try {
                this.statusResult = ''
                this.mediaPlayGestureAccess = false;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, this.str + 'IsPageEnd', 0);
                this.controller.requestFocus();
                this.controller.runJavaScript("play()")
                await waitForExist(()=>this.statusResult, this.str, 'true_');
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
              await waitForExist(()=>this.statusResult, this.str, 'true_true_');
              let flag = this.statusResult;
              this.controller.runJavaScript("pause()", (error, result) => {
                if (error) {
                  console.log(`The controller.pause() return error is: ${error}`);
                }
                if (result) {
                  console.log(`The controller.pause() return value is: ${result}`);
                }
              })
              await waitForExist(()=>this.statusResult, this.str, 'true_true_false_');
              this.controller.runJavaScript("test()", () => {
                Utils.emitEvent(flag, 300730)
              })
              break;
            }
            case "emitMediaPlayGestureAccessFalsePause": {
              try {
                this.statusResult = ''
                this.mediaPlayGestureAccess = false;
                this.isPageEnd = -1;
                this.controller.refresh();
                await waitForExist(()=>this.isPageEnd, this.str + 'IsPageEnd', 0);
                this.controller.requestFocus();
                this.controller.runJavaScript("play()")
                await waitForExist(()=>this.statusResult, this.str, 'true_');
                this.controller.runJavaScript("pause()")
                await waitForExist(()=>this.statusResult, this.str, 'true_false_');
                this.controller.runJavaScript("isPlaying()", (error, result) => {
                  if (error) {
                    console.log(`The controller.isPlaying() return error is: ${error}`);
                  }
                  if (result) {
                    this.statusResult += (result + '_')
                    console.log(`The controller.isPlaying() return value is: ${result}`);
                  }
                })
                await waitForExist(()=>this.statusResult, this.str, 'true_false_false_');
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", () => {
                Utils.emitEvent(this.statusResult, 300740)
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('audioTest.html'), controller: this.controller })
        .key('MediaPlayGestureAccessWebView')
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
        .onPageEnd(()=>{
          this.isPageEnd = 0;
        })
    }
  }
}