/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';

const EVENT_ID_SET_EMIT_KEY = 201850;
let loadedUrl: string;

@Entry
@Component
struct Index {
  controller: WebController = new WebController();
  @State str: string = "emitImageAccessFalse";
  @State loadedResource: string = "";
  @State progress: string = "";
  @State newUrl: string = "";
  @State pageBegin: string = "";
  @State pageEnd: string = "";
  @State console: string = "";
  @State confirm: string = "";
  @State alert: string = "";
  @State errorReceive: string = "";
  @State httpErrorReceive: number = 0;
  @State titleReceive: string = "";
  @State isDownloadStart: boolean = false;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State geolocationAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State initialScale: number = 100;
  @State enterPageEnd: boolean = false;
  @State newScale: number = 0;
  @State scaleChange: boolean = false;
  @State geoShow: boolean = false;
  @State mixedMode: MixedMode = MixedMode.All;
  @State cacheMode: CacheMode = CacheMode.Default;
  @State cacheError: boolean = false;
  @State mixedSwitch: boolean = false;
  @State mixedAllSwitch: boolean = false;
  @State webVisibility: Visibility = Visibility.Visible;
  @State isProgressFinish: boolean = false;
  @State isHttpErrorReceive: boolean = false;
  @State isLargeThan: boolean = false;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }
  private jsObj: ESObject = {
    test: (res: ESObject) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str: ESObject) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 86);
      return "web222";
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'webcomponentIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, 'webcomponentIsPageEnd', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitImageAccessFalse": {
              this.imageAccess = false;
              this.isPageEnd = -1;
              this.controller.refresh();
              await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "resource://rawfile/index.html" });
              await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.controller.runJavaScript({
                script: "getImgResult()", callback: (res) => {
                  console.info("getImgResult==>" + res);
                  Utils.emitEvent(res, 201860);
                }
              });
              break;
            }
            case "emitImageAccessTrue": {
              this.imageAccess = true;
              this.isPageEnd = -1;
              this.controller.refresh();
              await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "resource://rawfile/index.html" });
              await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.controller.runJavaScript({
                script: "getImgResult()", callback: (res) => {
                  console.info("getImgResult==>" + res);
                  Utils.emitEvent(res, 201870);
                }
              });
              break;
            }
            case "emitOnlineImageAccessFalse": {
              this.onlineImageAccess = false;
              this.isPageEnd = -1;
              this.controller.refresh();
              await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "resource://rawfile/onlineImageAccess.html" });
              await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.controller.runJavaScript({
                script: "getImageLoadResult()", callback: (res) => {
                  console.info("getImageLoadResult==>" + res);
                  Utils.emitEvent(res, 201880);
                }
              })
              break;
            }
            case "emitOnlineImageAccessTrue": {
              this.onlineImageAccess = true;
              this.isPageEnd = -1;
              this.controller.refresh();
              await Utils.waitForExist(()=>this.isPageEnd, 'refreshIsPageEnd', 1, 1000);
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "resource://rawfile/onlineImageAccess.html" });
              await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.controller.runJavaScript({
                script: "getImageLoadResult()", callback: (res) => {
                  console.info("getImageLoadResult==>" + res)
                  Utils.emitEvent(res, 201890);
                }
              })
              break;
            }
            case "emitCacheModeOnly": {
              this.cacheError = true;
              this.cacheMode = CacheMode.Only;
              this.controller.loadUrl({ url: "https://www.openharmony.cn" });
              break;
            }
            case "emitCacheModeDefault": {
              this.cacheMode = CacheMode.Default;
              this.isPageEnd = -1;
              this.controller.loadUrl({ url: "resource://rawfile/index.html" });
              await Utils.waitForExist(()=>this.isPageEnd, 'loadUrlIsPageEnd', 1, 1000);
              this.controller.runJavaScript({
                script: "gettitle()", callback: (res) => {
                  Utils.emitEvent(res, 201910);
                }
              });
              break;
            }
            case "emitMixedModeNone": {
              this.mixedSwitch = true;
              this.mixedMode = MixedMode.None;
              this.controller.loadUrl({ url: "https://mixed-script.badssl.com/" });
              break;
            }
            case "emitMixedModeAll": {
              this.mixedAllSwitch = true;
              this.mixedMode = MixedMode.All;
              this.controller.loadUrl({ url: "https://mixed-script.badssl.com/" });
              break;
            }

            default:
              console.info("can not match case");
          }
        })
      }

      TextInput({ placeholder: "inputs your words" })
        .key('textInput')
        .type(InputType.Normal)
        .placeholderColor(Color.Blue)
        .placeholderFont({ size: 20, weight: FontWeight.Normal, family: "sans-serif", style: FontStyle.Normal })
        .enterKeyType(EnterKeyType.Next)
        .caretColor(Color.Green)
        .height(60)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("cursive")
        .fontStyle(FontStyle.Italic)
        .fontColor(Color.Red)
        .maxLength(20)
        .border({ width: 1, color: 0x317AF7, radius: 10, style: BorderStyle.Solid })
        .onClick(() => {
          console.info("TextInput click")
        })
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .visibility(this.webVisibility)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .geolocationAccess(this.geolocationAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .cacheMode(this.cacheMode)
        .initialScale(this.initialScale)
        .mixedMode(this.mixedMode)
        .userAgent("Mozila/5.0 (Linux; Andriod 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 HuaweiBrowser/12.0.4.1 MobileSafari/537.36")
        .javaScriptProxy({
          object: this.jsObj,
          name: "backToEts",
          methodList: ["test", "toString"],
          controller: this.controller
        })
        .onUrlLoadIntercept((event) => {
          console.info("onUrlLoadIntercept==>" + event?.data);
          loadedUrl = String(event?.data);
          return false;
        })
        .onRenderExited((event) => {
          console.info("onRenderExited==>" + event?.renderExitReason);

        })
        .onResourceLoad((event) => {
          console.info("onResourceLoad==>" + event.url);
          this.loadedResource = event.url;
        })
        .onProgressChange((event) => {
          if (this.isProgressFinish) {
            console.info("isProgressFinish==>");
            if (this.progress == "100") {
              this.isProgressFinish = false;
            }
          }
          this.progress = event.newProgress + "";
        })
        .onRefreshAccessedHistory((event) => {
          console.info("onRefreshAccessedHistory==>");
          this.newUrl = event.url;
        })
        .onFocus(() => {

        })
        .onPageBegin((event) => {
          this.pageBegin = event.url;
        })
        .onPageEnd((event) => {
          this.pageEnd = event.url;
          console.log("onPageEnd==>");
          this.isPageEnd = 1;
          if (this.enterPageEnd) {
            this.enterPageEnd = false;
          }
        })
        .onConsole((event) => {
          this.console = event.message.getMessage();
          let level = event.message.getMessageLevel();
          let msg = event.message.getMessage();
          console.log("html==>" + msg);
          if (this.mixedSwitch) {
            Utils.emitEvent(msg.includes('insecure') ? true : false, 201920);
            this.mixedSwitch = false;
          } else if (this.mixedAllSwitch) {
            Utils.emitEvent(level, 201930);
            this.mixedAllSwitch = false;
          }
          return false;
        })
        .onAlert((event) => {
          this.alert = event.message;
          return false;
        })
        .onConfirm((event) => {
          this.confirm = event.message;
          return false;
        })
        .onErrorReceive((event) => {
          this.errorReceive = event.request.getRequestUrl();
          console.log("onErrorReceive==>");
          if (this.cacheError) {
            Utils.emitEvent("cacheError", 201900);
            this.cacheError = false;
          }
        })
        .onHttpErrorReceive((event) => {
          if (this.isHttpErrorReceive) {
            console.info("isHttpErrorReceive==>");
            this.httpErrorReceive = event.response.getResponseCode();
            if (this.httpErrorReceive > 400) {
              this.isLargeThan = true;
            }
            this.isLargeThan = false;
            this.isHttpErrorReceive = false;
          }
        })
        .onTitleReceive((event) => {
          this.titleReceive = event.title;
        })
        .onDownloadStart((event) => {
          if (this.isDownloadStart) {
            console.info("isDownloadStart==>");
            this.isDownloadStart = false;
          }
        })
        .onScaleChange((event) => {
          console.log("onScaleChange==>");
          this.newScale = event.newScale;
          if (this.scaleChange) {
            this.scaleChange = false;
          }
        })
        .onPrompt((event) => {
          event.result.handlePromptConfirm("onPrompt ok");
          return true;
        })
        .onGeolocationShow(() => {
          console.log("onGeolocationShow==>")
          if (this.geoShow) {
            this.geoShow = false;
          }
        })
        .onBlur(() => {
          console.info("onBlur==>");
          this.controller.requestFocus();
        })
    }
  }
}
