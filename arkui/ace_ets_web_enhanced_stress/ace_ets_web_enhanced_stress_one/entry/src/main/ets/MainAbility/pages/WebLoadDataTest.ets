/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebLoadDataTest {
  controller: WebController = new WebController()
  @State str: string = "";
  @State callBackId: number = 0;
  @State stressTimes: number = 0;
  @State buttonKey: string = '';
  @State factor: number = 1;

  onPageShow() {
    Utils.registerEventPage((eventData: events_emitter.EventData) => {
      if (eventData.data) {
        this.str = eventData.data.CASE_NAME;
        this.callBackId = eventData.data.CALL_BACK_ID;
        this.stressTimes = eventData.data.STRESS_TIMES;
        this.buttonKey = eventData.data.BUTTON_KEY
      }
    })
  }

  onPageHide() {
    Utils.unRegisterEventPage()
  }

  build() {
    Row() {
      Column() {
        Button(this.buttonKey)
          .key(this.buttonKey)
          .onClick(async () => {
            console.info("key==>" + this.str)
            switch (this.str) {
              case 'testWebLoadData001': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8"
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData002': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      baseUrl: "https://openharmony.cn/"
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData003': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      baseUrl: "https://openharmony.cn/",
                      historyUrl: "https://openharmony.cn/"
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData004': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      historyUrl: "https://openharmony.cn/"
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData005': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      baseUrl: "",
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData006': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      baseUrl: "",
                      historyUrl: ""
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData007': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      historyUrl: ""
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData008': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      baseUrl: "",
                      historyUrl: "https://openharmony.cn/"
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
              case 'testWebLoadData009': {
                try {
                  for (let i = 0; i < this.stressTimes; i++) {
                    this.controller.loadData({
                      data: "<html><head><title>LoadData</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                      mimeType: "text/html",
                      encoding: "UTF-8",
                      baseUrl: "https://openharmony.cn/",
                      historyUrl: ""
                    })
                    Utils.stressingLog('WebController.loadData()', i + 1, this.stressTimes)
                  }
                  Utils.emitEvent(true, this.callBackId)
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                  Utils.emitEvent(false, this.callBackId)
                }
                break;
              }
            }
          })

        Web({ src: '', controller: this.controller })
          .javaScriptAccess(true)
          .geolocationAccess(true)
          .databaseAccess(true)
          .onPageEnd((event) => {
            if (event) {
              console.log(`onPageEnd ==> Web.LoadData:${this.callBackId}`)
            }
          })
      }
      .width('100%')
    }

    .height('100%')
  }
}