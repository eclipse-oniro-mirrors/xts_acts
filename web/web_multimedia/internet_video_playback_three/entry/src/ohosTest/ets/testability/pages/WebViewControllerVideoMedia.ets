/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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


import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

const driver = Driver.create();
const EVENT_ID_SET_EMIT_KEY = 350000;

@Entry
@Component
struct WebViewControllerVideoMedia {
  @State str: string = ""
  @State userAgentPC:string = "";
  @State isPageEnd:number = -1;
  @State isReceive: number = -1;
  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerVideoMedia").id('WebViewControllerVideoMedia').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
          this.isReceive = -1;
          switch (this.str) {
            case "StopAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 350010)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(5000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0100 res: " + res);
                  Utils.emitEvent(res, 350010)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 350020)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0200 res: " + res);
                  Utils.emitEvent(res, 350020)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                let size = await driver.getDisplaySize();
                console.log("size x:" + size.x)
                console.log("size y:" + size.y)
                await driver.click(size.x / 2, size.y / 2);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 350030)
                }else{
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(3000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0300 res: " + res);
                  Utils.emitEvent(res, 350030)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350040)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(5000);
                  this.controller.runJavaScript("pauseVideo()");
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0400 res: " + res);
                  Utils.emitEvent(res, 350040)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350050)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(5000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0500 res: " + res);
                  Utils.emitEvent(res, 350050)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 350060)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(3000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0600 res: " + res);
                  Utils.emitEvent(res, 350060)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 350070)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(3000);
                  this.controller.runJavaScript("pauseVideo2()");
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0700 res: " + res);
                  Utils.emitEvent(res, 350070)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "StopAllMedia0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video3.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 350080)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  this.controller.runJavaScript("playAudio()");
                  await Utils.sleep(5000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("StopAllMedia0800 res: " + res);
                  Utils.emitEvent(res, 350080)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350100)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  this.controller.resumeAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("ResumeAllMedia0100 res: " + res);
                  Utils.emitEvent(res, 350100)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 350120)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.resumeAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("ResumeAllMedia0200 res: " + res);
                  Utils.emitEvent(res, 350120)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350130)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(5000);
                  this.controller.resumeAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("ResumeAllMedia0300 res: " + res);
                  Utils.emitEvent(res, 350130)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350140)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(3000);
                  this.controller.runJavaScript("pauseVideo()");
                  await Utils.sleep(2000);
                  this.controller.resumeAllMedia();
                  await Utils.sleep(3000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("ResumeAllMedia0400 res: " + res);
                  Utils.emitEvent(res, 350140)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                this.isPageEnd = -1;
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 350150)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(5000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  this.controller.resumeAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("ResumeAllMedia0500 res: " + res);
                  Utils.emitEvent(res, 350150)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350160)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  this.controller.resumeAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("ResumeAllMedia0600 res: " + res);
                  Utils.emitEvent(res, 350160)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "ResumeAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video3.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350170)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
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
                  Utils.emitEvent(res, 350170)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350210)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0100 res: " + res);
                  Utils.emitEvent(res, 350210)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350220)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0200 res: " + res);
                  Utils.emitEvent(res, 350220)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350230)
                }else{

                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0300 res: " + res);
                  Utils.emitEvent(res, 350230)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350240)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0400 res: " + res);
                  Utils.emitEvent(res, 350240)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350250)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0500 res: " + res);
                  Utils.emitEvent(res, 350250)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0600": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350260)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0600 res: " + res);
                  Utils.emitEvent(res, 350260)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350270)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo2()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0700 res: " + res);
                  Utils.emitEvent(res, 350270)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "PauseAllMedia0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video3.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350280)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  this.controller.runJavaScript("playAudio()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("PauseAllMedia0800 res: " + res);
                  Utils.emitEvent(res, 350280)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("video1.html"), controller: this.controller })
        .mediaPlayGestureAccess(false)
        .javaScriptAccess(true)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}
