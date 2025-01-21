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
export default function Tabs_barPosition() {
  describe('Tabs_barPosition', function () {
    beforeEach(async function (done) {
      console.info("Tabs_barPosition beforeEach start");
      let options = {
        url: "MainAbility/pages/Tabs/Tabs_ParmsChange/Tabs_barPosition",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_barPosition state pages:" + JSON.stringify(pages));
        if (!("Tabs_barPosition" == pages.name)) {
          console.info("get Tabs_barPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_barPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_barPosition page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_barPosition beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Tabs_barPosition after each called");
      globalThis.value.message.notify({name:'currentIndex', value:0});
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARPOSITION_TEST_0100
     * @tc.name      TabsBarPositionStartWithVerticalFalse
     * @tc.desc      When vertical is set to the default value of false, barPosition is set to barPosition.Start
     */
    it('TabsBarPositionStartWithVerticalFalse', 0, async function (done) {
      console.info('[TabsBarPositionStartWithVerticalFalse] START');
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');
      let obj = JSON.parse(strJson);
      console.info("[TabsBarPositionStartWithVerticalFalse] type: " + JSON.stringify(obj.$type));
      console.info("[TabsBarPositionStartWithVerticalFalse] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[TabsBarPositionStartWithVerticalFalse] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[TabsBarPositionStartWithVerticalFalse] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[TabsBarPositionStartWithVerticalFalse] vertical: " + JSON.stringify(obj.$attrs.vertical));
      console.info("[TabsBarPositionStartWithVerticalFalse] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.vertical).assertEqual("false");
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001 = CommonFunc.getComponentRect('Tabs_barPosition_001');
      let Tabs_barPosition_011 = CommonFunc.getComponentRect('Tabs_barPosition_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round((Tabs_barPosition_011.right - 30)),
      Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)),
      Math.round(Tabs_barPosition_011.left + 30),
      Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002 = CommonFunc.getComponentRect('Tabs_barPosition_002');
      let Tabs_barPosition_012 = CommonFunc.getComponentRect('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.right - 30),
      Math.round(Tabs_barPosition_012.top +((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)),
      Math.round(Tabs_barPosition_012.left + 30),
      Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003 = CommonFunc.getComponentRect('Tabs_barPosition_003');
      let Tabs_barPosition_013 = CommonFunc.getComponentRect('Tabs_barPosition_013');
      let Tabs_barPosition_01 = CommonFunc.getComponentRect('Tabs_barPosition_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barPosition_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barPosition_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
      expect(Tabs_barPosition_011.left).assertEqual(Tabs_barPosition_001.left);
      expect(Tabs_barPosition_012.left).assertEqual(Tabs_barPosition_002.left);
      expect(Tabs_barPosition_013.left).assertEqual(Tabs_barPosition_003.left);
      expect(Tabs_barPosition_011.top).assertEqual(Tabs_barPosition_001.top);
      expect(Tabs_barPosition_012.top).assertEqual(Tabs_barPosition_002.top);
      expect(Tabs_barPosition_013.top).assertEqual(Tabs_barPosition_003.top);

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_01.top equal subGreen.top
        ${Tabs_barPosition_01.top} === ${subGreen.top}`);
      expect(Tabs_barPosition_01.top).assertEqual(subGreen.top);
      expect(Tabs_barPosition_01.top).assertEqual(subBlue.top);
      expect(Tabs_barPosition_01.top).assertEqual(subYellow.top);

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_011.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_011.left}`);
      expect(Tabs_barPosition_011.left).assertEqual(Tabs_barPosition_011.left);
      expect(Tabs_barPosition_012.left).assertEqual(Tabs_barPosition_01.left);
      expect(Tabs_barPosition_013.left).assertEqual(Tabs_barPosition_01.left);
      expect(Tabs_barPosition_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_barPosition_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_barPosition_013.top).assertEqual(subYellow.bottom);

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
      expect(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barPosition_011.right - Tabs_barPosition_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - Tabs_barPosition_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - Tabs_barPosition_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barPosition_001.right - Tabs_barPosition_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_002.right - Tabs_barPosition_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_003.right - Tabs_barPosition_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionStartWithVerticalFalse]subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`)
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[TabsBarPositionStartWithVerticalFalse] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARPOSITION_TEST_0200
     * @tc.name      TabsBarPositionEndWithVerticalFalse
     * @tc.desc      When vertical takes the default value of false, barPosition is set to barPosition.End
     */
    it('TabsBarPositionEndWithVerticalFalse', 0, async function (done) {
      console.info('[TabsBarPositionEndWithVerticalFalse] START');
      globalThis.value.message.notify({name:'changeBarPosition', value:BarPosition.End});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');
      let obj = JSON.parse(strJson);
      console.info(`[TabsBarPositionEndWithVerticalFalse] type: ${JSON.stringify(obj.$type)}`);
      console.info("[TabsBarPositionEndWithVerticalFalse] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[TabsBarPositionEndWithVerticalFalse] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[TabsBarPositionEndWithVerticalFalse] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[TabsBarPositionEndWithVerticalFalse] vertical: " + JSON.stringify(obj.$attrs.vertical));
      console.info("[TabsBarPositionEndWithVerticalFalse] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.End");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.vertical).assertEqual("false");
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001 = CommonFunc.getComponentRect('Tabs_barPosition_001');
      let Tabs_barPosition_011 = CommonFunc.getComponentRect('Tabs_barPosition_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barPosition_011.right - 30),
      Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)),
      Math.round(Tabs_barPosition_011.left + 30),
      Math.round(Tabs_barPosition_011.top + ((Tabs_barPosition_011.bottom - Tabs_barPosition_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002 = CommonFunc.getComponentRect('Tabs_barPosition_002');
      let Tabs_barPosition_012 = CommonFunc.getComponentRect('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.right - 30),
      Math.round(Tabs_barPosition_012.top +((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)),
      Math.round(Tabs_barPosition_012.left + 30),
      Math.round(Tabs_barPosition_012.top + ((Tabs_barPosition_012.bottom - Tabs_barPosition_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003 = CommonFunc.getComponentRect('Tabs_barPosition_003');
      let Tabs_barPosition_013 = CommonFunc.getComponentRect('Tabs_barPosition_013');
      let Tabs_barPosition_01 = CommonFunc.getComponentRect('Tabs_barPosition_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barPosition_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barPosition_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
      expect(Tabs_barPosition_011.left).assertEqual(Tabs_barPosition_001.left);
      expect(Tabs_barPosition_012.left).assertEqual(Tabs_barPosition_002.left);
      expect(Tabs_barPosition_013.left).assertEqual(Tabs_barPosition_003.left);
      expect(Tabs_barPosition_011.top).assertEqual(Tabs_barPosition_001.top);
      expect(Tabs_barPosition_012.top).assertEqual(Tabs_barPosition_002.top);
      expect(Tabs_barPosition_013.top).assertEqual(Tabs_barPosition_003.top);

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);
      expect(Tabs_barPosition_011.top).assertEqual(Tabs_barPosition_01.top);
      expect(Tabs_barPosition_012.top).assertEqual(Tabs_barPosition_01.top);
      expect(Tabs_barPosition_013.top).assertEqual(Tabs_barPosition_01.top);

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.left equal Tabs_barPosition_01.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_01.left}`);
      expect(Tabs_barPosition_011.left).assertEqual(Tabs_barPosition_01.left);
      expect(Tabs_barPosition_012.left).assertEqual(Tabs_barPosition_01.left);
      expect(Tabs_barPosition_013.left).assertEqual(Tabs_barPosition_01.left);
      expect(Tabs_barPosition_011.bottom).assertEqual(subGreen.top);
      expect(Tabs_barPosition_012.bottom).assertEqual(subBlue.top);
      expect(Tabs_barPosition_013.bottom).assertEqual(subYellow.top);

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
      expect(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barPosition_011.right - Tabs_barPosition_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - Tabs_barPosition_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - Tabs_barPosition_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_barPosition_001.right - Tabs_barPosition_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_002.right - Tabs_barPosition_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_003.right - Tabs_barPosition_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[TabsBarPositionEndWithVerticalFalse]subGreen.bottom - subGreen.bottom=
        ${Math.round(subGreen.bottom - subGreen.bottom)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[TabsBarPositionEndWithVerticalFalse] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARPOSITION_TEST_0300
     * @tc.name      TabsBarPositionStartWithVerticalTrue
     * @tc.desc      When vertical is set to the default value of true, barPosition is set to barPosition.Start
     */
    it('TabsBarPositionStartWithVerticalTrue', 0, async function (done) {
      console.info('[TabsBarPositionStartWithVerticalTrue] START');
      globalThis.value.message.notify({name:'setBarWidth', value:56});
      globalThis.value.message.notify({name:'setBarHeight', value:300});
      globalThis.value.message.notify({name:'changeVertical', value:true});
      globalThis.value.message.notify({name:'changeBarPosition', value:BarPosition.Start});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');
      let obj = JSON.parse(strJson);
      console.info("[TabsBarPositionStartWithVerticalTrue] type: " + JSON.stringify(obj.$type));
      console.info("[TabsBarPositionStartWithVerticalTrue] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[TabsBarPositionStartWithVerticalTrue] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[TabsBarPositionStartWithVerticalTrue] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[TabsBarPositionStartWithVerticalTrue] vertical: " + JSON.stringify(obj.$attrs.vertical));
      console.info("[TabsBarPositionStartWithVerticalTrue] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.vertical).assertEqual("true");
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001 = CommonFunc.getComponentRect('Tabs_barPosition_001');
      let Tabs_barPosition_011 = CommonFunc.getComponentRect('Tabs_barPosition_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
      Math.round(Tabs_barPosition_011.bottom - 30),
      Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
      Math.round(Tabs_barPosition_011.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002 = CommonFunc.getComponentRect('Tabs_barPosition_002');
      let Tabs_barPosition_012 = CommonFunc.getComponentRect('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
      Math.round(Tabs_barPosition_012.bottom - 30),
      Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
      Math.round(Tabs_barPosition_012.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003 = CommonFunc.getComponentRect('Tabs_barPosition_003');
      let Tabs_barPosition_013 = CommonFunc.getComponentRect('Tabs_barPosition_013');
      let Tabs_barPosition_01 = CommonFunc.getComponentRect('Tabs_barPosition_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barPosition_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barPosition_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
      expect(Tabs_barPosition_011.left).assertEqual(Tabs_barPosition_001.left);
      expect(Tabs_barPosition_012.left).assertEqual(Tabs_barPosition_002.left);
      expect(Tabs_barPosition_013.left).assertEqual(Tabs_barPosition_003.left);
      expect(Tabs_barPosition_011.top).assertEqual(Tabs_barPosition_001.top);
      expect(Tabs_barPosition_012.top).assertEqual(Tabs_barPosition_002.top);
      expect(Tabs_barPosition_013.top).assertEqual(Tabs_barPosition_003.top);

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);
      expect(Tabs_barPosition_011.top).assertEqual(Tabs_barPosition_01.top);
      expect(Tabs_barPosition_012.top).assertEqual(Tabs_barPosition_01.top);
      expect(Tabs_barPosition_013.top).assertEqual(Tabs_barPosition_01.top);

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.left equal subGreen.right=
        ${Tabs_barPosition_011.left} === ${subGreen.right}`);
      expect(Tabs_barPosition_011.left).assertEqual(subGreen.right);
      expect(Tabs_barPosition_012.left).assertEqual(subBlue.right);
      expect(Tabs_barPosition_013.left).assertEqual(subYellow.right);
      expect(Tabs_barPosition_011.top).assertEqual(subGreen.top);
      expect(subBlue.top).assertEqual(subGreen.bottom);
      expect(subYellow.top).assertEqual(subBlue.bottom);

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
      expect(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_011.right - Tabs_barPosition_011.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_012.right - Tabs_barPosition_012.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_013.right - Tabs_barPosition_013.left)).assertEqual(Math.round(vp2px(274)));

      console.info(`[TabsBarPositionStartWithVerticalTrue]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_001.right - Tabs_barPosition_001.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_002.right - Tabs_barPosition_002.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_003.right - Tabs_barPosition_003.left)).assertEqual(Math.round(vp2px(274)));

      console.info(`[TabsBarPositionStartWithVerticalTrue]subGreen.right - subGreen.left=
        ${Math.round(subGreen.right - subGreen.left)}`);
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(100)));
      console.info('[TabsBarPositionStartWithVerticalTrue] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_BARPOSITION_TEST_0400
     * @tc.name      TabsBarPositionEndWithVerticalTrue
     * @tc.desc      When vertical takes the default value of true, barPosition is set to barPosition.End
     */
    it('TabsBarPositionEndWithVerticalTrue', 0, async function (done) {
      console.info('[TabsBarPositionEndWithVerticalTrue] START');
      globalThis.value.message.notify({name:'setBarWidth', value:56});
      globalThis.value.message.notify({name:'setBarHeight', value:300});
      globalThis.value.message.notify({name:'changeVertical', value:true});
      globalThis.value.message.notify({name:'changeBarPosition', value:BarPosition.End});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_barPosition_01');
      let obj = JSON.parse(strJson);
      console.info("[TabsBarPositionEndWithVerticalTrue] type: " + JSON.stringify(obj.$type));
      console.info("[TabsBarPositionEndWithVerticalTrue] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[TabsBarPositionEndWithVerticalTrue] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[TabsBarPositionEndWithVerticalTrue] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[TabsBarPositionEndWithVerticalTrue] vertical: " + JSON.stringify(obj.$attrs.vertical));
      console.info("[TabsBarPositionEndWithVerticalTrue] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.End");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.vertical).assertEqual("true");
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_barPosition_001 = CommonFunc.getComponentRect('Tabs_barPosition_001');
      let Tabs_barPosition_011 = CommonFunc.getComponentRect('Tabs_barPosition_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
      Math.round(Tabs_barPosition_011.bottom - 30),
      Math.round(Tabs_barPosition_011.left + ((Tabs_barPosition_011.right - Tabs_barPosition_011.left) / 2)),
      Math.round(Tabs_barPosition_011.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_002 = CommonFunc.getComponentRect('Tabs_barPosition_002');
      let Tabs_barPosition_012 = CommonFunc.getComponentRect('Tabs_barPosition_012');
      await driver.swipe(Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
      Math.round(Tabs_barPosition_012.bottom - 30),
      Math.round(Tabs_barPosition_012.left + ((Tabs_barPosition_012.right - Tabs_barPosition_012.left) / 2)),
      Math.round(Tabs_barPosition_012.top + 30));
      await CommonFunc.sleep(1000);
      let Tabs_barPosition_003 = CommonFunc.getComponentRect('Tabs_barPosition_003');
      let Tabs_barPosition_013 = CommonFunc.getComponentRect('Tabs_barPosition_013');
      let Tabs_barPosition_01 = CommonFunc.getComponentRect('Tabs_barPosition_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_barPosition_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_barPosition_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_barPosition_yellow');

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.left equal Tabs_barPosition_001.left
        ${Tabs_barPosition_011.left} === ${Tabs_barPosition_001.left}`);
      expect(Tabs_barPosition_011.left).assertEqual(Tabs_barPosition_001.left);
      expect(Tabs_barPosition_012.left).assertEqual(Tabs_barPosition_002.left);
      expect(Tabs_barPosition_013.left).assertEqual(Tabs_barPosition_003.left);
      expect(Tabs_barPosition_011.top).assertEqual(Tabs_barPosition_001.top);
      expect(Tabs_barPosition_012.top).assertEqual(Tabs_barPosition_002.top);
      expect(Tabs_barPosition_013.top).assertEqual(Tabs_barPosition_003.top);

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.top equal Tabs_barPosition_01.top
        ${Tabs_barPosition_011.top} === ${Tabs_barPosition_01.top}`);
      expect(Tabs_barPosition_011.top).assertEqual(Tabs_barPosition_01.top);
      expect(Tabs_barPosition_012.top).assertEqual(Tabs_barPosition_01.top);
      expect(Tabs_barPosition_013.top).assertEqual(Tabs_barPosition_01.top);

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.right equal subGreen.left
        ${Tabs_barPosition_011.right} === ${subGreen.left}`);
      expect(Math.abs(Tabs_barPosition_011.right - subGreen.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_012.right - subBlue.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_barPosition_013.right - subYellow.left) <= 1).assertTrue();
      expect(Tabs_barPosition_01.top).assertEqual(subGreen.top);
      expect(subBlue.top).assertEqual(subGreen.bottom);
      expect(subYellow.top).assertEqual(subBlue.bottom);

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_011.bottom - Tabs_barPosition_011.top=
        ${Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)}`);
      expect(Math.round(Tabs_barPosition_011.bottom - Tabs_barPosition_011.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_012.bottom - Tabs_barPosition_012.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_013.bottom - Tabs_barPosition_013.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_011.right - Tabs_barPosition_011.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_012.right - Tabs_barPosition_012.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_013.right - Tabs_barPosition_013.left)).assertEqual(Math.round(vp2px(274)));

      console.info(`[TabsBarPositionEndWithVerticalTrue]Tabs_barPosition_001.bottom - Tabs_barPosition_001.top=
        ${Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)}`);
      expect(Math.round(Tabs_barPosition_001.bottom - Tabs_barPosition_001.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_002.bottom - Tabs_barPosition_002.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_003.bottom - Tabs_barPosition_003.top)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Tabs_barPosition_001.right - Tabs_barPosition_001.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_002.right - Tabs_barPosition_002.left)).assertEqual(Math.round(vp2px(274)));
      expect(Math.round(Tabs_barPosition_003.right - Tabs_barPosition_003.left)).assertEqual(Math.round(vp2px(274)));

      console.info(`[TabsBarPositionEndWithVerticalTrue]subGreen.right - subGreen.left=
        ${Math.round(subGreen.right - subGreen.left)}`);
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(100)));
      console.info('[TabsBarPositionEndWithVerticalTrue] END');
      done();
    });
  })
}
