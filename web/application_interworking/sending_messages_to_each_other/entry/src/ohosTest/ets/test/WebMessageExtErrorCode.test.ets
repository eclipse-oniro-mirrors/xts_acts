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

import { beforeAll, beforeEach, afterEach,describe, it, expect,TestType,Size,Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
import { Driver, ON } from '@kit.TestKit';
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webMessageExtErrorCode() {

  describe('webMessageExtErrorCodeTestSuite', () => {

      let pageName = 'webMessageExtErrorCode'
      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'testability/pages/' + pageName,
        }
        try {
          router.clear();
          let pages = router.getState();
          console.info(`get ${pageName} state success ` + JSON.stringify(pages));
          if (!(pageName == pages.name)) {
            console.info(`get ${pageName} state success ` + JSON.stringify(pages.name));
            let result = await router.pushUrl(options);
            console.info(`push ${pageName} page success ` + JSON.stringify(result));
          }
        } catch (err) {
          console.error(`push ${pageName} page error: ` + err);
        }
        await waitForComponent("WebMessageExtErrorCodeButton");
        done()
      });

      beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        console.info(`${pageName} beforeEach start`);
        done();
      })

      afterEach(async (done: Function) => {
        console.info(`${pageName} afterEach start`);
        console.info(`${pageName} afterEach end`);
        done();
      })


    /**
     * @tc.name   testWebMessageExtSetStringErrorCode001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETSTRING_ERROR_CODE_0100
     * @tc.desc   test WebMessageExtSetString error code 17100014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetStringErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetStringErrorCode001", 170290)
      Utils.registerEvent("testWebMessageExtSetStringErrorCode001", "17100014", 170300, done);
      sendEventByKey('WebMessageExtErrorCodeButton', 10, '');

    })

    /**
     * @tc.name   testWebMessageExtSetNumberErrorCode001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETNUMBER_ERROR_CODE_0100
     * @tc.desc   test WebMessageExtSetNumber error code 17100014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetNumberErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetNumberErrorCode001", 170290)
      Utils.registerEvent("testWebMessageExtSetNumberErrorCode001", "17100014", 170310, done);
      sendEventByKey('WebMessageExtErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetBooleanErrorCode001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETBOOLEAN_ERROR_CODE_0100
     * @tc.desc   test WebMessageExtSetBoolean error code 17100014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetBooleanErrorCode001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetBooleanErrorCode001", 170290)
      Utils.registerEvent("testWebMessageExtSetBooleanErrorCode001", "17100014", 170320, done);
      sendEventByKey('WebMessageExtErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetArrayBufferErrorCode001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAYBUFFER_ERROR_CODE_0100
     * @tc.desc   test WebMessageExtSetArrayBuffer error code 17100014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetArrayBufferErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayBufferErrorCode001", 170290)
      Utils.registerEvent("testWebMessageExtSetArrayBufferErrorCode001", "17100014", 170330, done);
      sendEventByKey('WebMessageExtErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetArrayErrorCode001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAY_ERROR_CODE_0100
     * @tc.desc   test WebMessageExtSetArray error code 17100014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetArrayErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayErrorCode001", 170290)
      Utils.registerEvent("testWebMessageExtSetArrayErrorCode001", "17100014", 170340, done);
      sendEventByKey('WebMessageExtErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetErrorErrorCode001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETERROR_ERROR_CODE_0100
     * @tc.desc   test WebMessageExtSetError error code 17100014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetErrorErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetErrorErrorCode001", 170290)
      Utils.registerEvent("testWebMessageExtSetError002", "17100014", 170350, done);
      sendEventByKey('WebMessageExtErrorCodeButton', 10, '');
    })



  })
}
