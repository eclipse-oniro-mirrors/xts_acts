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
import events_emitter from '@ohos.events.emitter';
import web_webview from '@ohos.web.webview';

import Utils from '../../test/Utils';
import promptAction from '@ohos.promptAction';

//
class DataTrans {
    constructor() {
    }
    
    trans() {
        return 'obj'
    }
}

@Entry
@Component
struct webViewCookieTrack {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State emitKey: string = '';
  @State getUrlStr: string = ''
  @State cookie: string = ''
  @State whiteUrlList: string[] = ['www.example.com']
  @State webUrl: string = 'https://www.example.com/cookieTrack.html'
  @State pageStatus: string = 'add'
  @State traceHosts: string[] = []
  responseResource: WebResourceResponse = new WebResourceResponse();
  @State webData: string = '<!DOCTYPE html>\n' +
    '<html lang="en">\n' +
    '<head>\n' +
    '<meta charset="UTF-8">\n' +
    '<meta http-equiv="X-UA-Compatible" content="IE=edge">\n' +
    '<meta name="viewport" content="width=device-width, initial-scale=1.0">\n' +
    '<meta http-equiv="pragma" content="no-cache" />\n' +
    '<title>cookieTrack</title>\n' +
    '</head>\n' +
    '<body>\n' +
    '<span>cookieTrack</span>\n' +
    '</body>\n' +
    '</html>\n' +
    '<script type="text/javascript">\n' +
    'function createRandomTag(tagName,src){\n' +
    'let tagEle = document.createElement(tagName);\n' +
    'tagEle.src = src+"?"+Math.random();\n' +
    'document.head.appendChild(tagEle);}\n' +
    'function createDiv(tagName,content){\n' +
    'let tagEle = document.createElement("div");\n' +
    'tagEle.innerText = content;\n' +
    'document.body.appendChild(tagEle);}\n' +
    'let src_list = ["https://mc.yandex.ru/metrika/watch.js","https://mc.yandex.ru/metrika/tag.js"]\n' +
    'for(let src of src_list){\n' +
    'createRandomTag("script",src)\n' +
    'createDiv("div",src)}\n' +
    'let img_list = ["https://hm.baidu.com/hm.gif"]\n' +
    'for(let src of img_list){\n' +
    'createRandomTag("img",src)\n' +
    'createDiv("div",src)}\n' +
    'function printCookie(){\n' +
    'createDiv("div",document.cookie)}\n' +
    '</script>\n'

  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
          }
      }
  }
  
  private triggerCookie = async () => {
      this.controller.enableIntelligentTrackingPrevention(true);
      web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(true);
      console.log('当前状态：' + this.controller.isIntelligentTrackingPreventionEnabled())
      web_webview.WebCookieManager.clearAllCookiesSync()
      this.controller.removeCache(true);
      this.controller.loadUrl(this.webUrl)
      await Utils.sleep(1000)
      let retryTime = 0
      while(this.traceHosts.length == 0 && retryTime < 15) {
          retryTime += 1
          await Utils.sleep(2000)
          this.controller.refresh()
          console.log('reset traceHosts')
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('webViewCookieTrackTriggerFeiButton').key('webViewCookieTrackTriggerFeiButton')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                await Utils.sleep(1000)
                this.traceHosts = []
                this.cookie = ''
                switch (this.emitKey) {
                  case 'emitWebViewCookieTrackEnableTrue': {
                      this.controller.enableIntelligentTrackingPrevention(true)
                      this.controller.refresh()
                      await Utils.sleep(2000)
                      Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == true, 3001)
                  }
                  case 'emitWebViewCookieTrackEnableFalse': {
                    this.controller.enableIntelligentTrackingPrevention(false)
                    this.controller.refresh()
                    Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == false, 3002)
                    break;
                  }
                  case 'emitWebViewCookieTrackEnabled': {
                    this.controller.enableIntelligentTrackingPrevention(true)
                    this.controller.refresh()
                    await Utils.sleep(2000)
                    Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == true, 3003)
                  }
                  case 'emitNoCookieTrackingPrevention': {
                    this.controller.enableIntelligentTrackingPrevention(true);
                    web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(true);
                    console.log('当前状态：' + this.controller.isIntelligentTrackingPreventionEnabled())
                    web_webview.WebCookieManager.clearAllCookiesSync()
                    this.controller.removeCache(true);
                    this.controller.loadUrl(this.webUrl)
                    let beforeTraceLength = this.traceHosts.length
                    console.log('this.traceHosts before: ' + this.traceHosts)
                    Utils.emitEvent(beforeTraceLength == 0, 3008)
                    break;
                  }
                }
              })
              TextArea({
                  text: this.cookie,
                  controller: new TextAreaController()
              })
          }
          Web({ src: '', controller: this.controller })
                .key('webViewCookieTrackButton')
                .javaScriptAccess(true)
                .width('100%')
                .height('70%')
                .databaseAccess(true)
                .domStorageAccess(true)
                .fileAccess(true)
                .cacheMode(CacheMode.Default)
                .onPageBegin(() => {
                })
                .onIntelligentTrackingPreventionResult((event) => {
                    if (event) {
                        this.cookie = 'host:' + event.host + ',url:' + event.trackerHost
                        this.traceHosts.push(this.cookie)
                        console.log('onIntelligentTrackingPreventionResult ->' + this.cookie)
                    }
                })
                .onInterceptRequest((event=>{
                  if(event){
                    console.info('url:'+event.request.getRequestUrl());

                    if (event.request.getRequestUrl()!='https://www.example.com/cookieTrack.html'){
                        return null;
                    }
                  }
                    console.info('webData:'+this.webData);
                    this.responseResource.setResponseData(this.webData);
                    this.responseResource.setResponseEncoding('utf-8');
                    this.responseResource.setResponseMimeType('text/html');
                    this.responseResource.setResponseCode(200);
                    this.responseResource.setReasonMessage('OK');
                    return this.responseResource;

                }))
      }
  }
}
