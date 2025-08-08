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
struct WebViewControllerVideoMedia {
  @State str: string = ""
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController();
  @State backStateArr:string[] = ['MediaPlaybackState.NONE','MediaPlaybackState.PLAYING','MediaPlaybackState.PAUSED','MediaPlaybackState.STOPPED']

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
        Button("WebViewControllerVideoMedia").id('WebViewControllerVideoMedia').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "StopAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(5000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[3], 77011)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77011)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
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
                  Utils.emitEvent(this.backStateArr[0], 77012)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77012)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[3], 77013)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77013)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 77014)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77014)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 77015)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77015)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
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
                  Utils.emitEvent(this.backStateArr[3], 77016)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77016)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo2()");
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
                  Utils.emitEvent(this.backStateArr[3], 77017)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77017)
                }
              }, 3000)
              break;
            }
            case "StopAllMedia0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video3.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                this.controller.runJavaScript("playAudio()");
                await Utils.sleep(2000);
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
                  Utils.emitEvent(this.backStateArr[3], 77018)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 77018)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[1], 78011)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 78011)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
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
                  Utils.emitEvent(this.backStateArr[0], 78012)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 78012)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[1], 78013)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 78013)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 78014)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 78014)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[3], 78015)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 78015)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
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
                  Utils.emitEvent(this.backStateArr[1], 78016)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 78016)
                }
              }, 3000)
              break;
            }
            case "ResumeAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video3.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                this.controller.runJavaScript("playAudio()");
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
                  Utils.emitEvent(this.backStateArr[1], 78017)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 78017)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 79011)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79011)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
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
                  Utils.emitEvent(this.backStateArr[2], 79012)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79012)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 79013)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79013)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 79014)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79014)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 79015)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79015)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
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
                  Utils.emitEvent(this.backStateArr[2], 79016)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79016)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo2()");
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
                  Utils.emitEvent(this.backStateArr[2], 79017)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79017)
                }
              }, 3000)
              break;
            }
            case "PauseAllMedia0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video3.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                this.controller.runJavaScript("playAudio()");
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
                  Utils.emitEvent(this.backStateArr[2], 79018)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 79018)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0100 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 8101)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8101)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0200 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 8102)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8102)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[2], 8103)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8103)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0400 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 8104)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8104)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
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
                  Utils.emitEvent(this.backStateArr[3], 8105)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8105)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0600": {
              let res: webView.MediaPlaybackState;
              let back_res: boolean = false;
              let num1: number = 0;
              try {
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("enterFullScreen()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo()");
                await Utils.sleep(2000);
                this.controller.closeAllMediaPresentations();
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0600 res: " + res);
                await Utils.sleep(2000);
                this.controller.runJavaScript("isVideoFullScreen()", (err, isFull) => {
                  num1 = Number.parseInt(isFull);
                  console.info("key==>isFull_8106):" + isFull)
                  if ((num1 == 0) && (res == 3)) {
                    back_res = true;
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8106)
                }else{
                  Utils.emitEvent(back_res, 8106)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0700 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 8107)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8107)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0800 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 8108)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8108)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState0900": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState0900 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 8109)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8109)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState1000": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo1()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1000 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 8110)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8110)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState1100": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
                await Utils.sleep(2000);
                this.controller.runJavaScript("pauseVideo1()");
                this.controller.runJavaScript("pauseVideo2()");
                await Utils.sleep(2000);
                res = this.controller.getMediaPlaybackState();
                console.log("GetMediaPlaybackState1100 res: " + res);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 8111)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8111)
                }
              }, 3000)
              break;
            }
            case "GetMediaPlaybackState1200": {
              let res: webView.MediaPlaybackState;
              try {
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.sleep(2000);
                this.controller.runJavaScript("playVideo1()");
                this.controller.runJavaScript("playVideo2()");
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
                  Utils.emitEvent(this.backStateArr[2], 8112)
                }else{
                  Utils.emitEvent(this.backStateArr[res], 8112)
                }
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("video1.html"), controller: this.controller })
    }
  }
}
