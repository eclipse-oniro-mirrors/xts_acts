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

const EVENT_ID_SET_EMIT_KEY = 200620;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebAttributeTest page success");
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      await driver.waitForComponent(ON.id('WebAttributeTestButton'),10000);
      console.log('waitForComponent WebAttributeTestButton==>');
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

    /*
    * @tc.number      : SUB_WEB_ONTITLERECEIVE_0100
    * @tc.name        : testOnTitleReceive001
    * @tc.desc        : test onTitleReceive normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnTitleReceive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnTitleReceive001", EVENT_ID_SET_EMIT_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnTitleReceive001", "ChangeTitle", 200630, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebAttributeTestButton");
      await Utils.waitForExist(() => isReturn, 'emitOnTitleReceive001' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONTITLERECEIVE_0200
    * @tc.name        : testOnTitleReceive002
    * @tc.desc        : test onTitleReceive when js changed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnTitleReceive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnTitleReceive002", EVENT_ID_SET_EMIT_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnTitleReceive002", "123", 200640, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebAttributeTestButton");
      await Utils.waitForExist(() => isReturn, 'emitOnTitleReceive002' + '_returnCheck', true, 1000);
      done();
    })
    /*
    * @tc.number      : SUB_WEB_USERAGENT_0100
    * @tc.name        : testUserAgent001
    * @tc.desc        : test userAgent normal
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testUserAgent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitUserAgent001", EVENT_ID_SET_EMIT_KEY)
      let isReturn = false;
      Utils.registerContainEvent("testUserAgent001", "Mozilla/5.0 (Windows NT 10.0; WOW64)", 200650, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebAttributeTestButton");
      await Utils.waitForExist(() => isReturn, 'emitOnTitleReceive002' + '_returnCheck', true, 1000);
      done();
    })
  })
}