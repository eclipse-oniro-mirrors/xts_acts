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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import web_webview from '@ohos.web.webview'
import image from "@ohos.multimedia.image";
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct getSurfaceId {
  @State str: string = '';
  @State checkResult: number = 0;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerOne: web_webview.WebviewController = new web_webview.WebviewController();
  @State imagePixelMap: image.PixelMap | undefined = undefined;
  urltrustList: string = '{\"UrlPermissionList\":[{\"host\":\"www.example.com\"}]}'
  urltrustListTwo: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"host\":\"www.test.com\", \"port\":80, \"path\":\"test\"}]}'
  urltrustListThree: string = '{\"UrlPermissionList\":[{\"scheme\":\"https\", \"host\":\"www.163.com\", \"port\":443, \"path\":\"test\"}]}'
  urltrustListFour: string = '{\"UrlPermissionList\":[{\"scheme\":\"https\", \"host\":\"www.163.com\", \"port\":443, \"path\":\"test\"},{\"scheme\":\"http\", \"host\":\"www.163.com\", \"port\":80, \"path\":\"test\"}]}'
  urltrustListFive: string = '{\"UrlPermissionList\":[{\"scheme\":\"http\", \"port\":80, \"path\":\"test\"}]}'
  urltrustListSix: string = '{\"UrlPermissionList\":[{\"host\":\"www.baidu.com\"},{\"host\":\"www.163.com\", \"port\":80, \"path\":\"test\"}]}'

  @State isReceive: number = -1
  @State isPageEnd: number = -1
  @State isWebInitPageEnd: number = -1


  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 728,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info('webOnSslError page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  onPageHide() {
    events_emitter.off(728)
  }

  build() {
    Column() {
      Row() {
        Button('getSurfaceId').key('getSurfaceIdButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, 'getSurfaceIdButton_isReceive', 1, 1000)
          await waitForExist(()=>this.isWebInitPageEnd, 'webInitPage_isPageEnd', 1, 1000)
          console.info('key==>' + this.str)
          this.isReceive = -1
          this.isPageEnd = -1
          switch (this.str) {
            case 'emitSetUrlTrustList0100': {
              try {
                this.controller.clearMatches();
                this.controller.loadUrl('www.example.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0100_isPageEnd_example', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 1;
                this.controller.setUrlTrustList(this.urltrustList);
                await Utils.sleep(2000);
                this.controller.loadUrl('https://www.baidu.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0100_isPageEnd_baidu', 1, 1000)
                this.isPageEnd = -1;
                this.controller.searchAllAsync('返回');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList0200': {
              try {
                this.controller.clearMatches();
                this.controller.loadUrl('www.example.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0200_isPageEnd_example', 1, 1000)
                this.isPageEnd = -1;
                await Utils.sleep(2000);
                this.controller.setUrlTrustList('');
                await Utils.sleep(2000);
                this.controller.loadUrl('https://www.baidu.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0200_isPageEnd_baidu', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 2;
                this.controller.searchAllAsync('百度一下');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList0300': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustListTwo);
                await Utils.sleep(2000);
                this.controller.loadUrl('https://www.test.com/test');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0300_isPageEnd', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 3;
                this.controller.searchAllAsync('返回');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList0400': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustListThree);
                await Utils.sleep(2000);
                this.controller.loadUrl('http://www.163.com/test');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0400_isPageEnd', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 4;
                this.controller.searchAllAsync('返回');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList0500': {
              try {
                this.controller.clearMatches();
                await Utils.sleep(2000);
                this.controller.setUrlTrustList(this.urltrustListFour);
                await Utils.sleep(4000);
                this.controller.loadUrl('http://www.163.com/test');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0400_isPageEnd_163', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 5;
                this.controller.searchAllAsync('网易首页');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList0600': {
              try {
                this.controller.loadUrl('https://www.baidu.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0600_isPageEnd_baidu', 1, 1000)
                this.isPageEnd = -1;
                this.controller.removeCache(true);
                await Utils.sleep(2000);
                this.controller.clearMatches();
                await Utils.sleep(2000);
                this.controller.setUrlTrustList(this.urltrustListFour);
                await Utils.sleep(4000);
                this.controller.loadUrl('https://www.163.com/test');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0600_isPageEnd_163', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 6;
                this.controller.searchAllAsync('网易首页');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList0700': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustListThree);
                await Utils.sleep(2000);
                this.controller.loadUrl('https://163.com/test');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList0700_isPageEnd_163', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 7;
                this.controller.searchAllAsync('返回');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList0800': {
              try {
                this.controllerOne.setUrlTrustList(this.urltrustListThree);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code, 28940)
              }
              break;
            }
            case 'emitSetUrlTrustList0900': {
              try {
                this.controllerOne.setUrlTrustList(this.urltrustListThree);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.message, 28941)
              }
              break;
            }
            case 'emitSetUrlTrustList1000': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustListFive);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code, 28942)
              }
              break;
            }
            case 'emitSetUrlTrustList1100': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustListSix);
                await Utils.sleep(2000);
                this.controller.loadUrl('www.baidu.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList1100_isPageEnd', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 9;
                this.controller.searchAllAsync('百度一下');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList1200': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustListSix);
                await Utils.sleep(2000);
                this.controller.loadUrl('www.163.com:80/test');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList1200_isPageEnd', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 10;
                this.controller.searchAllAsync('网易首页');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList1300': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustList);
                await Utils.sleep(2000);
                this.controller.loadUrl('www.example.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList1300_isPageEnd', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 11;
                this.controller.searchAllAsync('Domain');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case 'emitSetUrlTrustList1400': {
              try {
                this.controller.clearMatches();
                this.controller.setUrlTrustList(this.urltrustListSix);
                this.controller.setUrlTrustList(this.urltrustList);
                await Utils.sleep(2000);
                this.controller.loadUrl('www.example.com');
                await waitForExist(()=>this.isPageEnd, 'emitSetUrlTrustList1400_isPageEnd', 1, 1000)
                this.isPageEnd = -1;
                this.checkResult = 12;
                this.controller.searchAllAsync('Domain');
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
        Image(this.imagePixelMap)
        .height(100)
      }

      Web({src: 'www.example.com', controller: this.controller, renderMode: RenderMode.ASYNC_RENDER})
      .onSearchResultReceive(ret => {
          if (ret) {
            console.log('on search result receive:' + '[cur]' + ret.activeMatchOrdinal +
              '[total]' + ret.numberOfMatches + '[isDone]' + ret.isDoneCounting);
            if(ret.isDoneCounting == false){
              return;
            }
            if(this.checkResult == 1) {
              console.log('check1')
              Utils.emitEvent(ret.numberOfMatches, 28931)
              this.checkResult = 0;
            }
            if(this.checkResult == 2) {
              console.log('check2')
              Utils.emitEvent(ret.numberOfMatches, 28932)
              this.checkResult = 0;
            }
            if(this.checkResult == 3) {
              console.log('check3')
              Utils.emitEvent(ret.numberOfMatches, 28933)
              this.checkResult = 0;
            }
            if(this.checkResult == 4) {
              console.log('check4')
              Utils.emitEvent(ret.numberOfMatches, 28934)
              this.checkResult = 0;
            }
            if(this.checkResult == 5) {
              console.log('check5')
              Utils.emitEvent(ret.numberOfMatches, 28935)
              this.checkResult = 0;
            }
            if(this.checkResult == 6) {
              console.log('check6')
              Utils.emitEvent(ret.numberOfMatches, 28936)
              this.checkResult = 0;
            }
            if(this.checkResult == 7) {
              console.log('check7')
              Utils.emitEvent(ret.numberOfMatches, 28937)
              this.checkResult = 0;
            }
            if(this.checkResult == 9) {
              console.log('check9')
              Utils.emitEvent(ret.numberOfMatches, 28943)
              this.checkResult = 0;
            }
            if(this.checkResult == 10) {
              console.log('check10')
              Utils.emitEvent(ret.numberOfMatches, 28944)
              this.checkResult = 0;
            }
            if(this.checkResult == 11) {
              console.log('check11')
              Utils.emitEvent(ret.numberOfMatches, 28945)
              this.checkResult = 0;
            }
            if(this.checkResult == 12) {
              console.log('check12')
              Utils.emitEvent(ret.numberOfMatches, 28946)
              this.checkResult = 0;
            }
          }
        })
        .onPageBegin((event) => {
            console.log('onPageBegin url:' + event.url)
        })
        .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
            this.isPageEnd = 1
            if(this.isWebInitPageEnd == -1) {
                this.isWebInitPageEnd = 1
            }
        })
    }
  }
}