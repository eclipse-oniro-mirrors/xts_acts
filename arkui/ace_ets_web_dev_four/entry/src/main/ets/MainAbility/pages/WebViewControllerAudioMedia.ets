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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebViewControllerAudioMedia {
  @State str: string = ""
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController(); 

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
        Button("WebViewControllerAudioMedia").id('WebViewControllerAudioMedia').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "StopAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(5000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(5000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0100 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 33301)
                }else{
                  Utils.emitEvent(res, 33301)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0200 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 33302)
                }else{
                  Utils.emitEvent(res, 33302)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0300 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 33303)
                }else{
                  Utils.emitEvent(res, 33303)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio()");
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0400 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33304)
                }else{
                  Utils.emitEvent(res, 33304)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0500 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33305)
                }else{
                  Utils.emitEvent(res, 33305)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0600 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 33306)
                }else{
                  Utils.emitEvent(res, 33306)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio2()");
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0700 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 33307)
                }else{
                  Utils.emitEvent(res, 33307)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio3.html"))
                await Utils.sleep(5000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(5000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("StopAllMedia0800 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 33308)
                }else{
                  Utils.emitEvent(res, 33308)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0100 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33309)
                }else{
                  Utils.emitEvent(res, 33309)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0200 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 33310)
                }else{
                  Utils.emitEvent(res, 33310)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0300 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33311)
                }else{
                  Utils.emitEvent(res, 33311)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio()");
                await Utils.sleep(2000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0400 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33312)
                }else{
                  Utils.emitEvent(res, 33312)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0500 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 33313)
                }else{
                  Utils.emitEvent(res, 33313)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0600 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33314)
                }else{
                  Utils.emitEvent(res, 33314)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio3.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("ResumeAllMedia0700 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33315)
                }else{
                  Utils.emitEvent(res, 33315)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0100 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33316)
                }else{
                  Utils.emitEvent(res, 33316)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0200 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33317)
                }else{
                  Utils.emitEvent(res, 33317)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0300 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33318)
                }else{
                  Utils.emitEvent(res, 33318)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0400 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33319)
                }else{
                  Utils.emitEvent(res, 33319)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0500 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33320)
                }else{
                  Utils.emitEvent(res, 33320)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0600 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33321)
                }else{
                  Utils.emitEvent(res, 33321)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio2()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0700 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33322)
                }else{
                  Utils.emitEvent(res, 33322)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio3.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("PauseAllMedia0800 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33323)
                }else{
                  Utils.emitEvent(res, 33323)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0100 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 33324)
                }else{
                  Utils.emitEvent(res, 33324)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0200 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33325)
                }else{
                  Utils.emitEvent(res, 33325)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia()
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0300 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33326)
                }else{
                  Utils.emitEvent(res, 33326)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0400 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33327)
                }else{
                  Utils.emitEvent(res, 33327)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
                this.controller.stopAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0500 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 33328)
                }else{
                  Utils.emitEvent(res, 33328)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(5000);
                this.controller.resumeAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0600 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33329)
                }else{
                  Utils.emitEvent(res, 33329)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0700 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 33330)
                }else{
                  Utils.emitEvent(res, 33330)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0800 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33331)
                }else{
                  Utils.emitEvent(res, 33331)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0900": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0900 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33332)
                }else{
                  Utils.emitEvent(res, 33332)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState1000": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio1()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1000 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 33333)
                }else{
                  Utils.emitEvent(res, 33333)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState1100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseAudio1()");
                this.controller.runJavaScript("pauseAudio2()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1100 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33334)
                }else{
                  Utils.emitEvent(res, 33334)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState1200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("audio2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playAudio1()");
                this.controller.runJavaScript("playAudio2()");
                await Utils.sleep(2000);
                this.controller.pauseAllMedia();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1200 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 33335)
                }else{
                  Utils.emitEvent(res, 33335)
                }
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("audio1.html"), controller: this.controller })
    }
  }
}
