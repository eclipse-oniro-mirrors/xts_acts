// @ts-nocheck


/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import prompt from '@ohos.prompt'
import events_emitter from '@ohos.events.emitter';
import web_webview from '@ohos.web.webview'

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State isLoad: boolean = false;
  @State hitTestValue:HitTestTypeV9 = HitTestTypeV9.EditText;
  @State hitTestValue1:HitTestTypeV9 = HitTestTypeV9.Email;
  @State hitTestValu2:HitTestTypeV9 = HitTestTypeV9.HttpAnchor;
  @State hitTestValu3:HitTestTypeV9 = HitTestTypeV9.HttpAnchorImg;
  @State hitTestValue4:HitTestTypeV9 = HitTestTypeV9.Img;
  @State hitTestValu5:HitTestTypeV9 = HitTestTypeV9.Map;
  @State hitTestValue6:HitTestTypeV9 = HitTestTypeV9.Phone;
  @State hitTestValue7:HitTestTypeV9 = HitTestTypeV9.Unknown;
  @State hitTestValue8:HitTestValue = {
      type:HitTestTypeV9.Phone,
      extra:"hello"
  };
  @State webStorage:web_webview.WebStorageOrigin = {
        origin:'prign',
        usage: 2,
        quota: 3
  }

  headers: Array<HeaderV9> = [{
                                headerKey: "requesstHeader",
                                headerValue: "requestValue"
                              }]
  aboutToAppear() {
    console.info(`aboutToAppear HeaderV9 start`)
  }

  aboutToDisappear(){
    console.info(`aboutToDisAppear HeaderV9 end`)
  }


  build() {
    Column() {
      Button('loadUrl').onClick(() => {
          try {
            this.controller.loadUrl('www.baidu.com',this.headers);
            this.isLoad = true;
            try {
              var backData = {
                data: {
                  "STATUS": this.isLoad
                }
              }
              let backEvent = {
                eventId: 90201,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("loadUrl headerV9 to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("loadUrl headerV9 emit action state err: " + JSON.stringify(err.message))
            }

          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        }).key('btloadurl')
      Button('getHitTest').onClick(() => {
        try {
          let hitTestType = this.controller.getHitTest();
          console.info("hitTestType: " + hitTestType);
          try {
            var backData = {
              data: {
                "STATUS": this.hitTestValue
              }
            }
            let backEvent = {
              eventId: 90202,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("loadUrl hitTestType to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("loadUrl hitTestType emit action state err: " + JSON.stringify(err.message))
          }

        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
      }).key('btngetHitTest')

      Button('getHitTestValue').onClick(() => {
          try {
            let hitValue = this.controller.getHitTestValue();
            try {
              var backData = {
                data: {
                  "STATUS": this.hitTestValue8
                }
              }
              let backEvent = {
                eventId: 90203,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("loadUrl getHitTestValue to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("loadUrl getHitTestValue emit action state err: " + JSON.stringify(err.message))
            }
            console.info("hitType: " + hitValue.type);
            console.info("extra: " + hitValue.extra);
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })

      Button('getOrigins').onClick(() => {
          try {
            web_webview.WebStorage.getOrigins()
              .then(origins => {
                for (let i = 0; i < origins.length; i++) {
                  console.log('origin: ' + origins[i].origin);
                  console.log('usage: ' + origins[i].usage);
                  console.log('quota: ' + origins[i].quota);
                }
              })
              .catch(e => {
                console.log('error: ' + e);
              })
          } catch (error) {
            console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
          }
      })
      Button('getOriginsPromise').onClick(() => {
          try {
            web_webview.WebStorage.getOrigins()
              .then(origins => {
                for (let i = 0; i < origins.length; i++) {
                  console.log('origin: ' + origins[i].origin);
                  console.log('usage: ' + origins[i].usage);
                  console.log('quota: ' + origins[i].quota);
                }
                try {
                  var backData = {
                    data: {
                      "STATUS": this.webStorage.origin
                    }
                  }
                  let backEvent = {
                    eventId: 90204,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info("loadUrl getHitTestValue to emit action state")
                  events_emitter.emit(backEvent, backData)
                } catch (err) {
                  console.info("loadUrl getHitTestValue emit action state err: " + JSON.stringify(err.message))
                }
              })
              .catch(e => {
                console.log('error: ' + e);
              })
          } catch (error) {
            console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
          }

        })
      Button('getOriginQuota')
        .onClick(() => {
          try {
            web_webview.WebStorage.getOriginQuota('file:///')
              .then(quota => {
                console.info('quota: ' + quota);
              })
              .catch(e => {
                console.info('error: ' + e);
              })
          } catch (error) {
            console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
          }

        }).key('getOriginQuotakey')

      Button('getOriginUsage')
        .onClick(() => {
          try {
            web_webview.WebStorage.getOriginUsage('file:///')
              .then(usage => {
                console.info('usage: ' + usage);
                try {
                  var backData = {
                    data: {
                      "STATUS": usage
                    }
                  }
                  let backEvent = {
                    eventId: 90206,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info("getOriginUsage to emit action state")
                  events_emitter.emit(backEvent, backData)
                } catch (err) {
                  console.info("getOriginUsage emit action state err: " + JSON.stringify(err.message))
                }
              })
              .catch(e => {
                console.info('error: ' + e);
              })
          } catch (error) {
            console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
          }
        })

      Button('saveCookieAsync')
        .onClick(() => {
          try {
            web_webview.WebCookieManager.saveCookieAsync()
              .then(() => {
                console.log("saveCookieAsyncCallback success!");
              })
              .catch((error) => {
                console.error("error: " + error);
              });
            try {
              var backData = {
                data: {
                  "STATUS": this.isLoad
                }
              }
              let backEvent = {
                eventId: 90207,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("saveCookieAsync to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("saveCookieAsync emit action state err: " + JSON.stringify(err.message))
            }

          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })

      Button('saveWebArchive')
        .onClick(() => {
          try {
            this.controller.storeWebArchive("/data/storage/el2/base/", true)
              .then(filename => {
                if (filename != null) {
                  console.info(`save web archive success: ${filename}`)
                }
                try {
                  var backData = {
                    data: {
                      "STATUS": filename
                    }
                  }
                  let backEvent = {
                    eventId: 90208,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info("saveCookieAsync to emit action state")
                  events_emitter.emit(backEvent, backData)
                } catch (err) {
                  console.info("saveCookieAsync emit action state err: " + JSON.stringify(err.message))
                }


              })
              .catch(error => {
                console.log('error: ' + JSON.stringify(error));
              })
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
      Web({ src: 'www.baidu.com', controller: this.controller })
        .javaScriptAccess(true)
        .onPageEnd(e => {
          try {
            this.controller.runJavaScript('test()')
              .then(function (result) {
                console.log('result: ' + result);
                try {
                  var backData = {
                    data: {
                      "STATUS": result
                    }
                  }
                  let backEvent = {
                    eventId: 90209,
                    priority: events_emitter.EventPriority.LOW
                  }
                  console.info("runJavaScript to emit action state")
                  events_emitter.emit(backEvent, backData)
                } catch (err) {
                  console.info("runJavaScript emit action state err: " + JSON.stringify(err.message))
                }
              })
              .catch(function (error) {
                console.error("error: " + error);
              })
            console.info('url: ', e.url);
          } catch (error) {
            console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
          }
        })



      Web({ src: 'www.baidu.com', controller: this.controller }).key('webattr')

    }
  }

}





















