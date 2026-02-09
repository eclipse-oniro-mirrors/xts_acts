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
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03100
     * @tc.name       WebNetErrorList_03100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03100", -32, 101310, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03200
     * @tc.name       WebNetErrorList_03200
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03200", -100, 101320, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03300
     * @tc.name       WebNetErrorList_03300
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03300", -101, 101330, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03400
     * @tc.name       WebNetErrorList_03400
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03400", -102, 101340, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03500
     * @tc.name       WebNetErrorList_03500
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03500", -103, 101350, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03600
     * @tc.name       WebNetErrorList_03600
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03600", -104, 101360, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03700
     * @tc.name       WebNetErrorList_03700
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03700", -105, 101370, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03800
     * @tc.name       WebNetErrorList_03800
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03800", -106, 101380, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_03900
     * @tc.name       WebNetErrorList_03900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_03900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_03900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_03900", -107, 101390, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04000
     * @tc.name       WebNetErrorList_04000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04000", -108, 101400, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04100
     * @tc.name       WebNetErrorList_04100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04100", -109, 101410, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04200
     * @tc.name       WebNetErrorList_04200
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04200", -110, 101420, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04300
     * @tc.name       WebNetErrorList_04300
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04300", -111, 101430, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04400
     * @tc.name       WebNetErrorList_04400
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04400", -112, 101440, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04500
     * @tc.name       WebNetErrorList_04500
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04500", -113, 101450, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04600
     * @tc.name       WebNetErrorList_04600
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04600", -114, 101460, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04700
     * @tc.name       WebNetErrorList_04700
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04700", -115, 101470, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04800
     * @tc.name       WebNetErrorList_04800
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04800", -117, 101480, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_04900
     * @tc.name       WebNetErrorList_04900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_04900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_04900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_04900", -118, 101490, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05000
     * @tc.name       WebNetErrorList_05000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05000", -119, 101500, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05100
     * @tc.name       WebNetErrorList_05100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05100", -120, 101510, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05200
     * @tc.name       WebNetErrorList_05200
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05200", -121, 101520, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05300
     * @tc.name       WebNetErrorList_05300
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05300", -122, 101530, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05400
     * @tc.name       WebNetErrorList_05400
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05400", -123, 101540, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05500
     * @tc.name       WebNetErrorList_05500
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05500", -124, 101550, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05600
     * @tc.name       WebNetErrorList_05600
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05600", -125, 101560, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05700
     * @tc.name       WebNetErrorList_05700
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05700", -126, 101570, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05800
     * @tc.name       WebNetErrorList_05800
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05800", -127, 101580, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_05900
     * @tc.name       WebNetErrorList_05900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_05900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_05900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_05900", -130, 101590, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06000
     * @tc.name       WebNetErrorList_06000
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06000", -131, 101600, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
  })
}
