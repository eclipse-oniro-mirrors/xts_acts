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

import webView from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base';
import { Entry, Text, Column, Component, Button, ClickEvent, Row, $rawfile, EmbedOptions, NativeMediaPlayerConfig } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import image from '@ohos.multimedia.image';
import events_emitter from '@ohos.events.emitter';
import { Web, OnAudioStateChangedEvent} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test.ets';
import { UIContext, Router } from '@ohos.arkui.UIContext'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebMediaPlayGestureAccess {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State mediaPlayGestureAccess: boolean | undefined = true;
  @State statusResult: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isEnd: number = -1;
  @State isMediaConfigReady: number = -1; // -1：未生效，0：已生效
  @State isAudioChanged:number = -1;
  @State family2: string | undefined = "cursive";
  enableNativeMediaPlayer:NativeMediaPlayerConfig = {enable: true, shouldOverlay: false}
  options: EmbedOptions|undefined = {supportDefaultIntrinsicSize: true};


  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("audioStateTest").key('WebMediaPlayGestureAccessTestButton').onClick((e:ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          this.isReceive = -1;
          switch (this.stringObj.str) {
            case "emitMediaPlayGestureAccessTrue": {
              try {
                this.statusResult = ''
                this.mediaPlayGestureAccess = true;
                this.isPageEnd = -1;
                this.controller.refresh();
                this.controller.requestFocus();
                this.controller.runJavaScript("play()")
                this.controller.runJavaScript("pause()")
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
                this.controller.requestFocus();
                this.controller.runJavaScript("play()")
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
              let flag = this.statusResult;
              this.controller.runJavaScript("pause()", (error, result) => {
                if (error) {
                  console.log(`The controller.pause() return error is: ${error}`);
                }
                if (result) {
                  console.log(`The controller.pause() return value is: ${result}`);
                }
              })
              this.controller.runJavaScript("test()", () => {
                Utils.emitEvent(flag, 300730)
              })
              break;
            }
            case "emitMediaPlayGestureAccessUndefinedPause": {
              try {
                this.statusResult = ''
                this.mediaPlayGestureAccess = undefined;
                this.isPageEnd = -1;
                this.controller.refresh();
                this.controller.requestFocus();
                this.controller.runJavaScript("play()")
                this.controller.runJavaScript("pause()")
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
                Utils.emitEvent(this.statusResult, 300740)
              })
              break;
            }
            case "webCursiveFontString" :{
              Utils.emitEvent("cursive", 300741)
              break;
            }
            case "webCursiveFontundefined" :{
              this.family2 = undefined
              Utils.emitEvent("cursive", 300742)
              break;
            }
            case "nativeEmbedOptions" :{
              Utils.emitEvent("success", 300743)
              break;
            }
            case "nativeEmbedOptionsUndefined" :{
              this.options = undefined
              Utils.emitEvent("success", 300744)
              break;
            }
            case "NativeMediaPlayerConfig001" :{
              Utils.emitEvent(this.enableNativeMediaPlayer.enable, 300745)
              Utils.emitEvent(this.enableNativeMediaPlayer.shouldOverlay, 300746)
              break;
            }
            case "NativeMediaPlayerConfig002" :{
              this.enableNativeMediaPlayer = {enable: false, shouldOverlay: true}
              Utils.emitEvent(this.enableNativeMediaPlayer.enable, 300747)
              Utils.emitEvent(this.enableNativeMediaPlayer.shouldOverlay, 300748)
              break;
            }
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebKeyBoardAvoidMode' })
              console.log('push URL success')
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('audioTest.html'), controller: this.controller })
        .key('MediaPlayGestureAccessWebView')
        .enableNativeMediaPlayer(this.enableNativeMediaPlayer)
        .webCursiveFont(this.family2)
        .nativeEmbedOptions(this.options)
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