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
import events_emitter from '@ohos.events.emitter';

const SLEEP_TIME = 1000;

export default function ListFillPolicyModifier() {
  describe('ListFillPolicyModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("ListFillPolicyModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListFillPolicyModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListFillPolicyModifier state pages:" + JSON.stringify(pages));
        if (!("ListFillPolicyModifier" == pages.name)) {
          console.info("get ListFillPolicyModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
          console.info("push ListFillPolicyModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListFillPolicyModifier page error:" + err);
      }
      console.info("ListFillPolicyModifier beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("listLevel1 after each called");
    });

    /**
     * @tc.number test_list_lanse_value_001
     * @tc.name   test_list_lanse_value_001
     * @tc.desc   Set the value to PresetFillType.BREAKPOINT_SM1MD2LG3 and return PresetFillType::BREAKPOINT_SM1MD2LG3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_list_lanse_value_001', Level.LEVEL0, async (done: Function) => {
      console.info('[test_list_lanse_value_001] START');
      let strJsonNew = getInspectorByKey('ListModifier');
      console.info("[test_list_lanse_value_001] component opacity strJson:" + strJsonNew);
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(obj.$type).assertEqual('List');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_SM1MD2LG3");
      let listItem1 = CommonFunc.getComponentRectOnScreen('listType_1');
      console.info('[ListFillPolicy_0200] listItem1.bottom: ' + listItem1.bottom);
      let listItem2 = CommonFunc.getComponentRectOnScreen('listType_2');
      console.info('[ListFillPolicy_0200] listItem2.top: ' + listItem2.top);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(Math.abs(Math.floor(listItem2.top - listItem1.bottom)) <= 1 ).assertTrue();
      console.info('[test_list_lanse_value_001] END');
      done();
    });
    /**
     * @tc.number test_list_lanse_value_002
     * @tc.name   test_list_lanse_value_002
     * @tc.desc   Set the value to PresetFillType.BREAKPOINT_SM2MD3LG5 and return PresetFillType::BREAKPOINT_SM2MD3LG5.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_list_lanse_value_002', Level.LEVEL0, async (done: Function) => {
      console.info('[test_list_lanse_value_002] START');
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('modifierBtn1'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('ListModifier');
      console.info("[test_list_lanse_value_002] component opacity strJson:" + strJsonNew);
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('List');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_SM2MD3LG5");
      let listItem1 = CommonFunc.getComponentRectOnScreen('listType_1');
      console.info('[ListFillPolicy_0200] listItem1.bottom: ' + listItem1.bottom);
      let listItem2 = CommonFunc.getComponentRectOnScreen('listType_2');
      console.info('[ListFillPolicy_0200] listItem2.top: ' + listItem2.top);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(Math.abs(Math.floor(listItem2.top - listItem1.bottom)) <= 1 ).assertTrue();
      console.info('[test_list_lanse_value_002] END');
      done();
    });
    /**
     * @tc.number test_list_lanse_value_003
     * @tc.name   test_list_lanse_value_003
     * @tc.desc   Set the value to PresetFillType.BREAKPOINT_DEFAULT and return PresetFillType.BREAKPOINT_DEFAULT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_list_lanse_value_003', Level.LEVEL0, async (done: Function) => {
      console.info('[test_list_lanse_value_003] START');
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('modifierBtn2'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('ListModifier');
      console.info("[test_list_lanse_value_003] component opacity strJson:" + strJsonNew);
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('List');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_DEFAULT");
      let listItem1 = CommonFunc.getComponentRectOnScreen('listType_1');
      console.info('[ListFillPolicy_0200] listItem1.bottom: ' + listItem1.bottom);
      let listItem2 = CommonFunc.getComponentRectOnScreen('listType_2');
      console.info('[ListFillPolicy_0200] listItem2.top: ' + listItem2.top);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(Math.abs(Math.floor(listItem2.top - listItem1.bottom)) <= 1 ).assertTrue();
      console.info('[test_list_lanse_value_003] END');
      done();
    });
    /**
     * @tc.number test_list_lanse_value_004
     * @tc.name   test_list_lanse_value_004
     * @tc.desc   Set the value to undefined and return PresetFillType.BREAKPOINT_DEFAULT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_list_lanse_value_004', Level.LEVEL0, async (done: Function) => {
      console.info('[test_list_lanse_value_004] START');
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('modifierBtn3'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('ListModifier');
      console.info("[test_list_lanse_value_004] component opacity strJson:" + strJsonNew);
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('List');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_DEFAULT");
      let listItem1 = CommonFunc.getComponentRectOnScreen('listType_1');
      console.info('[ListFillPolicy_0200] listItem1.bottom: ' + listItem1.bottom);
      let listItem2 = CommonFunc.getComponentRectOnScreen('listType_2');
      console.info('[ListFillPolicy_0200] listItem2.top: ' + listItem2.top);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(Math.abs(Math.floor(listItem2.top - listItem1.bottom)) <= 1 ).assertTrue();
      console.info('[test_list_lanse_value_004] END');
      done();
    });
    /**
     * @tc.number test_list_lanse_value_005
     * @tc.name   test_list_lanse_value_005
     * @tc.desc   Set the value to -1 and return PresetFillType.BREAKPOINT_DEFAULT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_list_lanse_value_005', Level.LEVEL0, async (done: Function) => {
      console.info('[test_list_lanse_value_005] START');
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('modifierBtn4'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('ListModifier');
      console.info("[test_list_lanse_value_005] component opacity strJson:" + strJsonNew);
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('List');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_DEFAULT");
      let listItem1 = CommonFunc.getComponentRectOnScreen('listType_1');
      console.info('[ListFillPolicy_0200] listItem1.bottom: ' + listItem1.bottom);
      let listItem2 = CommonFunc.getComponentRectOnScreen('listType_2');
      console.info('[ListFillPolicy_0200] listItem2.top: ' + listItem2.top);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(Math.abs(Math.floor(listItem2.top - listItem1.bottom)) <= 1 ).assertTrue();
      console.info('[test_list_lanse_value_005] END');
      done();
    });
    /**
     * @tc.number test_list_lanse_value_006
     * @tc.name   test_list_lanse_value_006
     * @tc.desc   Set the value to 0 and return PresetFillType.BREAKPOINT_DEFAULT.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_list_lanse_value_006', Level.LEVEL0, async (done: Function) => {
      console.info('[test_list_lanse_value_006] START');
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('modifierBtn5'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('ListModifier');
      console.info("[test_list_lanse_value_006] component opacity strJson:" + strJsonNew);
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('List');
      expect(JSON.parse(strJsonNew).$attrs.itemFillPolicy).assertEqual("PresetFillType::BREAKPOINT_DEFAULT");
      let listItem1 = CommonFunc.getComponentRectOnScreen('listType_1');
      console.info('[ListFillPolicy_0200] listItem1.bottom: ' + listItem1.bottom);
      let listItem2 = CommonFunc.getComponentRectOnScreen('listType_2');
      console.info('[ListFillPolicy_0200] listItem2.top: ' + listItem2.top);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(Math.abs(Math.floor(listItem2.top - listItem1.bottom)) <= 1 ).assertTrue();
      console.info('[test_list_lanse_value_006] END');
      done();
    });
  })
}