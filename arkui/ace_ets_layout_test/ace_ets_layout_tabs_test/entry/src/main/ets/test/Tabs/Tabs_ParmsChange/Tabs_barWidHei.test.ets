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
export default function Tabs_barWidHei() {
  describe('Tabs_barWidHei', function () {
    beforeEach(async function (done) {
      console.info("Tabs_barWidHei beforeEach start");
      let options = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_barWidHei",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_barWidHei state pages:" + JSON.stringify(pages));
        if (!("Tabs_barWidHei" == pages.name)) {
          console.info("get Tabs_barWidHei pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_barWidHei page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_barWidHei page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_barWidHei beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Tabs_barWidHei after each called")
      globalThis.value.message.notify({name:'currentIndex', value:0});
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARWIDHEI_TEST_0100
     * @tc.name      testTabsBarWidToNegative
     * @tc.desc      The parent component sets the value of barWidth to a negative number .barwidth(-10)
     */
    it('testTabsBarWidToNegative', 0, async function (done) {
      console.info('[testTabsBarWidToNegative] START');
      let strJson = getInspectorByKey('Tabs_barWidHei_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsBarWidToNegative] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsBarWidToNegative] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsBarWidToNegative] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsBarWidToNegative] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsBarWidToNegative] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001 = CommonFunc.getComponentRect('Tabs_barWidHei_001');
      let Tabs_barWidHei_011 = CommonFunc.getComponentRect('Tabs_barWidHei_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round((Tabs_barWidHei_011.right - 30)),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)),
      Math.round(Tabs_barWidHei_011.left + 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002 = CommonFunc.getComponentRect('Tabs_barWidHei_002');
      let Tabs_barWidHei_012 = CommonFunc.getComponentRect('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
      Math.round(Tabs_barWidHei_012.top +((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)),
      Math.round(Tabs_barWidHei_012.left + 30),
      Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003 = CommonFunc.getComponentRect('Tabs_barWidHei_003');
      let Tabs_barWidHei_013 = CommonFunc.getComponentRect('Tabs_barWidHei_013');
      let Tabs_barWidHei_01 = CommonFunc.getComponentRect('Tabs_barWidHei_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barWidHei_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barWidHei_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_001.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_002.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_003.left);
      expect(Tabs_barWidHei_011.top).assertEqual(Tabs_barWidHei_001.top);
      expect(Tabs_barWidHei_012.top).assertEqual(Tabs_barWidHei_002.top);
      expect(Tabs_barWidHei_013.top).assertEqual(Tabs_barWidHei_003.top);

      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_barWidHei_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_barWidHei_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidToNegative]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left)).assertEqual(Math.round(vp2px(330)));

      console.info(`[testTabsBarWidToNegative]subGreen.bottom - subGreen.top
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));

      console.info('[testTabsBarWidToNegative] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARWIDHEI_TEST_0200
     * @tc.name      testTabsBarWidExceedTabsWid
     * @tc.desc      The parent component sets the value of barWidth to a positive number (exceeding the width of Tabs)
     * .barwidth(400)
     */
    it('testTabsBarWidExceedTabsWid', 0, async function (done) {
      console.info('[testTabsBarWidExceedTabsWid] START');
      globalThis.value.message.notify({name:'setBarWidth', value:400});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsBarWidExceedTabsWid] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsBarWidExceedTabsWid] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsBarWidExceedTabsWid] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsBarWidExceedTabsWid] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsBarWidExceedTabsWid] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001 = CommonFunc.getComponentRect('Tabs_barWidHei_001');
      let Tabs_barWidHei_011 = CommonFunc.getComponentRect('Tabs_barWidHei_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)),
      Math.round(Tabs_barWidHei_011.left + 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002 = CommonFunc.getComponentRect('Tabs_barWidHei_002');
      let Tabs_barWidHei_012 = CommonFunc.getComponentRect('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
      Math.round(Tabs_barWidHei_012.top +((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)),
      Math.round(Tabs_barWidHei_012.left + 30),
      Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003 = CommonFunc.getComponentRect('Tabs_barWidHei_003');
      let Tabs_barWidHei_013 = CommonFunc.getComponentRect('Tabs_barWidHei_013');
      let Tabs_barWidHei_01 = CommonFunc.getComponentRect('Tabs_barWidHei_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barWidHei_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barWidHei_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_001.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_002.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_003.left);
      expect(Tabs_barWidHei_011.top).assertEqual(Tabs_barWidHei_001.top);
      expect(Tabs_barWidHei_012.top).assertEqual(Tabs_barWidHei_002.top);
      expect(Tabs_barWidHei_013.top).assertEqual(Tabs_barWidHei_003.top);

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_barWidHei_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_barWidHei_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidExceedTabsWid]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left)).assertEqual(Math.round(vp2px(330)));

      console.info(`[testTabsBarWidExceedTabsWid]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsBarWidExceedTabsWid] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARWIDHEI_TEST_0300
     * @tc.name      testTabsBarWidWithinTabsWid
     * @tc.desc      The parent component sets the value of barWidth to a positive number
     * (a value within the Tabs width).barwidth(300)
     */
    it('testTabsBarWidWithinTabsWid', 0, async function (done) {
      console.info('[testTabsBarWidWithinTabsWid] START');
      globalThis.value.message.notify({name:'setBarWidth', value:300});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsBarWidWithinTabsWid] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsBarWidWithinTabsWid] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsBarWidWithinTabsWid] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsBarWidWithinTabsWid] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsBarWidWithinTabsWid] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001 = CommonFunc.getComponentRect('Tabs_barWidHei_001');
      let Tabs_barWidHei_011 = CommonFunc.getComponentRect('Tabs_barWidHei_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)),
      Math.round(Tabs_barWidHei_011.left + 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002 = CommonFunc.getComponentRect('Tabs_barWidHei_002');
      let Tabs_barWidHei_012 = CommonFunc.getComponentRect('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
      Math.round(Tabs_barWidHei_012.top +((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)),
      Math.round(Tabs_barWidHei_012.left + 30),
      Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003 = CommonFunc.getComponentRect('Tabs_barWidHei_003');
      let Tabs_barWidHei_013 = CommonFunc.getComponentRect('Tabs_barWidHei_013');
      let Tabs_barWidHei_01 = CommonFunc.getComponentRect('Tabs_barWidHei_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barWidHei_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barWidHei_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_001.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_002.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_003.left);
      expect(Tabs_barWidHei_011.top).assertEqual(Tabs_barWidHei_001.top);
      expect(Tabs_barWidHei_012.top).assertEqual(Tabs_barWidHei_002.top);
      expect(Tabs_barWidHei_013.top).assertEqual(Tabs_barWidHei_003.top);

      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_barWidHei_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_barWidHei_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarWidWithinTabsWid]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
      ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`)
      expect(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left)).assertEqual(Math.round(vp2px(330)));

      console.info(`[testTabsBarWidWithinTabsWid]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(100)));
      console.info('[testTabsBarWidWithinTabsWid] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARWIDHEI_TEST_0400
     * @tc.name      testTabsBarHeiExceedTabsHei
     * @tc.desc      The parent component sets the value of barHeigh to a positive number (exceeding the height of Tabs)
     */
    it('testTabsBarHeiExceedTabsHei', 0, async function (done) {
      console.info('[testTabsBarHeiExceedTabsHei] START');
      globalThis.value.message.notify({name:'setBarWidth', value:330});
      globalThis.value.message.notify({name:'setBarHeight', value:320});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsBarHeiExceedTabsHei] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsBarHeiExceedTabsHei] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsBarHeiExceedTabsHei] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsBarHeiExceedTabsHei] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsBarHeiExceedTabsHei] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001 = CommonFunc.getComponentRect('Tabs_barWidHei_001');
      let Tabs_barWidHei_011 = CommonFunc.getComponentRect('Tabs_barWidHei_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)),
      Math.round(Tabs_barWidHei_011.left + 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002 = CommonFunc.getComponentRect('Tabs_barWidHei_002');
      let Tabs_barWidHei_012 = CommonFunc.getComponentRect('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
      Math.round(Tabs_barWidHei_012.top +((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)),
      Math.round(Tabs_barWidHei_012.left + 30),
      Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003 = CommonFunc.getComponentRect('Tabs_barWidHei_003');
      let Tabs_barWidHei_013 = CommonFunc.getComponentRect('Tabs_barWidHei_013');
      let Tabs_barWidHei_01 = CommonFunc.getComponentRect('Tabs_barWidHei_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barWidHei_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barWidHei_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_001.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_002.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_003.left);
      expect(Tabs_barWidHei_011.top).assertEqual(Tabs_barWidHei_001.top);
      expect(Tabs_barWidHei_012.top).assertEqual(Tabs_barWidHei_002.top);
      expect(Tabs_barWidHei_013.top).assertEqual(Tabs_barWidHei_003.top);

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_barWidHei_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_barWidHei_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiExceedTabsHei]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left)).assertEqual(Math.round(vp2px(330)));

      console.info(`[testTabsBarHeiExceedTabsHei]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsBarHeiExceedTabsHei] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARWIDHEI_TEST_0500
     * @tc.name      testTabsBarHeiWithinTabsHei
     * @tc.desc      The parent component sets the value of barHeigh to a positive number
     * (a value within the height range of Tabs).barHeight(100)
     */
    it('testTabsBarHeiWithinTabsHei', 0, async function (done) {
      console.info('[testTabsBarHeiWithinTabsHei] START');
      globalThis.value.message.notify({name:'setBarHeight', value:100});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsBarHeiWithinTabsHei] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsBarHeiWithinTabsHei] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsBarHeiWithinTabsHei] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsBarHeiWithinTabsHei] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsBarHeiWithinTabsHei] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001 = CommonFunc.getComponentRect('Tabs_barWidHei_001');
      let Tabs_barWidHei_011 = CommonFunc.getComponentRect('Tabs_barWidHei_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)),
      Math.round(Tabs_barWidHei_011.left + 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002 = CommonFunc.getComponentRect('Tabs_barWidHei_002');
      let Tabs_barWidHei_012 = CommonFunc.getComponentRect('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
      Math.round(Tabs_barWidHei_012.top +((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)),
      Math.round(Tabs_barWidHei_012.left + 30),
      Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003 = CommonFunc.getComponentRect('Tabs_barWidHei_003');
      let Tabs_barWidHei_013 = CommonFunc.getComponentRect('Tabs_barWidHei_013');
      let Tabs_barWidHei_01 = CommonFunc.getComponentRect('Tabs_barWidHei_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barWidHei_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barWidHei_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_001.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_002.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_003.left);
      expect(Tabs_barWidHei_011.top).assertEqual(Tabs_barWidHei_001.top);
      expect(Tabs_barWidHei_012.top).assertEqual(Tabs_barWidHei_002.top);
      expect(Tabs_barWidHei_013.top).assertEqual(Tabs_barWidHei_003.top);

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_barWidHei_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_barWidHei_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiWithinTabsHei]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left)).assertEqual(Math.round(vp2px(330)));

      console.info(`[testTabsBarHeiWithinTabsHei]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsBarHeiWithinTabsHei] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARWIDHEI_TEST_0600
     * @tc.name      testTabsBarHeiToNegative
     * @tc.desc      The parent component sets the value of barHeight to a negative number
     */
    it('testTabsBarHeiToNegative', 0, async function (done) {
      console.info('[testTabsBarHeiToNegative] START');
      globalThis.value.message.notify({name:'setBarHeight', value:-10});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barWidHei_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsBarHeiToNegative] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsBarHeiToNegative] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsBarHeiToNegative] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsBarHeiToNegative] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsBarHeiToNegative] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barWidHei_001 = CommonFunc.getComponentRect('Tabs_barWidHei_001');
      let Tabs_barWidHei_011 = CommonFunc.getComponentRect('Tabs_barWidHei_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barWidHei_011.right - 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)),
      Math.round(Tabs_barWidHei_011.left + 30),
      Math.round(Tabs_barWidHei_011.top + ((Tabs_barWidHei_011.bottom -Tabs_barWidHei_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_002 = CommonFunc.getComponentRect('Tabs_barWidHei_002');
      let Tabs_barWidHei_012 = CommonFunc.getComponentRect('Tabs_barWidHei_012');
      await driver.swipe(Math.round(Tabs_barWidHei_012.right - 30),
      Math.round(Tabs_barWidHei_012.top +((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)),
      Math.round(Tabs_barWidHei_012.left + 30),
      Math.round(Tabs_barWidHei_012.top + ((Tabs_barWidHei_012.bottom -Tabs_barWidHei_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barWidHei_003 = CommonFunc.getComponentRect('Tabs_barWidHei_003');
      let Tabs_barWidHei_013 = CommonFunc.getComponentRect('Tabs_barWidHei_013');
      let Tabs_barWidHei_01 = CommonFunc.getComponentRect('Tabs_barWidHei_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barWidHei_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barWidHei_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barWidHei_yellow');

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_001.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_001.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_001.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_002.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_003.left);
      expect(Tabs_barWidHei_011.top).assertEqual(Tabs_barWidHei_001.top);
      expect(Tabs_barWidHei_012.top).assertEqual(Tabs_barWidHei_002.top);
      expect(Tabs_barWidHei_013.top).assertEqual(Tabs_barWidHei_003.top);

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_011.left equal Tabs_barWidHei_01.left
        ${Tabs_barWidHei_011.left} === ${Tabs_barWidHei_01.left}`);
      expect(Tabs_barWidHei_011.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_012.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_013.left).assertEqual(Tabs_barWidHei_01.left);
      expect(Tabs_barWidHei_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_barWidHei_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_barWidHei_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top=
        ${Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)}`);
      expect(Math.round(Tabs_barWidHei_011.bottom - Tabs_barWidHei_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_012.bottom - Tabs_barWidHei_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_013.bottom - Tabs_barWidHei_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barWidHei_011.right - Tabs_barWidHei_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_012.right - Tabs_barWidHei_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barWidHei_013.right - Tabs_barWidHei_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsBarHeiToNegative]Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top=
        ${Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)}`);
      expect(Math.round(Tabs_barWidHei_001.bottom - Tabs_barWidHei_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_002.bottom - Tabs_barWidHei_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_003.bottom - Tabs_barWidHei_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barWidHei_001.right - Tabs_barWidHei_001.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_002.right - Tabs_barWidHei_002.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_barWidHei_003.right - Tabs_barWidHei_003.left)).assertEqual(Math.round(vp2px(330)));

      console.info(`[testTabsBarHeiToNegative]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsBarHeiToNegative] END');
      done();
    });
  })
}
