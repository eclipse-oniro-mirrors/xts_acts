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
import webView from '@ohos.web.webview';
import Utils from '../../test/Utils';

@Entry
@Component
struct WebOnDataResubmitted {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = '';
  @State onDataResubmittedCalled: boolean = false;
  @State resend: boolean = true;
  @State title: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
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
        Button("web click").onClick(async () => {
          this.controller.backward();
        });

        Button("web click").key('WebOnDataResubmittedTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnDataResubmitted": {
              try {
                await Utils.clickComponent('WebOnDataResubmittedTestWebView')
                await Utils.sleep(2000)
                this.controller.refresh();
                await Utils.sleep(2000)
                Utils.emitEvent(this.onDataResubmittedCalled, 60425)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitDataResubmissionHandlerResend": {
              try {
                this.controller.loadUrl("resource://rawfile/dataSubmit.html");
                await Utils.sleep(2000)
                this.title = ''
                await Utils.clickComponent('WebOnDataResubmittedTestWebView')
                await Utils.sleep(2000)
                this.controller.refresh();
                await Utils.sleep(2000)
                Utils.emitEvent(this.title, 60426)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitDataResubmissionHandlerCancel": {
              try {
                this.controller.loadUrl("resource://rawfile/dataSubmit.html");
                await Utils.sleep(2000)
                this.title = ''
                this.resend = false
                await Utils.clickComponent('WebOnDataResubmittedTestWebView')
                await Utils.sleep(2000)
                this.controller.refresh();
                await Utils.sleep(2000)
                Utils.emitEvent(this.title, 60428)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('dataSubmit.html'), controller: this.controller })
        .key('WebOnDataResubmittedTestWebView')
        .javaScriptAccess(true)
        .onDataResubmitted((event) => {
          this.onDataResubmittedCalled = true
          console.log('onDataResubmitted')
          if (event) {
            if (this.resend) {
              event.handler.resend();
            } else {
              event.handler.cancel();
            }
          }
        })
        .onTitleReceive((event) => {
          if (event) {
            console.log('onTitleReceive title:' + event.title)
            this.title += event.title
          }
        })
    }
  }
}