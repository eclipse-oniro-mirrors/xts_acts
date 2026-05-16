/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  OnHttpErrorReceiveEvent,
  OnInterceptRequestEvent,
  Header,
  WebResourceResponse,
  OnRenderExitedEvent,
  OnPageBeginEvent,
  RenderProcessNotRespondingReason,
  RenderProcessNotRespondingData,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  Resource
} from "@ohos.arkui.component"
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import { UIContext, Router } from '@ohos.arkui.UIContext'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebGetResponseDataExTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isReceive: int = -1;
  @State isPageEnd: int = -1;

  // Mock WebResourceResponse for testing
  mockResourceResponse: MockWebResourceResponse = new MockWebResourceResponse();

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('Test Button').key('WebResourceResponseTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case "testGetResponseDataExString001": {
              try {
                // Test with HTML string
                this.mockResourceResponse.setResponseData("<html><body>Test Content</body></html>");
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExString001 result: ' + result);
                Utils.emitEvent(result === "<html><body>Test Content</body></html>", 134010);
              } catch (error) {
                console.error(`testGetResponseDataExString001 ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 134010);
              }
              break;
            }

            case "testGetResponseDataExString002": {
              try {
                // Test with plain string
                this.mockResourceResponse.setResponseData("plain text data");
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExString002 result: ' + result);
                Utils.emitEvent(result === "plain text data", 134020);
              } catch (error) {
                console.error(`testGetResponseDataExString002 ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 134020);
              }
              break;
            }

            case "testGetResponseDataExInt001": {
              try {
                // Test with file handle
                this.mockResourceResponse.setResponseData(12345);
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExNumber001 result: ' + result);
                Utils.emitEvent(result === 12345, 134030);
              } catch (error) {
                console.error(`testGetResponseDataExNumber001 ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 134030);
              }
              break;
            }

            case "testGetResponseDataExInt002": {
              try {
                // Test with zero file handle
                this.mockResourceResponse.setResponseData(0);
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExNumber002 result: ' + result);
                Utils.emitEvent(result === 0, 134040);
              } catch (error) {
                console.error(`testGetResponseDataExNumber002 ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 134040);
              }
              break;
            }

            case "testGetResponseDataExArrayBuffer001": {
              try {
                // Test with ArrayBuffer
                let buffer = new ArrayBuffer(1024);
                this.mockResourceResponse.setResponseData(buffer);
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExArrayBuffer001 result type: ' + typeof result);
                Utils.emitEvent(true, 134050);
              } catch (error) {
                console.error(`testGetResponseDataExArrayBuffer001 ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 134050);
              }
              break;
            }

            case "testGetResponseDataExResource001": {
              try {
                // Test with Resource (using $rawfile string representation)
                this.mockResourceResponse.setResponseData("$rawfile('test.html')");
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExResource001 result: ' + result);
                Utils.emitEvent(true, 134060);
              } catch (error) {
                console.error(`testGetResponseDataExResource001 ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 134060);
              }
              break;
            }

            case "testGetResponseDataExUndefined001": {
              try {
                // Test with undefined
                this.mockResourceResponse.setResponseData(undefined);
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExUndefined001 result: ' + result);
                Utils.emitEvent(result === undefined, 134070);
              } catch (error) {
                console.error(`testGetResponseDataExUndefined001 ErrorCode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(false, 134070);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'https://gitee.com/openharmony/123', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}


// Mock WebResourceResponse class for testing
export class MockWebResourceResponse {
  private responseData: string | int | ArrayBuffer | Resource | undefined;
  private isValid: boolean = true;

  constructor(responseData?: string | int | ArrayBuffer | Resource) {
    this.responseData = responseData;
  }

  getResponseDataEx(): string | int | ArrayBuffer | Resource | undefined {
    if (!this.isValid) {
      return undefined;
    }
    return this.responseData;
  }

  setResponseData(data: string | int | ArrayBuffer | Resource | undefined): void {
    this.responseData = data;
    this.isValid = true;
  }

  setInvalidState(): void {
    this.isValid = false;
  }

  // Mock methods to match WebResourceResponse interface
  getReasonMessage(): string {
    return "OK";
  }

  getResponseCode(): number {
    return 200;
  }

  getResponseData(): string {
    return this.responseData as string || "";
  }

  getResponseEncoding(): string {
    return "utf-8";
  }

  getResponseHeader(): Array<Header> {
    return [];
  }

  getResponseMimeType(): string {
    return "text/html";
  }

  getResponseIsReady(): boolean {
    return this.isValid;
  }

  setResponseData_(data: string | int | Resource | ArrayBuffer): void {
    if (typeof data === 'boolean') {
      this.setResponseData(data ? "true" : "false");
    } else {
      this.setResponseData(data);
    }
  }

  setResponseEncoding(encoding: string): void {
    // Mock implementation
  }

  setResponseMimeType(mimeType: string): void {
    // Mock implementation
  }

  setReasonMessage(reason: string): void {
    // Mock implementation
  }

  setResponseHeader(header: Array<Header>): void {
    // Mock implementation
  }

  setResponseCode(code: number): void {
    // Mock implementation
  }

  setResponseIsReady(isReady: boolean): void {
    this.isValid = isReady;
  }
}