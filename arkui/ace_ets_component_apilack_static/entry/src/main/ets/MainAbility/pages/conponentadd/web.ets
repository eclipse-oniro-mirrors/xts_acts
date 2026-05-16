'use static';
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test';
import Utils from '../../common/Utils';
import web_webview from '@ohos.web.webview';
import {
  $rawfile,
  AlertDialogParamWithButtons,
  Button,
  ClickEvent,
  Column,
  Component,
  ConsoleMessage,
  ControllerHandler,
  Entry,
  FullScreenExitHandler,
  Row,
  Text,
  Web,
  WebAttribute,
  WebContextMenuParam,
  WebResourceResponse,
  WebviewController
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';

let loadedUrl = '';

@Entry
@Component
struct Index {
  controllerhandler: ControllerHandler = new ControllerHandler();
  fullscreenexithandler: FullScreenExitHandler = new FullScreenExitHandler();
  ConsoleMessage: ConsoleMessage = new ConsoleMessage();
  webconTextmenuparam: WebContextMenuParam = new WebContextMenuParam();
  // controllerE: WebMessageEvent = new WebMessageEvent();
  newcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  controller: WebviewController = new WebviewController()
  @State str: string = "emitStoreWebArchive"
  @State text: string = ""
  @State textRatio: Int = 100
  @State zoomAccessValue: boolean = true
  handler: FullScreenExitHandler | null = null
  ports: Array<web_webview.WebMessagePort> = new Array<web_webview.WebMessagePort>()
  host: string = "www.spincast.org"
  realm: string = "protected example"
  username_password: Array<string> = new Array<string>()
  origin: string = "file:///"

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  build() {
    Column() {
      Web({ src: "", controller: this.controller })
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
            // Utils.emitEvent(lineNumber, 420)
          }, 3000)
          setTimeout(() => {
            // Utils.emitEvent(sourceId, 422)
          }, 3000)
          return false
        })
        .onSearchResultReceive(ret => {
          let searchResult = ret.activeMatchOrdinal.toString() +
          ret.numberOfMatches.toString()
          console.log("searchResult" + searchResult)
          setTimeout(() => {
            // Utils.emitEvent(searchResult, 426)
          }, 3000)
        })
        .onFullScreenExit(() => {
          console.log("onFullScreenExit...");
          this.handler = new FullScreenExitHandler();
          this.handler!.exitFullScreen();
        })
        .onShowFileSelector((): boolean => {
          // this.handler = event.handler;
          return true
        })
        .onSslErrorEventReceive((event) => {
          this.getUIContext().showAlertDialog({
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
          } as AlertDialogParamWithButtons)
        })
        .onFullScreenEnter((event) => {
          this.handler = event.handler;
        })
      Row() {
        Button("web click").key('webcomponent').onClick((event: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitStoreWebArchive": {
              let webAsyncController = this.controller
              webAsyncController.storeWebArchive("/data/storage/el2/base/", true, (filename) => {
                if (filename != null) {
                  // Utils.emitEvent(filename, 400)
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
                }
                this.text = this.origin + ", result: " + result;
                // Utils.emitEvent(this.text, 402)
              })
              break;
            }
            case "emitDeleteGeolocation": {
              web_webview.GeolocationPermissions.deleteGeolocation("file:///")
              web_webview.GeolocationPermissions.getStoredGeolocation((error, origins) => {
                if (error) {
                  console.log('error:' + JSON.stringify(error));
                  this.text = origins + ",error ," + JSON.stringify(error);
                }
                this.text = origins!.join();
                // Utils.emitEvent(this.text, 404)
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
                }
                this.text = origins!.join();
                // Utils.emitEvent(this.text, 406)
              })
              break;
            }
            case "emitIsCookieAllowed": {
              web_webview.WebCookieManager.putAcceptCookieEnabled(false);
              setTimeout(() => {
                // Utils.emitEvent(web_webview.WebCookieManager.isCookieAllowed(), 408)
              }, 3000)
              break;
            }
            case "emitSaveCookieAsync": {
              web_webview.WebCookieManager.saveCookieAsync((result) => {
                // Utils.emitEvent(result, 410)
              })
              break;
            }
            case "emitIsThirdPartyCookieAllowed": {
              web_webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
              setTimeout(() => {
                let result = web_webview.WebCookieManager.isThirdPartyCookieAllowed();
                console.log(result.toString());
                // Utils.emitEvent(web_webview.WebCookieManager.isThirdPartyCookieAllowed(), 412)
              }, 3000)
              break;
            }
            case "emitExistCookie": {
              web_webview.WebCookieManager.clearAllCookiesSync();
              setTimeout(() => {
                let result = web_webview.WebCookieManager.existCookie();
                console.log(result.toString());
                // Utils.emitEvent(result, 414)
              }, 3000)
              break;
            }
            case "emitOnConsole": {
              this.controller.runJavaScript('consoleTest()')
              break;
            }
            case "emitLoaData": {
              this.controller.loadUrl("file:///data/storage/el1/bundle/phone/resources/rawfile/index.html")
              setTimeout(() => {
                this.controller.loadData(
                  "<html><title>index</title></html>",
                  "text/html",
                  "UTF-8"
                )
              }, 3000)
              setTimeout(() => {
                this.text = this.controller.getTitle();
                // Utils.emitEvent(this.text, 424)
              }, 4000)
              break;
            }
            case "emitZoomAccess": {
              this.zoomAccessValue = false
              this.controller.refresh()
              let origin = this.controller.getPageHeight()
              let zoomInCalled = false
              setTimeout(() => {
                this.newcontroller.zoomIn();
                if (this.controller.getPageHeight() > origin) {
                  zoomInCalled = true
                }
                console.log("final" + this.controller.getPageHeight())
                // Utils.emitEvent(zoomInCalled, 428);
              }, 3000);
              break;
            }
            case "emitSaveHttpAuthCredentials": {
              web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "Stromgol", "Laroche");
              setTimeout(() => {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                // Utils.emitEvent(result, 442)
              }, 3000)
              break;
            }
            case "emitGetHttpAuthCredentials": {
              this.username_password = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
              setTimeout(() => {
                let result = this.username_password[0];
                // Utils.emitEvent(result, 444)
              }, 3000)
              break;
            }
            case "emitDeleteHttpAuthCredentials": {
              web_webview.WebDataBase.deleteHttpAuthCredentials();
              setTimeout(() => {
                let result = web_webview.WebDataBase.existHttpAuthCredentials();
                // Utils.emitEvent(result, 446)
              }, 3000)
              break;
            }


            case "emitdeleteAllData": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.deleteAllData()
                  let result = 'succesful'
                  //Utils.emitEvent(result, 446)
                } catch (error: Error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`)
                  let result = 'fail'
                  //Utils.emitEvent(result, 446)
                }
              }, 3000)
              break;
            }
            case "emitdeleteOringin": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.deleteOrigin(this.origin);
                  let result = 'succesful'
                  //Utils.emitEvent(result, 446)
                } catch (error: Error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`)
                  let result = 'fail'
                  //Utils.emitEvent(result, 446)
                }
              }, 3000)
              break;
            }
            case "emitgetOringin": {
              setTimeout(() => {
                web_webview.WebStorage.getOrigins((error, origins) => {
                  if (error) {
                    console.log('error: ' + error);
                    //Utils.emitEvent(result, 446)
                  }
                  for (let i = 0; i < origins!.length; i++) {
                    console.log('origin: ' + origins![i].origin);
                    console.log('usage: ' + origins![i].usage);
                    console.log('quota: ' + origins![i].quota);
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
                  //Utils.emitEvent('sucessful', 446)
                }, 3000)
              } catch (error: Error) {
                console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                // Utils.emitEvent('fail', 446)
              }
              break;
            }
            case "emitgetOringinUsage": {
              setTimeout(() => {
                try {
                  web_webview.WebStorage.getOriginUsage(this.origin, (error, usage) => {
                    if (error) {
                      console.log('error: ' + error);
                      // Utils.emitEvent(error, 446)
                    }
                    console.log('usage: ' + usage);
                    // Utils.emitEvent(usage, 446)
                  })
                  //Utils.emitEvent('sucessful', 446)
                } catch (error: Error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)
              break;
            }
            case "emitAsyncControllerconstructor": {
              setTimeout(() => {
                let webAsyncController = this.controller
                // webAsyncController.constructor()
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitdeleteSessionCookie": {
              setTimeout(() => {
                web_webview.WebCookieManager.clearSessionCookieSync()
                // Utils.emitEvent('succesful', 410)
              }, 3000)
              break;
            }
            case "emitSearchAllAsync": {
              this.controller.loadUrl("file:///data/storage/el1/bundle/phone/resources/rawfile/index.html")
              setTimeout(() => {
                this.newcontroller.searchAllAsync("首页");
              }, 3000)
              break;
            }
            case "emitclose": {
              setTimeout(() => {
                this.ports[1].close()
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitpostMessageEvent": {
              setTimeout(() => {
                try {
                  // let msg = new WebMessageEvent();
                  // msg.setData("post message from ets to html5");
                  // this.ports[0].postMessageEvent(msg)
                  //Utils.emitEvent('sucessful', 446)

                } catch (error: Error) {
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
                } catch (error: Error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }

            case "newemitonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: ArrayBuffer | String) => {
                  console.log("received message from html5, on message:" + result);
                  // Utils.emitEvent('sucessful', 446)
                })
              }, 3000)
              break;
            }


            case "emitgetHitTestValue": {
              setTimeout(() => {
                try {
                  let hitValue = this.newcontroller.getLastHitTest();
                  console.info("hitType: " + hitValue.type);
                  console.info("extra: " + hitValue.extra);
                  //Utils.emitEvent('sucessful', 446)
                } catch (error: Error) {
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
                  //Utils.emitEvent('sucessful', 446)
                } catch (error: Error) {
                  console.info(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitcreateWebMessagePorts": {
              setTimeout(() => {
                try {
                  this.ports = this.controller.createWebMessagePorts();
                  // Utils.emitEvent('succesful', 446)
                } catch (error: Error) {
                  console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              }, 3000)
              break;
            }
            case "emitclearMatches": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearMatches();
                  // Utils.emitEvent('succesful', 446)
                } catch (error: Error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)
              break;
            }
            case "emitsearchNext": {
              setTimeout(() => {
                try {
                  this.newcontroller.searchNext(true);
                  // Utils.emitEvent('succesful', 446)
                } catch (error: Error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitclearSslCache": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearSslCache();
                  // Utils.emitEvent('succesful', 446)

                } catch (error: Error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitclearClientAuthenticationCache": {
              setTimeout(() => {
                try {
                  this.newcontroller.clearClientAuthenticationCache();
                  // Utils.emitEvent('succesful', 446)
                } catch (error: Error) {
                  console.error(`Errorcode: ${(error as BusinessError)?.code}, Message: ${(error as Error)?.message}`);
                }
              }, 3000)

              break;
            }
            case "emitgetUrl": {
              try {
                setTimeout(() => {
                  this.newcontroller.getUrl();
                  // Utils.emitEvent('succesful', 446)
                }, 3000)
              } catch (error: Error) {
                console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
              }

              break;
            }
            case "emitonFullScreenExitconstructor": {
              setTimeout(() => {
                this.handler = new FullScreenExitHandler()
                // Utils.emitEvent('sucessful', 446)
              })
              break;
            }
            case "emitexitfullscreen": {
              setTimeout(() => {
                this.handler!.exitFullScreen()
                console.info('succesful')
                // Utils.emitEvent('succesful',69)
              }, 3000)
              break;
            }
            // ts  not exist

            case "emitpostMessageEvent1": {
              setTimeout(() => {
                try {
                  // this.controllerE.postMessageEvent();
                  this.ports = this.controller.createWebMessagePorts()
                  this.ports[1].postMessageEvent('')
                  // Utils.emitEvent('succesful',446)
                } catch (error: Error) {
                  console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              })
            }
            // ts   not exist

            case "emitpostMessage": {
              setTimeout(() => {
                try {
                  this.controller.postMessage('', this.ports, 'www.baidu.com');
                  // Utils.emitEvent('succesful',446)
                } catch (error: Error) {
                  console.error(`ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
                }
              })
            }
            // ts   not exist

            case "emitWebMessageEventconstructor": {
              setTimeout(() => {
                // this.controllerE.constructor()
                // Utils.emitEvent('sucessful', 446)
              }, 3000)
              break;
            }
            case "emitgetData": {
              setTimeout(() => {
                // this.controller.createWebMessage().getData()
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitsetData": {
              setTimeout(() => {
                // this.controller.createWebMessage().setData('1')
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitgetPorts": {
              setTimeout(() => {
                // this.controllerE.getPorts()
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "emitsetPorts": {
              setTimeout(() => {
                // this.ports = this.controller.createWebMessagePorts()
                // this.controllerE.setPorts(this.ports)
                console.info('succesful')
                // Utils.emitEvent('succesful', 69)
              }, 3000)
              break;
            }
            case "webmessageportonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: ArrayBuffer | string) => {
                  console.info("received message from html5, on message:" + result);
                  // Utils.emitEvent('succesful', 69)

                })
              }, 3000)
              break;
            }

            case "emitfullscreenexithandler": {
              setTimeout(() => {
                this.fullscreenexithandler = new FullScreenExitHandler()
                // Utils.emitEvent('succesful', 69)

              }, 3000)
              break;
            }
            case "emitcontrollerhandler": {
              setTimeout(() => {
                this.controllerhandler = new ControllerHandler()
                // Utils.emitEvent('succesful', 69)

              }, 3000)
              break;
            }
            case "emitwebconTextmenuparam": {
              setTimeout(() => {
                // this.webconTextmenuparam.constructor()
                // Utils.emitEvent('succesful', 69)

              }, 3000)
              break;
            }

            case "emitportsonMessageEvent": {
              setTimeout(() => {
                this.ports[0].onMessageEvent((result: ArrayBuffer | string) => {
                  console.log("received message from html5, on message:" + result);
                  // Utils.emitEvent('succesful', 69)
                })
              }, 3000)
              break;
            }

            default:
              console.info("can not match case")
          }
        })
      }
    }
  }

  private valueChangeCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      console.info("web page valueChangeCallBack");
      if (eventData != null && eventData.data != null) {
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
        const data = eventData.data as Record<String,RecordData>
        if (data['ACTION'] != null) {
          this.str = data['ACTION'] as string
        }
      }
    }
  // private jsObj = {
  //   test: (res) => {
  //     // Utils.emitEvent(res, 102);
  //   },
  //   toString: (str) => {
  //     console.info("ets toString:" + String(str));
  //   },
  //   register: (res) => {
  //     // Utils.emitEvent(res, 86);
  //     return "web222"
  //   }
  // }
}
