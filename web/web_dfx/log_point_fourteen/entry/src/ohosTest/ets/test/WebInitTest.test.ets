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
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015100
    * @tc.name       WebNetErrorList_015100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015100", -344, 102510, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015200
    * @tc.name       WebNetErrorList_015200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015200", -345, 102520, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015300
    * @tc.name       WebNetErrorList_015300
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015300", -346, 102530, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015400
    * @tc.name       WebNetErrorList_015400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015400", -347, 102540, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015500
    * @tc.name       WebNetErrorList_015500
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015500", -348, 102550, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015600
    * @tc.name       WebNetErrorList_015600
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015600", -349, 102560, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015700
    * @tc.name       WebNetErrorList_015700
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015700", -350, 102570, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015800
    * @tc.name       WebNetErrorList_015800
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015800", -351, 102580, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015900
    * @tc.name       WebNetErrorList_015900
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015900", -352, 102590, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016000
    * @tc.name       WebNetErrorList_016000
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016000", -354, 102600, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016100
    * @tc.name       WebNetErrorList_016100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016100", -355, 102610, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016200
    * @tc.name       WebNetErrorList_016200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016200", -356, 102620, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016300
    * @tc.name       WebNetErrorList_016300
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016300", -357, 102630, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016400
    * @tc.name       WebNetErrorList_016400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016400", -358, 102640, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016500
    * @tc.name       WebNetErrorList_016500
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016500", -360, 102650, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016600
    * @tc.name       WebNetErrorList_016600
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016600", -361, 102660, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016700
    * @tc.name       WebNetErrorList_016700
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016700", -362, 102670, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016800
    * @tc.name       WebNetErrorList_016800
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016800", -363, 102680, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_016900
    * @tc.name       WebNetErrorList_016900
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_016900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_016900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_016900", -364, 102690, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017000
    * @tc.name       WebNetErrorList_017000
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017000", -365, 102700, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017100
    * @tc.name       WebNetErrorList_017100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017100", -366, 102710, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017200
    * @tc.name       WebNetErrorList_017200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017200", -367, 102720, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017300
    * @tc.name       WebNetErrorList_017300
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017300", -370, 102730, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017400
    * @tc.name       WebNetErrorList_017400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017400", -371, 102740, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017500
    * @tc.name       WebNetErrorList_017500
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017500", -372, 102750, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017600
    * @tc.name       WebNetErrorList_017600
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017600", -373, 102760, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017700
    * @tc.name       WebNetErrorList_017700
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017700", -374, 102770, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017800
    * @tc.name       WebNetErrorList_017800
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017800", -375, 102780, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_017900
    * @tc.name       WebNetErrorList_017900
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_017900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_017900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_017900", -376, 102790, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_018000
    * @tc.name       WebNetErrorList_018000
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_018000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_018000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_018000", -377, 102800, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
  })
}
