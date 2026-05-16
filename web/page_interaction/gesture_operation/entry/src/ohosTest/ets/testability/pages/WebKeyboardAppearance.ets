/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview';

const EVENT_ID_SET_SUITE_KEY = 186001;

@Entry
@Component
struct WebKeyboardAppearance {
  @State str: string = "";
  @State isReceive: number = -1;
  @State appearanceMode: WebKeyboardAppearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("WebKeyboardAppearance page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webKeyboardAppearanceButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(() => this.isReceive, this.str + ' isReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.str + ' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitKeyboardAppearance001": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                Utils.emitEvent(true, 186010);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186010);
              }
              break;
            }
            case "emitKeyboardAppearance002": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                Utils.emitEvent(true, 186020);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186020);
              }
              break;
            }
            case "emitKeyboardAppearance003": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                Utils.emitEvent(true, 186030);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186030);
              }
              break;
            }
            case "emitKeyboardAppearance004": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
                Utils.emitEvent(true, 186040);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186040);
              }
              break;
            }
            case "emitKeyboardAppearance005": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                Utils.emitEvent(true, 186050);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186050);
              }
              break;
            }
            case "emitKeyboardAppearance006": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                Utils.emitEvent(true, 186060);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186060);
              }
              break;
            }
            case "emitKeyboardAppearance007": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
                Utils.emitEvent(true, 186070);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186070);
              }
              break;
            }
            case "emitKeyboardAppearance008": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.DARK_IMMERSIVE;
                this.appearanceMode = WebKeyboardAppearanceMode.NONE_IMMERSIVE;
                Utils.emitEvent(true, 186080);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186080);
              }
              break;
            }
            case "emitKeyboardAppearance009": {
              try {
                this.appearanceMode = WebKeyboardAppearanceMode.LIGHT_IMMERSIVE;
                Utils.emitEvent(true, 186090);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186090);
              }
              break;
            }
            case "emitKeyboardAppearance010": {
              try {
                Utils.emitEvent(true, 186100);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(false, 186100);
              }
              break;
            }
            default:
              break;
          }
        })
      }

      Web({ src: $rawfile('indexFive.html'), controller: this.controller })
        .key('WebKeyboardAppearanceWeb')
        .javaScriptAccess(true)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .keyboardAppearance(this.appearanceMode)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .height('95%')
    }
  }
}
