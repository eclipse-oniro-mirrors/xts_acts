/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import business_error from '@ohos.base'
import Utils from '../../test/Utils';
import promptAction from '@ohos.promptAction';
import {waitForExist} from '../../test/WaitTest';

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
  @State emitKey: string = 'emitCookieTrackRemoveTrackingPrevention';
  @State getUrlStr: string = ''
  @State cookie: string = ''
  @State whiteUrlList: string[] = ['mc.yandex.ru','hm.baidu.com']
  @State webUrl: string = ''
  @State pageStatus: string = 'add'
  @State traceHosts: string[] = []
  @State errorCode: number = 0
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 160060,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(160060)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
            this.isReceive = 0;
          }
      }
  }
  
  private triggerCookie = async () => {
      try {
          this.controller.enableIntelligentTrackingPrevention(true);
          console.log('当前状态：' + this.controller.isIntelligentTrackingPreventionEnabled())
      } catch (error) {
          let e:business_error.BusinessError = error as business_error.BusinessError;
          console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
          if(e.code == 801) {
            console.log(`The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
            this.errorCode = 801
          }
      }
      web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(true);
      web_webview.WebCookieManager.clearAllCookiesSync()
      this.controller.removeCache(true);
      this.isPageEnd = -1;
      this.controller.loadUrl($rawfile('cookieTrack.html'))
      await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
      let retryTime = 0
      while(this.traceHosts.length == 0 && retryTime < 5) {
          retryTime += 1
          this.controller.refresh()
          console.log('reset traceHosts')
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('获取url').key('webViewCookieTrackTriggerButton')
              .onClick(async () => {
                await waitForExist(()=>this.isReceive, this.emitKey, 0);
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                console.info('key==>' + this.emitKey);
                this.isReceive = -1;
                switch (this.emitKey) {
                    case 'emitWebViewCookieTrackEnableTrue': {
                        try {
                            this.controller.enableIntelligentTrackingPrevention(true)
                            this.isPageEnd = -1;
                            this.controller.refresh()
                            await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                            Utils.emitEvent(true,160070)
                            Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == true, 160070)
                        } catch (error) {
                            let e:business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            if(e.code == 801) {
                              console.log(`emitWebViewCookieTrackEnableTrue The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                              Utils.emitEvent(true, 160070)
                            } else {
                              Utils.emitEvent(false, 160070)
                            }
                        }
                      break;
                    }
                    case 'emitWebViewCookieTrackEnableFalse': {
                        try{
                            this.controller.enableIntelligentTrackingPrevention(false)
                          this.isPageEnd = -1;
                          this.controller.refresh()
                          await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                            Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == false, 160080)
                        } catch (error) {
                            let e:business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            if(e.code == 801) {
                               console.log(`emitWebViewCookieTrackEnableFalse The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                               Utils.emitEvent(true, 160080)
                            } else {
                               Utils.emitEvent(false, 160080)
                            }
                        }
                        break;
                    }
                    case 'emitCookieTrackClearTrackingPrevention': {
                        await this.triggerCookie()
                        if(this.errorCode == 801){
                            Utils.emitEvent(true, 160090)
                        } else {
                          let beforeTraceLength = this.traceHosts.length
                          console.log('this.traceHosts before: ' + this.traceHosts)
                          try {
                              web_webview.WebviewController.addIntelligentTrackingPreventionBypassingList(this.whiteUrlList)
                              this.isPageEnd = -1;
                              this.controller.refresh()
                              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                              console.log('this.traceHosts afterAdd: ' + this.traceHosts)
                              let afterAddTraceLength = this.traceHosts.length

                              web_webview.WebviewController.clearIntelligentTrackingPreventionBypassingList()
                              this.isPageEnd = -1;
                              this.controller.refresh()
                              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                              console.log('this.traceHosts afterClear: ' + this.traceHosts)
                              let afterClearTraceLength = this.traceHosts.length
                              Utils.emitEvent(beforeTraceLength >= 0 && beforeTraceLength <= afterAddTraceLength && afterClearTraceLength >= afterAddTraceLength, 1282)
                              Utils.emitEvent(true, 160090)
                          } catch (error) {
                            let e:business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            if(e.code == 801) {
                              console.log(`emitCookieTrackClearTrackingPrevention The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                              Utils.emitEvent(true, 160090)
                            } else {
                              Utils.emitEvent(false, 160090)
                            }
                          }
                        }

                        break;
                    }
                }
              })
              TextArea({
                  text: this.cookie,
                  controller: new TextAreaController()
              })
          }
          Web({ src: $rawfile('cookieTrack.html'), controller: this.controller })
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
              .onPageEnd((event)=>{
                console.info('[TAO]' + this.emitKey);
                this.isPageEnd = 0;
               })

      }
  }
}
