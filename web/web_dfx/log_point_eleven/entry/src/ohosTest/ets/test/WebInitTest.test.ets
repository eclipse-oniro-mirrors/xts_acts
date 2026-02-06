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
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06100
     * @tc.name       WebNetErrorList_06100
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06100", -133, 101610, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06200
     * @tc.name       WebNetErrorList_06200
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06200", -134, 101620, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06300
     * @tc.name       WebNetErrorList_06300
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06300", -135, 101630, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06400
     * @tc.name       WebNetErrorList_06400
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06400", -136, 101640, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06500
     * @tc.name       WebNetErrorList_06500
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06500", -137, 101650, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06600
     * @tc.name       WebNetErrorList_06600
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06600", -138, 101660, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06700
     * @tc.name       WebNetErrorList_06700
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06700", -139, 101670, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_06800
      * @tc.name       WebNetErrorList_06800
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_06800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06800", -140, 101680, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
     * @tc.number     SUB_WEB_WEBNETERRORLIST_06900
     * @tc.name       WebNetErrorList_06900
     * @tc.desc       test WebSchemeHandlerResponse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('WebNetErrorList_06900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_06900", -141, 101690, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07000
      * @tc.name       WebNetErrorList_07000
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07000", -142, 101700, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07100
      * @tc.name       WebNetErrorList_07100
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07100", -145, 101710, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07200
      * @tc.name       WebNetErrorList_07200
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07200", -147, 101720, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07300
      * @tc.name       WebNetErrorList_07300
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07300", -148, 101730, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07400
      * @tc.name       WebNetErrorList_07400
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07400", -149, 101740, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07500
      * @tc.name       WebNetErrorList_07500
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07500", -150, 101750, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07600
      * @tc.name       WebNetErrorList_07600
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07600", -151, 101760, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number    SUB_WEB_WEBNETERRORLIST_07700
      * @tc.name      WebNetErrorList_07700
      * @tc.desc      test WebSchemeHandlerResponse
      * @tc.size      MediumTest
      * @tc.type      Function
      * @tc.level     Level 1
      */
    it('WebNetErrorList_07700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07700", -153, 101770, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07800
      * @tc.name       WebNetErrorList_07800
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07800", -154, 101780, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_07900
      * @tc.name       WebNetErrorList_07900
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_07900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_07900", -156, 101790, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08000
      * @tc.name       WebNetErrorList_08000
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08000", -159, 101800, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08100
      * @tc.name       WebNetErrorList_08100
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08100", -160, 101810, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08200
      * @tc.name       WebNetErrorList_08200
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08200", -161, 101820, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08300
      * @tc.name       WebNetErrorList_08300
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08300", -162, 101830, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08400
      * @tc.name       WebNetErrorList_08400
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08400", -163, 101840, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08500
      * @tc.name       WebNetErrorList_08500
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08500", -164, 101850, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08600
      * @tc.name       WebNetErrorList_08600
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08600", -166, 101860, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08700
      * @tc.name       WebNetErrorList_08700
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08700", -167, 101870, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08800
      * @tc.name       WebNetErrorList_08800
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08800", -168, 101880, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_08900
      * @tc.name       WebNetErrorList_08900
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_08900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_08900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_08900", -169, 101890, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
      * @tc.number     SUB_WEB_WEBNETERRORLIST_09000
      * @tc.name       WebNetErrorList_09000
      * @tc.desc       test WebSchemeHandlerResponse
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 1
      */
    it('WebNetErrorList_09000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_09000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_09000", -170, 101900, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })

  })
}
