/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import hilog from '@ohos.hilog';
const SLEEP_TIME = 1000;
const SLEEP_TIME_2000 = 2000;
const PARAMETER_ERROR_CODE = 401;

export default function listActionTest() {
  describe('listrActionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperActionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listAction",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listActionTest state pages:" + JSON.stringify(pages));
        if (!("listAction" == pages.name)) {
          console.info("get listActionTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_2000);
          console.info("push listActionTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listActionTest page error:" + err);
      }
      console.info("listActionTest beforeEach end");
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0010
     * @tc.number SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0010
     * @tc.desc   test ListItemSwipeActionDirection is start and ListItemSwipeActionManager is EXPANDED,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0010 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('btn1'));
      await btn1.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson: string = getInspectorByKey('swipe0100');
      console.info('ACE_ListItemSwipeActionManager_0010 text: ' + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("ACE_ListItemSwipeActionManager_0010 content: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('EXPANDED');
      let strJson1: string = getInspectorByKey('textstart');
      console.info('ACE_ListItemSwipeActionManager_0010 ' + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$type).assertEqual('Text');
      console.info("ACE_ListItemSwipeActionManager_0010 content1: " + JSON.parse(strJson1).$attrs.content);
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('start');
      let btn3 = await driver.findComponent(ON.id('btn3'));
      await btn3.click();
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0010 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0020
     * @tc.number SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0020
     * @tc.desc   test ListItemSwipeActionDirection is end and ListItemSwipeActionManager is EXPANDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0020 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn2 = await driver.findComponent(ON.id('btn2'));
      await btn2.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson: string = getInspectorByKey('swipe0100');
      console.info('ACE_ListItemSwipeActionManager_0020 text: ' + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("ACE_ListItemSwipeActionManager_0020 content: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('EXPANDED');
      let strJson1: string = getInspectorByKey('textend');
      console.info('ACE_ListItemSwipeActionManager_0020 ' + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$type).assertEqual('Text');
      console.info("ACE_ListItemSwipeActionManager_0020 content1: " + JSON.parse(strJson1).$attrs.content);
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('end');
      let btn4 = await driver.findComponent(ON.id('btn4'));
      await btn4.click();
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0020 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0030
     * @tc.number SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0030
     * @tc.desc   test ListItemSwipeActionManager is COLLAPSED,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0030 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('btn1'));
      await btn1.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let btn3 = await driver.findComponent(ON.id('btn3'));
      await btn3.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson: string = getInspectorByKey('swipe0100');
      console.info('ArkUI_List_Swipe_0300 text: ' + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("ArkUI_List_Swipe_0300 obj2.$attrs.content: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('COLLAPSED');
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0030 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0040
     * @tc.number SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0040
     * @tc.desc   ListItemSwipeActionDirection is undefined and ListItemSwipeActionManager is EXPANDED,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0040 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn5 = await driver.findComponent(ON.id('btn5'));
      await btn5.click();
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0040 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
      };
      done();
    })

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0050
     * @tc.number SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0050
     * @tc.desc   ListItemSwipeActionDirection is null and ListItemSwipeActionManager is EXPANDED,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0050 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let driver: Driver = Driver.create();
      let btn6 = await driver.findComponent(ON.id('btn6'));
      await btn6.click();
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        console.info('SUB_ACE_UI_COMPONENT_ListItemSwipeActionManager_0050 Parameters are correct');
      } catch (err) {
        hilog.error(0x0000, "Error expand item:",
          `listSwipeAction, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
      };
      done();
    })
  })
}
