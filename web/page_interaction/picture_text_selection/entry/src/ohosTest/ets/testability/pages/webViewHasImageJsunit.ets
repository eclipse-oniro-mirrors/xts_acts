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
import web_webview from '@ohos.web.webview';
import { BusinessError } from '@ohos.base';



@Entry
@Component
struct webViewHasImage {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitHasImagePm";
  @State webId: number = 0;
  @State hasImagePm: boolean = true;
  @State hasImagePmSvg: boolean = true;
  @State hasImagePmOnline: boolean = true;
  @State hasImageCb: boolean = true;
  @State hasImageCbSvg: boolean = true;
  @State hasImageCbOnline: boolean = true;
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = false;
  @State databaseAccess: boolean = true;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webImagecomponent').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitHasImagePm": {
              try {
                this.controller.hasImage().then((data) => {
                  console.info('HasImagePm: ' + data);
                  this.hasImagePm = data;
                })
                  .catch((error:BusinessError) => {
                    console.error("error: " + error);
                  })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImagePm, 202);
            }
            case "emitHasImagePmSvg": {
              this.controller.loadUrl($rawfile('hasImageTwo.html'))
              await Utils.sleep(2000)
              try {
                this.controller.hasImage().then((data) => {
                  console.info('HasImagePmSvg: ' + data);
                  this.hasImagePmSvg = data;
                })
                  .catch((error:BusinessError) => {
                    console.error("error: " + error);
                  })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImagePmSvg, 204);
            }
            case "emitHasImagePmOnline": {
              this.controller.loadUrl($rawfile('onlineImageAccess.html'))
              try {
                this.controller.hasImage().then((data) => {
                  console.info('HasImagePmOnline: ' + data);
                  this.hasImagePmOnline = data;
                })
                  .catch((error:BusinessError) => {
                    console.error("error: " + error);
                  })
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImagePmOnline, 206);
            }
            case "emitHasImageCb": {
              this.controller.loadUrl($rawfile('hasImageOne.html'))
              try {
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCb error: ` + JSON.stringify(error))
                    return
                  }
                  this.hasImageCb = data;
                  console.info("hasImageCb: " + data);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImageCb, 208);
            }
            case "emitHasImageCbSvg": {
              this.controller.loadUrl($rawfile('hasImageTwo.html'))
              await Utils.sleep(2000)
              try {
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCbSvg error: ` + JSON.stringify(error))
                    return;
                  }
                  this.hasImageCbSvg = data;
                  console.info("hasImageCbSvg: " + data);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImageCbSvg, 210);
            }
            case "emitHasImageCbOnline": {
              this.controller.loadUrl($rawfile('onlineImageAccess.html'))
              try {
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCbOnline error: ` + JSON.stringify(error))
                    return;
                  }
                  this.hasImageCbOnline = data;
                  console.info("hasImageCbOnline: " + data);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImageCbOnline, 212);
            }
          }
        })
      }

      Web({ src: $rawfile('hasImageOne.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)

    }
  }
}
