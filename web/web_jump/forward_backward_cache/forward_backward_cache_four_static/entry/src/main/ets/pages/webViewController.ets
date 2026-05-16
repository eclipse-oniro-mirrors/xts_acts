/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Row, Button, ClickEvent, Web, WebBypassVsyncCondition } from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement"
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import Utils from '../../src/test/Util.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';
import { Callback, RecordData } from '@ohos.base'
import events_emitter from '@ohos.events.emitter';
import { webview } from '@kit.ArkWeb';
import { UIContext, Router } from '@ohos.arkui.UIContext';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Index {
  stringObj: StringFields  = new StringFields ();
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = "emitFetchCookieSync";
  @State cookieResult: string = "";
  @State no_error: string = 'no error happened';
  @State userAgent: string = "";
  @State errorCode: int = 0;
  @State condition: WebBypassVsyncCondition = WebBypassVsyncCondition.NONE;

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
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick((e: ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'testFetchCookieIncognitoError008': {
              try {
                web_webview.WebCookieManager.configCookie('', '', true, true);
                Utils.emitEvent(this.no_error, 123217);
              } catch (error) {
                const actualCode = String(error.code);
                const actualMsg = String(error.message);
                const actualResult = `${actualCode}${actualMsg}`;
                console.error(`actualResult: ${actualResult}`);
                if (error.code == 401){
                  Utils.emitEvent(actualResult, 123217);
                } else {
                  Utils.emitEvent(actualResult, 123217);
                }
                web_webview.WebCookieManager.clearAllCookies();
              }
              break;
            }

            case "emitFetchCookiePromise001": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookie('', "a=d", (error) => {
                    if (error) {
                      console.error("configCookie error: " + JSON.stringify(error));
                    }
                  });
                }, 2000);
                setTimeout(() => {
                  web_webview.WebCookieManager.fetchCookie('', true)
                    .then((cookie: string) => {
                      console.error("emitFetchCookiePromise cookie = " + cookie);
                      Utils.emitEvent(cookie, 131);
                    })
                    .catch((error) => {
                      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                      Utils.emitEvent(String(error.code) + String(error.message), 131);
                    });
                }, 2000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitFetchCookiePromise002": {
              try {
                setTimeout(() => {
                  web_webview.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                    if (error) {
                      console.log("configCookie error: " + JSON.stringify(error));
                    }
                  });
                }, 2000);
                setTimeout(() => {
                  web_webview.WebCookieManager.fetchCookie('https://www.example.com', false)
                    .then((cookie: string) => {
                      console.log("emitFetchCookiePromise cookie = " + cookie);
                      Utils.emitEvent(cookie, 132);
                    })
                    .catch((error) => {
                      console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                      Utils.emitEvent(String(error.code) + String(error.message), 132);
                    });
                }, 2000);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testSaveCookieAsync001': {
              try {
                web_webview.WebCookieManager.saveCookieAsync((error) => {
                  if (error) {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  }
                  Utils.emitEvent('done', 134760)
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'testSaveCookieAsync002': {
              try {
                web_webview.WebCookieManager.saveCookieAsync()
                  .then(() => {
                    console.log('saveCookieAsyncCallback success!');
                    Utils.emitEvent('done', 134761)
                  })
                  .catch((error) => {
                    console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
                  });
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case "emitConfigCookieCallback": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=f", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                this.cookieResult = web_webview.WebCookieManager.fetchCookieSync('https://www.example.com');
                console.log("emitConfigCookieCallback cookie = " + this.cookieResult);
                Utils.emitEvent(this.cookieResult, 134);
                web_webview.WebCookieManager.clearAllCookies();
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitFetchCookieCallback": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=c", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                web_webview.WebCookieManager.fetchCookie('https://www.example.com', (error, cookie) => {
                  if (error) {
                    console.log('error: ' + JSON.stringify(error));
                    return;
                  }
                  if (cookie) {
                    console.log('fetchCookie cookie = ' + cookie);
                    Utils.emitEvent(cookie, 111)
                    web_webview.WebCookieManager.clearAllCookies();
                  }
                })
                }, 3000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitFetchCookiePromise": {
              try {
                setTimeout(() => {
                web_webview.WebCookieManager.configCookie('https://www.example.com', "a=d", (error) => {
                  if (error) {
                    console.log("error: " + JSON.stringify(error));
                  }
                })
                }, 2000)
                setTimeout(() => {
                web_webview.WebCookieManager.fetchCookie('https://www.example.com')
                  .then((cookie:string) => {
                    console.log("emitFetchCookiePromise cookie = " + cookie);
                    Utils.emitEvent(cookie, 130)
                  })
                }, 4000)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webViewController1' })
              console.log('push URL success')
            }
          }
        })
      }

      Web({ src: 'https://www.example.com', controller: this.controller })
        .webFixedFont('monospace')
        .bypassVsyncCondition(this.condition)
        .onControllerAttached(() => {
          try {
            let arrayVersions: Array<webview.UserAgentBrandVersion> = new Array<webview.UserAgentBrandVersion>;
            let brandVersion:webview.UserAgentBrandVersion = new webview.UserAgentBrandVersion();
            brandVersion.setBrand("brand OpenHarmony");
            brandVersion.setMajorVersion("major version 1.0");
            brandVersion.setFullVersion("blank full version 1.0");
            arrayVersions.push(brandVersion);
            console.info("arrayVersions initialized:", arrayVersions);
            this.userAgent = this.controller.getUserAgent();
            let metadata = this.controller.getUserAgentMetadata(this.userAgent);
            let versionList = metadata.getBrandVersionList();
            for(let i = 0; i < versionList.length; i++) {
              console.info("Brand:" + versionList[i].getBrand());
              console.info("MajorVersion " + versionList[i].getMajorVersion());
              console.info("FullVersion " + versionList[i].getFullVersion());
            }
            console.info("User Agent retrieved:", this.userAgent);
            let metaData: webview.UserAgentMetadata = new webview.UserAgentMetadata();
            console.info("User Agent Metadata initialized:", metaData);
            metaData.setBrandVersionList(arrayVersions);
            console.info("Brand Version List set:", arrayVersions);
            metaData.setFormFactors([webview.UserAgentFormFactor.AUTOMOTIVE]);
            metaData.setArchitecture("arch OpenHarmony");
            metaData.setBitness("bitness 64");
            metaData.setFullVersion("full version OpenHarmony");
            metaData.setMobile(true);
            let architecture = metaData.getArchitecture()
            let bitness = metaData.getBitness()
            console.info('[WebView] architecture=' + architecture)
            console.info('[WebView] bitness=' + bitness)
            console.info("FullVersion:" + metaData.getFullVersion());
            console.info("Mobile:" + metaData.getMobile());
            console.info("Model:" + metaData.getModel());
            console.info("Platform:" + metaData.getPlatform());
            console.info("PlatformVersion:" + metaData.getPlatformVersion());
            console.info("Wow64:" + metaData.getWow64());
            let FormFactors = metaData.getFormFactors();
            for(let j = 0; j < FormFactors.length; j++) {
              console.info("FormFactor:" + FormFactors[j]);
            }
            metaData.setModel("model OpenHarmony");
            metaData.setPlatform("platform OpenHarmony");
            metaData.setPlatformVersion("platform version OpenHarmony");
            metaData.setWow64(false);
            this.controller.setCustomUserAgent('');
            console.info("Custom User Agent set:", this.userAgent);
            this.controller.setUserAgentMetadata(this.userAgent, metaData);
            console.info("User Agent Metadata set:", metaData);
            let enabled: boolean = webview.WebviewController.getUserAgentClientHintsEnabled();
            console.info("isUserAgentClientHintsEnabled:", enabled);
            webview.WebviewController.setUserAgentClientHintsEnabled(false);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })
    }
  }
}
