/*   * Copyright (c) 2024 Huawei Device Co., Ltd.   * Licensed under the Apache License, Version 2.0 (the "License");   * you may not use this file except in compliance with the License.   * You may obtain a copy of the License at   *   *     http://www.apache.org/licenses/LICENSE-2.0   *   * Unless required by applicable law or agreed to in writing, software   * distributed under the License is distributed on an "AS IS" BASIS,   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   * See the License for the specific language governing permissions and   * limitations under the License.   */
import testNapi from 'libentry.so';
import { beforeEach, describe, it , TestType, Size, Level, beforeAll, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import Utils from './Utils';
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

    /**
     * @tc.name   testWebHttpBodyStream_IsEof
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0370
     * @tc.desc   test WebHttpBodyStream_IsEof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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



    /**
     * @tc.name   testWebHttpBodyStream_IsChunked
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0380
     * @tc.desc   test WebHttpBodyStream_IsChunked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebHttpBodyStream_IsInMemory
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0390
     * @tc.desc   test WebHttpBodyStream_IsInMemory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebHttpBodyStream_GetPosition
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0400
     * @tc.desc   test WebHttpBodyStream_GetPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebHttpBodyStream_GetSize
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0410
     * @tc.desc   test WebHttpBodyStream_GetSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebHttpBodyStream_SetReadCallback
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0420
     * @tc.desc   test WebHttpBodyStream_SetReadCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebHttpBodyStream_SetUserData
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0430
     * @tc.desc   test WebHttpBodyStream_SetUserData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebHttpBodyStream_Init
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0440
     * @tc.desc   test WebHttpBodyStream_Init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebResourceHandler_Destroy
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0450
     * @tc.desc   test WebResourceHandler_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebResourceHandler_DidReceiveResponse
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0460
     * @tc.desc   test WebResourceHandler_DidReceiveResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebResourceHandler_DidReceiveData
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0470
     * @tc.desc   test WebResourceHandler_DidReceiveData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebResourceHandler_DidFinish
     * @tc.number SUB_ACE_WEB_SCHEME_HANDLER_NAPI_0480
     * @tc.desc   test WebResourceHandler_DidFinish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testWebResourceRequest_IsMainFrame_True
     * @tc.number SUB_ACE_WEB_OH_ARKWEBRESOURCEREQUEST_ISMAINFRAME_RETURNTRUE
     * @tc.desc   test OH_ArkWebResourceRequest_IsMainFrame  return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebResourceRequest_IsMainFrame_True', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testWebResourceRequest_IsMainFrame_True PASS');
      Utils.emitEvent("testWebResourceRequest_IsMainFrame_True", 147701)
      Utils.registerBaseEvent('testWebResourceRequest_IsMainFrame_True', true, 147860, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
        })
      await Utils.waitAndClickComponent('webHostingButton',driver);
    })

     /**
      * @tc.name   testArkWebHttpBodyStream_IsInMemory_True
      * @tc.number SUB_ACE_WEB_OH_ArkWebHttpBodyStream_IsInMemory_RETURNTRUE
      * @tc.desc   test OH_ArkWebHttpBodyStream_IsInMemory  return true
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testArkWebHttpBodyStream_IsInMemory_True', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
       hilog.info(0x0000, 'testTag', '%{public}s', 'testArkWebHttpBodyStream_IsInMemory_True PASS');
       Utils.emitEvent("testArkWebHttpBodyStream_IsInMemory_True", 147701)
       Utils.registerBaseEvent('testArkWebHttpBodyStream_IsInMemory_True', 1, 147870, done, (backData: events_emitter.EventData, expected: Object) => {
             expect(backData?.data?.ACTION).assertEqual(expected)
         })
       await Utils.waitAndClickComponent('webHostingButton',driver);
     })

    /**
     * @tc.name   testArkWebGetNativeApiReturnNullptr
     * @tc.number SUB_ACE_WEB_OH_ARKWEB_GETNATIVEAPI_RETURNNULLPTR
     * @tc.desc   test OH_ArkWeb_GetNativeAPI  return nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebGetNativeApiReturnNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testArkWebGetNativeApiReturnNullptr start')
        try {
            let ret = testNapi.arkWebGetNativeApiReturnNullptr();
            expect(ret).assertEqual(0)
        } catch(error) {
            console.error('testArkWebGetNativeApiReturnNullptr error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebGetNativeApiReturnNullptr end')
        done()
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamGetUserDataReturnNullptr
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_GETUSERDATA_RETURNNULLPTR
     * @tc.desc   test OH_ArkWebHttpBodyStream_GetUserData  return nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebHttpBodyStreamGetUserDataReturnNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testArkWebHttpBodyStreamGetUserDataReturnNullptr start')
        try {
            let ret = testNapi.arkWebHttpBodyStreamGetUserDataReturnNullptr();
            expect(ret).assertEqual(0)
        } catch(error) {
            console.error('testArkWebHttpBodyStreamGetUserDataReturnNullptr error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebHttpBodyStreamGetUserDataReturnNullptr end')
        done()
    })

    /**
     * @tc.name   testArkWebResourceRequestGetUserDataReturnNullptr
     * @tc.number SUB_ACE_WEB_OH_ARKWEBRESOURCEREQUEST_GETUSERDATA_RETURNNULLPTR
     * @tc.desc   test OH_ArkWebResourceRequest_GetUserData  return nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebResourceRequestGetUserDataReturnNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testArkWebResourceRequestGetUserDataReturnNullptr start')
        try {
            let ret = testNapi.arkWebResourceRequestGetUserDataReturnNullptr();
            expect(ret).assertEqual(0)
        } catch(error) {
            console.error('testArkWebResourceRequestGetUserDataReturnNullptr error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebResourceRequestGetUserDataReturnNullptr end')
        done()
    })

    /**
     * @tc.name   testArkWebSchemeHandlerGetUserDataReturnNullptr
     * @tc.number SUB_ACE_WEB_OH_ARKWEBSCHEMEHANDLER_GETUSERDATA_RETURNNULLPTR
     * @tc.desc   test OH_ArkWebSchemeHandler_GetUserData  return nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebSchemeHandlerGetUserDataReturnNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testArkWebSchemeHandlerGetUserDataReturnNullptr start')
        try {
            let ret = testNapi.arkWebSchemeHandlerGetUserDataReturnNullptr();
            expect(ret).assertEqual(0)
        } catch(error) {
            console.error('testArkWebSchemeHandlerGetUserDataReturnNullptr error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebSchemeHandlerGetUserDataReturnNullptr end')
        done()
    })

    /**
     * @tc.name   testArkWebSetSchemeHandlerReturnTrue
     * @tc.number SUB_ACE_WEB_OH_ARKWEB_SETSCHEMEHANDLER_RETURNTURE
     * @tc.desc   test OH_ArkWeb_SetSchemeHandler  return nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkWebSetSchemeHandlerReturnTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.log('testArkWebSetSchemeHandlerReturnTrue start')
        try {
            let ret = testNapi.arkWebSetSchemeHandlerReturnTrue();
            expect(ret).assertEqual(1)
        } catch(error) {
            console.error('testArkWebSetSchemeHandlerReturnTrue error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebSetSchemeHandlerReturnTrue end')
        done()
    })

    /**
     * @tc.name   testArkWebSetSchemeHandlerReturnFalse
     * @tc.number SUB_ACE_WEB_OH_ARKWEB_SETSCHEMEHANDLER_RETURNFALSE
     * @tc.desc   test OH_ArkWeb_SetSchemeHandler  return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebSetSchemeHandlerReturnFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testArkWebSetSchemeHandlerReturnFalse start')
        try {
            let ret = testNapi.arkWebSetSchemeHandlerReturnFalse();
            expect(ret).assertEqual(0)
        } catch(error) {
            console.error('testArkWebSetSchemeHandlerReturnFalse error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebSetSchemeHandlerReturnFalse end')
        done()
    })

    /**
     * @tc.name   testArkWebServiceWorkerSetSchemeHandlerReturnTrue
     * @tc.number SUB_ACE_WEB_OH_ARKWEBSERVICEWORKER_SETSCHEMEHANDLER_RETURNTURE
     * @tc.desc   test OH_ArkWebServiceWorker_SetSchemeHandler  return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkWebServiceWorkerSetSchemeHandlerReturnTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.log('testArkWebServiceWorkerSetSchemeHandlerReturnTrue start')
        try {
            let ret = testNapi.arkWebServiceWorkerSetSchemeHandlerReturnTrue();
            expect(ret).assertEqual(1)
        } catch(error) {
            console.error('testArkWebServiceWorkerSetSchemeHandlerReturnTrue error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebServiceWorkerSetSchemeHandlerReturnTrue end')
        done()
    })

    /**
     * @tc.name   testArkWebServiceWorkerSetSchemeHandlerReturnFalse
     * @tc.number SUB_ACE_WEB_OH_ARKWEBSERVICEWORKER_SETSCHEMEHANDLER_RETURNFALSE
     * @tc.desc   test OH_ArkWebServiceWorker_SetSchemeHandler  return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebServiceWorkerSetSchemeHandlerReturnFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testArkWebServiceWorkerSetSchemeHandlerReturnFalse start')
        try {
            let ret = testNapi.arkWebServiceWorkerSetSchemeHandlerReturnFalse();
            expect(ret).assertEqual(0)
        } catch(error) {
            console.error('testArkWebServiceWorkerSetSchemeHandlerReturnFalse error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testArkWebServiceWorkerSetSchemeHandlerReturnFalse end')
        done()
    })

  })
}