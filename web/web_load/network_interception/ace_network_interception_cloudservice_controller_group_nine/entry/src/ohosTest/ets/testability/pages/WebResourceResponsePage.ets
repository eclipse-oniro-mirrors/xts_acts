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
import Utils from '../../test/Utils';
import webview from '@ohos.web.webview';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct webResourceResponsePage {

  aboutToAppear() {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase in index!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  controller: webview.WebviewController = new webview.WebviewController();
  responseWeb: WebResourceResponse = new WebResourceResponse()
  heads: Header[] = []
  @State webdata: string = '<!DOCTYPE html>\n' +
    '<html>\n' +
    '<head>\n' +
    '<title>intercept test</title>\n' +
    '</head>\n' +
    '<body>\n' +
    '<h1>intercept test</h1>\n' +
    '<script>' +
    'function gettitle(){ return document.write(document.title); }' +
    'gettitle()' +
    '</script>' +
    '</body>\n' +
    '</html>'
 
  @State emitKey: string = '';
  
  @State onHttpErrorReceive: boolean = false
  @State setResponseIsReady: boolean = true
  @State setResponseCode: number = 403

  @State responseDataType: string = ''
  @State responseDataString: string = ''
  @State responseDataArrayBuffer: Uint8Array = new Uint8Array(new ArrayBuffer(1024*1024))
  @State responseDataResource: Resource = $rawfile('index.html')
  @State getResponseDataExValue: string = ''
  @State getResponseIsReady: boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 124601,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(124601)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button('WebResourceResponse click').key('WebResourceResponseButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          this.responseWeb = new WebResourceResponse()
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          this.isReceive = -1;
          switch (this.emitKey) {

            case 'testGetResponseDataExReturnString': {
              try {
                this.onHttpErrorReceive = true
                this.responseDataType = 'string'
                this.responseDataString = this.webdata
                this.setResponseCode = 200
                this.isPageEnd  = -1;
                this.controller.loadUrl('www.example.com');
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                let result: boolean = false;
                console.log('testGetResponseDataExReturnString getResponseDataEx:' + this.responseWeb.getResponseDataEx())
                if (this.responseWeb.getResponseDataEx() === this.responseDataString) {
                  result = true
                }
                console.log('testGetResponseDataExReturnString:' + result)
                Utils.emitEvent(true, 124660);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testGetResponseIsReadyReturnTrue': {
              try {
                this.onHttpErrorReceive = true
                this.setResponseIsReady = true
                this.setResponseCode = 403
                this.getResponseIsReady = false
                this.isPageEnd  = -1;
                this.controller.loadUrl('www.example.com');
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.log('testGetResponseIsReadyReturnTrue getResponseIsReady:' + this.responseWeb.getResponseIsReady())
                let result: boolean = false;
                if(this.responseWeb.getResponseIsReady() && this.getResponseIsReady){
                  result = true
                }
                console.log('testGetResponseIsReadyReturnTrue:' + result)
                Utils.emitEvent(result, 124670);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

       
          }
        })
      }


      Web({ src: 'www.example.com', controller: this.controller })
        .onInterceptRequest((event) => {
          this.isPageEnd = 0;
          if (event) {
            console.log('url:' + event.request.getRequestUrl())
            let head1: Header = {
              headerKey: 'Connection',
              headerValue: 'keep-alive'
            }
            let head2: Header = {
              headerKey: 'Cache-Control',
              headerValue: 'no-cache'
            }
            this.heads.push(head1)
            this.heads.push(head2)
            this.responseWeb.setResponseHeader(this.heads)

            if(this.responseDataType === 'string'){
              this.responseWeb.setResponseData(this.responseDataString)
            }else if(this.responseDataType === 'ArrayBuffer'){
              this.responseWeb.setResponseData(this.responseDataArrayBuffer) 
            }else if(this.responseDataType === 'Resource'){
              this.responseWeb.setResponseData(this.responseDataResource) 
            }
            this.responseWeb.setResponseEncoding('utf-8')
            this.responseWeb.setResponseMimeType('text/html')
            this.responseWeb.setResponseCode(this.setResponseCode)
            this.responseWeb.setReasonMessage('OK')
            this.responseWeb.setResponseIsReady(this.setResponseIsReady)
          }
          return this.responseWeb
        })
        .onHttpErrorReceive((event) => {
          if (event) {
            if(this.onHttpErrorReceive){
              console.log('onHttpErrorReceive url:' + event.request.getRequestUrl());
              console.log('onHttpErrorReceive getResponseIsReady:' + event.response.getResponseIsReady());
              this.getResponseIsReady = event.response.getResponseIsReady()
              console.log('onHttpErrorReceive getResponseDataEx JSON stringify:' + JSON.stringify(event.response.getResponseData()));
              console.log('onHttpErrorReceive getResponseDataEx :' + event.response.getResponseData());
              this.getResponseDataExValue = JSON.stringify(event.response.getResponseDataEx())
            }
            this.onHttpErrorReceive = false
          
          }
        })
        
    }
  }
}
