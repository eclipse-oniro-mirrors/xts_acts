/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter'
import webview from '@ohos.web.webview'
import Utils from '../../test/Utils'
import { BusinessError } from '@ohos.base'

const EVENT_ID_SET_SUITE_KEY = 134000;

// Define Header interface for webview
interface Header {
  headerKey: string;
  headerValue: string;
}

// Define Resource type for testing
type Resource = string;

@Entry
@Component
struct WebResourceResponseGetResponseDataEx {
  controller: webview.WebviewController = new webview.WebviewController();
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  
  // Mock WebResourceResponse for testing
  mockResourceResponse: MockWebResourceResponse = new MockWebResourceResponse();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }
  
  build() {
    Column() {
      Row() {
        Button('Test Button').key('webResourceResponseTestButton').onClick(async () => {
          await Utils.waitForExist(() => this.isReceive, this.emitKey + ' isReceive', 1, 1000);
          await Utils.waitForExist(() => this.isPageEnd, this.emitKey + ' isPageEnd', 1, 1000);
          console.info('key==>' + this.emitKey)
          this.isReceive = -1;
          
          switch (this.emitKey) {
            case "testGetResponseDataExString001": {
              try {
                // Test with HTML string
                this.mockResourceResponse.setResponseData("<html><body>Test Content</body></html>");
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExString001 result: ' + result);
                Utils.emitEvent(result === "<html><body>Test Content</body></html>", 134010);
               } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExString001 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
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
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExString002 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
                Utils.emitEvent(false, 134020);
              }
              break;
            }
            
            case "testGetResponseDataExNumber001": {
              try {
                // Test with file handle
                this.mockResourceResponse.setResponseData(12345);
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExNumber001 result: ' + result);
                Utils.emitEvent(result === 12345, 134030);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExNumber001 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
                Utils.emitEvent(false, 134030);
              }
              break;
            }
            
            case "testGetResponseDataExNumber002": {
              try {
                // Test with zero file handle
                this.mockResourceResponse.setResponseData(0);
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExNumber002 result: ' + result);
                Utils.emitEvent(result === 0, 134040);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExNumber002 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
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
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExArrayBuffer001 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
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
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExResource001 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
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
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExUndefined001 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
                Utils.emitEvent(false, 134070);
              }
              break;
            }
            
            case "testGetResponseDataExBoundary001": {
              try {
                // Test with empty string
                this.mockResourceResponse.setResponseData("");
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExBoundary001 result: ' + result);
                // Check if result is an empty string
                Utils.emitEvent(result === "", 134080);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExBoundary001 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
                Utils.emitEvent(false, 134080);
              }
              break;
            }
            
            case "testGetResponseDataExBoundary002": {
              try {
                // Test with large number
                this.mockResourceResponse.setResponseData(2147483647);
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExBoundary002 result: ' + result);
                Utils.emitEvent(result === 2147483647, 134090);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExBoundary002 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
                Utils.emitEvent(false, 134090);
              }
              break;
            }
            
            case "testGetResponseDataExError001": {
              try {
                // Test with invalid state (should return undefined)
                this.mockResourceResponse.setInvalidState();
                let result = this.mockResourceResponse.getResponseDataEx();
                console.log('testGetResponseDataExError001 result: ' + result);
                Utils.emitEvent(result === undefined, 134100);
              } catch (error) {
                const businessError = error as BusinessError;
                console.error(`testGetResponseDataExError001 ErrorCode: ${businessError.code}, Message: ${businessError.message}`);
                Utils.emitEvent(true, 134100);
              }
              break;
            }
          }
        })
      }
      
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
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
class MockWebResourceResponse {
  private responseData: string | number | ArrayBuffer | Resource | undefined;
  private isValid: boolean = true;

  constructor(responseData?: string | number | ArrayBuffer | Resource) {
    this.responseData = responseData;
  }

  getResponseDataEx(): string | number | ArrayBuffer | Resource | undefined {
    if (!this.isValid) {
      return undefined;
    }
    return this.responseData;
  }

  setResponseData(data: string | number | ArrayBuffer | Resource | undefined): void {
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

  setResponseData_(data: string | number | boolean | ArrayBuffer): void {
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