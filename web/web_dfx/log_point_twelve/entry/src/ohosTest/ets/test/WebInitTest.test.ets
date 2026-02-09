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
      console.info('web beforeEach start');
      done();
    })

    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09100
      * @tc.name       WebNetErrorList_09100
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09100", -171, 101910, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09200
      * @tc.name       WebNetErrorList_09200
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09200", -172, 101920, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09300
      * @tc.name       WebNetErrorList_09300
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09300", -173, 101930, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09400
      * @tc.name       WebNetErrorList_09400
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09400", -174, 101940, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number    SUB_WEB_WEBNETERRORLIST_09500
      * @tc.name      WebNetErrorList_09500
      * @tc.desc      test WebSchemeHandlerResponse
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 1
      */
    it('WebNetErrorList_09500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09500", -176, 101950, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09600
      * @tc.name       WebNetErrorList_09600
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09600", -177, 101960, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09700
      * @tc.name       WebNetErrorList_09700
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09700", -178, 101970, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09800
      * @tc.name       WebNetErrorList_09800
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09800", -179, 101980, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_09900
     * @tc.name       WebNetErrorList_09900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_09900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09900", -180, 101990, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010000
     * @tc.name       WebNetErrorList_010000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010000", -181, 102000, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010100
     * @tc.name       WebNetErrorList_010100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010100", -182, 102010, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010200
     * @tc.name       WebNetErrorList_010200
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010200", -183, 102020, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010300
     * @tc.name       WebNetErrorList_010300
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010300", -184, 102030, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010400
     * @tc.name       WebNetErrorList_010400
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010400", -200, 102040, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010500
     * @tc.name       WebNetErrorList_010500
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010500", -201, 102050, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010600
     * @tc.name       WebNetErrorList_010600
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010600", -202, 102060, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010700
     * @tc.name       WebNetErrorList_010700
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010700", -203, 102070, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010800
     * @tc.name       WebNetErrorList_010800
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010800", -204, 102080, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_010900
     * @tc.name       WebNetErrorList_010900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_010900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_010900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_010900", -205, 102090, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_011000
     * @tc.name       WebNetErrorList_011000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_011000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011000", -206, 102100, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_011100
     * @tc.name       WebNetErrorList_011100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_011100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011100", -207, 102110, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011200
    * @tc.name       WebNetErrorList_011200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011200", -208, 102120, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011300
    * @tc.name       WebNetErrorList_011300
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011300", -210, 102130, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011400
    * @tc.name       WebNetErrorList_011400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011400", -211, 102140, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011500
    * @tc.name       WebNetErrorList_011500
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011500", -212, 102150, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011600
    * @tc.name       WebNetErrorList_011600
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011600", -213, 102160, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011700
    * @tc.name       WebNetErrorList_011700
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011700", -214, 102170, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011800
    * @tc.name       WebNetErrorList_011800
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011800", -215, 102180, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_011900
    * @tc.name       WebNetErrorList_011900
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_011900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_011900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_011900", -217, 102190, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_012000
    * @tc.name       WebNetErrorList_012000
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_012000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012000", -218, 102200, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
  })
}
