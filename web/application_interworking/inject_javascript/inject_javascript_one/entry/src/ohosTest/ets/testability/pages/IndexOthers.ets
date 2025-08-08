/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
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

import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Utils';

class TestOfflineResource {
  public urlList: string[] | null;
  public resource: Uint8Array | null;
  public responseHeaders: TestWebHeader[] | null;
  public type: webview.OfflineResourceType | null;

  constructor(urlList: string[] | null, resource: Uint8Array | null, responseHeaders: webview.WebHeader[] | null,
    type: webview.OfflineResourceType | null){
    this.urlList = urlList;
    this.resource = resource;
    this.responseHeaders = responseHeaders;
    this.type = type;
  }
}

class TestWebHeader {
  public headerKey: string | null | undefined;
  public headerValue: string | null | undefined;

  constructor(headerKey: string | null | undefined, headerValue: | null | undefined){
    this.headerKey = headerKey;
    this.headerValue = headerValue
  }
}

class TestObj {
  constructor(){
  }

  test(testStr: string): string{
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(): void{
    console.log('Web Component toString');
  }

  testNumber(testNum: number): number{
    console.log('Web Component number' + testNum);
    return testNum;
  }

  asyncTestBool(testBol: boolean): void{
    console.log('Web Component boolean' + testBol);
  }
}

class WebObj {
  constructor(){
  }

  webTest(): string{
    console.log('Web test');
    return 'Web test';
  }

  webString(): void{
    console.log('Web test toString');
  }
}

class AsyncObj {
  constructor(){
  }

  asyncTest(): void{
    console.log('Async test');
  }

  asyncString(testStr: string): void{
    console.log('Web async string' + testStr);
  }
}

@Entry
@Component
struct Index {
  controller: webview.WebviewController = new webview.WebviewController();
  @State testObjTest: TestObj = new TestObj();
  @State webTestObj: WebObj = new WebObj();
  @State asyncTestObj: AsyncObj = new AsyncObj();
  @State resourceMapArr: Array<TestOfflineResource> = [];
  private header: string = 'https:'
  private body: string = '//www.example.com/example.js'
  private controllerTest: webview.WebviewController = new webview.WebviewController();
  private buf: Uint8Array = new Uint8Array(0);

  async aboutToAppear(): Promise<void>{
    this.initData()
  }

  async initData(){
    this.resourceMapArr = []
    this.buf = await readRawFile('example.html');
    let testData: TestOfflineResource = new TestOfflineResource([this.header + this.body], this.buf,
      [{ headerKey: 'Cross-Origin', headerValue: 'anonymous' }], webview.OfflineResourceType.CLASSIC_JS)
    this.resourceMapArr.push(testData)
  }

  build(){
    Column() {
      Button('refresh')
        .id('refresh')
        .onClick(() => {
          try {
            this.controller.refresh();
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('Register JavaScript To Window')
        .id('Register')
        .onClick(() => {
          try {
            this.controller.registerJavaScriptProxy(this.testObjTest, 'objName', ['test', 'toString', 'testNumber'],
              ['asyncTestBool']);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('Register JavaScript To Window')
        .id('Sub_WEB_javaScriptProxy_asyncMethodList_0200')
        .onClick(() => {
          try {
            this.controller.registerJavaScriptProxy(this.webTestObj, 'objTestName', ['webTest', 'webString']);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })


      Button('Register JavaScript To Window')
        .id('Sub_WEB_registerJavaScriptProxy_asyncMethodList_0100')
        .onClick(() => {
          try {
            this.controller.registerJavaScriptProxy(this.asyncTestObj, 'objAsyncName', [],
              ['asyncTest', 'asyncString']);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
          }
        })

      Button('Invalid url')
        .key('SetInjectOfflineUrlList')
        .onClick(() => {
          try {
            this.resourceMapArr[0].urlList = ['x&x']
            this.controller.injectOfflineResources(this.resourceMapArr)
          } catch (e) {
            Utils.emitEvent(e.code + e.message, 1001)
            console.log(e.code + e.message)
          } finally {
            this.initData()
          }
        })

      Button('Invalid input parameter')
        .key('SetInjectOfflineResource')
        .onClick(() => {
          try {
            this.resourceMapArr[0].resource = new Uint8Array(0)
            this.controller.injectOfflineResources(this.resourceMapArr)
          } catch (e) {
            Utils.emitEvent(e.code + e.message, 1002)
            console.log(e.code + e.message)
          } finally {
            this.initData()
          }
        })
        .margin({ top: 30 })

      Button('Invalid input parameter')
        .key('SetInjectOfflineHeaderKey')
        .onClick(async () => {
          try {
            this.resourceMapArr[0].responseHeaders = null
            this.controller.injectOfflineResources(this.resourceMapArr)
            console.log('success')
          } catch (e) {
            Utils.emitEvent(e.code + e.message, 1003)
            console.log(e.code + e.message)
          } finally {
            this.initData()
          }
        })
        .margin({ top: 30 })

      Button('Invalid input parameter')
        .key('SetInjectOfflineHeaderValue')
        .onClick(async () => {
          try {
            this.resourceMapArr[0].responseHeaders = null
            this.controller.injectOfflineResources(this.resourceMapArr)
            console.log('success')
          } catch (e) {
            Utils.emitEvent(e.code + e.message, 1004)
            console.log(e.code + e.message)
          } finally {
            this.initData()
          }
        })
        .margin({ top: 30 })

      Button('Invalid input parameter')
        .key('SetInjectOfflineType')
        .onClick(async () => {
          try {
            this.resourceMapArr[0].type = null
            this.controller.injectOfflineResources(this.resourceMapArr)
            console.log('success')
          } catch (e) {
            Utils.emitEvent(e.code + e.message, 1005)
            console.log(e.code + e.message)
          } finally {
            this.initData()
          }
        })
        .margin({ top: 30 })

      Button('Initialization failed')
        .key('InitializationFailed')
        .onClick(async () => {
          try {
            this.controllerTest.injectOfflineResources(this.resourceMapArr)
          } catch (e) {
            Utils.emitEvent(e.code + '', 1006)
            console.log(e.code + e.message)
          } finally {
            this.initData()
          }
        })
        .margin({ top: 30 })

      Button('correct')
        .onClick(async () => {
          try {
            this.controller.injectOfflineResources(this.resourceMapArr)
            console.log('success')
          } catch (e) {
            Utils.emitEvent(e.code + '', 1006)
            console.log(e.code + e.message)
          } finally {
            this.initData()
          }
        })
        .margin({ top: 30 })

      Web({ src: $rawfile('indexDemo.html'), controller: this.controller })
        .javaScriptAccess(true)
    }
  }
}

async function readRawFile(url: string){
  try {
    return await getContext().resourceManager.getRawFileContent(url);
  } catch (err) {
    return new Uint8Array(0);
  }
}