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

import { beforeAll, beforeEach, describe, it, afterEach , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils.test';
import { Driver } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_EIMIT_KEY = 101000;
const driver = Driver.create();

export default function webInitTest() {

  describe('WebInitTest', () => {
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
    * @tc.number     SUB_WEB_WEBNETERRORLIST_0100
    * @tc.name       WebNetErrorList_0100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0100", 0, 101010, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })


    /**
   * @tc.number     SUB_WEB_WEBNETERRORLIST_0200
   * @tc.name       WebNetErrorList_0200
   * @tc.desc       test WebSchemeHandlerResponse
   * @tc.size       MediumTest
   * @tc.type       Function
   * @tc.level      Level 1
   */
    it('WebNetErrorList_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0200", -1, 101020, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })

    /**
   * @tc.number     SUB_WEB_WEBNETERRORLIST_0300
   * @tc.name       WebNetErrorList_0300
   * @tc.desc       test WebSchemeHandlerResponse
   * @tc.size       MediumTest
   * @tc.type       Function
   * @tc.level      Level 1
   */
    it('WebNetErrorList_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0300", -2, 101030, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
   * @tc.number     SUB_WEB_WEBNETERRORLIST_0400
   * @tc.name       WebNetErrorList_0400
   * @tc.desc       test WebSchemeHandlerResponse
   * @tc.size       MediumTest
   * @tc.type       Function
   * @tc.level      Level 1
   */
    it('WebNetErrorList_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0400", -3, 101040, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
   * @tc.number     SUB_WEB_WEBNETERRORLIST_0500
   * @tc.name       WebNetErrorList_0500
   * @tc.desc       test WebSchemeHandlerResponse
   * @tc.size       MediumTest
   * @tc.type       Function
   * @tc.level      Level 1
   */
    it('WebNetErrorList_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0500", -4, 101050, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_0600
       * @tc.name       WebNetErrorList_0600
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0600", -5, 101060, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_0700
       * @tc.name       WebNetErrorList_0700
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0700", -6, 101070, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_0800
       * @tc.name       WebNetErrorList_0800
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0800", -7, 101080, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_0900
       * @tc.name       WebNetErrorList_0900
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0900", -8, 101090, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01000
      * @tc.name       WebNetErrorList_01000
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_ERR_UNEXPECTED_01000", -9, 101100, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01100
      * @tc.name       WebNetErrorList_01100
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01100", -10, 101110, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01200
      * @tc.name       WebNetErrorList_01200
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01200", -11, 101120, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01300
      * @tc.name       WebNetErrorList_01300
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01300", -12, 101130, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01400
      * @tc.name       WebNetErrorList_01400
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01400", -13, 101140, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01500
      * @tc.name       WebNetErrorList_01500
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01500", -14, 101150, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01600
      * @tc.name       WebNetErrorList_01600
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01600", -15, 101160, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_01700
      * @tc.name       WebNetErrorList_01700
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_01700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01700", -16, 101170, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_01800
     * @tc.name       WebNetErrorList_01800
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_01800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01800", -17, 101180, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_01900
     * @tc.name       WebNetErrorList_01900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_01900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01900", -18, 101190, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02000
     * @tc.name       WebNetErrorList_02000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02000", -19, 101200, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02100
     * @tc.name       WebNetErrorList_02100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02100", -20, 101210, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02200
     * @tc.name       WebNetErrorList_02200
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02200", -21, 101220, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02300
     * @tc.name       WebNetErrorList_02300
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02300", -22, 101230, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02400
     * @tc.name       WebNetErrorList_02400
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02400", -23, 101240, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02500
     * @tc.name       WebNetErrorList_02500
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02500", -25, 101250, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02600
     * @tc.name       WebNetErrorList_02600
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02600", -26, 101260, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02700
     * @tc.name       WebNetErrorList_02700
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02700", -27, 101270, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02800
     * @tc.name       WebNetErrorList_02800
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02800", -29, 101280, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_02900
     * @tc.name       WebNetErrorList_02900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_02900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02900", -30, 101290, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03000
     * @tc.name       WebNetErrorList_03000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03000", -31, 101300, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
  })
}
