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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { WebNetErrorList } from '@ohos.web.netErrorList'
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

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

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      console.info("WebInitTest afterEach end");
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
      Utils.emitEvent("WebNetErrorList_0100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0100", 0, 6600, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0200", -1, 6601, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0300", -2, 6602, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0400", -3, 6603, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0500", -4, 6604, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0600", -5, 6605, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0700", -6, 6606, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0800", -7, 6607, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_0900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_0900", -8, 6608, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_ERR_UNEXPECTED_01000", -9, 6609, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01100", -10, 6610, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01200", -11, 6611, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01300", -12, 6612, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01400", -13, 6613, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01500", -14, 6614, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01600", -15, 6615, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01700", -16, 6616, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01800", -17, 6617, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_01900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_01900", -18, 6618, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02000", -19, 6619, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02100", -20, 6620, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02200", -21, 6621, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02300", -22, 6622, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02400", -23, 6623, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02500", -25, 6624, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02600", -26, 6625, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02700", -27, 6626, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02800", -29, 6627, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_02900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_02900", -30, 6628, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03000", -31, 6629, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03100", -32, 6630, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03200", -100, 6631, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03300", -101, 6632, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03400", -102, 6633, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03500", -103, 6634, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03600", -104, 6635, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03700", -105, 6636, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03800", -106, 6637, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_03900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_03900", -107, 6638, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04000", -108, 6639, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04100", -109, 6640, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04200", -110, 6641, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04300", -111, 6642, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04400", -112, 6643, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04500", -113, 6644, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04600", -114, 6645, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04700", -115, 6646, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04800", -117, 6647, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_04900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_04900", -118, 6648, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05000", -119, 6649, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05100", -120, 6650, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05200", -121, 6651, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05300", -122, 6652, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05400", -123, 6653, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05500", -124, 6654, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05600", -125, 6655, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05700", -126, 6656, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05800", -127, 6657, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_05900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_05900", -130, 6658, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06000", -131, 6659, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06100", -133, 6660, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06200", -134, 6661, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06300", -135, 6662, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06400", -136, 6663, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06500", -137, 6664, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06600", -138, 6665, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06700", -139, 6666, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06800", -140, 6668, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_06900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_06900", -141, 6669, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07000", -142, 6670, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07100", -145, 6671, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07200", -147, 6672, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07300", -148, 6673, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07400", -149, 6674, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07500", -150, 6675, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07600", -151, 6676, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07700", -153, 6677, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07800", -154, 6678, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_07900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_07900", -156, 6679, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08000", -159, 6680, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08100", -160, 6681, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08200", -161, 6682, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08300", -162, 6683, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08400", -163, 6684, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08500", -164, 6685, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08600", -166, 6686, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08700", -167, 6687, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08800", -168, 6688, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_08900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_08900", -169, 6689, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09000", -170, 6690, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09100", -171, 6691, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09200", -172, 6692, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09300", -173, 6693, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09400", -174, 6694, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09500", -176, 6695, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09600", -177, 6696, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09700", -178, 6697, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09800", -179, 6698, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_09900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_09900", -180, 6699, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010000", -181, 6700, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010100", -182, 6701, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010200", -183, 6702, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010300", -184, 6703, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010400", -200, 6704, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010500", -201, 6705, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010600", -202, 6706, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010700", -203, 6707, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010800", -204, 6708, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_010900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_010900", -205, 6709, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011000", -206, 6710, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011100", -207, 6711, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011200", -208, 6712, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011300", -210, 6713, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011400", -211, 6714, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011500", -212, 6715, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011600", -213, 6716, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011700", -214, 6717, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011800", -215, 6718, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_011900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_011900", -217, 6719, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012000", -218, 6720, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012100", -219, 6721, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012200", -300, 6722, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012300", -301, 6723, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012400", -302, 6724, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012500", -303, 6725, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012600", -310, 6726, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012700", -311, 6727, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012800", -312, 6728, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_012900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_012900", -320, 6729, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013000", -321, 6730, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013100", -322, 6731, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013200", -323, 6732, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013300", -324, 6733, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013400", -325, 6734, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013500", -327, 6735, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013600", -328, 6736, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013700", -329, 6737, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013800", -330, 6738, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_013900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_013900", -331, 6739, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014000", -332, 6740, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014100", -333, 6741, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014200", -334, 6742, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014300", -336, 6743, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014400", -337, 6744, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014500", -338, 6745, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014600", -339, 6746, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014700", -340, 6747, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014800", -341, 6748, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_014900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_014900", -342, 6749, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015000", -343, 6750, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015100", -344, 6751, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015200", -345, 6752, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015300", -346, 6753, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015400", -347, 6754, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015500", -348, 6755, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015600", -349, 6756, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015700", -350, 6757, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015800", -351, 6758, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_015900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_015900", -352, 6759, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016000", -354, 6760, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016100", -355, 6761, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016200", -356, 6762, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016300", -357, 6763, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016400", -358, 6764, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016500", -360, 6765, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016600", -361, 6766, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016700", -362, 6767, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016800", -363, 6768, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_016900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_016900", -364, 6769, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017000", -365, 6770, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017100", -366, 6771, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017200", -367, 6772, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017300", -370, 6773, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017400", -371, 6774, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017500", -372, 6775, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017600", -373, 6776, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017700", -374, 6777, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017800", -375, 6778, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_017900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_017900", -376, 6779, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018000", -377, 6780, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018100", -378, 6781, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018200", -379, 6782, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018300", -380, 6783, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018400", -381, 6784, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018500", -382, 6785, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018600", -383, 6786, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018700", -384, 6787, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018800", -400, 6788, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_018900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_018900", -401, 6789, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019000", -402, 6790, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019100", -403, 6791, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019200", -404, 6792, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019300", -405, 6793, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019400", -406, 6794, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019500", -407, 6795, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019600", -408, 6796, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019700", -409, 6797, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019800", -410, 6798, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_019900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_019900", -411, 6799, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020000", -412, 6800, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020100", -413, 6801, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020200", -501, 6802, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020300", -502, 6803, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020400", -503, 6804, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020500", -504, 6805, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020600", -505, 6806, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020700", -506, 6807, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020800", -507, 6808, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_020900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_020900", -601, 6809, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021000", -602, 6810, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021100", -603, 6811, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021200", -604, 6812, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021300", -605, 6813, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021400", -606, 6814, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021500", -607, 6815, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021600", -701, 6816, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021700", -702, 6817, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021800", -703, 6818, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_021900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_021900", -704, 6819, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022000", -705, 6820, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022100", -706, 6821, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022200", -707, 6822, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022300", -708, 6823, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022400", -709, 6824, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022500", -710, 6825, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022600", -712, 6826, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022700", -713, 6827, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022800", -714, 6828, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_022900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_022900", -716, 6829, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023000", -800, 6830, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023100", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023100", -801, 6831, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023200", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023200", -802, 6832, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023300", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023300", -803, 6833, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023400", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023400", -804, 6834, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023500", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023500", -805, 6835, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023600", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023600", -806, 6836, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023700", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023700", -808, 6837, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023800", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023800", -809, 6838, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_023900", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_023900", -810, 6839, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
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
      Utils.emitEvent("WebNetErrorList_024000", 10)
      await Utils.sleep(1000);
      Utils.registerEvent("WebNetErrorList_024000", -811, 6840, done);
      await Utils.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let StartModel = await driver.findComponent(ON.id("WebSchemeHandlerResponse"));
      await StartModel.click();
      await driver.delayMs(1000);
    })

    
  })
}
