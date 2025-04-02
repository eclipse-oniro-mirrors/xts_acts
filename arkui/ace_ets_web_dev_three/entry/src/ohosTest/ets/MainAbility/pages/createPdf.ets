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
import webview from '@ohos.web.webview';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from '../../test/Utils';
import fs from '@ohos.file.fs';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
    @State str: string = "emitSavePDF";
  pdfConfig: webview.PdfConfiguration = {
    width: 8.27,
    height: 11.69,
    marginTop: 0,
    marginBottom: 0,
    marginRight: 0,
    marginLeft: 0,
    shouldPrintBackground: true
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  build() {
    Column() {

      Row() {
        Button("SavePDF").key('webSavePDF').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitSavePDF": {
                this.controller.createPdf(
                      this.pdfConfig,
                      (error, result: webview.PdfData) => {
                        try {
                          // 获取组件上下文
                          let context = getContext(this) as common.UIAbilityContext;
                          // 获取沙箱路径，设置pdf文件名
                          let filePath = context.filesDir + "/test.pdf";
                          let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                          fs.write(file.fd, result.pdfArrayBuffer().buffer).then((writeLen: number) => {
                            console.info("createPDF write data to file succeed and size is:" + writeLen);
                            if(writeLen>0) {
                               Utils.emitEvent(true, 20241127);
                               console.info('suceess111')
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

            case "emitSavePDF1": {
                this.controller.createPdf(this.pdfConfig)
                .then((result: webview.PdfData) => {
                  try {
                    // 获取组件上下文
                    let context = getContext(this) as common.UIAbilityContext;
                    // 获取沙箱路径，设置pdf文件名
                    let filePath = context.filesDir + "/test.pdf";
                    let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                    fs.write(file.fd, result.pdfArrayBuffer().buffer).then((writeLen: number) => {
                      console.info("pdfResult" + result.pdfArrayBuffer().length );
                      if(result.pdfArrayBuffer().length > 0) {
                        Utils.emitEvent(true, 20241128);
                      }
                    }).catch((err: BusinessError) => {
                      console.error("createPDF write data to file failed with error message: " + err.message +
                        ", error code: " + err.code);
                    }).finally(() => {
                      fs.closeSync(file);
                    });
                  } catch (resError) {
                    console.error(`ErrorCode: ${(resError as BusinessError).code},  Message: ${(resError as BusinessError).message}`);
                  }
                })

                break;
            }
          }
        })
      }


     Web({ src: "www.example.com", controller: this.controller })
   
    }
  }
}