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

const EVENT_ID_SET_SUITE_KEY = 180501;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

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
     * @tc.name   onInterceptKeyboardAttach0100
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0100
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0100';
      tcName = 'testOnInterceptKeyboardAttach0100'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 180510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0200
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0200
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0200';
      tcName = 'testOnInterceptKeyboardAttach0200'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 180520, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0300
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0300
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0300';
      tcName = 'testOnInterceptKeyboardAttach0300'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '6', 180530, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0400
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0400
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0400';
      tcName = 'testOnInterceptKeyboardAttach0400'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '2', 180540, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0500
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0500
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0500';
      tcName = 'testOnInterceptKeyboardAttach0500'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '5', 180550, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0600
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0600
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0600';
      tcName = 'testOnInterceptKeyboardAttach0600'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '7', 180560, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0700
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0700
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0700';
      tcName = 'testOnInterceptKeyboardAttach0700'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '3', 180570, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0800
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0800
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0800';
      tcName = 'testOnInterceptKeyboardAttach0800'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '4', 180580, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach0900
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_0900
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach0900';
      tcName = 'testOnInterceptKeyboardAttach0900'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '0', 180590, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   onInterceptKeyboardAttach1000
     * @tc.number SUB_WEB_ONINTERCEPTKEYBOARDATTACH_1000
     * @tc.desc   test onInterceptKeyboardAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onInterceptKeyboardAttach1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'onInterceptKeyboardAttach1000';
      tcName = 'testOnInterceptKeyboardAttach1000'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 1, 180600, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewMenuInputFieldTypeTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
