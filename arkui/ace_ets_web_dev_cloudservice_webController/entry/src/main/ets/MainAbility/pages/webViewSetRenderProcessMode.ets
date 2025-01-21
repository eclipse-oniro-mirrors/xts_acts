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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct webViewSetRenderProcessMode {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  handler: FullScreenExitHandler = new FullScreenExitHandler();
  @State str: string = "emitGetRenderProcessMode";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State checkEleResult: string = '';
  @State isSuccess: boolean = false;
  @State isOpen: boolean = false;
  
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
              this.str = eventData.data.ACTION;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button("web click")
              .key('webViewSetRenderProcessMode')
              .onClick(async () => {
                  try {
                      await Utils.sleep(3000)
                      web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.MULTIPLE);
                      Utils.sleep(1000);
                      let mode = web_webview.WebviewController.getRenderProcessMode();
                      console.info('>>>>>renderProcessMode:' + mode)
                      Utils.emitEvent(mode === web_webview.RenderProcessMode.MULTIPLE, 10005)
                      Utils.emitEvent(true, 10005)
                } catch (error) {
                    console.error('ErrorCode: ${error.code}, Message: ${error.message}');
                }
              })
              .height(45)
              .margin({ right: 10})
          }
          Web({ src: 'metaViewport.html', controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
      }
  }
}
