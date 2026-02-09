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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";
let tcName = ''
const EVENT_ID_SET_SUITE_KEY = 176601;
const driver = Driver.create();

export default function webViewMenuInputFieldType() {

  describe('webViewMenuInputFieldType', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewMenuInputFieldType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewMenuInputFieldType state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get webViewMenuInputFieldType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebViewMenuInputFieldTypeTestButton"), 10000);
          console.info("push webViewMenuInputFieldType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewMenuInputFieldType page error: " + err);
      }
      done()
    });
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
     * @tc.name   testInputFieldTypeNumber001
     * @tc.number SUB_WEB_INPUTFIELDTYPENUMBER_0100
     * @tc.desc   test InputFieldType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputFieldTypeNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitInputFieldTypeNumber001';
      tcName = 'testInputFieldTypeNumber001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 176610, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testInputFieldTypeText001
     * @tc.number SUB_WEB_INPUTFIELDTYPETEXT_0100
     * @tc.desc   test InputFieldTypeText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputFieldTypeText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitInputFieldTypeText001';
      tcName = 'testInputFieldTypeText001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 176620, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testInputFieldTypePassword001
     * @tc.number SUB_WEB_INPUTFIELDTYPEPASSWORD_0100
     * @tc.desc   test InputFieldTypePassWord
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputFieldTypePassword001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitInputFieldTypePassWord001';
      tcName = 'testInputFieldTypePassword001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 176630, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testInputFieldTypeTelephone001
     * @tc.number SUB_WEB_INPUTFIELDTYPETELEPHONE_0100
     * @tc.desc   test InputFieldTypePassTelephone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputFieldTypeTelephone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitInputFieldTypeTelephone001';
      tcName = 'testInputFieldTypeTelephone001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 176640, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testInputFieldTypeOther001
     * @tc.number SUB_WEB_INPUTFIELDTYPEOTHER_0100
     * @tc.desc   test InputFieldTypeOther
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputFieldTypeOther001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitInputFieldTypeOther001';
      tcName = 'testInputFieldTypeOther001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 176650, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
