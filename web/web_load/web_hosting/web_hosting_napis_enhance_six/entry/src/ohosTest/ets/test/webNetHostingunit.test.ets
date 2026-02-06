/*   * Copyright (c) 2024 Huawei Device Co., Ltd.   * Licensed under the Apache License, Version 2.0 (the "License");   * you may not use this file except in compliance with the License.   * You may obtain a copy of the License at   *   *     http://www.apache.org/licenses/LICENSE-2.0   *   * Unless required by applicable law or agreed to in writing, software   * distributed under the License is distributed on an "AS IS" BASIS,   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   * See the License for the specific language governing permissions and   * limitations under the License.   */
import { beforeEach, describe, it , TestType, Size, Level, beforeAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import Utils from './Utils';
// import { hilog } from '@kit.PerformanceAnalysisKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const  driver = Driver.create();

export default function webviewApi() {

  describe('webNetHostingTwo', () => {

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0370
     * @tc.name       : testWebHttpBodyStream_IsEof
     * @tc.desc       : test WebHttpBodyStream_IsEof
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_IsEof', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsEof PASS');
      Utils.emitEvent("emitWebHttpBodyStream_IsEof", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_IsEof", true, 147740, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'testWebHttpBodyStream_IsEof', true,1000);
      done();
    })



    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0380
     * @tc.name       : testWebHttpBodyStream_IsChunked
     * @tc.desc       : test WebHttpBodyStream_IsChunked
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_IsChunked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsChunked PASS');

      Utils.emitEvent("emitWebHttpBodyStream_IsChunked", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_IsChunked", true, 147750, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'testWebHttpBodyStream_IsChunked', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0390
     * @tc.name       : testWebHttpBodyStream_IsInMemory
     * @tc.desc       : test WebHttpBodyStream_IsInMemory
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_IsInMemory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_IsInMemory PASS');
      Utils.emitEvent("emitWebHttpBodyStream_IsInMemory", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_IsInMemory", true, 147760, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'testWebHttpBodyStream_IsInMemory', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0400
     * @tc.name       : testWebHttpBodyStream_GetPosition
     * @tc.desc       : test WebHttpBodyStream_GetPosition
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_GetPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_GetPosition PASS');
      Utils.emitEvent("emitWebHttpBodyStream_GetPosition", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_GetPosition", true, 147770, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'testWebHttpBodyStream_GetPosition', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0410
     * @tc.name       : testWebHttpBodyStream_GetSize
     * @tc.desc       : test WebHttpBodyStream_GetSize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_GetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_GetSize PASS');
      Utils.emitEvent("emitWebHttpBodyStream_GetSize", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_GetSize", true, 147780, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'testWebHttpBodyStream_GetSize', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0420
     * @tc.name       : testWebHttpBodyStream_SetReadCallback
     * @tc.desc       : test WebHttpBodyStream_SetReadCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_SetReadCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_SetReadCallback PASS');
      Utils.emitEvent("emitWebHttpBodyStream_SetReadCallback", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_SetReadCallback", true, 147790, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'testWebHttpBodyStream_SetReadCallback', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0430
     * @tc.name       : testWebHttpBodyStream_SetUserData
     * @tc.desc       : test WebHttpBodyStream_SetUserData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_SetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_SetUserData PASS');
      Utils.emitEvent("emitWebHttpBodyStream_SetUserData", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_SetUserData", true, 147800, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'emitWebHttpBodyStream_SetUserData', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0440
     * @tc.name       : testWebHttpBodyStream_Init
     * @tc.desc       : test WebHttpBodyStream_Init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebHttpBodyStream_Init', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebHttpBodyStream_Init PASS');
      Utils.emitEvent("emitWebHttpBodyStream_Init", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebHttpBodyStream_Init", true, 147810, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'emitWebHttpBodyStream_Init', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0450
     * @tc.name       : testWebResourceHandler_Destroy
     * @tc.desc       : test WebResourceHandler_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebResourceHandler_Destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_Destroy PASS');
      Utils.emitEvent("emitWebResourceHandler_Destroy", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebResourceHandler_Destroy", true, 147820, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'emitWebResourceHandler_Destroy', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0460
     * @tc.name       : testWebResourceHandler_DidReceiveResponse
     * @tc.desc       : test WebResourceHandler_DidReceiveResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebResourceHandler_DidReceiveResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidReceiveResponse PASS');
      Utils.emitEvent("emitWebResourceHandler_DidReceiveResponse", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebResourceHandler_DidReceiveResponse", true, 147830, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'emitWebResourceHandler_DidReceiveResponse', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0470
     * @tc.name       : testWebResourceHandler_DidReceiveData
     * @tc.desc       : test WebResourceHandler_DidReceiveData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebResourceHandler_DidReceiveData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidReceiveData PASS');
      Utils.emitEvent("emitWebResourceHandler_DidReceiveData", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebResourceHandler_DidReceiveData", true, 147840, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'emitWebResourceHandler_DidReceiveData', true,1000);
      done();
    })

    /*
     * @tc.number     : SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0480
     * @tc.name       : testWebResourceHandler_DidFinish
     * @tc.desc       : test WebResourceHandler_DidFinish
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testWebResourceHandler_DidFinish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceHandler_DidFinish PASS');
      Utils.emitEvent("emitWebResourceHandler_DidFinish", 147701)
      let isReturn = false;
      Utils.registerEvent("testWebResourceHandler_DidFinish", true, 147850, ()=>{isReturn = true});
      Utils.waitAndClickComponent('webHostingButton',driver);
      await waitForExist(()=>isReturn, 'emitWebResourceHandler_DidFinish', true,1000);
      done();
    })
  })
}