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
    * @tc.number     SUB_WEB_WEBNETERRORLIST_018100
    * @tc.name       WebNetErrorList_018100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_018100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018100", -378, 102810, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_018200
    * @tc.name       WebNetErrorList_018200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_018200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018200", -379, 102820, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_018300
    * @tc.name       WebNetErrorList_018300
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_018300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018300", -380, 102830, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_018400
    * @tc.name       WebNetErrorList_018400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_018400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018400", -381, 102840, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_018500
      * @tc.name       WebNetErrorList_018500
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_018500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018500", -382, 102850, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_018600
      * @tc.name       WebNetErrorList_018600
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_018600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018600", -383, 102860, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_018700
      * @tc.name       WebNetErrorList_018700
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_018700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018700", -384, 102870, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
      /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_018800
       * @tc.name       WebNetErrorList_018800
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_018800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018800", -400, 102880, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
      /**
        * @tc.number     SUB_WEB_WEBNETERRORLIST_018900
        * @tc.name       WebNetErrorList_018900
        * @tc.desc       test WebSchemeHandlerResponse
        * @tc.size       MediumTest
        * @tc.type       Function
        * @tc.level      Level 1
        */
    it('WebNetErrorList_018900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018900", -401, 102890, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
     /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_019000
       * @tc.name       WebNetErrorList_019000
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_019000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019000", -402, 102900, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_019100
     * @tc.name       WebNetErrorList_019100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_019100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019100", -403, 102910, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
     /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_019200
     * @tc.name       WebNetErrorList_019200
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_019200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019200", -404, 102920, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
      /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_019300
       * @tc.name       WebNetErrorList_019300
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_019300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019300", -405, 102930, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
     /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_019400
       * @tc.name       WebNetErrorList_019400
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_019400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019400", -406, 102940, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
     /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_019500
       * @tc.name       WebNetErrorList_019500
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_019500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019500", -407, 102950, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
      /**
         * @tc.number     SUB_WEB_WEBNETERRORLIST_019600
         * @tc.name       WebNetErrorList_019600
         * @tc.desc       test WebSchemeHandlerResponse
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 1
         */
    it('WebNetErrorList_019600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019600", -408, 102960, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
      /**
        * @tc.number     SUB_WEB_WEBNETERRORLIST_019700
        * @tc.name       WebNetErrorList_019700
        * @tc.desc       test WebSchemeHandlerResponse
        * @tc.size       MediumTest
        * @tc.type       Function
        * @tc.level      Level 1
        */
    it('WebNetErrorList_019700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019700", -409, 102970, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
       /**
        * @tc.number     SUB_WEB_WEBNETERRORLIST_019800
        * @tc.name       WebNetErrorList_019800
        * @tc.desc       test WebSchemeHandlerResponse
        * @tc.size       MediumTest
        * @tc.type       Function
        * @tc.level      Level 1
        */
    it('WebNetErrorList_019800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019800", -410, 102980, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
     /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_019900
      * @tc.name       WebNetErrorList_019900
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_019900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_019900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_019900", -411, 102990, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_020000
     * @tc.name       WebNetErrorList_020000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_020000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020000", -412, 103000, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020100
       * @tc.name       WebNetErrorList_020100
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020100", -413, 103010, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020200
       * @tc.name       WebNetErrorList_020200
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020200", -501, 103020, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
     /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020300
       * @tc.name       WebNetErrorList_020300
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020300", -502, 103030, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020400
       * @tc.name       WebNetErrorList_020400
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020400", -503, 103040, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020500
       * @tc.name       WebNetErrorList_020500
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020500", -504, 103050, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020600
       * @tc.name       WebNetErrorList_020600
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020600", -505, 103060, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
     /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020700
       * @tc.name       WebNetErrorList_020700
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020700", -506, 103070, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020800
       * @tc.name       WebNetErrorList_020800
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020800", -507, 103080, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_020900
       * @tc.name       WebNetErrorList_020900
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_020900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_020900", -601, 103090, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021000
       * @tc.name       WebNetErrorList_021000
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021000", -602, 103100, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
  })
}
