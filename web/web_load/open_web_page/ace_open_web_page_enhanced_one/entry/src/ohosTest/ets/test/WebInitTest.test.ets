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

import { beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200730;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webInitTest() {

  describe('WebInitTest', () => {
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
    * @tc.number      : SUB_WEB_CUSTOMIZESCHEMES_FETCH_0100
    * @tc.name        : testCustomizeSchemesFetch001
    * @tc.desc        : test fetch request not in customizeSchemes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testCustomizeSchemesFetch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemesFetch001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testCustomizeSchemesFetch001", true, 200740, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebInitTestButton");
      await Utils.waitForExist(() => isReturn, 'testCustomizeSchemesFetch001' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_CUSTOMIZESCHEMES_FETCH_0200
    * @tc.name        : testCustomizeSchemesFetch002
    * @tc.desc        : test fetch request in customizeSchemes
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testCustomizeSchemesFetch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemesFetch002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testCustomizeSchemesFetch002", true, 200750, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebInitTestButton");
      await Utils.waitForExist(() => isReturn, 'testCustomizeSchemesFetch002' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_CUSTOMIZESCHEMES_FETCH_0300
    * @tc.name        : testCustomizeSchemesFetch003
    * @tc.desc        : test fetch request when isSupportCORS is false and isSupportFetch is true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testCustomizeSchemesFetch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemesFetch003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testCustomizeSchemesFetch003", true, 200760, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebInitTestButton");
      await Utils.waitForExist(() => isReturn, 'testCustomizeSchemesFetch003' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_CUSTOMIZESCHEMES_FETCH_0400
    * @tc.name        : testCustomizeSchemesFetch004
    * @tc.desc        : test fetch request allow cors when isSupportCORS is false and isSupportFetch is true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testCustomizeSchemesFetch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemesFetch004", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testCustomizeSchemesFetch004", true, 200770, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebInitTestButton");
      await Utils.waitForExist(() => isReturn, 'testCustomizeSchemesFetch004' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_CUSTOMIZESCHEMES_FETCH_0500
    * @tc.name        : testCustomizeSchemesFetch005
    * @tc.desc        : test fetch request allow cors when isSupportCORS is true and isSupportFetch is false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testCustomizeSchemesFetch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemesFetch005", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testCustomizeSchemesFetch005", true, 200780, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebInitTestButton");
      await Utils.waitForExist(() => isReturn, 'testCustomizeSchemesFetch005' + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_CUSTOMIZESCHEMES_FETCH_0600
    * @tc.name        : testCustomizeSchemesFetch006
    * @tc.desc        : test fetch request allow cors when isSupportCORS is false and isSupportFetch is false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testCustomizeSchemesFetch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testCustomizeSchemesFetch006", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testCustomizeSchemesFetch006", true, 200790, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebInitTestButton");
      await Utils.waitForExist(() => isReturn, 'testCustomizeSchemesFetch006' + '_returnCheck', true, 1000);
      done();
    })
  })
}