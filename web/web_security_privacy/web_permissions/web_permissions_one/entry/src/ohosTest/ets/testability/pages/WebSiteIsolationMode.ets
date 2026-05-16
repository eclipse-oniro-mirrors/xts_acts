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

import { waitForExist} from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { Driver, MouseButton, UiWindow, ON, On  } from '@ohos.UiTest';
import web_webview from '@ohos.web.webview';
import business_error from '@ohos.base'

@Entry
@Component
struct WebSiteIsolationMode {
  @State webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State result:number = 0;
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State url: string = '';
  @State SiteIsolationModeArr: web_webview.SiteIsolationMode[] = [web_webview.SiteIsolationMode.PARTIAL,web_webview.SiteIsolationMode.STRICT]
  @State RenderProcessModeArr: web_webview.RenderProcessMode[] = [web_webview.RenderProcessMode.MULTIPLE,web_webview.RenderProcessMode.SINGLE]
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 162001,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.emitKey = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebSiteIsolationModeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          console.info('key==>' + this.emitKey);
          this.isReceive = -1;
          switch (this.emitKey) {
            case "emitWebSiteIsolationMode001": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                web_webview
                  .WebviewController
                  .setSiteIsolationMode(web_webview.SiteIsolationMode.PARTIAL)
                  Utils.emitEvent(this.SiteIsolationModeArr[web_webview.WebviewController.getSiteIsolationMode()], 20250920)
              } catch (error) {
                Utils.emitEvent(this.SiteIsolationModeArr[web_webview.SiteIsolationMode.PARTIAL], 20250920);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitWebSiteIsolationMode002": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                web_webview
                  .WebviewController
                  .setSiteIsolationMode(web_webview.SiteIsolationMode.STRICT);
                Utils.emitEvent(this.SiteIsolationModeArr[web_webview.WebviewController.getSiteIsolationMode()], 20250921)
              } catch (error) {
                Utils.emitEvent(this.SiteIsolationModeArr[web_webview.SiteIsolationMode.STRICT], 20250921);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitWebSiteIsolationMode003": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                web_webview
                  .WebviewController
                  .setRenderProcessMode(web_webview.RenderProcessMode.MULTIPLE);
                Utils.emitEvent(this.RenderProcessModeArr[web_webview.WebviewController.getRenderProcessMode()], 20250922)
              } catch (error) {
                Utils.emitEvent(this.RenderProcessModeArr[web_webview.RenderProcessMode.MULTIPLE], 20250922);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitWebSiteIsolationMode004": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                web_webview.WebviewController.setRenderProcessMode(web_webview.RenderProcessMode.SINGLE);
                Utils.emitEvent(this.RenderProcessModeArr[web_webview.WebviewController.getRenderProcessMode()], 20250923)
              } catch (error) {
                Utils.emitEvent(this.RenderProcessModeArr[web_webview.RenderProcessMode.SINGLE], 20250922);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }


          }
        })
      }
      Web({ src: 'https://www.w3school.com.cn/tiy/t.asp?f=tags_iframe', controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .onlineImageAccess(true)
        .domStorageAccess(true)
        .imageAccess(true)
        .databaseAccess(true)

    }
  }
}