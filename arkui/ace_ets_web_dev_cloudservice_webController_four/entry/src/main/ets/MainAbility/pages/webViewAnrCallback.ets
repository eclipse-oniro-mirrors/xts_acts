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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';

@Entry
@Component
struct webViewAnr {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
         "Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State isFrameResourceType: boolean = false
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info("valueChangeCallBack:" + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button("web click")
              .key('webViewAnrCallback')
              .onClick(async () => {
                  console.info("key==>" + this.emitKey)
                  this.controller.refresh()
                  this.controller.loadUrl($rawfile('common_index.html'))
                  await Utils.sleep(1000)
                  switch (this.emitKey) {
                    case "emitWebViewOnRenderProcessNotResponding": {
                      await Utils.sleep(1000)
                      this.controller.runJavaScript("blockJS()", (error, result) => {
                        console.error(`The blockJS() return error is: ${error}`);
                        console.log(`The blockJS() return value is: ${result}`);
                      })
                      await Utils.sleep(15000)
                      Utils.emitEvent(true,1335)
                      break;
                    }
                    case "emitWebViewOnRenderProcessResponding": {
                      await Utils.sleep(1000)
                      this.controller.runJavaScript("jumpPageCaton()", (error, result) => {
                        console.error(`The jumpPageCaton() return error is: ${error}`);
                        console.log(`The jumpPageCaton() return value is: ${result}`);
                      })
                      await Utils.sleep(15000)
                      Utils.emitEvent(true,1336)
                      break;
                    }
                    case "emitWebViewNotRespondingReason_INPUT_TIMEOUT": {
                      await Utils.sleep(1000)
                      this.controller.runJavaScript("blockJS()", (error, result) => {
                        console.error(`The blockJS() return error is: ${error}`);
                        console.log(`The blockJS() return value is: ${result}`);
                      })
                      await Utils.sleep(15000)
                      Utils.emitEvent(true,1337)
                      break;
                    }
                    case "emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT": {
                      await Utils.sleep(1000)
                      this.controller.runJavaScript("jumpPageCaton()", (error, result) => {
                        console.error(`The jumpPageCaton() return error is: ${error}`);
                        console.log(`The jumpPageCaton() return value is: ${result}`);
                      })
                      await Utils.sleep(15000)
                      Utils.emitEvent(true,1338)
                      break;
                    }
                }
              })
          }
        Web({ src: $rawfile('common_index.html'), controller: this.controller })
          .onRenderProcessNotResponding(async (data) => {
            console.log("onRenderProcessNotResponding: [jsStack]= " + data.jsStack +
            ", [process]=" + data.pid + ", [reason]=" + data.reason);
            console.log('data.reason:' + RenderProcessNotRespondingReason.INPUT_TIMEOUT)
            console.log('data.reason:' + RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT)
            await Utils.sleep(1000)
            this.controller.runJavaScript("stopBlockJs()", (error, result) => {
              console.error(`The stopBlockJs() return error is: ${error}`);
              console.log(`The stopBlockJs() return value is: ${result}`);
            })

            if(RenderProcessNotRespondingReason.INPUT_TIMEOUT.toString() === '0'){
              Utils.emitEvent(true,1337)
            }

            if(RenderProcessNotRespondingReason.NAVIGATION_COMMIT_TIMEOUT.toString() === '1'){
              Utils.emitEvent(true,1338)
            }

            Utils.emitEvent(true,1335)
          })
          .onRenderProcessResponding(() => {
            console.log("onRenderProcessResponding again");
            Utils.emitEvent(true,1336)
          })
      }
  }
}
