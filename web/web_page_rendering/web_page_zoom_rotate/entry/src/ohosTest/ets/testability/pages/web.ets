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
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct Index {
  controller: WebController = new WebController();
  @State str: string = "emitInitialScale";
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
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153080,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }
  onPageHide() {
    events_emitter.off(153080)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
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
          console.info("key==>" + this.str);
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitInitialScale": {
              this.initialScale = 120;
              this.isComplete = -1;
              this.controller.loadUrl({ url: "resource://rawfile/second.html" });
              await waitForExist(() => this.isComplete, this.str, 0);
              this.enterPageEnd = true;
              if (this.enterPageEnd) {
                    Utils.emitEvent(this.newScale, 153090);
                  }

              break;
            }
            case "emitOnscaleChange": {
              this.initialScale = 110;
              this.scaleChange = true;
              await waitForExist(() => this.scaleChange, this.str,"true");
              this.isComplete = -1;
              this.controller.loadUrl({ url: "https://gitee.com/" })
              await waitForExist(() => this.isComplete, this.str, 0);
              break;
            }
            case "emitZoom": {
             this.isComplete = -1;
              this.controller.loadUrl({ url: "resource://rawfile/index.html" });
              await waitForExist(() => this.isComplete, this.str, 0);
              this.controller.zoom(2);
              this.isComplete = -1;
              this.controller.refresh();
              await waitForExist(() => this.isComplete, this.str, 0);
                this.controller.runJavaScript({
                  script: "getPageHeight()", callback: (res) => {
                    console.info("getPageHeight++++++" + res);
                    let zoomCalled: boolean = false;
                    if (Number(res) > 1400) {
                      zoomCalled = true;
                    }
                    Utils.emitEvent(zoomCalled, 153110);
                  }
                })
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

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
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
        .onScaleChange((event) => {
          this.enterPageEnd = false;
          console.log("onScaleChange==>");
          this.newScale = event.newScale;
          if (this.scaleChange) {
            Utils.emitEvent("onScaleChange", 153100);
            this.scaleChange = false;
          }
        })
    }
  }
}
