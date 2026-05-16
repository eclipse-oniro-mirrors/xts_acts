/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_RESULT_KEY = 133250;
const driver = Driver.create();

export default function SerializeWebStateTest() {

  describe('SerializeWebStateTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/SerializeWebState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SerializeWebState state success " + JSON.stringify(pages));
        if (!("SerializeWebState" == pages.name)) {
          console.info("get SerializeWebState state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push SerializeWebState page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SerializeWebState page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("SerializeWebState beforeEach start");
      done();
    })

    /**
     * @tc.name testSerializeWebStateReturnValue001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SERIALIZE_WEBSTATE_RETURN_VALUE_001
     * @tc.desc Test serializeWebState returns non-null Uint8Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('testSerializeWebStateReturnValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSerializeWebStateReturnValue001", EVENT_ID_SET_RESULT_KEY);
      let isReturn = false;
      Utils.registerEvent("testSerializeWebStateReturnValue001", "Uint8Array", 133251, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "SerializeWebStateTestButton");
      await Utils.waitForExist(() => isReturn, "testSerializeWebStateReturnValue001" + '_returnCheck', true, 1000);
      done();
    })

    //
    // it('testOnFirstContentfulPaint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    //   Utils.emitEvent("emitOnFirstContentfulPaint001", EVENT_ID_SET_SUITE_KEY);
    //   let isReturn = false;
    //   Utils.registerEvent("testOnFirstContentfulPaint001", false, 127110, () => { isReturn = true });
    //   Utils.waitAndClickComponent(driver, "WebOnFirstContentfulPaintButton", "testOnFirstContentfulPaint001");
    //   await Utils.waitForExist(() => isReturn, "testOnFirstContentfulPaint001" + '_returnCheck', true, 1000);
    //   done();
    // })
    /**
     * @tc.name testSerializeWebStateNonEmpty002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SERIALIZE_WEBSTATE_NON_EMPTY_002
     * @tc.desc Test serializeWebState returns non-empty Uint8Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSerializeWebStateNonEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSerializeWebStateNonEmpty002", EVENT_ID_SET_RESULT_KEY);
      let isReturn = false;
      Utils.registerEvent("testSerializeWebStateNonEmpty002","nonEmpty", 133252, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "SerializeWebStateTestButton");
      await Utils.waitForExist(() => isReturn, "testSerializeWebStateNonEmpty002" + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name testSerializeWebStateValidForRestore003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SERIALIZE_WEBSTATE_VALID_FOR_RESTORE_003
     * @tc.desc Test serializeWebState return value is valid for restoreWebState
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSerializeWebStateValidForRestore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSerializeWebStateValidForRestore003", EVENT_ID_SET_RESULT_KEY);
      let isReturn = false;
      Utils.registerEvent("testSerializeWebStateValidForRestore003","validForRestore", 133253, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "SerializeWebStateTestButton");
      await Utils.waitForExist(() => isReturn, "testSerializeWebStateValidForRestore003" + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name testSerializeWebStateErrorHandling004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SERIALIZE_WEBSTATE_ERROR_HANDLING_004
     * @tc.desc Test serializeWebState error handling when controller not associated with Web component
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSerializeWebStateErrorHandling004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSerializeWebStateErrorHandling004", EVENT_ID_SET_RESULT_KEY);
      let isReturn = false;
      Utils.registerEvent("testSerializeWebStateErrorHandling004","error", 133254, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "SerializeWebStateTestButton");
      await Utils.waitForExist(() => isReturn, "testSerializeWebStateErrorHandling004" + '_returnCheck', true, 1000);
      done();
    })
  })
}