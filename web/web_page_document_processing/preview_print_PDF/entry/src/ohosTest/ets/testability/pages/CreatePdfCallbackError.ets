/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import webview from '@ohos.web.webview';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from '../../test/Utils';
import fs from '@ohos.file.fs';
import events_emitter from '@ohos.events.emitter';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  @State str: string = "emitCreatePdfShouldPrintBackgroundFalse";
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  pdfConfig: webview.PdfConfiguration = {
    width: 8.27,
    height: 11.69,
    marginTop: 0,
    marginBottom: 0,
    marginRight: 0,
    marginLeft: 0,
    scale: 1.0,
    shouldPrintBackground: false
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 300530,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(): void {
    events_emitter.off(300530)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("createPdfCallbackError").key('webCreatePdfCallbackError').onClick(async () => {
          console.info("isPageEnd :" + this.isPageEnd);
          console.info("isReceive :" + this.isReceive);
          await waitForExist(() => this.isPageEnd, this.str + 'IsPageEnd', 0);
          await waitForExist(() => this.isReceive, this.str + 'IsReceive', 0);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {
            case "emitCreatePdfShouldPrintBackgroundFalse": {
              let configFalse: webview.PdfConfiguration = {
                width: 8.27,
                height: 11.69,
                marginTop: 0,
                marginBottom: 0,
                marginRight: 0,
                marginLeft: 0,
                scale: 1.0,
                shouldPrintBackground: false
              };
              this.controller.createPdf(
                configFalse,
                (error, result: webview.PdfData) => {
                  try {
                    let context = getContext(this) as common.UIAbilityContext;
                    let filePath = context.filesDir + "/test.pdf";
                    let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                    fs.write(file.fd, result.pdfArrayBuffer().buffer).then((writeLen: number) => {
                      console.info("createPDF write data to file succeed and size is:" + writeLen);
                      if (writeLen > 0) {
                        Utils.emitEvent(true, 300531);
                        console.info('shouldPrintBackground false success');
                      }
                    }).catch((err: BusinessError) => {
                      console.error("createPDF write data to file failed with error message: " + err.message +
                        ", error code: " + err.code);
                    }).finally(() => {
                      fs.closeSync(file);
                    });
                  } catch (resError) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                  }
                });
              break;
            }

            case "emitCreatePdfConfigurationNull": {
              try {
                this.controller.createPdf(
                  null,
                  (error, result: webview.PdfData) => {
                    if (error) {
                      console.error('error: ' + JSON.stringify(error));
                      Utils.emitEvent(String((error as BusinessError).code), 300532);
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent('no error', 300532);
                  });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 300532);
              }
              break;
            }

            case "emitCreatePdfConfigurationUndefined": {
              try {
                this.controller.createPdf(
                  undefined,
                  (error, result: webview.PdfData) => {
                    if (error) {
                      console.error('error: ' + JSON.stringify(error));
                      Utils.emitEvent(String((error as BusinessError).code), 300533);
                      return;
                    }
                    console.log('result: ' + result);
                    Utils.emitEvent('no error', 300533);
                  });
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                Utils.emitEvent(String(e.code), 300533);
              }
              break;
            }
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
    }
  }
}
