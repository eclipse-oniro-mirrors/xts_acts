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
import UIAbility from '@ohos.app.ability.UIAbility';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

const EVENT_ID_SET_EMIT_KEY = 202400;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("EntryAbility onCreate");
    web_webview.WebviewController.initializeWebEngine();
    AppStorage.setOrCreate("abilityWant", want);
    console.log("EntryAbility onCreate done");
  }
}

let loadedUrl: string;

@Entry
@Component
struct Index {
  controller: WebController = new WebController()
  responseweb: WebResourceResponse = new WebResourceResponse();
  @State str: string = "emitSaveHttpAuthCredentials";
  @State text: string = "";
  @State textRatio: number = 100;
  @State zoomAccessValue: boolean = true;
  @State isReceive: number = -1;
  host: string = "www.spincast.org";
  realm: string = "protected example";
  username_password: string[] = [];
  origin: string = "resource://rawfile/";

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

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
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
          await Utils.waitForExist(()=>this.isReceive, 'webcomponentIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitSaveHttpAuthCredentials": {
              web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "Stromgol", "Laroche");
              let result = web_webview.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 202410);
              break;
            }
            case "emitGetHttpAuthCredentials": {
              web_webview.WebDataBase.deleteHttpAuthCredentials();
              web_webview.WebDataBase.saveHttpAuthCredentials(this.host, this.realm, "Stromgol", "Laroche");
              this.username_password = web_webview.WebDataBase.getHttpAuthCredentials(this.host, this.realm);
              let result = this.username_password[0];
              Utils.emitEvent(result, 202420);
              break;
            }
            case "emitDeleteHttpAuthCredentials": {
              web_webview.WebDataBase.deleteHttpAuthCredentials();
              let result = web_webview.WebDataBase.existHttpAuthCredentials();
              Utils.emitEvent(result, 202430);
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .databaseAccess(true)
        .zoomAccess(this.zoomAccessValue)
        .textZoomRatio(this.textRatio)
        .onConsole((event) => {
          let level = event.message.getMessageLevel();
          let msg = event.message.getMessage();
          let lineNumber = event.message.getLineNumber().toString();
          let sourceId = event.message.getSourceId();
          console.log("lineNumber:" + lineNumber);
          return false;
        })
    }
  }
}