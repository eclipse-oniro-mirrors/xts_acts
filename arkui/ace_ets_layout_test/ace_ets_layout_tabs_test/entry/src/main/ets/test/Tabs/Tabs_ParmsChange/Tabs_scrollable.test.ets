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
export default function Tabs_scrollable() {
  describe('Tabs_scrollable', function () {
    beforeEach(async function (done) {
      console.info("Tabs_scrollable beforeEach start");
      let options = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_scrollable",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_scrollable state pages:" + JSON.stringify(pages));
        if (!("Tabs_scrollable" == pages.name)) {
          console.info("get Tabs_scrollable pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_scrollable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_scrollable page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_scrollable beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Tabs_scrollable after each called");
      globalThis.value.message.notify({name:'currentIndex', value:0});
    });
    /**
     * @tc.number    SUB_ACE_TABS_SCROLLABLE_TEST_0100
     * @tc.name      testTabsScrollableToTrue
     * @tc.desc      The parent component sets scrollable to true
     */
    it('testTabsScrollableToTrue', 0, async function (done) {
      console.info('[testTabsScrollableToTrue] START');
      let strJson = getInspectorByKey('Tabs_scrollable_01');
      let obj = JSON.parse(strJson);
      console.info("[testTabsScrollableToTrue] type: " + JSON.stringify(obj.$type));
      console.info("[testTabsScrollableToTrue] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsScrollableToTrue] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsScrollableToTrue] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsScrollableToTrue] vertical: " + JSON.stringify(obj.$attrs.vertical));
      console.info("[testTabsScrollableToTrue] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.vertical).assertEqual("false");
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_scrollable_001 = CommonFunc.getComponentRect('Tabs_scrollable_001');
      let Tabs_scrollable_011 = CommonFunc.getComponentRect('Tabs_scrollable_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_scrollable_011.right - 30),
      Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom -Tabs_scrollable_011.top) / 2)),
      Math.round(Tabs_scrollable_011.left + 30),
      Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom -Tabs_scrollable_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_002 = CommonFunc.getComponentRect('Tabs_scrollable_002');
      let Tabs_scrollable_012 = CommonFunc.getComponentRect('Tabs_scrollable_012');
      await driver.swipe(Math.round(Tabs_scrollable_012.right - 30),
      Math.round(Tabs_scrollable_012.top +((Tabs_scrollable_012.bottom -Tabs_scrollable_012.top) / 2)),
      Math.round(Tabs_scrollable_012.left + 30),
      Math.round(Tabs_scrollable_012.top + ((Tabs_scrollable_012.bottom -Tabs_scrollable_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_003 = CommonFunc.getComponentRect('Tabs_scrollable_003');
      let Tabs_scrollable_013 = CommonFunc.getComponentRect('Tabs_scrollable_013');
      let Tabs_scrollable_01 = CommonFunc.getComponentRect('Tabs_scrollable_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_scrollable_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_scrollable_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_scrollable_yellow');

      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_011.left equal Tabs_scrollable_001.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_001.left}`);
      expect(Tabs_scrollable_011.left).assertEqual(Tabs_scrollable_001.left);
      expect(Tabs_scrollable_012.left).assertEqual(Tabs_scrollable_002.left);
      expect(Tabs_scrollable_013.left).assertEqual(Tabs_scrollable_003.left);
      expect(Tabs_scrollable_011.top).assertEqual(Tabs_scrollable_001.top);
      expect(Tabs_scrollable_012.top).assertEqual(Tabs_scrollable_002.top);
      expect(Tabs_scrollable_013.top).assertEqual(Tabs_scrollable_003.top);

      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_011.left equal Tabs_scrollable_01.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_01.left}`);
      expect(Tabs_scrollable_011.left).assertEqual(Tabs_scrollable_01.left);
      expect(Tabs_scrollable_012.left).assertEqual(Tabs_scrollable_01.left);
      expect(Tabs_scrollable_013.left).assertEqual(Tabs_scrollable_01.left);
      expect(Tabs_scrollable_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_scrollable_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_scrollable_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_011.bottom - Tabs_scrollable_011.top=
        ${Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)}`);
      expect(Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_012.bottom - Tabs_scrollable_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_013.bottom - Tabs_scrollable_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_scrollable_011.right - Tabs_scrollable_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.right - Tabs_scrollable_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.right - Tabs_scrollable_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue]Tabs_scrollable_001.bottom - Tabs_scrollable_001.top=
        ${Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)}`);
      expect(Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_002.bottom - Tabs_scrollable_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_003.bottom - Tabs_scrollable_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_scrollable_001.right - Tabs_scrollable_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_002.right - Tabs_scrollable_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_003.right - Tabs_scrollable_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsScrollableToTrue]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsScrollableToTrue] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_SCROLLABLE_TEST_0200
     * @tc.name      testTabsScrollableToFalse
     * @tc.desc      The parent component sets scrollable to false
     */
    it('testTabsScrollableToFalse', 0, async function (done) {
      console.info('[testTabsScrollableToFalse] START');
      let strJson = getInspectorByKey('Tabs_scrollable_02');
      let obj = JSON.parse(strJson);
      console.info("[testTabsScrollableToFalse] type: " + JSON.stringify(obj.$type));
      console.info("[testTabsScrollableToFalse] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsScrollableToFalse] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsScrollableToFalse] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsScrollableToFalse] vertical: " + JSON.stringify(obj.$attrs.vertical));
      console.info("[testTabsScrollableToFalse] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(false);
      expect(obj.$attrs.vertical).assertEqual("false");
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_scrollable_001 = CommonFunc.getComponentRect('Tabs_scrollable_004');
      let Tabs_scrollable_011 = CommonFunc.getComponentRect('Tabs_scrollable_041');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_scrollable_011.right - 30),
      Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom -Tabs_scrollable_011.top) / 2)),
      Math.round(Tabs_scrollable_011.left + 30),
      Math.round(Tabs_scrollable_011.top + ((Tabs_scrollable_011.bottom -Tabs_scrollable_011.top) / 2)));
      await CommonFunc.sleep(1000);
     let Tabs_scrollable_0012 = CommonFunc.getComponentRect('Tabs_scrollable_004');
      let Tabs_scrollable_0112 = CommonFunc.getComponentRect('Tabs_scrollable_041');
      let btn1 = await driver.findComponent(ON.text('blueTwo'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_002 = CommonFunc.getComponentRect('Tabs_scrollable_005');
      let Tabs_scrollable_012 = CommonFunc.getComponentRect('Tabs_scrollable_042');
      let btn2 = await driver.findComponent(ON.text('yellowTwo'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let Tabs_scrollable_003 = CommonFunc.getComponentRect('Tabs_scrollable_006');
      let Tabs_scrollable_013 = CommonFunc.getComponentRect('Tabs_scrollable_043');
      let Tabs_scrollable_01 = CommonFunc.getComponentRect('Tabs_scrollable_02');
      let subGreen = CommonFunc.getComponentRect('Tabs_scrollable_greenTwo');
      let subBlue = CommonFunc.getComponentRect('Tabs_scrollable_blueTwo');
      let subYellow = CommonFunc.getComponentRect('Tabs_scrollable_yellowTwo');

      console.info(`[testTabsScrollableToFalse]Tabs_scrollable_011.left equal Tabs_scrollable_001.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_001.left}`);
      expect(Tabs_scrollable_011.left).assertEqual(Tabs_scrollable_001.left);
      expect(Tabs_scrollable_012.left).assertEqual(Tabs_scrollable_002.left);
      expect(Tabs_scrollable_013.left).assertEqual(Tabs_scrollable_003.left);
      expect(Tabs_scrollable_011.top).assertEqual(Tabs_scrollable_001.top);
      expect(Tabs_scrollable_012.top).assertEqual(Tabs_scrollable_002.top);
      expect(Tabs_scrollable_013.top).assertEqual(Tabs_scrollable_003.top);

      console.info(`[testTabsScrollableToFalse]Tabs_scrollable_011.left equal Tabs_scrollable_01.left
        ${Tabs_scrollable_011.left} === ${Tabs_scrollable_01.left}`);
      expect(Tabs_scrollable_011.left).assertEqual(Tabs_scrollable_01.left);
      expect(Tabs_scrollable_012.left).assertEqual(Tabs_scrollable_01.left);
      expect(Tabs_scrollable_013.left).assertEqual(Tabs_scrollable_01.left);
      expect(Tabs_scrollable_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_scrollable_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_scrollable_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsScrollableToFalse]Tabs_scrollable_011.bottom - Tabs_scrollable_011.top=
        ${Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)}`);
      expect(Math.round(Tabs_scrollable_011.bottom - Tabs_scrollable_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_012.bottom - Tabs_scrollable_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_013.bottom - Tabs_scrollable_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_scrollable_011.right - Tabs_scrollable_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_012.right - Tabs_scrollable_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_013.right - Tabs_scrollable_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[ ]Tabs_scrollable_001.bottom - Tabs_scrollable_001.top=
        ${Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)}`);
      expect(Math.round(Tabs_scrollable_001.bottom - Tabs_scrollable_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_002.bottom - Tabs_scrollable_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_scrollable_003.bottom - Tabs_scrollable_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_scrollable_001.right - Tabs_scrollable_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_002.right - Tabs_scrollable_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_scrollable_003.right - Tabs_scrollable_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsScrollableToFalse]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsScrollableToFalse] END');
      done();
    });
  })
}
