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
            case "CloseAllMediaPresentations0100": {
              let res: webView.MediaPlaybackState;
              let back_res: boolean = false
              let num1: number = 0;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 350310)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("enterFullScreen()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.closeAllMediaPresentations();
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.runJavaScript("isVideoFullScreen()", (err, isFull) => {
                    num1 = Number.parseInt(isFull);
                    console.info("key==>isFull 1:" + isFull)
                    this.isPageEnd = 3;
                  })
                  await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 3, 1000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("CloseAllMediaPresentations0100 res: " + res);
                  if ((num1 == 0) && (res == 3)) {
                    back_res = true;
                  }
                  Utils.emitEvent(back_res, 350310)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "CloseAllMediaPresentations0200": {
              let res: webView.MediaPlaybackState;
              let back_res: boolean = false;
              let num1: number = 0;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 350320)
                }else{

                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("enterFullScreen()");
                  await Utils.sleep(2000);
                  this.controller.closeAllMediaPresentations();
                  await Utils.sleep(2000);
                  this.isPageEnd = -1;
                  this.controller.runJavaScript("isVideoFullScreen()", (err, isFull) => {
                    num1 = Number.parseInt(isFull);
                    console.info("key==>isFull 2:" + isFull)
                    this.isPageEnd = 3;
                  })
                  await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 3, 1000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("CloseAllMediaPresentations0200 res: " + res);
                  if ((num1 == 0) && (res == 0)) {
                    back_res = true;
                  }
                  Utils.emitEvent(back_res, 350320)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "CloseAllMediaPresentations0300": {
              let res: webView.MediaPlaybackState;
              let back_res: boolean = false;
              let num1: number = 0;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 350330)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("enterFullScreen()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  this.controller.closeAllMediaPresentations();
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("isVideoFullScreen()", (err, isFull) => {
                    num1 = Number.parseInt(isFull);
                    console.info("key==>isFull 3:" + isFull)
                  })
                  res = this.controller.getMediaPlaybackState();
                  console.log("CloseAllMediaPresentations0300 res: " + res);
                  if ((num1 == 0) && (res == 3)) {
                    back_res = true;
                  }
                  Utils.emitEvent(back_res, 350330)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "CloseAllMediaPresentations0400": {
              let res: webView.MediaPlaybackState;
              let back_res: boolean = false;
              let num1: number = 0;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 350340)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("enterFullScreen()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo()");
                  await Utils.sleep(2000);
                  this.controller.closeAllMediaPresentations();
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("isVideoFullScreen()", (err, isFull) => {
                    num1 = Number.parseInt(isFull);
                    console.info("key==>isFull 4:" + isFull)
                  })
                  res = this.controller.getMediaPlaybackState();
                  console.log("CloseAllMediaPresentations0400 res: " + res);
                  if ((num1 == 0) && (res == 2)) {
                    back_res = true;
                  }
                  Utils.emitEvent(back_res, 350340)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "CloseAllMediaPresentations0500": {
              let res: webView.MediaPlaybackState;
              let back_res: boolean = false;
              let num1: number = 0;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 350350)
                }else{

                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("enterFullScreen()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.closeAllMediaPresentations();
                  await Utils.sleep(2000);
                  this.controller.closeAllMediaPresentations();
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("isVideoFullScreen()", (err, isFull) => {
                    num1 = Number.parseInt(isFull);
                    console.info("key==>isFull 5:" + isFull)
                  })
                  res = this.controller.getMediaPlaybackState();
                  console.log("CloseAllMediaPresentations0500 res: " + res);
                  if ((num1 == 0) && (res == 3)) {
                    back_res = true;
                  }
                  Utils.emitEvent(back_res, 350350)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);

                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 350360)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0100 res: " + res);
                  Utils.emitEvent(res, 350360)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350370)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(3000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0200 res: " + res);
                  Utils.emitEvent(res, 350370)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350380)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia()
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0300 res: " + res);
                  Utils.emitEvent(res, 350380)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350390)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0400 res: " + res);
                  Utils.emitEvent(res, 350390)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(3, 350400)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0500 res: " + res);
                  Utils.emitEvent(res, 350400)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0600": {
              let res: webView.MediaPlaybackState;
              let back_res: boolean = false;
              let num1: number = 0;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video1.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 350410)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
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
                    if ((num1 === 0) && (res === 3)) {
                      back_res = true;
                      this.isPageEnd = 3;
                    }
                  })
                  await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 3, 1000);
                  Utils.emitEvent(back_res, 350410)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(0, 350420)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0700 res: " + res);
                  Utils.emitEvent(res, 350420)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350430)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  await Utils.sleep(6000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0800 res: " + res);
                  Utils.emitEvent(res, 350430)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0900": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350440)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0900 res: " + res);
                  Utils.emitEvent(res, 350440)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1000": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350450)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo1()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState1000 res: " + res);
                  Utils.emitEvent(res, 350450)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1100": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350460)
                }else{
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.click(size.x / 2, size.y / 2);
                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(3000);
                  this.controller.runJavaScript("pauseVideo1()");
                  this.controller.runJavaScript("pauseVideo2()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState1100 res: " + res);
                  Utils.emitEvent(res, 350460)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1200": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);

                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(2, 350470)
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
                  console.log("GetMediaPlaybackState1200 res: " + res);
                  Utils.emitEvent(res, 350470)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1300": {
              let res: webView.MediaPlaybackState;
              try {
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video2.html"))
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(1, 350480)
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
                  this.controller.runJavaScript("playVideo1()");
                  await Utils.sleep(3000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState1300 res: " + res);
                  Utils.emitEvent(res, 350480)
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
