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
import Utils from './Utils';
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

    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_0100
    * @tc.name       : WebNetErrorList_0100
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0100", 0, 101010, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })


    /*
   * @tc.number     : SUB_WEB_WEBNETERRORLIST_0200
   * @tc.name       : WebNetErrorList_0200
   * @tc.desc       : test WebSchemeHandlerResponse
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('WebNetErrorList_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0200", -1, 101020, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })

    /*
   * @tc.number     : SUB_WEB_WEBNETERRORLIST_0300
   * @tc.name       : WebNetErrorList_0300
   * @tc.desc       : test WebSchemeHandlerResponse
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('WebNetErrorList_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0300", -2, 101030, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
   * @tc.number     : SUB_WEB_WEBNETERRORLIST_0400
   * @tc.name       : WebNetErrorList_0400
   * @tc.desc       : test WebSchemeHandlerResponse
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('WebNetErrorList_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0400", -3, 101040, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
   * @tc.number     : SUB_WEB_WEBNETERRORLIST_0500
   * @tc.name       : WebNetErrorList_0500
   * @tc.desc       : test WebSchemeHandlerResponse
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('WebNetErrorList_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0500", -4, 101050, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_0600
       * @tc.name       : WebNetErrorList_0600
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0600", -5, 101060, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_0700
       * @tc.name       : WebNetErrorList_0700
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0700", -6, 101070, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_0800
       * @tc.name       : WebNetErrorList_0800
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0800", -7, 101080, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_0900
       * @tc.name       : WebNetErrorList_0900
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_0900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_0900", -8, 101090, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01000
      * @tc.name       : WebNetErrorList_01000
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_ERR_UNEXPECTED_01000", -9, 101100, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01100
      * @tc.name       : WebNetErrorList_01100
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01100", -10, 101110, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01200
      * @tc.name       : WebNetErrorList_01200
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01200", -11, 101120, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01300
      * @tc.name       : WebNetErrorList_01300
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01300", -12, 101130, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01400
      * @tc.name       : WebNetErrorList_01400
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01400", -13, 101140, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01500
      * @tc.name       : WebNetErrorList_01500
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01500", -14, 101150, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01600
      * @tc.name       : WebNetErrorList_01600
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01600", -15, 101160, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_01700
      * @tc.name       : WebNetErrorList_01700
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_01700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01700", -16, 101170, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_01800
     * @tc.name       : WebNetErrorList_01800
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_01800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01800", -17, 101180, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_01900
     * @tc.name       : WebNetErrorList_01900
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_01900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_01900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_01900", -18, 101190, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02000
     * @tc.name       : WebNetErrorList_02000
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02000", -19, 101200, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02100
     * @tc.name       : WebNetErrorList_02100
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02100", -20, 101210, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02200
     * @tc.name       : WebNetErrorList_02200
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02200", -21, 101220, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02300
     * @tc.name       : WebNetErrorList_02300
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02300", -22, 101230, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02400
     * @tc.name       : WebNetErrorList_02400
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02400", -23, 101240, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02500
     * @tc.name       : WebNetErrorList_02500
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02500", -25, 101250, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02600
     * @tc.name       : WebNetErrorList_02600
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02600", -26, 101260, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02700
     * @tc.name       : WebNetErrorList_02700
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02700", -27, 101270, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02800
     * @tc.name       : WebNetErrorList_02800
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02800", -29, 101280, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_02900
     * @tc.name       : WebNetErrorList_02900
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_02900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_02900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_02900", -30, 101290, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03000
     * @tc.name       : WebNetErrorList_03000
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03000", -31, 101300, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03100
     * @tc.name       : WebNetErrorList_03100
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03100", -32, 101310, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03200
     * @tc.name       : WebNetErrorList_03200
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03200", -100, 101320, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03300
     * @tc.name       : WebNetErrorList_03300
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03300", -101, 101330, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03400
     * @tc.name       : WebNetErrorList_03400
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03400", -102, 101340, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03500
     * @tc.name       : WebNetErrorList_03500
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03500", -103, 101350, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03600
     * @tc.name       : WebNetErrorList_03600
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03600", -104, 101360, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03700
     * @tc.name       : WebNetErrorList_03700
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03700", -105, 101370, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03800
     * @tc.name       : WebNetErrorList_03800
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03800", -106, 101380, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_03900
     * @tc.name       : WebNetErrorList_03900
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_03900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03900", -107, 101390, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04000
     * @tc.name       : WebNetErrorList_04000
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04000", -108, 101400, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04100
     * @tc.name       : WebNetErrorList_04100
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04100", -109, 101410, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04200
     * @tc.name       : WebNetErrorList_04200
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04200", -110, 101420, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04300
     * @tc.name       : WebNetErrorList_04300
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04300", -111, 101430, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04400
     * @tc.name       : WebNetErrorList_04400
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04400", -112, 101440, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04500
     * @tc.name       : WebNetErrorList_04500
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04500", -113, 101450, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04600
     * @tc.name       : WebNetErrorList_04600
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04600", -114, 101460, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04700
     * @tc.name       : WebNetErrorList_04700
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04700", -115, 101470, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04800
     * @tc.name       : WebNetErrorList_04800
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04800", -117, 101480, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_04900
     * @tc.name       : WebNetErrorList_04900
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_04900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04900", -118, 101490, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05000
     * @tc.name       : WebNetErrorList_05000
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05000", -119, 101500, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05100
     * @tc.name       : WebNetErrorList_05100
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05100", -120, 101510, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05200
     * @tc.name       : WebNetErrorList_05200
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05200", -121, 101520, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05300
     * @tc.name       : WebNetErrorList_05300
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05300", -122, 101530, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05400
     * @tc.name       : WebNetErrorList_05400
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05400", -123, 101540, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05500
     * @tc.name       : WebNetErrorList_05500
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05500", -124, 101550, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05600
     * @tc.name       : WebNetErrorList_05600
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05600", -125, 101560, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05700
     * @tc.name       : WebNetErrorList_05700
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05700", -126, 101570, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05800
     * @tc.name       : WebNetErrorList_05800
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05800", -127, 101580, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_05900
     * @tc.name       : WebNetErrorList_05900
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_05900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05900", -130, 101590, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_06000
     * @tc.name       : WebNetErrorList_06000
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_06000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06000", -131, 101600, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_06100
     * @tc.name       : WebNetErrorList_06100
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_06100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06100", -133, 101610, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_06200
     * @tc.name       : WebNetErrorList_06200
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_06200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06200", -134, 101620, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_06300
     * @tc.name       : WebNetErrorList_06300
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_06300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06300", -135, 101630, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_06400
     * @tc.name       : WebNetErrorList_06400
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_06400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06400", -136, 101640, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_06500
     * @tc.name       : WebNetErrorList_06500
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_06500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06500", -137, 101650, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_06600
         * @tc.name       : WebNetErrorList_06600
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_06600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06600", -138, 101660, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_06700
         * @tc.name       : WebNetErrorList_06700
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_06700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06700", -139, 101670, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
        * @tc.number     : SUB_WEB_WEBNETERRORLIST_06800
        * @tc.name       : WebNetErrorList_06800
        * @tc.desc       : test WebSchemeHandlerResponse
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('WebNetErrorList_06800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06800", -140, 101680, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_06900
       * @tc.name       : WebNetErrorList_06900
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_06900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06900", -141, 101690, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07000
      * @tc.name       : WebNetErrorList_07000
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07000", -142, 101700, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07100
      * @tc.name       : WebNetErrorList_07100
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07100", -145, 101710, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07200
      * @tc.name       : WebNetErrorList_07200
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07200", -147, 101720, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07300
      * @tc.name       : WebNetErrorList_07300
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07300", -148, 101730, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07400
      * @tc.name       : WebNetErrorList_07400
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07400", -149, 101740, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07500
      * @tc.name       : WebNetErrorList_07500
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07500", -150, 101750, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07600
      * @tc.name       : WebNetErrorList_07600
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07600", -151, 101760, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07700
      * @tc.name       : WebNetErrorList_07700
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07700", -153, 101770, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07800
      * @tc.name       : WebNetErrorList_07800
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07800", -154, 101780, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_07900
      * @tc.name       : WebNetErrorList_07900
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_07900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07900", -156, 101790, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08000
      * @tc.name       : WebNetErrorList_08000
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08000", -159, 101800, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08100
      * @tc.name       : WebNetErrorList_08100
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08100", -160, 101810, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08200
      * @tc.name       : WebNetErrorList_08200
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08200", -161, 101820, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08300
      * @tc.name       : WebNetErrorList_08300
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08300", -162, 101830, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08400
      * @tc.name       : WebNetErrorList_08400
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08400", -163, 101840, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08500
      * @tc.name       : WebNetErrorList_08500
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08500", -164, 101850, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08600
      * @tc.name       : WebNetErrorList_08600
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08600", -166, 101860, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08700
      * @tc.name       : WebNetErrorList_08700
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08700", -167, 101870, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08800
      * @tc.name       : WebNetErrorList_08800
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08800", -168, 101880, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_08900
      * @tc.name       : WebNetErrorList_08900
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_08900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08900", -169, 101890, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09000
      * @tc.name       : WebNetErrorList_09000
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09000", -170, 101900, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09100
      * @tc.name       : WebNetErrorList_09100
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09100", -171, 101910, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09200
      * @tc.name       : WebNetErrorList_09200
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09200", -172, 101920, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09300
      * @tc.name       : WebNetErrorList_09300
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09300", -173, 101930, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09400
      * @tc.name       : WebNetErrorList_09400
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09400", -174, 101940, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09500
      * @tc.name       : WebNetErrorList_09500
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09500", -176, 101950, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09600
      * @tc.name       : WebNetErrorList_09600
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09600", -177, 101960, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09700
      * @tc.name       : WebNetErrorList_09700
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09700", -178, 101970, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_09800
      * @tc.name       : WebNetErrorList_09800
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_09800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09800", -179, 101980, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_09900
     * @tc.name       : WebNetErrorList_09900
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_09900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09900", -180, 101990, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010000
     * @tc.name       : WebNetErrorList_010000
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010000", -181, 102000, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010100
     * @tc.name       : WebNetErrorList_010100
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010100", -182, 102010, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010200
     * @tc.name       : WebNetErrorList_010200
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010200", -183, 102020, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010300
     * @tc.name       : WebNetErrorList_010300
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010300", -184, 102030, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010400
     * @tc.name       : WebNetErrorList_010400
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010400", -200, 102040, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010500
     * @tc.name       : WebNetErrorList_010500
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010500", -201, 102050, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010600
     * @tc.name       : WebNetErrorList_010600
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010600", -202, 102060, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010700
     * @tc.name       : WebNetErrorList_010700
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010700", -203, 102070, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010800
     * @tc.name       : WebNetErrorList_010800
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010800", -204, 102080, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_010900
     * @tc.name       : WebNetErrorList_010900
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_010900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010900", -205, 102090, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_011000
     * @tc.name       : WebNetErrorList_011000
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_011000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011000", -206, 102100, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
     * @tc.number     : SUB_WEB_WEBNETERRORLIST_011100
     * @tc.name       : WebNetErrorList_011100
     * @tc.desc       : test WebSchemeHandlerResponse
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('WebNetErrorList_011100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011100", -207, 102110, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011200
    * @tc.name       : WebNetErrorList_011200
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011200", -208, 102120, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011300
    * @tc.name       : WebNetErrorList_011300
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011300", -210, 102130, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011400
    * @tc.name       : WebNetErrorList_011400
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011400", -211, 102140, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011500
    * @tc.name       : WebNetErrorList_011500
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011500", -212, 102150, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011600
    * @tc.name       : WebNetErrorList_011600
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011600", -213, 102160, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011700
    * @tc.name       : WebNetErrorList_011700
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011700", -214, 102170, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011800
    * @tc.name       : WebNetErrorList_011800
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011800", -215, 102180, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_011900
    * @tc.name       : WebNetErrorList_011900
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_011900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011900", -217, 102190, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_012000
    * @tc.name       : WebNetErrorList_012000
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_012000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012000", -218, 102200, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_012100
    * @tc.name       : WebNetErrorList_012100
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_012100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012100", -219, 102210, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_012200
    * @tc.name       : WebNetErrorList_012200
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_012200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012200", -300, 102220, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_012300
    * @tc.name       : WebNetErrorList_012300
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_012300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012300", -301, 102230, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_012400
    * @tc.name       : WebNetErrorList_012400
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_012400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012400", -302, 102240, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
    * @tc.number     : SUB_WEB_WEBNETERRORLIST_012500
    * @tc.name       : WebNetErrorList_012500
    * @tc.desc       : test WebSchemeHandlerResponse
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('WebNetErrorList_012500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012500", -303, 102250, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
   * @tc.number     : SUB_WEB_WEBNETERRORLIST_012600
   * @tc.name       : WebNetErrorList_012600
   * @tc.desc       : test WebSchemeHandlerResponse
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('WebNetErrorList_012600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012600", -310, 102260, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_012700
  * @tc.name       : WebNetErrorList_012700
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_012700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012700", -311, 102270, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_012800
  * @tc.name       : WebNetErrorList_012800
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_012800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012800", -312, 102280, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_012900
  * @tc.name       : WebNetErrorList_012900
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_012900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012900", -320, 102290, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013000
  * @tc.name       : WebNetErrorList_013000
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013000", -321, 102300, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013100
  * @tc.name       : WebNetErrorList_013100
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013100", -322, 102310, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013200
  * @tc.name       : WebNetErrorList_013200
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013200", -323, 102320, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013300
  * @tc.name       : WebNetErrorList_013300
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013300", -324, 102330, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013400
  * @tc.name       : WebNetErrorList_013400
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013400", -325, 102340, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013500
  * @tc.name       : WebNetErrorList_013500
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013500", -327, 102350, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013600
  * @tc.name       : WebNetErrorList_013600
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013600", -328, 102360, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013700
  * @tc.name       : WebNetErrorList_013700
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013700", -329, 102370, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013800
  * @tc.name       : WebNetErrorList_013800
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013800", -330, 102380, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_013900
  * @tc.name       : WebNetErrorList_013900
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_013900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013900", -331, 102390, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014000
  * @tc.name       : WebNetErrorList_014000
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014000", -332, 102400, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014100
  * @tc.name       : WebNetErrorList_014100
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014100", -333, 102410, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014200
  * @tc.name       : WebNetErrorList_014200
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014200", -334, 102420, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014300
  * @tc.name       : WebNetErrorList_014300
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014300", -336, 102430, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014400
  * @tc.name       : WebNetErrorList_014400
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014400", -337, 102440, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014500
  * @tc.name       : WebNetErrorList_014500
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014500", -338, 102450, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014600
  * @tc.name       : WebNetErrorList_014600
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014600", -339, 102460, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014700
  * @tc.name       : WebNetErrorList_014700
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014700", -340, 102470, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014800
  * @tc.name       : WebNetErrorList_014800
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014800", -341, 102480, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_014900
  * @tc.name       : WebNetErrorList_014900
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_014900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014900", -342, 102490, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015000
  * @tc.name       : WebNetErrorList_015000
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015000", -343, 102500, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015100
  * @tc.name       : WebNetErrorList_015100
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015100", -344, 102510, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015200
  * @tc.name       : WebNetErrorList_015200
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015200", -345, 102520, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015300
  * @tc.name       : WebNetErrorList_015300
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015300", -346, 102530, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015400
  * @tc.name       : WebNetErrorList_015400
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015400", -347, 102540, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015500
  * @tc.name       : WebNetErrorList_015500
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015500", -348, 102550, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015600
  * @tc.name       : WebNetErrorList_015600
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015600", -349, 102560, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015700
  * @tc.name       : WebNetErrorList_015700
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015700", -350, 102570, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015800
  * @tc.name       : WebNetErrorList_015800
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015800", -351, 102580, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_015900
  * @tc.name       : WebNetErrorList_015900
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_015900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015900", -352, 102590, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016000
  * @tc.name       : WebNetErrorList_016000
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016000", -354, 102600, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016100
  * @tc.name       : WebNetErrorList_016100
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016100", -355, 102610, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016200
  * @tc.name       : WebNetErrorList_016200
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016200", -356, 102620, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016300
  * @tc.name       : WebNetErrorList_016300
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016300", -357, 102630, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016400
  * @tc.name       : WebNetErrorList_016400
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016400", -358, 102640, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016500
  * @tc.name       : WebNetErrorList_016500
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016500", -360, 102650, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016600
  * @tc.name       : WebNetErrorList_016600
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016600", -361, 102660, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016700
  * @tc.name       : WebNetErrorList_016700
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016700", -362, 102670, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016800
  * @tc.name       : WebNetErrorList_016800
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016800", -363, 102680, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_016900
  * @tc.name       : WebNetErrorList_016900
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_016900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016900", -364, 102690, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017000
  * @tc.name       : WebNetErrorList_017000
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017000", -365, 102700, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017100
  * @tc.name       : WebNetErrorList_017100
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017100", -366, 102710, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017200
  * @tc.name       : WebNetErrorList_017200
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017200", -367, 102720, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017300
  * @tc.name       : WebNetErrorList_017300
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017300", -370, 102730, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017400
  * @tc.name       : WebNetErrorList_017400
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017400", -371, 102740, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017500
  * @tc.name       : WebNetErrorList_017500
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017500", -372, 102750, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017600
  * @tc.name       : WebNetErrorList_017600
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017600", -373, 102760, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017700
  * @tc.name       : WebNetErrorList_017700
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017700", -374, 102770, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017800
  * @tc.name       : WebNetErrorList_017800
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017800", -375, 102780, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_017900
  * @tc.name       : WebNetErrorList_017900
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_017900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017900", -376, 102790, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_018000
  * @tc.name       : WebNetErrorList_018000
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_018000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018000", -377, 102800, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_018100
  * @tc.name       : WebNetErrorList_018100
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_018100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018100", -378, 102810, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_018200
  * @tc.name       : WebNetErrorList_018200
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_018200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018200", -379, 102820, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_018300
  * @tc.name       : WebNetErrorList_018300
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_018300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018300", -380, 102830, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
  * @tc.number     : SUB_WEB_WEBNETERRORLIST_018400
  * @tc.name       : WebNetErrorList_018400
  * @tc.desc       : test WebSchemeHandlerResponse
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('WebNetErrorList_018400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018400", -381, 102840, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_018500
      * @tc.name       : WebNetErrorList_018500
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_018500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018500", -382, 102850, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_018600
      * @tc.name       : WebNetErrorList_018600
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_018600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018600", -383, 102860, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
      * @tc.number     : SUB_WEB_WEBNETERRORLIST_018700
      * @tc.name       : WebNetErrorList_018700
      * @tc.desc       : test WebSchemeHandlerResponse
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('WebNetErrorList_018700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018700", -384, 102870, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_018800
         * @tc.name       : WebNetErrorList_018800
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_018800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018800", -400, 102880, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
        * @tc.number     : SUB_WEB_WEBNETERRORLIST_018900
        * @tc.name       : WebNetErrorList_018900
        * @tc.desc       : test WebSchemeHandlerResponse
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('WebNetErrorList_018900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018900", -401, 102890, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_019000
         * @tc.name       : WebNetErrorList_019000
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_019000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019000", -402, 102900, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_019100
         * @tc.name       : WebNetErrorList_019100
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_019100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019100", -403, 102910, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_019200
         * @tc.name       : WebNetErrorList_019200
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_019200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019200", -404, 102920, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_019300
         * @tc.name       : WebNetErrorList_019300
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_019300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019300", -405, 102930, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_019400
         * @tc.name       : WebNetErrorList_019400
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_019400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019400", -406, 102940, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_019500
         * @tc.name       : WebNetErrorList_019500
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_019500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019500", -407, 102950, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
         * @tc.number     : SUB_WEB_WEBNETERRORLIST_019600
         * @tc.name       : WebNetErrorList_019600
         * @tc.desc       : test WebSchemeHandlerResponse
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
    it('WebNetErrorList_019600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019600", -408, 102960, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
        * @tc.number     : SUB_WEB_WEBNETERRORLIST_019700
        * @tc.name       : WebNetErrorList_019700
        * @tc.desc       : test WebSchemeHandlerResponse
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('WebNetErrorList_019700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019700", -409, 102970, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
        * @tc.number     : SUB_WEB_WEBNETERRORLIST_019800
        * @tc.name       : WebNetErrorList_019800
        * @tc.desc       : test WebSchemeHandlerResponse
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('WebNetErrorList_019800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019800", -410, 102980, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
        * @tc.number     : SUB_WEB_WEBNETERRORLIST_019900
        * @tc.name       : WebNetErrorList_019900
        * @tc.desc       : test WebSchemeHandlerResponse
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('WebNetErrorList_019900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019900", -411, 102990, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020000
       * @tc.name       : WebNetErrorList_020000
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020000", -412, 103000, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020100
       * @tc.name       : WebNetErrorList_020100
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020100", -413, 103010, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020200
       * @tc.name       : WebNetErrorList_020200
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020200", -501, 103020, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020300
       * @tc.name       : WebNetErrorList_020300
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020300", -502, 103030, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020400
       * @tc.name       : WebNetErrorList_020400
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020400", -503, 103040, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020500
       * @tc.name       : WebNetErrorList_020500
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020500", -504, 103050, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020600
       * @tc.name       : WebNetErrorList_020600
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020600", -505, 103060, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020700
       * @tc.name       : WebNetErrorList_020700
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020700", -506, 103070, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020800
       * @tc.name       : WebNetErrorList_020800
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020800", -507, 103080, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_020900
       * @tc.name       : WebNetErrorList_020900
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_020900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020900", -601, 103090, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021000
       * @tc.name       : WebNetErrorList_021000
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021000", -602, 103100, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021100
       * @tc.name       : WebNetErrorList_021100
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021100", -603, 103110, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021200
       * @tc.name       : WebNetErrorList_021200
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021200", -604, 103120, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021300
       * @tc.name       : WebNetErrorList_021300
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021300", -605, 103130, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021400
       * @tc.name       : WebNetErrorList_021400
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021400", -606, 103140, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021500
       * @tc.name       : WebNetErrorList_021500
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021500", -607, 103150, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021600
       * @tc.name       : WebNetErrorList_021600
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021600", -701, 103160, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021700
       * @tc.name       : WebNetErrorList_021700
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021700", -702, 103170, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021800
       * @tc.name       : WebNetErrorList_021800
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021800", -703, 103180, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_021900
       * @tc.name       : WebNetErrorList_021900
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_021900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021900", -704, 103190, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022000
       * @tc.name       : WebNetErrorList_022000
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022000", -705, 103200, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022100
       * @tc.name       : WebNetErrorList_022100
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022100", -706, 103210, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022200
       * @tc.name       : WebNetErrorList_022200
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022200", -707, 103220, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022300
       * @tc.name       : WebNetErrorList_022300
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022300", -708, 103230, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022400
       * @tc.name       : WebNetErrorList_022400
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022400", -709, 103240, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022500
       * @tc.name       : WebNetErrorList_022500
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022500", -710, 103250, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022600
       * @tc.name       : WebNetErrorList_022600
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022600", -712, 103260, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022700
       * @tc.name       : WebNetErrorList_022700
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022700", -713, 103270, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022800
       * @tc.name       : WebNetErrorList_022800
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022800", -714, 103280, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_022900
       * @tc.name       : WebNetErrorList_022900
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_022900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022900", -716, 103290, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023000
       * @tc.name       : WebNetErrorList_023000
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023000", -800, 103300, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023100
       * @tc.name       : WebNetErrorList_023100
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023100", -801, 103310, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023200
       * @tc.name       : WebNetErrorList_023200
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023200", -802, 103320, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023300
       * @tc.name       : WebNetErrorList_023300
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023300", -803, 103330, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023400
       * @tc.name       : WebNetErrorList_023400
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023400", -804, 103340, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023500
       * @tc.name       : WebNetErrorList_023500
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023500", -805, 103350, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023600
       * @tc.name       : WebNetErrorList_023600
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023600", -806, 103360, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023700
       * @tc.name       : WebNetErrorList_023700
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023700", -808, 103370, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023800
       * @tc.name       : WebNetErrorList_023800
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023800", -809, 103380, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_023900
       * @tc.name       : WebNetErrorList_023900
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_023900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023900", -810, 103390, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /*
       * @tc.number     : SUB_WEB_WEBNETERRORLIST_024000
       * @tc.name       : WebNetErrorList_024000
       * @tc.desc       : test WebSchemeHandlerResponse
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('WebNetErrorList_024000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_024000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_024000", -811, 103400, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
  })
}
