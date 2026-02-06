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
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021100
       * @tc.name       WebNetErrorList_021100
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021100", -603, 103110, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021200
       * @tc.name       WebNetErrorList_021200
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021200", -604, 103120, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021300
       * @tc.name       WebNetErrorList_021300
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021300", -605, 103130, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021400
       * @tc.name       WebNetErrorList_021400
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021400", -606, 103140, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021500
       * @tc.name       WebNetErrorList_021500
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021500", -607, 103150, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021600
       * @tc.name       WebNetErrorList_021600
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021600", -701, 103160, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021700
       * @tc.name       WebNetErrorList_021700
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021700", -702, 103170, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number    SUB_WEB_WEBNETERRORLIST_021800
       * @tc.name      WebNetErrorList_021800
       * @tc.desc      test WebSchemeHandlerResponse
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 1
       */
    it('WebNetErrorList_021800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021800", -703, 103180, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_021900
       * @tc.name       WebNetErrorList_021900
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_021900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_021900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_021900", -704, 103190, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022000
       * @tc.name       WebNetErrorList_022000
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022000", -705, 103200, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022100
       * @tc.name       WebNetErrorList_022100
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022100", -706, 103210, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022200
       * @tc.name       WebNetErrorList_022200
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022200", -707, 103220, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022300
       * @tc.name       WebNetErrorList_022300
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022300", -708, 103230, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022400
       * @tc.name       WebNetErrorList_022400
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022400", -709, 103240, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022500
       * @tc.name       WebNetErrorList_022500
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022500", -710, 103250, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022600
       * @tc.name       WebNetErrorList_022600
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022600", -712, 103260, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022700
       * @tc.name       WebNetErrorList_022700
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022700", -713, 103270, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022800
       * @tc.name       WebNetErrorList_022800
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022800", -714, 103280, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_022900
       * @tc.name       WebNetErrorList_022900
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_022900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_022900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_022900", -716, 103290, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023000
       * @tc.name       WebNetErrorList_023000
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023000", -800, 103300, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023100
       * @tc.name       WebNetErrorList_023100
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023100", -801, 103310, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023200
       * @tc.name       WebNetErrorList_023200
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023200", -802, 103320, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023300
       * @tc.name       WebNetErrorList_023300
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023300", -803, 103330, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023400
       * @tc.name       WebNetErrorList_023400
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023400", -804, 103340, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023500
       * @tc.name       WebNetErrorList_023500
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023500", -805, 103350, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023600
       * @tc.name       WebNetErrorList_023600
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023600", -806, 103360, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023700
       * @tc.name       WebNetErrorList_023700
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023700", -808, 103370, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023800
       * @tc.name       WebNetErrorList_023800
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023800", -809, 103380, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_023900
       * @tc.name       WebNetErrorList_023900
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_023900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_023900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_023900", -810, 103390, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
       * @tc.number     SUB_WEB_WEBNETERRORLIST_024000
       * @tc.name       WebNetErrorList_024000
       * @tc.desc       test WebSchemeHandlerResponse
       * @tc.size       MediumTest
       * @tc.type       Function
       * @tc.level      Level 1
       */
    it('WebNetErrorList_024000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_024000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_024000", -811, 103400, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
  })
}
