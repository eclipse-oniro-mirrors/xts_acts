/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection,
  WindowMode, PointerMatrix, UiDirection, MouseButton } from '@ohos.UiTest';
export default function tabs_IndexTest() {
  describe('Tabs_IndexTest', function () {
    beforeEach(async function (done) {
      console.info("Tabs_IndexTest beforeEach start");
      let options = {
        url: "MainAbility/pages/Tabs/tabs_index/Tabs_index",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_index state pages:" + JSON.stringify(pages));
        if (!("Tabs_index" == pages.name)) {
          console.info("get Tabs_index pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_index page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_index page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_IndexTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Tabs_IndexTest after each called")
    });
    /**
     * @tc.number    SUB_ACE_TABS_INDEX_TEST_0100
     * @tc.name      testTabsIndexLessThanMin
     * @tc.desc      set index of tabs to -1
     */
    it('testTabsIndexLessThanMin', 0, async function (done) {
      console.info('[testTabsIndexLessThanMin] START');
      globalThis.value.message.notify({name:'index', value:-1});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_Index_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexLessThanMin] type: ${JSON.stringify(obj.$type)}`);
      console.info(`[testTabsIndexLessThanMin] barPosition: ${JSON.stringify(obj.$attrs.barPosition)}`);
      console.info(`[testTabsIndexLessThanMin] index: ${JSON.stringify(obj.$attrs.index)}`);
      console.info(`[testTabsIndexLessThanMin] scrollable: ${JSON.stringify(obj.$attrs.scrollable)}`);
      console.info(`[testTabsIndexLessThanMin] vertical: ${JSON.stringify(obj.$attrs.vertical)}`);
      console.info(`[testTabsIndexLessThanMin] barMode: ${JSON.stringify(obj.$attrs.barMode)}`);

      let Tabs_index_01 = CommonFunc.getComponentRect('Tabs_Index_01');
      let Tabs_index_001 = CommonFunc.getComponentRect('Tabs_Index_001');
      let Tabs_index_011 = CommonFunc.getComponentRect('Tabs_Index_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round((Tabs_index_011.right - 30)),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)),
        Math.round(Tabs_index_011.left + 30),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_002 = CommonFunc.getComponentRect('Tabs_Index_002');
      let Tabs_index_012 = CommonFunc.getComponentRect('Tabs_Index_012');
      await driver.swipe(Math.round(Tabs_index_012.right - 30),
        Math.round(Tabs_index_012.top +((Tabs_index_012.bottom - Tabs_index_012.top) / 2)),
        Math.round(Tabs_index_012.left + 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_003 = CommonFunc.getComponentRect('Tabs_Index_003');
      let Tabs_index_013 = CommonFunc.getComponentRect('Tabs_Index_013');
      let subGreen = CommonFunc.getComponentRect('Tabs_Index_Green');
      let subBlue = CommonFunc.getComponentRect('Tabs_Index_Blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_Index_Yellow');

      console.info(`[testTabsIndexLessThanMin] Tabs_index_01.left = ${Tabs_index_01.left}`);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_011.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_012.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_013.left);

      console.info(`[testTabsIndexLessThanMin] Tabs_index_011.left = ${Tabs_index_011.left}`);
      expect(Tabs_index_011.left).assertEqual(Tabs_index_001.left);
      expect(Tabs_index_012.left).assertEqual(Tabs_index_002.left);
      expect(Tabs_index_013.left).assertEqual(Tabs_index_003.left);
      expect(Tabs_index_011.top).assertEqual(Tabs_index_001.top);
      expect(Tabs_index_012.top).assertEqual(Tabs_index_002.top);
      expect(Tabs_index_013.top).assertEqual(Tabs_index_003.top);

      console.info(`[testTabsIndexLessThanMin] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);
      expect(Math.round(Tabs_index_011.bottom - Tabs_index_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_012.bottom - Tabs_index_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_013.bottom - Tabs_index_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexLessThanMin] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);
      expect(Math.round(Tabs_index_001.bottom - Tabs_index_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_002.bottom - Tabs_index_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_003.bottom - Tabs_index_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexLessThanMin] subGreen.bottom = ${subGreen.bottom}`);
      expect(subGreen.bottom).assertEqual(Tabs_index_001.top);
      expect(subGreen.bottom).assertEqual(subBlue.bottom);
      expect(subGreen.bottom).assertEqual(subYellow.bottom);

      console.info(`[testTabsIndexLessThanMin] subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));

      console.info('[testTabsIndexLessThanMin] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_INDEX_TEST_0200
     * @tc.name      testTabsIndexNormal
     * @tc.desc      set index of tabs to 1
     */
    it('testTabsIndexNormal', 0, async function (done) {
      console.info('[testTabsIndexNormal] START');
      globalThis.value.message.notify({name:'index', value:1});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_Index_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("1");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexNormal] type: ${JSON.stringify(obj.$type)}`);
      console.info(`[testTabsIndexNormal] barPosition: ${JSON.stringify(obj.$attrs.barPosition)}`);
      console.info(`[testTabsIndexNormal] index: ${JSON.stringify(obj.$attrs.index)}`);
      console.info(`[testTabsIndexNormal] scrollable: ${JSON.stringify(obj.$attrs.scrollable)}`);
      console.info(`[testTabsIndexNormal] vertical: ${JSON.stringify(obj.$attrs.vertical)}`);
      console.info(`[testTabsIndexNormal] barMode: ${JSON.stringify(obj.$attrs.barMode)}`);
      let driver = await Driver.create();
      let Tabs_index_002 = CommonFunc.getComponentRect('Tabs_Index_002');
      let Tabs_index_012 = CommonFunc.getComponentRect('Tabs_Index_012');
      await driver.swipe(Math.round(Tabs_index_012.right - 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)),
        Math.round(Tabs_index_012.left + 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_003 = CommonFunc.getComponentRect('Tabs_Index_003');
      let Tabs_index_013 = CommonFunc.getComponentRect('Tabs_Index_013');
      let subGreen = CommonFunc.getComponentRect('Tabs_Index_Green');
      let subBlue = CommonFunc.getComponentRect('Tabs_Index_Blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_Index_Yellow');
      globalThis.value.message.notify({name:'index', value:0});
      await CommonFunc.sleep(1000);

      let Tabs_index_01 = CommonFunc.getComponentRect('Tabs_Index_01');
      let Tabs_index_001 = CommonFunc.getComponentRect('Tabs_Index_001');
      let Tabs_index_011 = CommonFunc.getComponentRect('Tabs_Index_011');

      console.info(`[testTabsIndexNormal] Tabs_index_01.left = ${Tabs_index_01.left}`);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_011.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_012.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_013.left);

      console.info(`[testTabsIndexNormal] Tabs_index_011.left = ${Tabs_index_011.left}`);
      expect(Tabs_index_011.left).assertEqual(Tabs_index_001.left);
      expect(Tabs_index_012.left).assertEqual(Tabs_index_002.left);
      expect(Tabs_index_013.left).assertEqual(Tabs_index_003.left);
      expect(Tabs_index_011.top).assertEqual(Tabs_index_001.top);
      expect(Tabs_index_012.top).assertEqual(Tabs_index_002.top);
      expect(Tabs_index_013.top).assertEqual(Tabs_index_003.top);

      console.info(`[testTabsIndexNormal] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);
      expect(Math.round(Tabs_index_011.bottom - Tabs_index_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_012.bottom - Tabs_index_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_013.bottom - Tabs_index_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexNormal] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);
      expect(Math.round(Tabs_index_001.bottom - Tabs_index_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_002.bottom - Tabs_index_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_003.bottom - Tabs_index_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexNormal] subGreen.bottom = ${subGreen.bottom}`);
      expect(subGreen.bottom).assertEqual(Tabs_index_001.top);
      expect(subGreen.bottom).assertEqual(subBlue.bottom);
      expect(subGreen.bottom).assertEqual(subYellow.bottom);

      console.info(`[testTabsIndexNormal] subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsIndexNormal] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_INDEX_TEST_0300
     * @tc.name      testTabsIndexMoreThanMax
     * @tc.desc      set index of tabs to 3
     */
    it('testTabsIndexMoreThanMax', 0, async function (done) {
      console.info('[testTabsIndexMoreThanMax] START');
      globalThis.value.message.notify({name:'index', value:3});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Tabs_Index_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      console.info(`[testTabsIndexMoreThanMax] type: ${JSON.stringify(obj.$type)}`);
      console.info(`[testTabsIndexMoreThanMax] barPosition: ${JSON.stringify(obj.$attrs.barPosition)}`);
      console.info(`[testTabsIndexMoreThanMax] index: ${JSON.stringify(obj.$attrs.index)}`);
      console.info(`[testTabsIndexMoreThanMax] scrollable: ${JSON.stringify(obj.$attrs.scrollable)}`);
      console.info(`[testTabsIndexMoreThanMax] vertical: ${JSON.stringify(obj.$attrs.vertical)}`);
      console.info(`[testTabsIndexMoreThanMax] barMode: ${JSON.stringify(obj.$attrs.barMode)}`);

      let Tabs_index_01 = CommonFunc.getComponentRect('Tabs_Index_01');
      let Tabs_index_001 = CommonFunc.getComponentRect('Tabs_Index_001');
      let Tabs_index_011 = CommonFunc.getComponentRect('Tabs_Index_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_index_011.right - 30),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)),
        Math.round(Tabs_index_011.left + 30),
        Math.round(Tabs_index_011.top + ((Tabs_index_011.bottom - Tabs_index_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_002 = CommonFunc.getComponentRect('Tabs_Index_002');
      let Tabs_index_012 = CommonFunc.getComponentRect('Tabs_Index_012');
      await driver.swipe(Math.round(Tabs_index_012.right - 30),
        Math.round(Tabs_index_012.top +((Tabs_index_012.bottom - Tabs_index_012.top) / 2)),
        Math.round(Tabs_index_012.left + 30),
        Math.round(Tabs_index_012.top + ((Tabs_index_012.bottom - Tabs_index_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_index_003 = CommonFunc.getComponentRect('Tabs_Index_003');
      let Tabs_index_013 = CommonFunc.getComponentRect('Tabs_Index_013');
      let subGreen = CommonFunc.getComponentRect('Tabs_Index_Green');
      let subBlue = CommonFunc.getComponentRect('Tabs_Index_Blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_Index_Yellow');

      console.info(`[testTabsIndexMoreThanMax] Tabs_index_01.left = ${Tabs_index_01.left}`);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_011.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_012.left);
      expect(Tabs_index_01.left).assertEqual(Tabs_index_013.left);

      console.info(`[testTabsIndexMoreThanMax] Tabs_index_011.left = ${Tabs_index_011.left}`);
      expect(Tabs_index_011.left).assertEqual(Tabs_index_001.left);
      expect(Tabs_index_012.left).assertEqual(Tabs_index_002.left);
      expect(Tabs_index_013.left).assertEqual(Tabs_index_003.left);
      expect(Tabs_index_011.top).assertEqual(Tabs_index_001.top);
      expect(Tabs_index_012.top).assertEqual(Tabs_index_002.top);
      expect(Tabs_index_013.top).assertEqual(Tabs_index_003.top);

      console.info(`[testTabsIndexMoreThanMax] Tabs_index_011.bottom -
      Tabs_index_011.top = ${Tabs_index_011.bottom - Tabs_index_011.top}`);
      expect(Math.round(Tabs_index_011.bottom - Tabs_index_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_012.bottom - Tabs_index_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_013.bottom - Tabs_index_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_index_011.right - Tabs_index_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_012.right - Tabs_index_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_013.right - Tabs_index_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexMoreThanMax] Tabs_index_001.bottom -
      Tabs_index_001.top = ${Tabs_index_001.bottom - Tabs_index_001.top}`);
      expect(Math.round(Tabs_index_001.bottom - Tabs_index_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_002.bottom - Tabs_index_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_index_003.bottom - Tabs_index_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_index_001.right - Tabs_index_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_002.right - Tabs_index_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_index_003.right - Tabs_index_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsIndexMoreThanMax] subGreen.bottom = ${subGreen.bottom}`);
      expect(subGreen.bottom).assertEqual(Tabs_index_001.top);
      expect(subGreen.bottom).assertEqual(subBlue.bottom);
      expect(subGreen.bottom).assertEqual(subYellow.bottom);

      console.info(`[testTabsIndexMoreThanMax] subGreen.bottom - subGreen.top = ${subGreen.bottom - subGreen.top}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));

      console.info('[testTabsIndexMoreThanMax] END');
      done();
    });
  })
}
