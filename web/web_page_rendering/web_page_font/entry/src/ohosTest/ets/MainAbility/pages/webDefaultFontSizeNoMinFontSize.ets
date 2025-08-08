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
import Utils from '../../test/Utils';

@Entry
@Component
struct webDefaultFontSizeNoMinFontSize {
  controller: WebController = new WebController();
  @State str: string = "emitdefaultFontSize7AndNominFontSizeWebC";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State defaultFontSize: number = 13;
  @State checkEleResult: Object[] = [];

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webDefaultFontSizeNoMinFontSize page valueChangeCallBack");
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
        Button("web click").key('webDefaultFontSizeNoMinFontSize').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitdefaultFontSize7AndNominFontSizeWebC": {
              try {
                this.defaultFontSize = 7;
                await Utils.sleep(2000);
                console.log("fonsize of emitdefaultFontSize7AndNominFontSizeWebC is :" + this.defaultFontSize);
                this.controller.runJavaScript({
                  script: "getPageFontsize()", callback: (result) => {
                    this.checkEleResult = JSON.parse(result)
                    console.log(`The getPageFontsize() return value is: ${result}`);
                    Utils.emitEvent(this.checkEleResult[1], 436)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitdefaultFontSize17AndCssFontSize9WebC": {
              try {
                this.defaultFontSize = 17;
                await Utils.sleep(2000);
                console.log("fonsize of emitdefaultFontSize17AndCssFontSize9WebC is :" + this.defaultFontSize);
                this.controller.runJavaScript({
                  script: "getTestPageFontsize()", callback: (result) => {
                    this.checkEleResult = JSON.parse(result)
                    console.log(`The getTestPageFontsize() return value is: ${result}`);
                    Utils.emitEvent(this.checkEleResult[1], 438)
                  }
                })
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('indexFive.html'), controller: this.controller })
        .defaultFontSize(this.defaultFontSize)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .userAgent(this.userAgent)
    }
  }
}