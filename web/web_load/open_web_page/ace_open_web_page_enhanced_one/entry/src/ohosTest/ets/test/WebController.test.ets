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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200660;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webController page error: " + err);
      }
      await driver.waitForComponent(ON.id('WebControllerButton'),10000);
      console.log('waitForComponent WebControllerButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webController beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_REFRESH_0100
    * @tc.name       : testRefresh001
    * @tc.desc       : test refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRefresh001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testRefresh001", "\"index\"", 200670, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testRefresh001' + '_returnCheck', true, 1000);
      done();
    })

    /*
     * @tc.number     : SUB_WEB_LOADDATA_0100
     * @tc.name       : testLoadData001
     * @tc.desc       : test loadData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLoadData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadData001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadData001", "\"LoadData\"", 200680, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadData001' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0100
    * @tc.name       : testLoadUrl001
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl001", true, 200690, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl001' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0200
    * @tc.name       : testLoadUrl002
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl002", 'Example Domain', 200700, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl002' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0300
    * @tc.name       : testLoadUrl003
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl003", 'second', 200710, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl003' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_LOADURL_0400
    * @tc.name       : testLoadUrl004
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl004", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl004", 'second', 200720, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      await Utils.waitForExist(() => isReturn, 'testLoadUrl004' + '_returnCheck', true, 1000);
      done();
    })
  })
}