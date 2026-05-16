/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack,ThreatType ,WebRotateEffect,WebResourceResponse} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import { UIContext, Router } from '@ohos.arkui.UIContext'

export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct Second {
  stringObj: StringFields  = new StringFields ();
  @State outputStr: string = '';
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  webResourceResponse: WebResourceResponse = new WebResourceResponse();
  @State rotateRenderEffectArr: WebRotateEffect[]= [WebRotateEffect.RESIZE_COVER_EFFECT,WebRotateEffect.TOPLEFT_EFFECT]
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;
  @State isOnLoadStarted: number = -1;
  @State isOnResourceLoad: number = -1;
  @State isOnLoadFinished: number = -1;
  @State isOnInterceptRequest: number = -1;
  @State databaseAccess: boolean = true;
  @State rotateRenderEffect: WebRotateEffect = WebRotateEffect.RESIZE_COVER_EFFECT;
  @State title: number = -1;
  @State isRealTitle: number = -1;
  @State isOnLoadStartedResult: number = -1;
  @State onResourceLoadResult: number = -1;
  @State onLoadFinishedResult: number = -1;
  @State onInterceptRequestResult: number = -1;



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
        Button('web click').key('web').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'emitOnTitleReceive01': {
              try {
                this.webviewCtl.loadUrl('www.baidu.com');
                if ( this.title === 1){
                  Utils.emitEvent(true, 202511081)
                }
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitOnTitleReceive02': {
              try {
                this.webviewCtl.loadUrl('www.baidu.com');
                if ( this.isRealTitle === 1){
                  Utils.emitEvent(true, 202511082)
                }
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRotateRenderEffect01': {
              try {
                let metadata:webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setFormFactors([webview.UserAgentFormFactor.AUTOMOTIVE]);
                let FormFactors = metadata.getFormFactors();
                Utils.emitEvent(FormFactors.toString(), 20251101)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitRotateRenderEffect02': {
              try {
                let metadata:webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setFormFactors([webview.UserAgentFormFactor.DESKTOP]);
                let FormFactors = metadata.getFormFactors();
                Utils.emitEvent(FormFactors.toString(), 20251102)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRotateRenderEffect03': {
              try {
                let metadata:webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setFormFactors([webview.UserAgentFormFactor.MOBILE]);
                let FormFactors = metadata.getFormFactors();
                Utils.emitEvent(FormFactors.toString(), 20251103)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRotateRenderEffect04': {
              try {
                let metadata:webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setFormFactors([webview.UserAgentFormFactor.EINK]);
                let FormFactors = metadata.getFormFactors();
                Utils.emitEvent(FormFactors.toString(), 20251104)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRotateRenderEffect05': {
              try {
                let metadata:webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setFormFactors([webview.UserAgentFormFactor.TABLET]);
                let FormFactors = metadata.getFormFactors();
                Utils.emitEvent(FormFactors.toString(), 20251105)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRotateRenderEffect06': {
              try {
                let metadata:webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setFormFactors([webview.UserAgentFormFactor.WATCH]);
                let FormFactors = metadata.getFormFactors();
                Utils.emitEvent(FormFactors.toString(), 20251106)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRotateRenderEffect07': {
              try {
                let metadata:webview.UserAgentMetadata = new webview.UserAgentMetadata();
                metadata.setFormFactors([webview.UserAgentFormFactor.XR]);
                let FormFactors = metadata.getFormFactors();
                Utils.emitEvent(FormFactors.toString(), 20251107)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitRotateRenderEffect08": {
              this.rotateRenderEffect = WebRotateEffect.RESIZE_COVER_EFFECT;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.baidu.com");
              Utils.emitEvent(true, 20251108)
              break;
            }
            case "emitRotateRenderEffect09": {
              this.rotateRenderEffect = WebRotateEffect.TOPLEFT_EFFECT;
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.baidu.com");
              Utils.emitEvent(true, 20251109)
              break;
            }



            case "onResourceLoad": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.baidu.com");
              Utils.emitEvent(this.onResourceLoadResult, 202511092)
              break;
            }

            case "onLoadFinished": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.baidu.com");
              Utils.emitEvent(this.onLoadFinishedResult, 202511093)
              break;
            }



            case "onInterceptRequest": {
              this.webviewCtl.refresh();
              this.webviewCtl.loadUrl("www.baidu.com");
              Utils.emitEvent(this.onInterceptRequestResult, 202511095)
              break;
            }
          }
        })
      }


      Web({ src: 'www.baidu.com', controller: this.webviewCtl })
        .databaseAccess(this.databaseAccess)
        .rotateRenderEffect(this.rotateRenderEffect)
        .width('100%')
        .height('100%')
        .onResourceLoad(event => {
          if (event) {
            console.log('onResourceLoad url==>' + event.url);
            if (event.url) {
              this.onResourceLoadResult = 1;
            }
          }
        })
        .onLoadFinished(event => {
          if (event) {
            this.onLoadFinishedResult = 1;
            console.log('onLoadFinished url==>' + event.url);
          }
        })
        .onPageEnd((event) => {
          this.isPageEnd = 1;
          console.log('onPageEnd url:' + event.url);
        })
        .onTitleReceive(event => {
          if (event) {
            console.log('title:' + event.title);
            let title:string  = event.title;
            if(event.title='baidu.com'||event.title='百度一下'){
              this.title = 1;
            }
            if(event.isRealTitle){
              this.isRealTitle = 1;
            }
          }
        })
        .onInterceptRequest(event => {
          if (event) {
            this.onInterceptRequestResult = 1;
            console.log('onInterceptRequest getRequestUrl: ', event.request.getRequestUrl());
            console.log('onInterceptRequest isMainFrame: ', event.request.isMainFrame());
            console.log('onInterceptRequest isRedirect: ', event.request.isRedirect());
            console.log('onInterceptRequest isRequestGesture: ', event.request.isRequestGesture());
          }
          return this.webResourceResponse;

        })
    }

  }
}