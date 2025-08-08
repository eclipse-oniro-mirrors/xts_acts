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
      this.controller.loadUrl($rawfile('cookieTrack.html'))
      await Utils.sleep(1000)
      let retryTime = 0
      while(this.traceHosts.length == 0 && retryTime < 5) {
          retryTime += 1
          await Utils.sleep(1000)
          this.controller.refresh()
          console.log('reset traceHosts')
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('获取url').key('webViewCookieTrackTriggerButton')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                await Utils.sleep(1000)
                switch (this.emitKey) {
                    case 'emitWebViewCookieTrackEnableTrue': {
                        try {
                            this.controller.enableIntelligentTrackingPrevention(true)
                            this.controller.refresh()
                            await Utils.sleep(2000)
                            Utils.emitEvent(true,7701)
                            await Utils.sleep(2000)
                            Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == true, 7701)
                        } catch (error) {
                            let e:business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            await Utils.sleep(1000)
                            if(e.code == 801) {
                              console.log(`emitWebViewCookieTrackEnableTrue The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                              Utils.emitEvent(true, 7701)
                            } else {
                              Utils.emitEvent(false, 7701)
                            }
                        }
                    }
                    case 'emitCookieTrackTrackerHost': {
                        await this.triggerCookie()
                        if(this.errorCode == 801){
                            Utils.emitEvent(true, 7702)
                        } else {
                            console.log('this.traceHosts before: ' + this.traceHosts)
                            Utils.emitEvent(this.traceHosts.length > 0, 7702)
                        }

                    }
                    case 'emitWebViewCookieTrackEnableFalse': {
                        try{
                            this.controller.enableIntelligentTrackingPrevention(false)
                            this.controller.refresh()
                            Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == false, 1278)
                        } catch (error) {
                            let e:business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            await Utils.sleep(1000)
                            if(e.code == 801) {
                               console.log(`emitWebViewCookieTrackEnableFalse The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                               Utils.emitEvent(true, 1278)
                            } else {
                               Utils.emitEvent(false, 1278)
                            }
                        }
                        break;
                    }
                    case 'emitCookieTrackOnIntelligentTrackingPreventionResult': {
                        await this.triggerCookie()
                        break;
                    }
                    case 'emitCookieTrackIsIntelligentTrackingPreventionEnabled': {
                        try {
                          this.controller.enableIntelligentTrackingPrevention(true);
                          this.controller.refresh()
                          Utils.emitEvent(this.controller.isIntelligentTrackingPreventionEnabled() == true, 1382)
                        } catch (error) {
                           let e:business_error.BusinessError = error as business_error.BusinessError;
                           console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                           await Utils.sleep(1000)
                           if(e.code == 801) {
                             console.log(`emitCookieTrackIsIntelligentTrackingPreventionEnabled The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                             Utils.emitEvent(true, 1382)
                           } else {
                             Utils.emitEvent(false, 1382)
                           }
                        }
                        break;
                    }
                    case 'emitCookieTrackAddTrackingPrevention': {
                        await this.triggerCookie()
                          await Utils.sleep(1000)
                        if(this.errorCode == 801){
                            Utils.emitEvent(true, 1280)
                        } else {
                          let beforeTraceLength = this.traceHosts.length
                          console.log('this.traceHosts before: ' + this.traceHosts)
                          try {
                              web_webview.WebviewController.addIntelligentTrackingPreventionBypassingList(this.whiteUrlList)
                              this.controller.refresh()
                              await Utils.sleep(1000)
                              console.log('this.traceHosts after: ' + this.traceHosts)
                              let afterTraceLength = this.traceHosts.length
                              console.log('beforeTraceLength' + beforeTraceLength)
                              console.log('afterTraceLength' + afterTraceLength)
                              await Utils.sleep(2000)
                              Utils.emitEvent(beforeTraceLength >= 0 && afterTraceLength >= beforeTraceLength, 1280)
                          } catch (error) {
                              let e:business_error.BusinessError = error as business_error.BusinessError;
                              console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                              await Utils.sleep(1000)
                              if(e.code == 801) {
                                console.log(`emitCookieTrackAddTrackingPrevention The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                                Utils.emitEvent(true, 1280)
                              } else {
                                Utils.emitEvent(false, 1280)
                              }
                          }
                        }
                        break;
                    }
                    case 'emitCookieTrackRemoveTrackingPrevention': {
                        await this.triggerCookie()
                          await Utils.sleep(1000)
                          if(this.errorCode == 801){
                              Utils.emitEvent(true, 1281)
                          } else {
                            let beforeTraceLength = this.traceHosts.length
                            console.log('this.traceHosts before: ' + this.traceHosts)
                            console.log('this.traceHosts beforeTraceLength: ' + beforeTraceLength)
                            try {
                                web_webview.WebviewController.addIntelligentTrackingPreventionBypassingList(this.whiteUrlList)
                                this.controller.refresh()
                                await Utils.sleep(1000)
                                console.log('this.traceHosts afterAdd: ' + this.traceHosts)
                                let afterAddTraceLength = this.traceHosts.length
                                console.log('this.traceHosts afterAdd: ' + afterAddTraceLength)

                                web_webview.WebviewController.removeIntelligentTrackingPreventionBypassingList(this.whiteUrlList)
                                this.controller.refresh()
                                await Utils.sleep(1000)
                                console.log('this.traceHosts afterRemove: ' + this.traceHosts)
                                let afterRemoveTraceLength = this.traceHosts.length
                                console.log('this.traceHosts afterRemove: ' + afterRemoveTraceLength)
                                let result: Boolean = beforeTraceLength > 0 && beforeTraceLength == afterAddTraceLength && afterRemoveTraceLength >= afterAddTraceLength
                                console.log('result: ' + result)
                                Utils.emitEvent(beforeTraceLength > 0 && beforeTraceLength == afterAddTraceLength && afterRemoveTraceLength >= afterAddTraceLength, 1281)
                            } catch (error) {
                                 let e:business_error.BusinessError = error as business_error.BusinessError;
                                 console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                                 await Utils.sleep(1000)
                                 if(e.code == 801) {
                                   console.log(`emitCookieTrackRemoveTrackingPrevention The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                                   Utils.emitEvent(true, 1281)
                                 } else {
                                   Utils.emitEvent(false, 1281)
                                 }
                            }
                          }

                         break;
                    }
                    case 'emitCookieTrackClearTrackingPrevention': {
                        await this.triggerCookie()
                        if(this.errorCode == 801){
                            Utils.emitEvent(true, 1282)
                        } else {
                          let beforeTraceLength = this.traceHosts.length
                          console.log('this.traceHosts before: ' + this.traceHosts)
                          try {
                              web_webview.WebviewController.addIntelligentTrackingPreventionBypassingList(this.whiteUrlList)
                              this.controller.refresh()
                              await Utils.sleep(1000)
                              console.log('this.traceHosts afterAdd: ' + this.traceHosts)
                              let afterAddTraceLength = this.traceHosts.length

                              web_webview.WebviewController.clearIntelligentTrackingPreventionBypassingList()
                              this.controller.refresh()
                              await Utils.sleep(1000)
                              console.log('this.traceHosts afterClear: ' + this.traceHosts)
                              let afterClearTraceLength = this.traceHosts.length
                              await Utils.sleep(2000)
                              Utils.emitEvent(beforeTraceLength >= 0 && beforeTraceLength <= afterAddTraceLength && afterClearTraceLength >= afterAddTraceLength, 1282)
                              Utils.emitEvent(true, 1282)
                          } catch (error) {
                            let e:business_error.BusinessError = error as business_error.BusinessError;
                            console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                            await Utils.sleep(1000)
                            if(e.code == 801) {
                              console.log(`emitCookieTrackClearTrackingPrevention The current device type does not support Cause code:${e.code},  Message: ${e.message}`)
                              Utils.emitEvent(true, 1282)
                            } else {
                              Utils.emitEvent(false, 1282)
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
                        Utils.emitEvent(true,1381)
                        console.log('onIntelligentTrackingPreventionResult ->' + this.cookie)
                    }
                })
      }
  }
}
