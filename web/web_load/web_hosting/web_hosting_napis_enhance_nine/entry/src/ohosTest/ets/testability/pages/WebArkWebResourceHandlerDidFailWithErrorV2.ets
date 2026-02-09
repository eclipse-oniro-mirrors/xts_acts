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
import { waitForExist, waitForAssert } from '../../test/WaitTest.test';
import { URL_EXAMPLE_HTTPS } from '../../test/Config.test';
import testNapi from 'libentry.so'

@Entry
@Component
struct WebArkWebResourceHandlerDidFailWithErrorV2 {

  controller: webview.WebviewController = new webview.WebviewController('webTag');
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isWebInitPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 821,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(821)
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
    webview.WebviewController.initializeWebEngine();
    testNapi.initSchemeHandler();
  }


  build() {
    Column() {
      Row() {
          Button('ArkWebResourceHandlerDidFailWithErrorV2').key('ArkWebResourceHandlerDidFailWithErrorV2Test')
            .onClick(async () => {
              await waitForExist(()=>this.isReceive, 'ArkWebResourceHandlerDidFailWithErrorV2_isReceive', 1, 1000)
              await waitForExist(()=>this.isWebInitPageEnd, 'ArkWebResourceHandlerDidFailWithErrorV2_isWebInitPageEnd', 1, 1000)
              console.info('key==>' + this.emitKey)
              this.isReceive = -1
              switch (this.emitKey) {
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_001': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test1();
                  console.info('test1 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_001_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082101, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_002': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test2();
                  console.info('test2 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_002_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082102, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_003': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test3();
                  console.info('test3 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_003_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082103, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_004': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test4();
                  console.info('test4 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_004_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082104, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_005': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test5();
                  console.info('test5 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_005_isPageEnd', -1, 3000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082105, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_006': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test6();
                  console.info('test6 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_006_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082106, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_007': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test7();
                  console.info('test7 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_007_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082107, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_008': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test8();
                  console.info('test8 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_008_isPageEnd', -1, 3000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082108, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_009': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test9();
                  console.info('test9 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_009_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082109, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_010': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test10();
                  console.info('test10 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_010_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082110, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_011': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test11();
                  console.info('test11 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_011_isPageEnd', -1, 3000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082111, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_012': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test12();
                  console.info('test12 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_012_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082112, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_013': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test13();
                  console.info('test13 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_013_isPageEnd', -1, 3000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 17100101, 2025082113, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_014': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test14();
                  console.info('test14 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_014_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082114, this.emitKey, 1000);
                  break
                }
                case 'OH_ArkWebResourceHandler_DidFailWithErrorV2_015': {
                  this.isPageEnd = -1
                  let result:number = testNapi.test15();
                  console.info('test15 result:' + String(result))
                  this.controller.refresh()
                  await waitForExist(()=>this.isPageEnd, 'OH_ArkWebResourceHandler_DidFailWithErrorV2_015_isPageEnd', 1, 1000)
                  let check = (v1:number, v2:number):boolean => {
                    return v1 == v2
                  }
                  await waitForAssert(()=>testNapi.getResultCode(), check, 0, 2025082115, this.emitKey, 1000);
                  break
                }
                default :
                  break
              }
            })
        }
        Web({src: URL_EXAMPLE_HTTPS, controller: this.controller})
          .onPageBegin((event) => {
            console.log('onPageBegin url:' + event.url)
          })
          .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
            if (this.isWebInitPageEnd == -1) {
              this.isWebInitPageEnd = 1
              console.log('onPageEnd WebInitPageEnd url:' + event.url)
            }
            this.isPageEnd = 1;
          })
    }
  }
}
