/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct webViewOnNavigationEntryCommitted {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
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
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewOnNavigationEntryCommittedButton')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(2000);
                  switch (this.emitKey) {
                    case 'emitWebViewOnNavigationEntryCommitted01':
                    case 'emitWebViewOnNavigationEntryCommitted02':
                    case 'emitWebViewOnNavigationEntryCommitted03':
                    case 'emitWebViewOnNavigationEntryCommitted04':
                    case 'emitWebViewOnNavigationEntryCommitted05':{
                      try {
                        this.controller.loadUrl('https://www.weibo.com')
                      } catch (error) {
                        let e:business_error.BusinessError = error as business_error.BusinessError;
                        console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                      }
                      break;
                    }
                }
              })
          }
          Web({ src: 'https://www.baidu.com', controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                .onNavigationEntryCommitted((event) => {
                  console.log('onNavigationEntryCommitted: [isMainFrame]= ' + event.isMainFrame +
                    ', [isSameDocument]=' + event.isSameDocument +
                    ', [didReplaceEntry]=' + event.didReplaceEntry +
                    ', [navigationType]=' + event.navigationType +
                    ', [url]=' + event.url);
                  if (event.isMainFrame===true||event.isMainFrame===false) {
                    Utils.emitEvent('success', 8009);
                  }
                  if (event.isSameDocument===true||event.isSameDocument===false) {
                    Utils.emitEvent('success', 8010);
                  }
                  if (event.didReplaceEntry) {
                    Utils.emitEvent('success', 8011);
                  }
                  if (event.navigationType) {
                    Utils.emitEvent('success', 8012);
                  }
                  if (event.url) {
                    Utils.emitEvent('success', 8013);
                  }

              })
      }
  }
}
