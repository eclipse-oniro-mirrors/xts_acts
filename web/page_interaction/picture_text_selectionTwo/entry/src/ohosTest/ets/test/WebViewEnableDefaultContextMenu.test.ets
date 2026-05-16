/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON, MouseButton } from "@kit.TestKit";
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 177009;
let driver = Driver.create();

export default function WebViewEnableDefaultContextMenuJsunit() {
  describe('WebViewEnableDefaultContextMenuTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/WebViewEnableDefaultContextMenu"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnableDefaultContextMenu state success " + JSON.stringify(pages));
        if (!("WebViewEnableDefaultContextMenu" == pages.name)) {
          console.info("get WebViewEnableDefaultContextMenu state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push WebViewEnableDefaultContextMenu page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnableDefaultContextMenu page error: " + err);
      }
      await driver.waitForComponent(ON.id("webEnableDefaultContextMenu"), 10000);
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("SaveImageMenu beforeEach start");

      done();
    })
    /**
     * @tc.name   EnableDefaultContextMenu01
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_001
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu01",true, 20260325, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu01");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu01" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   EnableDefaultContextMenu02
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_002
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu02", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu02",true, 20260326, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu02");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu02" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   EnableDefaultContextMenu03
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_003
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu03", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu03",true, 20260327, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu03");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu03" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.name   EnableDefaultContextMenu04
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_004
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu04',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu04", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu04",true, 20260328, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu04");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu04" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   EnableDefaultContextMenu05
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_005
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu05',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu05", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu05",true, 20260329, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu05");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu05" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   EnableDefaultContextMenu06
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_006
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu06',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu06", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu06",true, 20260330, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu06");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu06" + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   EnableDefaultContextMenu07
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_007
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu07',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu07", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu07",true, 20260331, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu07");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu07" + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   EnableDefaultContextMenu08
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_008
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu08',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu08", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu08",true, 20260332, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu08");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu08" + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.name   EnableDefaultContextMenu09
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_009
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu09',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu09", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu09",true, 20260333, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu09");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu09" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   EnableDefaultContextMenu10
     * @tc.number SUB_ACE_ENABLEDEFAULTCONTEXTMENU_API_010
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenu10',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("EnableDefaultContextMenu10", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("EnableDefaultContextMenu10",true, 20260334, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webEnableDefaultContextMenu", "EnableDefaultContextMenu10");
      await Utils.waitForExist(() => isReturn, "EnableDefaultContextMenu10" + '_returnCheck', true, 1000);
      done();
    })

  })
}
