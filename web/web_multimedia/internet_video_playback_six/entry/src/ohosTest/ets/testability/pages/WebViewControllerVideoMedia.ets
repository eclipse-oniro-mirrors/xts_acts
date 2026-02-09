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


import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';
import { Driver, ON } from '@ohos.UiTest';

@Entry
@Component
struct WebViewControllerVideoMedia {
  @State str: string = ""
  @State userAgentPC:string = "";
  controller: webView.WebviewController = new webView.WebviewController();
  @State backStateArr:string[] = ['MediaPlaybackState.NONE','MediaPlaybackState.PLAYING','MediaPlaybackState.PAUSED','MediaPlaybackState.STOPPED']
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isFullScreen: number = 0;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 132260,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(132260)
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
        Button("WebViewControllerVideoMedia").id('WebViewControllerVideoMedia').onClick(async () => {
          console.info('key==>' + this.str)
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "GetMediaPlaybackState0100": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 132500)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video1.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0100 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132500)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0200": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132510)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video1.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0200 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132510)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0300": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132520)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video1.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia()
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0300 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132520)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0400": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132530)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video1.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0400 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132530)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0500": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[3], 132540)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video1.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo()");
                  await Utils.sleep(2000);
                  this.controller.stopAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0500 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132540)
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
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 132550)
                } else {
                  try {
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile("video1.html"))
                    await waitForExist(() => this.isPageEnd, this.str, 0);

                    let driver = Driver.create();
                    let size = await driver.getDisplaySize();
                    console.log("size x:" + size.x)
                    console.log("size y:" + size.y)
                    await driver.delayMs(1000);
                    await driver.click(size.x / 2, size.y / 2);
                    await driver.delayMs(1000);

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
                      console.info("key==>isFull_132550):" + isFull)
                      if ((num1 == 0) && (res == 3)) {
                        back_res = true;
                      }
                    })
                    await Utils.sleep(3000);
                    Utils.emitEvent(back_res, 132550)
                  } catch (error) {
                    console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  }
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0700": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[0], 132560)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video2.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0700 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132560)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0800": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132570)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video2.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo1()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0800 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132570)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState0900": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132580)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video2.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState0900 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132580)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1000": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[1], 132590)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video2.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo1()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState1000 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132590)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1100": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132600)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video2.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  this.controller.runJavaScript("pauseVideo1()");
                  this.controller.runJavaScript("pauseVideo2()");
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState1100 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132600)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "GetMediaPlaybackState1200": {
              let res: webView.MediaPlaybackState;
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(this.backStateArr[2], 132610)
                } else {
                  this.isPageEnd = -1;
                  this.controller.loadUrl($rawfile("video2.html"))
                  await waitForExist(() => this.isPageEnd, this.str, 0);

                  let driver = Driver.create();
                  let size = await driver.getDisplaySize();
                  console.log("size x:" + size.x)
                  console.log("size y:" + size.y)
                  await driver.delayMs(1000);
                  await driver.click(size.x / 2, size.y / 2);
                  await driver.delayMs(1000);

                  this.controller.runJavaScript("playVideo1()");
                  this.controller.runJavaScript("playVideo2()");
                  await Utils.sleep(2000);
                  this.controller.pauseAllMedia();
                  await Utils.sleep(2000);
                  res = this.controller.getMediaPlaybackState();
                  console.log("GetMediaPlaybackState1200 res: " + res);
                  Utils.emitEvent(this.backStateArr[res], 132610)
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
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
        .mediaPlayGestureAccess(false)
        .javaScriptAccess(true)
        .onFullScreenEnter(() => {
          console.log('isFullScreen==>');
          this.isFullScreen = 1;
        })
    }
  }
}
