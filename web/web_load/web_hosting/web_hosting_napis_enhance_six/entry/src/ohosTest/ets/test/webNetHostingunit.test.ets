/*   * Copyright (c) 2024 Huawei Device Co., Ltd.   * Licensed under the Apache License, Version 2.0 (the "License");   * you may not use this file except in compliance with the License.   * You may obtain a copy of the License at   *   *     http://www.apache.org/licenses/LICENSE-2.0   *   * Unless required by applicable law or agreed to in writing, software   * distributed under the License is distributed on an "AS IS" BASIS,   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   * See the License for the specific language governing permissions and   * limitations under the License.   */
import { beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import Utils from './Utils';
// import { hilog } from '@kit.PerformanceAnalysisKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webviewApi() {

  describe('webNetHostingTwo', () => {

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(1000);
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

      Utils.emitEvent("emitWebHttpBodyStream_IsEof", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_IsEof", true, 7743, done);
      sendEventByKey('webHostingButton', 10, '');
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

      Utils.emitEvent("emitWebHttpBodyStream_IsChunked", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_IsChunked", true, 7744, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebHttpBodyStream_IsInMemory", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_IsInMemory", true, 7745, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebHttpBodyStream_GetPosition", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_GetPosition", true, 7746, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebHttpBodyStream_GetSize", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_GetSize", true, 7747, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebHttpBodyStream_SetReadCallback", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_SetReadCallback", true, 7748, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebHttpBodyStream_SetUserData", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_SetUserData", true, 7749, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebHttpBodyStream_Init", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebHttpBodyStream_Init", true, 7750, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebResourceHandler_Destroy", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceHandler_Destroy", true, 7751, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebResourceHandler_DidReceiveResponse", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceHandler_DidReceiveResponse", true, 7752, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebResourceHandler_DidReceiveData", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceHandler_DidReceiveData", true, 7753, done);
      sendEventByKey('webHostingButton', 10, '');
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
      Utils.emitEvent("emitWebResourceHandler_DidFinish", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("testWebResourceHandler_DidFinish", true, 7754, done);
      sendEventByKey('webHostingButton', 10, '');
    })
  })
}