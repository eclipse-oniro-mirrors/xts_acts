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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import { webview } from '@kit.ArkWeb';

let loadedUrl: string;

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = "emitOnErrorReceive";
  @State loadedResource: string = "";
  @State progress: string = "";
  @State newUrl: string = "";
  @State pageBegin: string = "";
  @State pageEnd: string = "";
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
  @State isPageEnd: number = -1;
  @State isReceive:number = -1;
  @State isEnd:number = -1;
  @State isError:number =-1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 142001,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide(){
    events_emitter.off(142001);
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0
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
          await Utils.waitForExist(()=>this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info("key==>" + this.str);
          switch (this.str) {
            case "emitOnErrorReceive": {
                this.controller.loadUrl('http://bianixnbo.com' );
                await Utils.waitForExist(()=>this.isPageEnd, this.str, 0);
                Utils.emitEvent(this.errorReceive, 142010);

              break;
            }
            case "emitOnHttpErrorReceive": {
              this.isHttpErrorReceive = true;
              this.controller.loadUrl('http://1.1.1.123/index.html');
              await Utils.waitForExist(()=>this.isEnd, this.str, 0);
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
        .onErrorReceive((event) => {
          this.isPageEnd = 0
          this.errorReceive = event.request.getRequestUrl();
          console.log("onErrorReceive==>");
          if (this.cacheError) {
            Utils.emitEvent("cacheError", 182);
            this.cacheError = false;
          }
        })
        .onHttpErrorReceive((event) => {
          if (this.isHttpErrorReceive) {
            console.info("isHttpErrorReceive==>");
            this.httpErrorReceive = event.response.getResponseCode();
            if (this.httpErrorReceive > 400) {
              this.isLargeThan = true;
              Utils.emitEvent(this.isLargeThan, 142020);
            }
            this.isLargeThan = false;
            this.isHttpErrorReceive = false;
          }
        })
        .onPageEnd(()=>{
          this.isEnd = 0
        })
        .onPageBegin(()=>{
          this.isEnd = -1
        })
    }
  }
}
