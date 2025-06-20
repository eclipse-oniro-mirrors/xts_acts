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


@Entry
@Component
struct Index {
  controller: WebController = new WebController();
  @State str: string = "emitGetWebId";
  @State titleReceive: string = "";
  @State webVisibility: Visibility = Visibility.Visible;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
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
          switch (this.str) {
            case "emitGetWebId": {
              Utils.emitEvent("webId", 120);
              break;
            }
            case "emitOnTitleReceive": {
              this.controller.loadUrl({ url: "resource://rawfile/index.html" });
              setTimeout(() => {
                Utils.emitEvent(this.titleReceive, 67);
              }, 3000);
              break;
            }
            case "emitWebVisibility": {
              this.webVisibility = Visibility.Hidden;
              setTimeout(() => {
                this.webVisibility = Visibility.None;
                setTimeout(() => {
                  this.webVisibility = Visibility.Visible;
                  Utils.emitEvent(0, 90);
                }, 3000)
              }, 3000);
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .visibility(this.webVisibility)
        .onTitleReceive((event) => {
          this.titleReceive = event.title;
        })
    }
  }
}
