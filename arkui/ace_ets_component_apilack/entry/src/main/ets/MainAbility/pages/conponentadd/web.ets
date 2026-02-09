/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview';

let loadedUrl;

@Entry
@Component
struct Index {
  controllerhandler: ControllerHandler = new ControllerHandler();
  fullscreenexithandler ：FullScreenExitHandler = new FullScreenExitHandler();
  ConsoleMessage: ConsoleMessage = new ConsoleMessage();
  webconTextmenuparam: webConTextMenuParam = new webConTextMenuParam();
  controllerhader: ControllerHandler = new ControllerHandler();
  WebMessagePortController: WebMessagePort = new WebMessagePort();
  controllersss: WebAttribute = new WebAttribute();
  controllerE: WebMessageEvent = new WebMessageEvent();
  newcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  controller: WebController = new WebController()
  responseweb: WebResourceResponse = new WebResourceResponse()
  @State str: string = "emitStoreWebArchive"
  @State text: string = ""
  @State textRatio: number = 100
  @State zoomAccessValue: boolean = true
  handler: FullScreenExitHandler = null
  ports: WebMessagePort[]
  host: string = "www.spincast.org"
  realm: string = "protected example"
  username_password: string[]
  origin: string = "file:///"

  onPageShow() {
    let valueChangeEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj = {
    test: (res) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str) => {
      console.info("ets toString:" + String(str));
    },
    register: (res) => {
      Utils.emitEvent(res, 86);
      return "web222"
    }
  }

  aboutToAppear() {
    let abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .databaseAccess(true)
        .zoomAccess(this.zoomAccessValue)
        .textZoomRatio(this.textRatio)
        .onConsole((event) => {
          let level = event.message.getMessageLevel()
          let msg = event.message.getMessage()
          let lineNumber = event.message.getLineNumber().toString()
          let sourceId = event.message.getSourceId()
          console.log("lineNumber:" + lineNumber)
          setTimeout(() => {
            Utils.emitEvent(lineNumber, 420)
          }, 3000)
          setTimeout(() => {
            Utils.emitEvent(sourceId, 422)
          }, 3000)
          return false
        })
        .onSearchResultReceive(ret => {
          var searchResult = ret.activeMatchOrdinal.toString() +
          ret.numberOfMatches.toString()
          console.log("searchResult" + searchResult)
          setTimeout(() => {
            Utils.emitEvent(searchResult, 426)
          }, 3000)
        })
        .onFullScreenExit(() => {
          console.log("onFullScreenExit...");
          this.handler.constructor();
          this.handler.exitFullScreen();
        })
        .onFileSelectorShow((event) => {
          this.handler = event.handler;
        })
        .onSslErrorEventReceive((event) => {
          AlertDialog.show({
            title: 'onSslErrorEventReceive',
            message: 'text',
            primaryButton: {
              value: 'confirm',
              action: () => {
                event.handler.handleConfirm();
              }
            },
            secondaryButton: {
              value: 'cancel',
              action: () => {
                event.handler.handleCancel();
              }
            },
            cancel: () => {
              event.handler.handleCancel();
            }
          })
          return true;
        })
        .onFullScreenEnter((event) => {
          this.handler = event.handler;
        })
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitStoreWebArchive": {
              let webAsyncController = new web_webview.WebAsyncController(this.controller)
              webAsyncController.storeWebArchive("/data/storage/el2/base/", true, (filename) => {
                if (filename != null) {
                  Utils.emitEvent(filename, 400)
                }
              })
              break;
            }
            case "emitAllowGeolocation": {
              web_webview.GeolocationPermissions.allowGeolocation("file:///")
              web_webview.GeolocationPermissions.getAccessibleGeolocation(this.origin, (error, result) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = this.origin + ",error ," + JSON.stringify(error);
                  return;
                }
                this.text = this.origin + ", result: " + result;
                Utils.emitEvent(this.text, 402)
              })
              break;
            }
            case "emitDeleteGeolocation": {
              web_webview.GeolocationPermissions.deleteGeolocation("file:///")
              web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = origins + ",error ," + JSON.stringify(error);
                  return;
                }
                this.text = origins.join();
                Utils.emitEvent(this.text, 404)
              })
              break;
            }
            case "emitDeleteAllGeolocation": {
              web_webview.GeolocationPermissions.allowGeolocation("file:///")
              web_webview.GeolocationPermissions.deleteAllGeolocation()
              web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = origins + ",error ," + JSON.stringify(error);
                  return;
                }
                this.text = origins.join();
                Utils.emitEvent(this.text, 406)
              })
              break;
            }
            case "emitIsCookieAllowed": {
              web_webview.WebCookieManager.putAcceptCookieEnabled(false);
              setTimeout(() => {
                Utils.emitEvent(web_webview.WebCookieManager.isCookieAllowed(), 408)
              }, 3000)
              break;
            }
            case "emitSaveCookieAsync": {
              web_webview.WebCookieManager.saveCookieAsync(function (result) {
                Utils.emitEvent(result, 410)
              })
              break;
            }
            case "emitIsThirdPartyCookieAllowed": {
              web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
              setTimeout(() => {
                var result = web_webview.WebCookieManager.isThirdPartyCookieAllowed();
                console.log(result.toString());
                Utils.emitEvent(web_webview.WebCookieManager.isThirdPartyCookieAllowed(), 412)
              }, 3000)
              break;
            }
            case "emitExistCookie": {
              this.controller.getCookieManager().deleteEntireCookie();
              setTimeout(() => {
                var result = web_webview.WebCookieManager.existCookie();
                console.log(result.toString());
                Utils.emitEvent(result, 414)
              }, 3000)
              break;
            }
            case "emitOnConsole": {
              this.controller.runJavaScript({ script: "consoleTest()" })
              break;
            }
            case "emitLoaData": {
              this.controller.loadUrl({ url: "file:///data/storage/el1/bundle/phone/resources/rawfile/index.html" })
              setTimeout(() => {
                this.controller.loadData({
                  data: "<html><title>index</title></html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                })
              }, 3000)
              setTimeout(() => {
                this.text = this.controller.getTitle();
                Utils.emitEvent(this.text, 424)
              }, 4000)
              break;
            }
            case "emitZoomAccess": {
              this.zoomAccessValue = false
              this.controller.refresh()
              var origin = this.controller.getPageHeight()
              var zoomInCalled = false
              setTimeout(() => {
                this.newcontroller.zoomIn();
                if (this.controller.getPageHeight() > origin) {
                  zoomInCalled = true
                }
                console.log("final" + this.controller.getPageHeight())
                Utils.emitEvent(zoomInCalled, 428);
              }, 3000);
              break;
            }
            case "emitSaveHttpAuthCredentials": {
              web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "Stromgol", "Laroche");
              setTimeout(() => {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                Utils.emitEvent(result, 442)
              }, 3000)
              break;
            }
            case "emitGetHttpAuthCredentials": {
              this.username_password = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
              setTimeout(() => {
                let result = this.username_password[0];
                Utils.emitEvent(result, 444)
              }, 3000)
              break;
            }
            case "emitDeleteHttpAuthCredentials": {
              web_webview.WebDataBase.deleteHttpAuthCredentials();
              setTimeout(() => {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                Utils.emitEvent(result, 446)
              }, 3000)
              break;
            }


            case "emitdeleteAllData": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.deleteAllData()
                  let result = 'succesful'
                  Utils.emitEvent(result, 446)
                } catch (error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`)
                  let result = 'fail'
                  Utils.emitEvent(result, 446)
                }
              }, 3000)
              break;
            }
            case "emitdeleteOringin": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.deleteOrigin(this.origin);
                  let result = 'succesful'
                  Utils.emitEvent(result, 446)
                } catch (error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`)
                  let result = 'fail'
                  Utils.emitEvent(result, 446)
                }
              }, 3000)
              break;
            }
            case "emitgetOringin": {
              setTimeout(() => {
                web_webview.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.log('error: ' + error);
                    Utils.emitEvent(result, 446)
                  }
                  for (let i = 0; i < origins.length; i++) {
                    console.log('origin: ' + origins[i].origin);
                    console.log('usage: ' + origins[i].usage);
                    console.log('quota: ' + origins[i].quota);
                  }
                })
              }, 3000)
              break;

            }
            case "emitgetOringinQuota": {
              try {
                web_webview.WebStorage.getOriginQuota(this.origin);
                setTimeout(() => {
                  console.info('sucessful')
                  Utils.emitEvent('sucessful', 446)
                }, 3000)
              } catch (error) {
                console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                Utils.emitEvent('fail', 446)
              }
              break;
            }
            case "emitgetOringinUsage": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                    if (error) {
                      console.log('error: ' + error);
                      Utils.emitEvent(error, 446)
                    }
                    console.log('usage: ' + usage);
                    Utils.emitEvent(usage, 446)
                  })
                  Utils.emitEvent('sucessful', 446)
                } catch (error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)
              break;
            }
            case "emitAsyncControllerconstructor": {
              setTimeout(() => {
                let webAsyncController = new web_webview.WebAsyncController(this.controller)
                webAsyncController.constructor()
                Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitdeleteSessionCookie": {
              setTimeout(() => {
                web_webview.WebCookieManager.deleteSessionCookie()
                Utils.emitEvent('succesful', 410)
              }, 3000)
              break;
            }
            case "emitSearchAllAsync": {
              this.controller.loadUrl({ url: "file:///data/storage/el1/bundle/phone/resources/rawfile/index.html" })
              setTimeout(() => {
                this.newcontroller.searchAllAsync("首页");
              }, 3000)
              break;
            }
            case "emitclose": {
              setTimeout(() => {
                this.ports[1].close()
                Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitpostMessageEvent": {
              setTimeout(() => {
                try {
                  var msg = new WebMessageEvent();
                  msg.setData("post message from ets to html5");
                  this.ports[0].postMessageEvent(msg)
                  Utils.emitEvent('sucessful', 446)

                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              }, 3000)
              break;
            }
            case "emitonMessageEvent": {
              setTimeout(() => {
                try {
                  this.ports = this.controller.createWebMessagePorts();
                  this.ports[1].onMessageEvent((msg) => {
                    console.info("received message from html5, on message:" + msg);
                  })
                } catch (error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
                Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }

            case "newemitonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: string) => {
                  console.log("received message from html5, on message:" + result);
                  Utils.emitEvent('sucessful', 446)
                })
              }, 3000)
              break;
            }


            case "emitgetHitTestValue": {
              setTimeout(() => {
                try {
                  let hitValue = this.newcontroller.getHitTestValue();
                  console.info("hitType: " + hitValue.type);
                  console.info("extra: " + hitValue.extra);
                  Utils.emitEvent('sucessful', 446)
                } catch (error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitgetUserAgent": {
              setTimeout(() => {
                try {
                  let userAgent = this.newcontroller.getUserAgent();
                  console.log("userAgent: " + userAgent);
                  Utils.emitEvent('sucessful', 446)
                } catch (error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitcreateWebMessagePorts": {
              setTimeout(() => {
                try {
                  this.ports = this.controller.createWebMessagePorts();
                  Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              }, 3000)
              break;
            }
            case "emitclearMatches": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearMatches();
                  Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)
              break;
            }
            case "emitsearchNext": {
              setTimeout(() => {
                try {
                  this.newcontroller.searchNext(true);
                  Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitclearSslCache": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearSslCache();
                  Utils.emitEvent('succesful', 446)

                } catch (error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitclearClientAuthenticationCache": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearClientAuthenticationCache();
                  Utils.emitEvent('succesful', 446)
                } catch (error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitgetUrl": {
              try {
                setTimeout(() => {
                  this.newcontroller.getUrl();
                  Utils.emitEvent('succesful', 446)
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
              }

              break;
            }
            case "emitonFullScreenExitconstructor": {
              setTimeout(() => {
                this.handler.constructor()
                Utils.emitEvent('sucessful', 446)
              })
              break;
            }
          //      case "emitexitfullscreen":{
          //          setTimeout(()=>{
          //              this.handler.exitfullscreen()
          //              console.info('succesful')
          //              Utils.emitEvent('succesful',69)
          //          },3000)
          //          break;
          //      }
          //  ts  not exist

          //      case "emitpostMessageEvent1":{
          //          setTimeout(() => {
          //              try {
          //                  this.controllerE.postMessageEvent();
          //                  Utils.emitEvent('succesful',446)
          //                } catch (error) {
          //                  console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
          //            }
          //                  })
          //      }
          // ts   not exist

          //      case "emitpostMessage":{
          //          setTimeout(() => {
          //              try {
          //                  this.controllerE.postMessage();
          //                  Utils.emitEvent('succesful',446)
          //                } catch (error) {
          //                  console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
          //            }
          //                  })
          //      }
          // ts   not exist

            case "emitWebMessageEventconstructor": {
              setTimeout(() => {
                this.controllerE.constructor()
                Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitgetData": {
              setTimeout(() => {
                this.controllerE.getData()
                console.info('succesful')
                Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitsetData": {
              setTimeout(() => {
                this.controllerE.setData('1')
                console.info('succesful')
                Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitgetPorts": {
              setTimeout(() => {
                this.controllerE.getPorts()
                console.info('succesful')
                Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitsetPorts": {
              setTimeout(() => {
                this.ports = this.controller.createWebMessagePorts()
                this.controllerE.setPorts(this.ports)
                console.info('succesful')
                Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "webmessageportonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: string) => {
                  console.info("received message from html5, on message:" + result);
                  Utils.emitEvent('succesful', 69)

                }, 3000)
                break;
              }

            case "emitfullscreenexithandler": {
              setTimeout(() => {
                fullscreenexithandler.constructor()
                Utils.emitEvent('succesful', 69)

              }, 3000)
              break;
            }
            case "emitcontrollerhandler": {
              setTimeout(() => {
                controllerhandler.constructor()
                Utils.emitEvent('succesful', 69)

              }, 3000)
              break;
            }
            case "emitwebconTextmenuparam": {
              setTimeout(() => {
                webconTextmenuparam.constructor()
                Utils.emitEvent('succesful', 69)

              }, 3000)
              break;
            }

            case "emitportsonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: string) => {
                  console.log("received message from html5, on message:" + result);
                  Utils.emitEvent('succesful', 69)
                })
              }, 3000)
              break;
            }

            case "emitportsonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: string) => {
                  console.log("received message from html5, on message:" + result);
                  Utils.emitEvent('succesful', 69)
                })
              }, 3000)
              break;
            }
            case "emitportsonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: string) => {
                  console.log("received message from html5, on message:" + result);
                  Utils.emitEvent('succesful', 69)
                })
              }, 3000)
              break;
            }

          }

          default:
          console.info("can not match case")
        }
      }

      )
    }
  }
}
}
