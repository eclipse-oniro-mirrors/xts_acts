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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebInitTest afterEach end");
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
      Utils.emitEvent("testCustomizeSchemesFetch001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCustomizeSchemesFetch001", true, 202, done);
      sendEventByKey('WebInitTestButton', 10, '');
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
      Utils.emitEvent("testCustomizeSchemesFetch002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCustomizeSchemesFetch002", true, 204, done);
      sendEventByKey('WebInitTestButton', 10, '');
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
      Utils.emitEvent("testCustomizeSchemesFetch003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCustomizeSchemesFetch003", true, 206, done);
      sendEventByKey('WebInitTestButton', 10, '');
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
      Utils.emitEvent("testCustomizeSchemesFetch004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCustomizeSchemesFetch004", true, 208, done);
      sendEventByKey('WebInitTestButton', 10, '');
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
      Utils.emitEvent("testCustomizeSchemesFetch005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCustomizeSchemesFetch005", true, 210, done);
      sendEventByKey('WebInitTestButton', 10, '');
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
      Utils.emitEvent("testCustomizeSchemesFetch006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testCustomizeSchemesFetch006", true, 212, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
  })
}
