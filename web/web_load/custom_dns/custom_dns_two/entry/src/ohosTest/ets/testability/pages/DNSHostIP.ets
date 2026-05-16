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
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { waitForAssert, waitForAssert1, waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct DNSHostIP {
  @State userAgentPC:string = "";
  @State hostName: string | null | undefined= 'www.baidu.com';
  @State str: string = "";
  @State getURL: string = "";
  @State getURL1: string = "";
  @State getURL2: string = "";
  @State getURL3: string = "";
  @State getURL4: string = "";
  @State value: boolean = false;
  @State isMetaViewport: boolean | null | undefined = false;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State cachePath: string = Utils.getSandboxCacheDir() + 'web/Cache/Cache_Data/'

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148002,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(148002)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('DNSHostIP').id('DNSHostIP').onClick(async () => {
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'setHostIP0100': {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes('PC')) {
                Utils.emitEvent(true, 148012)
                break;
              } else if ((this.userAgentPC).includes('Tablet')) {
                Utils.emitEvent(true, 148012)
                break;
              }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('www.baidu.com', '124.95.179.4', 30);
                await Utils.sleep(3000);
                this.isPageEnd = -1;
                this.controller.loadUrl('www.baidu.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.getURL = this.controller.getUrl();
                console.log('setHostIP0100_getUrl: ' + this.getURL);
                web_webview.WebviewController.clearHostIP('www.baidu.com');
                let filesBeforeRemove = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove.length, check, true, this.str);
                this.isPageEnd = -1;
                this.controller.loadUrl('www.baidu.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                let checkUrl = (v1: string, v2: string): boolean => {
                  this.controller.loadUrl('www.baidu.com');
                  console.log(this.str,"url1111:"+this.controller.getUrl());
                  return this.controller.getUrl().includes(v2);
                }
                await waitForAssert1(() => this.controller.getUrl(), checkUrl, "baidu.com", this.str,5000);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP0100_getUrl1: ' + this.getURL1)
                if (this.getURL != this.getURL1) {
                  this.value = true;
                }
                console.log('setHostIP0100_value: ' + this.value)
                let filesBeforeRemove1 = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check1 = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove1.length, check1, true, this.str);
                Utils.emitEvent(this.value, 148012)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'setHostIP1200': {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes('PC')) {
                Utils.emitEvent(true, 148022)
                break;
              } else if ((this.userAgentPC).includes('Tablet')) {
                Utils.emitEvent(true, 148022)
                break;
              }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('baidu.com', '124.95.179.4', 30);
                this.isPageEnd = -1;
                this.controller.loadUrl('baidu.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.getURL = this.controller.getUrl();
                console.log('setHostIP1200_getUrl: ' + this.getURL);
                web_webview.WebviewController.clearHostIP('baidu.com');
                let filesBeforeRemove = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove.length, check, true, this.str);
                this.isPageEnd = -1;
                this.controller.loadUrl('baidu.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log('setHostIP1200_getUrl1: ' + this.getURL1)
                let checkUrl = (v1: string, v2: string): boolean => {
                  this.controller.loadUrl('baidu.com');
                  console.log(this.str,"url2222:"+this.controller.getUrl());
                  return this.controller.getUrl().includes(v2);
                }
                await waitForAssert1(() => this.controller.getUrl(), checkUrl, "baidu.com", this.str,5000);
                this.getURL1 = this.controller.getUrl();
                if (this.getURL != this.getURL1) {
                  this.value = true;
                }
                console.log('setHostIP1200_value: ' + this.value)
                let filesBeforeRemove1 = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check1 = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove1.length, check1, true, this.str);
                Utils.emitEvent(this.value, 148022)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'setHostIP1300': {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes('PC')) {
                Utils.emitEvent(true, 148032)
                break;
              } else if ((this.userAgentPC).includes('Tablet')) {
                Utils.emitEvent(true, 148032)
                break;
              }
              this.value = false;
              this.getURL = '';
              this.getURL1 = '';
              try {
                web_webview.WebviewController.setHostIP('store.apple.com', '124.95.179.4', 30);
                this.isPageEnd = -1;
                this.controller.loadUrl('store.apple.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.getURL = this.controller.getUrl();
                console.log('setHostIP1300_getUrl: ' + this.getURL);
                web_webview.WebviewController.clearHostIP('store.apple.com');
                let filesBeforeRemove = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove.length, check, true, this.str);
                this.isPageEnd = -1;
                this.controller.loadUrl('store.apple.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                console.log('setHostIP1300_getUrl1: ' + this.getURL1);
                let checkUrl = (v1: string, v2: string): boolean => {
                  this.controller.loadUrl('store.apple.com');
                  console.log(this.str,"url333:"+this.controller.getUrl());
                  return this.controller.getUrl().includes(v2);
                }
                await waitForAssert1(() => this.controller.getUrl(), checkUrl, "store.apple.com", this.str,5000);
                this.getURL1 = this.controller.getUrl();
                if (this.getURL != this.getURL1) {
                  this.value = true;
                }
                console.log('setHostIP1300_value: ' + this.value);
                let filesBeforeRemove1 = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check1 = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove1.length, check1, true, this.str);
                Utils.emitEvent(this.value, 148032)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'setHostIP1500': {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes('PC')) {
                Utils.emitEvent(true, 148042)
                break;
              } else if ((this.userAgentPC).includes('Tablet')) {
                Utils.emitEvent(true, 148042)
                break;
              }
              this.value = false;
              let value1: boolean = false;
              let value2: boolean = false;
              this.getURL1 = '';
              this.getURL2 = '';
              this.getURL3 = '';
              this.getURL4 = '';

              try {
                web_webview.WebviewController.setHostIP('www.baidu.com', '124.95.179.4', 30);
                this.isPageEnd = -1;
                this.controller.loadUrl('www.baidu.com');
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.getURL1 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl1' + this.getURL1)
                web_webview.WebviewController.clearHostIP('www.baidu.com');
                let filesBeforeRemove = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove.length, check, true, this.str);
                this.isPageEnd = -1;
                this.controller.loadUrl('https://www.baidu.com')
                await waitForExist(() => this.isPageEnd, this.str, 0);
                let checkUrl = (v1: string, v2: string): boolean => {
                  this.controller.loadUrl('https://www.baidu.com');
                  console.log(this.str,"url444:"+this.controller.getUrl());
                  return this.controller.getUrl().includes(v2);
                }
                await waitForAssert1(() => this.controller.getUrl(), checkUrl, "baidu.com", this.str,5000);
                this.getURL2 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl2' + this.getURL2)
                if (this.getURL1 != this.getURL2) {
                  value1 = true
                }
                let filesBeforeRemove1 = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check1 = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove1.length, check1, true, this.str);
                web_webview.WebviewController.setHostIP('www.baidu.com', '124.95.179.4', 30);
                this.isPageEnd = -1;
                this.controller.loadUrl('www.baidu.com')
                await waitForExist(() => this.isPageEnd, this.str, 0);
                this.getURL3 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl3' + this.getURL3)
                web_webview.WebviewController.clearHostIP('www.baidu.com');
                let filesBeforeRemove2 = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check2 = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove2.length, check2, true, this.str);
                this.isPageEnd = -1;
                this.controller.loadUrl('www.baidu.com')
                await waitForExist(() => this.isPageEnd, this.str, 0);
                let checkUrl1 = (v1: string, v2: string): boolean => {
                  this.controller.loadUrl('www.baidu.com');
                  console.log(this.str,"url444:"+this.controller.getUrl());
                  return this.controller.getUrl().includes(v2);
                }
                await waitForAssert1(() => this.controller.getUrl(), checkUrl1, "baidu.com", this.str,5000);
                this.getURL4 = this.controller.getUrl();
                console.log('setHostIP1500_getUrl4' + this.getURL4)
                if (this.getURL3 != this.getURL4) {
                  value2 = true
                }
                if ((value1 == true) && (value2 == true)) {
                  this.value = true
                }
                console.log('setHostIP1500_value: ' + this.value)
                let filesBeforeRemove3 = Utils.listFile(this.cachePath)
                this.controller.removeCache(true);
                let check3 = (v1: number, v2: boolean): boolean => {
                  let newFilesAfterRemove = Utils.listFile(this.cachePath)
                  return v1 > newFilesAfterRemove.length;
                }
                await waitForAssert1(() => filesBeforeRemove3.length, check3, true, this.str);
                Utils.emitEvent(this.value, 148042)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })

      }

      Web({ src: $rawfile('indexPhoto.html'), controller: this.controller })
        .height(500)
        .width(500)
        .onPageEnd(() => {
          this.isPageEnd = 0
        })
    }
  }
}
