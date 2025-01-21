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
import UIAbility from '@ohos.app.ability.UIAbility';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct webViewSetHttpDns {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitSetHttpDnsSecureOnlyExample";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)" +
    " CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";
  @State title: string = "test";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("webViewSetHttpDns page valueChangeCallBack");
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
        Button("sethttpdnsTest").key('webViewSetHttpDns').onClick(async () => {
          console.info("key==>" + this.str)
          web_webview.WebviewController.initializeWebEngine()
          switch (this.str) {
            case "emitSetHttpDnsSecureOnlyExample": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.SECURE_ONLY, "https://example1.test")
                await Utils.sleep(1000);
                this.controller.loadUrl("https://www.baidu.com/");
                await Utils.sleep(5000);
                this.title = this.controller.getTitle();
                console.log("title of this page: " + this.title);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.title, 354)
              })
              break;
            }
            case "emitSetHttpDnsSecureOnlyUserDefine": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.SECURE_ONLY, "https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}")
                await Utils.sleep(2000);
                this.controller.refresh();
                this.controller.loadUrl("https://weibo.com/");
                await Utils.sleep(15000);
                this.title = this.controller.getTitle();
                if ((this.title).includes("微博")) {
                  this.title = 'success'
                }
                console.log("title of this page: " + this.title);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.title, 356)
              })
              break;
            }
            case "emitSetHttpDnsAutoExample": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.AUTO, "https://example1.test")
                await Utils.sleep(1000);
                this.controller.loadUrl("https://www.huawei.com/cn/");
                await Utils.sleep(6000);
                this.title = this.controller.getTitle();
                console.log("title of this page: " + this.title);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.title, 358)
              })
              break;
            }
            case "emitSetHttpDnsOffExample": {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.OFF, "https://example1.test")
                await Utils.sleep(1000);
                this.controller.loadUrl("https://www.openharmony.cn/mainPlay");
                await Utils.sleep(5000);
                this.title = this.controller.getTitle();
                console.log("title of this page: " + this.title);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              this.controller.runJavaScript("test()", (res) => {
                Utils.emitEvent(this.title, 360)
              })
              break;
            }
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
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