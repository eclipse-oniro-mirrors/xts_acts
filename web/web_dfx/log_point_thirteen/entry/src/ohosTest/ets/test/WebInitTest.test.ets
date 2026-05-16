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
    * @tc.number     SUB_WEB_WEBNETERRORLIST_012100
    * @tc.name       WebNetErrorList_012100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_012100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012100", -219, 102210, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_012200
    * @tc.name       WebNetErrorList_012200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_012200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012200", -300, 102220, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_012300
    * @tc.name       WebNetErrorList_012300
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_012300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012300", -301, 102230, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_012400
    * @tc.name       WebNetErrorList_012400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_012400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012400", -302, 102240, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_012500
    * @tc.name       WebNetErrorList_012500
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_012500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012500", -303, 102250, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
   * @tc.number     SUB_WEB_WEBNETERRORLIST_012600
   * @tc.name       WebNetErrorList_012600
   * @tc.desc       test WebSchemeHandlerResponse
   * @tc.size       MediumTest
   * @tc.type       Function
   * @tc.level      Level 1
   */
    it('WebNetErrorList_012600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012600", -310, 102260, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
  * @tc.number     SUB_WEB_WEBNETERRORLIST_012700
  * @tc.name       WebNetErrorList_012700
  * @tc.desc       test WebSchemeHandlerResponse
  * @tc.size       MediumTest
  * @tc.type       Function
  * @tc.level      Level 1
  */
    it('WebNetErrorList_012700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012700", -311, 102270, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
  * @tc.number     SUB_WEB_WEBNETERRORLIST_012800
  * @tc.name       WebNetErrorList_012800
  * @tc.desc       test WebSchemeHandlerResponse
  * @tc.size       MediumTest
  * @tc.type       Function
  * @tc.level      Level 1
  */
    it('WebNetErrorList_012800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012800", -312, 102280, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
  * @tc.number     SUB_WEB_WEBNETERRORLIST_012900
  * @tc.name       WebNetErrorList_012900
  * @tc.desc       test WebSchemeHandlerResponse
  * @tc.size       MediumTest
  * @tc.type       Function
  * @tc.level      Level 1
  */
    it('WebNetErrorList_012900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_012900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_012900", -320, 102290, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
  * @tc.number     SUB_WEB_WEBNETERRORLIST_013000
  * @tc.name       WebNetErrorList_013000
  * @tc.desc       test WebSchemeHandlerResponse
  * @tc.size       MediumTest
  * @tc.type       Function
  * @tc.level      Level 1
  */
    it('WebNetErrorList_013000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013000", -321, 102300, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013100
    * @tc.name       WebNetErrorList_013100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013100", -322, 102310, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013200
    * @tc.name       WebNetErrorList_013200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013200", -323, 102320, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013300
    * @tc.name       WebNetErrorList_013300
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013300", -324, 102330, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013400
    * @tc.name       WebNetErrorList_013400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013400", -325, 102340, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013500
    * @tc.name       WebNetErrorList_013500
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013500", -327, 102350, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013600
    * @tc.name       WebNetErrorList_013600
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013600", -328, 102360, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013700
    * @tc.name       WebNetErrorList_013700
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013700", -329, 102370, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013800
    * @tc.name       WebNetErrorList_013800
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013800", -330, 102380, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_013900
    * @tc.name       WebNetErrorList_013900
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_013900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_013900", -331, 102390, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014000
    * @tc.name       WebNetErrorList_014000
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014000", -332, 102400, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014100
    * @tc.name       WebNetErrorList_014100
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014100", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014100", -333, 102410, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014200
    * @tc.name       WebNetErrorList_014200
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014200", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014200", -334, 102420, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number    SUB_WEB_WEBNETERRORLIST_014300
    * @tc.name      WebNetErrorList_014300
    * @tc.desc      test WebSchemeHandlerResponse
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 1
    */
    it('WebNetErrorList_014300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014300", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014300", -336, 102430, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014400
    * @tc.name       WebNetErrorList_014400
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014400", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014400", -337, 102440, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014500
    * @tc.name       WebNetErrorList_014500
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014500", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014500", -338, 102450, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014600
    * @tc.name       WebNetErrorList_014600
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014600", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014600", -339, 102460, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014700
    * @tc.name       WebNetErrorList_014700
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014700", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014700", -340, 102470, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014800
    * @tc.name       WebNetErrorList_014800
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014800", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014800", -341, 102480, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_014900
    * @tc.name       WebNetErrorList_014900
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_014900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014900", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_014900", -342, 102490, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })
    /**
    * @tc.number     SUB_WEB_WEBNETERRORLIST_015000
    * @tc.name       WebNetErrorList_015000
    * @tc.desc       test WebSchemeHandlerResponse
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('WebNetErrorList_015000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_015000", EVENT_ID_SET_EIMIT_KEY)
      Utils.registerEvent("WebNetErrorList_015000", -343, 102500, done);
      Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
    })

  })
}
