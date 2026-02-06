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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';

@Entry
@Component
struct webOnFullScreenExit {
  controller: WebController = new WebController();
  handler: FullScreenExitHandler | null = null
  @State str: string = "emitOnfullscreenexitWebc";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State checkEleResult: string = "";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnFullScreenExit page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webOnFullScreenExit').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnfullscreenexitWebc": {
              try {
                this.controller.runJavaScript({
                  script: "elementFullScreen()", callback: (result) => {
                    console.log(`The elementFullScreen() return value is: ${result}`);
                  }
                })
                await Utils.sleep(1000);
                this.controller.runJavaScript({
                  script: "elementExitFullScreen()", callback: (result) => {
                    console.log(`The elementExitFullScreen() return value is: ${result}`);
                  }
                })
                await Utils.sleep(1000);
                this.controller.runJavaScript({
                  script: "checkIsFullScreen()", callback: (result) => {
                    this.checkEleResult = JSON.stringify(result)
                    console.log(`The checkIsFullScreen() return value is: ${result}`);
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript({
                script: "test()", callback: (res) => {
                  Utils.emitEvent(JSON.stringify(this.handler).length + this.checkEleResult, 444)
                }
              })
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('fullScreenTest.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
        .onFullScreenExit(() => {
          console.log("onFullScreenExit...")
          console.log("this.handler: " + JSON.stringify(this.handler))
          this.handler?.exitFullScreen()
        })
        .onFullScreenEnter((event) => {
          this.handler = event.handler
        })
    }
  }
}