/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Web,
  Row
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = '';

  pdfConfig: webview.PdfConfiguration = {
    width: 8.27,
    height: 11.69,
    marginTop: 0,
    marginBottom: 0,
    marginRight: 0,
    marginLeft: 0,
    scale: 1.0,
    shouldPrintBackground: true
  } as webview.PdfConfiguration

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear');
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && (eventData.data as Record<string , RecordData>)?.['ACTION'] != null) {
        this.str = '' + (eventData.data as Record<string , RecordData>)?.['ACTION'];
      }
    }
  }


  build() {
    Column(undefined) {
      Row() {
        Button('SavePDF').key('webSavePDF').onClick((e: ClickEvent) => {
          console.log('key==>' + this.str)
          switch (this.str) {
            case 'emitSavePDF': {
              this.controller.createPdf(this.pdfConfig)
                .then((result: webview.PdfData) => {
                  try {
                    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
                    if (!context || !context.filesDir) {
                      console.error('获取 UIAbilityContext 失败！');
                    }
                    let filePath = context?.filesDir + '/test.pdf';
                    let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                    const buffer = result.pdfArrayBuffer()
                    fs.write(file.fd, result.pdfArrayBuffer().buffer)
                      .then((writeLen: Long) => {
                        console.info('createPDF write data to file succeed and size is :' + writeLen);
                        if (writeLen > 0) {
                          Utils.emitEvent(true, 20241127);
                          console.info('suceess emit')
                        }
                      }).catch((err: Error): void => {
                      console.error('createPDF write data to file failed with error message: ' + err.message +
                        ', error code: ' + err.code);
                    }).finally(() => {
                      fs.closeSync(file);
                    });
                  } catch (resError) {
                    console.error(`ErrorCode: ${(resError as BusinessError).code},  Message: ${(resError as BusinessError).message}`);
                  }
                });
              break;
            }

            case "emitSavePDF1": {
              this.controller.createPdf(this.pdfConfig)
                .then((result: webview.PdfData) => {
                  try {
                    // 获取组件上下文
                    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
                    // 获取沙箱路径，设置pdf文件名
                    let filePath = context.filesDir + "/test.pdf";
                    let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                    const buffer = result.pdfArrayBuffer()
                    fs.write(file.fd, result.pdfArrayBuffer().buffer)
                        .then((writeLen: Long) => {
                      console.info("pdfResult" + writeLen );
                      if(writeLen > 0) {
                        Utils.emitEvent(true, 20241128);
                      }
                        }).catch((err: Error): void => {
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

      Web({src:'www.example.com', controller:this.controller})
        .imageAccess(true)
        .databaseAccess(true)

    }
  }
}