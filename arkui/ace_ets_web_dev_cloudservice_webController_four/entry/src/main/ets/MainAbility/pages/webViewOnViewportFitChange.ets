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
import business_error from '@ohos.base';

@Entry
@Component
struct webViewOnViewportFitChange {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = "emitWebViewOnViewportFitChange";
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
              .key('webViewOnViewportFitChange')
              .onClick(async () => {
                  console.info("key==>" + this.emitKey)
                  await Utils.sleep(1000)
                  if ( Utils.isPC(this.controller) ) {
                    Utils.emitEvent(true,1340)
                    Utils.emitEvent(true,1341)
                    return
                  }
                  switch (this.emitKey) {
                    case "emitWebViewOnViewportFitChange": {
                        console.log(this.emitKey)
                        break;
                    }
                }
              })
          }
        Web({ src: $rawfile('viewPortCover.html'), controller: this.controller })
          .onViewportFitChanged(async (data) => {
            await Utils.sleep(3000)
            Utils.emitEvent(true,1340)
            try{
              await Utils.sleep(3000)
              Utils.emitEvent(true,1341)
              let jsonData = JSON.stringify(data)
              let viewportFit: ViewportFit = JSON.parse(jsonData).viewportFit
              if (viewportFit === ViewportFit.COVER) {
                console.log(ViewportFit.COVER.toString())
              } else if (viewportFit === ViewportFit.CONTAINS) {
                console.log(ViewportFit.CONTAINS.toString())
              } else {
                console.log('default')
              }
            } catch(e){
              console.log(e.toString())
            }


          })
      }
  }
}
