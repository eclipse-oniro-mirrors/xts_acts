/*
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

import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import { waitForExist } from '../../test/WaitTest.test';
import { URL_EXAMPLE_HTTPS, URL_EXAMPLE_HTTP } from '../../test/Config.test';
import testNapi from 'libentry.so'

@Entry
@Component
struct WebArkWebHttpBodyStream {

  controller: webview.WebviewController = new webview.WebviewController('scheme-handler');
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isEnd: number = -1


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 147101,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(147101)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  aboutToAppear() {
    console.info('start run testcase!!!')
    //注册三方 协议的配置
    testNapi.registerCustomSchemes();
    //初始化web组件内核，该操作会初始化Browser进程以及创建BrowserContext
    webview.WebviewController.initializeWebEngine();
    //设置SchemeHandler
    testNapi.setSchemeHandler();
  }


  build() {
    Column() {
      Row() {
          Button('ArkWebHttpBodyStreamButton').key('ArkWebHttpBodyStreamTest')
            .onClick(async () => {
              await waitForExist(()=>this.isReceive, 'ArkWebHttpBodyStreamTest_isReceive', 1, 1000)
              await waitForExist(()=>this.isPageEnd, 'ArkWebHttpBodyStreamTest_isPageEnd', 1, 1000)
              console.info('key==>' + this.emitKey)
              this.isReceive = -1
              switch (this.emitKey) {
                case 'OH_ArkWebHttpBodyStream_SetAsyncReadCallback001': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_SetAsyncReadCallback001_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','BYTES')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BYTES) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BYTES) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_SetAsyncReadCallback001_requestStop', 1, 1000)
                  let setAsyncReadCallback:number = testNapi.setAsyncReadCallback()
                  console.info('setAsyncReadCallback:' + String(setAsyncReadCallback))
                  Utils.emitEvent(setAsyncReadCallback,147100)
                  break
                }
                case 'ArkWebHttpBodyStreamAsyncReadCallback001': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'ArkWebHttpBodyStreamAsyncReadCallback001_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','BYTES')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BYTES) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BYTES) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'ArkWebHttpBodyStreamAsyncReadCallback001_requestStop', 1, 1000)
                  let asyncReadCallback:number = testNapi.asyncReadCallback()
                  console.info('asyncReadCallback:' + String(asyncReadCallback))
                  Utils.emitEvent(asyncReadCallback,147110)
                  break
                }
                case 'ArkWebHttpBodyStreamAsyncReadCallback002': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'ArkWebHttpBodyStreamAsyncReadCallback002_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','TEXT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,TEXT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,TEXT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'ArkWebHttpBodyStreamAsyncReadCallback002_requestStop', 1, 1000)
                  let asyncReadMore:number = testNapi.asyncReadMore()
                  console.info('asyncReadMore:' + String(asyncReadMore))
                  Utils.emitEvent(asyncReadMore,147120)
                  break
                }
                case 'ArkWebHttpBodyStreamAsyncReadCallback003': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'ArkWebHttpBodyStreamAsyncReadCallback003_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','BYTES')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BYTES) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BYTES) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'ArkWebHttpBodyStreamAsyncReadCallback003_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147130)
                  break
                }
                case 'ArkWebHttpBodyStreamAsyncReadCallback004': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'ArkWebHttpBodyStreamAsyncReadCallback004_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','TEXT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,TEXT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,TEXT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'ArkWebHttpBodyStreamAsyncReadCallback004_requestStop', 1, 1000)
                  let asyncReadMore:number = testNapi.asyncReadMore()
                  console.info('asyncReadMore:' + String(asyncReadMore))
                  Utils.emitEvent(asyncReadMore,147140)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead001': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead001_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','TEXT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,TEXT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,TEXT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead001_requestStop', 1, 1000)
                  let asyncRead:number = testNapi.asyncRead()
                  console.info('asyncRead:' + String(asyncRead))
                  Utils.emitEvent(asyncRead,147150)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead002': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead002_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','TEXT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,TEXT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,TEXT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead002_requestStop', 1, 1000)
                  let asyncReadMore:number = testNapi.asyncReadMore()
                  console.info('asyncReadMore:' + String(asyncReadMore))
                  Utils.emitEvent(asyncReadMore,147160)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead003': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead003_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','TEXT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,TEXT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,TEXT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead003_requestStop', 1, 1000)
                  let threadIdEqual:number = testNapi.threadIdEqual()
                  console.info('asyncReadMore:' + String(threadIdEqual))
                  Utils.emitEvent(threadIdEqual,147170)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead004': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTP+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead004_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('http://www.example.com/xhr','TEXT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,TEXT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,TEXT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead004_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147180)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead005': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTP+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead005_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('http://www.example.com/xhr','BYTES')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BYTES) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BYTES) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead005_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147190)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead006': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTP+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead006_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('http://www.example.com/xhr','BLOB')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BLOB) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BLOB) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead006_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  let result: boolean = false
                  if (readBufferValue.endsWith('--\r\n')) {
                    console.info('readBufferValue endsWith:--\r\n')
                    result = true
                  }
                  Utils.emitEvent(result,147200)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead007': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTP+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead007_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("testPostChunked('http://www.example.com/xhr')",(error, result) => {
                    if (error) {
                      console.error('testPostChunked(xhr) return error:' + error)
                    }
                    if (result) {
                      console.info('testPostChunked(xhr) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead007_requestStop', 1, 1000)
                  let asyncReadMore:number = testNapi.asyncReadMore()
                  console.info('asyncReadMore:' + String(asyncReadMore))
                  Utils.emitEvent(asyncReadMore,147210)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead008': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTP+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead008_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('http://www.example.com/xhr','ARRAYBUFFER')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,ARRAYBUFFER) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,ARRAYBUFFER) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead008_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147220)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead009': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTP+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead009_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('http://www.example.com/xhr','DOCUMENTOBJECT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,DOCUMENTOBJECT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,DOCUMENTOBJECT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead009_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147230)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead010': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead010_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','TEXT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,TEXT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,TEXT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead010_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147240)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead011': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead011_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','BYTES')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BYTES) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BYTES) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead011_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147250)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead012': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead012_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','BLOB')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BLOB) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BLOB) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead012_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  let result: boolean = false
                  if (readBufferValue.endsWith('--\r\n')) {
                    console.info('readBufferValue endsWith:--\r\n')
                    result = true
                  }
                  Utils.emitEvent(result,147260)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead013': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead013_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("testPostChunked('https://www.example.com/xhr')",(error, result) => {
                    if (error) {
                      console.error('testPostChunked(xhr) return error:' + error)
                    }
                    if (result) {
                      console.info('testPostChunked(xhr) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead013_requestStop', 1, 1000)
                  let asyncReadMore:number = testNapi.asyncReadMore()
                  console.info('asyncReadMore:' + String(asyncReadMore))
                  Utils.emitEvent(asyncReadMore,147270)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead014': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead014_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','ARRAYBUFFER')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,ARRAYBUFFER) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,ARRAYBUFFER) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead014_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147280)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead015': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead015_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','DOCUMENTOBJECT')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,DOCUMENTOBJECT) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,DOCUMENTOBJECT) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead015_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147290)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead016': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead016_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','LT_BUFFER')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,LT_BUFFER) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,LT_BUFFER) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead0016_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147300)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead017': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead017_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','EQ_BUFFER')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,EQ_BUFFER) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,EQ_BUFFER) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead0017_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147310)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead018': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead018_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','GT_BUFFER')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,GT_BUFFER) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,GT_BUFFER) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead0018_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147320)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead019': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead019_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/xhr','BYTES')",(error, result) => {
                    if (error) {
                      console.error('textPost(xhr,BYTES) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(xhr,BYTES) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead019_requestStop', 1, 1000)
                  let readBufferValueHello:string = testNapi.readBufferValue()
                  console.info('readBufferValueHello:' + readBufferValueHello)

                  this.controller.runJavaScript("textPost('https://www.example.com/httpBodyStreamNullptr','GT_BUFFER')",(error, result) => {
                    if (error) {
                      console.error('textPost(httpBodyStreamNullptr,GT_BUFFER) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(httpBodyStreamNullptr,GT_BUFFER) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead019_requestStop', -1, 1000)
                  //获取的是上次执行的结果 : scheme_handler http body stream is nullptr
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147330)
                  break
                }
                case 'OH_ArkWebHttpBodyStream_AsyncRead020': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTPS+'/post_data.html')
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebHttpBodyStream_AsyncRead020_isPageEnd', 1, 1000)
                  this.controller.runJavaScript("textPost('https://www.example.com/bufLenZero','GT_BUFFER')",(error, result) => {
                    if (error) {
                      console.error('textPost(bufLenZero,GT_BUFFER) return error:' + error)
                    }
                    if (result) {
                      console.info('textPost(bufLenZero,GT_BUFFER) return result:' + result)
                    }
                  })
                  await waitForExist(()=>testNapi.requestStop(), 'OH_ArkWebHttpBodyStream_AsyncRead020_requestStop', 1, 1000)
                  let readBufferValue:string = testNapi.readBufferValue()
                  console.info('readBufferValue:' + readBufferValue)
                  Utils.emitEvent(readBufferValue,147340)
                  break
                }

                default :
                  break
              }
            })
        }
        Web({src: $rawfile('test.html'), controller: this.controller})
          .height('50%')
          .width('100%')
          .javaScriptAccess(true)
          .fileAccess(true)
          .domStorageAccess(true)
          .databaseAccess(true)
          .onControllerAttached(() => {
            console.log('onControllerAttached webId:' + this.controller.getWebId())
          })
          .onPageBegin((event) => {
            console.log('onPageBegin url:' + event.url)
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
            testNapi.initResourceManager(this.getUIContext().getHostContext()!.resourceManager)
            this.isPageEnd = 1;
          })
    }
  }
}
