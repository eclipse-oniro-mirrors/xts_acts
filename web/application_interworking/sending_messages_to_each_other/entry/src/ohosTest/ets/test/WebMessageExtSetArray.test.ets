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
 * See the License for specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
import { Driver, ON } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function webMessageExtSetArray() {

  describe('webMessageExtSetArrayTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebMessageExtSetArray',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebMessageExtSetArray state success " + JSON.stringify(pages));
        if (!("WebMessageExtSetArray" == pages.name)) {
          console.info("get WebMessageExtSetArray state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebMessageExtSetArray page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebMessageExtSetArray page error: " + err);
      }
      await Utils.waitForComponent(driver,'WebMessageExtSetArrayButton');
      done()
    });
    
    /**
     * @tc.name   testWebMessageExtSetArrayWithEmpty001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAY_EMPTY_0100
     * @tc.desc   test WebMessageExt setArray with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetArrayWithEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayWithEmpty001", 170298)
      Utils.registerEvent("testWebMessageExtSetArrayWithEmpty001", '401', 170271, done);
      sendEventByKey('WebMessageExtSetArrayButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetArrayWithNull002
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAY_NULL_0200
     * @tc.desc   test WebMessageExt setArray with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtSetArrayWithNull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayWithNull002", 170298)
      Utils.registerEvent("testWebMessageExtSetArrayWithNull002", "\"Receive arraybuffer:\"", 170272, done);
      sendEventByKey('WebMessageExtSetArrayButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetArrayWithUndefined003
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAY_UNDEFINED_0300
     * @tc.desc   test WebMessageExt setArray with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebMessageExtSetArrayWithUndefined003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayWithUndefined003", 170298)
      Utils.registerEvent("testWebMessageExtSetArrayWithUndefined003",  "\"Receive arraybuffer:\"", 170273, done);
      sendEventByKey('WebMessageExtSetArrayButton', 10, '');
    })

    /**
     * @tc.name   testWebMessageExtSetArrayWithMixedTypes004
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAY_MIXED_0400
     * @tc.desc   test WebMessageExt setArray with mixed types (string, number, boolean)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebMessageExtSetArrayWithMixedTypes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetArrayWithMixedTypes004", 170298)
      Utils.registerEvent("testWebMessageExtSetArrayWithMixedTypes004", '401', 170274, done);
      sendEventByKey('WebMessageExtSetArrayButton', 10, '');
    })

  })
}
