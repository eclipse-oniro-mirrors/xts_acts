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
export default function Tabs_itemPadMar() {
  describe('Tabs_itemPadMar', function () {
    beforeEach(async function (done) {
      console.info("Tabs_itemPadMar beforeEach start");
      let options = {
        url: "MainAbility/pages/Tabs/Tabs_ItemsChange/Tabs_itemPadMar",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_itemPadMar state pages:" + JSON.stringify(pages));
        if (!("Tabs_itemPadMar" == pages.name)) {
          console.info("get Tabs_itemPadMar pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_itemPadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_itemPadMar page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_itemPadMar beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Tabs_itemPadMar after each called")
      globalThis.value.message.notify({name:'currentIndex', value:0});
    });
    /**
     * @tc.number    SUB_ACE_TABS_ITEMPADMAR_TEST_0100
     * @tc.name      testTabsItemPad
     * @tc.desc      Set 20 padding for TabContent
     */
    it('testTabsItemPad', 0, async function (done) {
      console.info('[testTabsItemPad] START');
      globalThis.value.message.notify({name:'dadPadding', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_itemPadMar_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsItemPad] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsItemPad] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsItemPad] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsItemPad] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsItemPad] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001 = CommonFunc.getComponentRect('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011 = CommonFunc.getComponentRect('Tabs_itemPadMar_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_itemPadMar_011.right - 30),
      Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)),
      Math.round(Tabs_itemPadMar_011.left + 30),
      Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002 = CommonFunc.getComponentRect('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012 = CommonFunc.getComponentRect('Tabs_itemPadMar_012');
      await driver.swipe(Math.round(Tabs_itemPadMar_012.right - 30),
      Math.round(Tabs_itemPadMar_012.top +((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)),
      Math.round(Tabs_itemPadMar_012.left + 30),
      Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003 = CommonFunc.getComponentRect('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013 = CommonFunc.getComponentRect('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01 = CommonFunc.getComponentRect('Tabs_itemPadMar_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_itemPadMar_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_itemPadMar_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemPad] Tabs_itemPadMar_011.left equal Tabs_itemPadMar_01.left=
        ${ Tabs_itemPadMar_011.left } === ${ Tabs_itemPadMar_01.left }`);
      expect(Tabs_itemPadMar_011.left).assertEqual(Tabs_itemPadMar_01.left);
      expect(Tabs_itemPadMar_011.top).assertEqual(subGreen.bottom);
      expect(Tabs_itemPadMar_012.left).assertEqual(Tabs_itemPadMar_01.left);
      expect(Tabs_itemPadMar_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_itemPadMar_013.left).assertEqual(Tabs_itemPadMar_01.left);
      expect(Tabs_itemPadMar_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsItemPad] Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left=
        ${Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)}`);
      expect(Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top)).assertEqual(Math.round(vp2px(20)));
      expect(Tabs_itemPadMar_002.left).assertEqual(Tabs_itemPadMar_012.left);
      expect(Tabs_itemPadMar_002.top).assertEqual(Tabs_itemPadMar_012.top);
      expect(Tabs_itemPadMar_003.left).assertEqual(Tabs_itemPadMar_013.left);
      expect(Tabs_itemPadMar_003.top).assertEqual(Tabs_itemPadMar_013.top);

      console.info(`[testTabsItemPad] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);
      expect(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.abs(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPad] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);
      expect(Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)).assertEqual(Math.round(vp2px(204)));
      expect(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left)).assertEqual(Math.round(vp2px(290)));
      expect(Math.round(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left)).assertEqual(Math.round(vp2px(330)));
      expect(Math.round(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left)).assertEqual(Math.round(vp2px(330)));

      console.info(`[testTabsItemPad] subGreen.bottom - subGreen.top=${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsItemPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_ITEMPADMAR_TEST_0200
     * @tc.name      testTabsItemMar
     * @tc.desc      Set 20 margin for TabContent
     */
    it('testTabsItemMar', 0, async function (done) {
      console.info('[testTabsItemMar] START');
      globalThis.value.message.notify({name:'dadPadding', value:0});
      globalThis.value.message.notify({name:'dadMargin', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_itemPadMar_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsItemMar] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsItemMar] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsItemMar] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsItemMar] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsItemMar] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001 = CommonFunc.getComponentRect('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011 = CommonFunc.getComponentRect('Tabs_itemPadMar_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_itemPadMar_011.right - 30),
      Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)),
      Math.round(Tabs_itemPadMar_011.left + 30),
      Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002 = CommonFunc.getComponentRect('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012 = CommonFunc.getComponentRect('Tabs_itemPadMar_012');
      await driver.swipe(Math.round(Tabs_itemPadMar_012.right - 30),
      Math.round(Tabs_itemPadMar_012.top +((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)),
      Math.round(Tabs_itemPadMar_012.left + 30),
      Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003 = CommonFunc.getComponentRect('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013 = CommonFunc.getComponentRect('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01 = CommonFunc.getComponentRect('Tabs_itemPadMar_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_itemPadMar_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_itemPadMar_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemMar] Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left=
        ${Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)}`);
      expect(Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(Tabs_itemPadMar_011.top - subGreen.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Tabs_itemPadMar_012.left).assertEqual(Tabs_itemPadMar_01.left);
      expect(Tabs_itemPadMar_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_itemPadMar_013.left).assertEqual(Tabs_itemPadMar_01.left);
      expect(Tabs_itemPadMar_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsItemMar] Tabs_itemPadMar_001.left equal Tabs_itemPadMar_011.left=
        ${Tabs_itemPadMar_001.left } === ${ Tabs_itemPadMar_011.left}`);
      expect(Tabs_itemPadMar_001.left).assertEqual(Tabs_itemPadMar_011.left);
      expect(Tabs_itemPadMar_001.top).assertEqual(Tabs_itemPadMar_011.top);
      expect(Tabs_itemPadMar_002.left).assertEqual(Tabs_itemPadMar_012.left);
      expect(Tabs_itemPadMar_002.top).assertEqual(Tabs_itemPadMar_012.top);
      expect(Tabs_itemPadMar_003.left).assertEqual(Tabs_itemPadMar_013.left);
      expect(Tabs_itemPadMar_003.top).assertEqual(Tabs_itemPadMar_013.top);

      console.info(`[testTabsItemMar] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);
      expect(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)).assertEqual(Math.round(vp2px(204)));
      expect(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left)).assertEqual(Math.round(vp2px(290)));
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemMar] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);
      expect(Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)).assertEqual(Math.round(vp2px(204)));
      expect(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left)).assertEqual(Math.round(vp2px(290)));
      expect(Math.abs(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemMar] subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsItemMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_TABS_ITEMPADMAR_TEST_0300
     * @tc.name      testTabsItemPadMar
     * @tc.desc      Set 20 padding and 20 margin for TabContent
     */
    it('testTabsItemPadMar', 0, async function (done) {
      console.info('[testTabsItemPadMar] START');
      globalThis.value.message.notify({name:'dadPadding', value:20});
      globalThis.value.message.notify({name:'dadMargin', value:20});
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_itemPadMar_01');
      let obj = JSON.parse(strJson);
      console.info(`[testTabsItemPadMar] type: ${JSON.stringify(obj.$type)}`);
      console.info("[testTabsItemPadMar] barPosition: " + JSON.stringify(obj.$attrs.barPosition));
      console.info("[testTabsItemPadMar] index: " + JSON.stringify(obj.$attrs.index));
      console.info("[testTabsItemPadMar] scrollable: " + JSON.stringify(obj.$attrs.scrollable));
      console.info("[testTabsItemPadMar] barMode: " + JSON.stringify(obj.$attrs.barMode));
      expect(obj.$type).assertEqual('Tabs');
      expect(obj.$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(obj.$attrs.index).assertEqual("0");
      expect(obj.$attrs.scrollable).assertEqual(true);
      expect(obj.$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_itemPadMar_001 = CommonFunc.getComponentRect('Tabs_itemPadMar_001');
      let Tabs_itemPadMar_011 = CommonFunc.getComponentRect('Tabs_itemPadMar_011');
      let driver = await Driver.create();
      await driver.swipe(Math.round(Tabs_itemPadMar_011.right - 30),
      Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)),
      Math.round(Tabs_itemPadMar_011.left + 30),
      Math.round(Tabs_itemPadMar_011.top + ((Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_002 = CommonFunc.getComponentRect('Tabs_itemPadMar_002');
      let Tabs_itemPadMar_012 = CommonFunc.getComponentRect('Tabs_itemPadMar_012');
      await driver.swipe(Math.round(Tabs_itemPadMar_012.right - 30),
      Math.round(Tabs_itemPadMar_012.top +((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)),
      Math.round(Tabs_itemPadMar_012.left + 30),
      Math.round(Tabs_itemPadMar_012.top + ((Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemPadMar_003 = CommonFunc.getComponentRect('Tabs_itemPadMar_003');
      let Tabs_itemPadMar_013 = CommonFunc.getComponentRect('Tabs_itemPadMar_013');
      let Tabs_itemPadMar_01 = CommonFunc.getComponentRect('Tabs_itemPadMar_01');
      let subGreen = CommonFunc.getComponentRect('Tabs_itemPadMar_green');
      let subBlue = CommonFunc.getComponentRect('Tabs_itemPadMar_blue');
      let subYellow = CommonFunc.getComponentRect('Tabs_itemPadMar_yellow');

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left=
        ${Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)}`);
      expect(Math.round(Tabs_itemPadMar_011.left - Tabs_itemPadMar_01.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(Tabs_itemPadMar_011.top - subGreen.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Tabs_itemPadMar_012.left).assertEqual(Tabs_itemPadMar_01.left);
      expect(Tabs_itemPadMar_012.top).assertEqual(subBlue.bottom);
      expect(Tabs_itemPadMar_013.left).assertEqual(Tabs_itemPadMar_01.left);
      expect(Tabs_itemPadMar_013.top).assertEqual(subYellow.bottom);

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left=
        ${Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)}`);
      expect(Math.round(Tabs_itemPadMar_001.left - Tabs_itemPadMar_011.left)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(Tabs_itemPadMar_001.top - Tabs_itemPadMar_011.top)).assertEqual(Math.round(vp2px(20)));
      expect(Tabs_itemPadMar_002.left).assertEqual(Tabs_itemPadMar_012.left);
      expect(Tabs_itemPadMar_002.top).assertEqual(Tabs_itemPadMar_012.top);
      expect(Tabs_itemPadMar_003.left).assertEqual(Tabs_itemPadMar_013.left);
      expect(Tabs_itemPadMar_003.top).assertEqual(Tabs_itemPadMar_013.top);

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top=
        ${Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)}`);
      expect(Math.round(Tabs_itemPadMar_011.bottom - Tabs_itemPadMar_011.top)).assertEqual(Math.round(vp2px(204)));
      expect(Math.round(Tabs_itemPadMar_012.bottom - Tabs_itemPadMar_012.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_013.bottom - Tabs_itemPadMar_013.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_011.right - Tabs_itemPadMar_011.left)).assertEqual(Math.round(vp2px(290)));
      expect(Math.abs(Tabs_itemPadMar_012.right - Tabs_itemPadMar_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_013.right - Tabs_itemPadMar_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar] Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top=
        ${Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)}`);
      expect(Math.round(Tabs_itemPadMar_001.bottom - Tabs_itemPadMar_001.top)).assertEqual(Math.round(vp2px(164)));
      expect(Math.round(Tabs_itemPadMar_002.bottom - Tabs_itemPadMar_002.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_003.bottom - Tabs_itemPadMar_003.top)).assertEqual(Math.round(vp2px(244)));
      expect(Math.round(Tabs_itemPadMar_001.right - Tabs_itemPadMar_001.left)).assertEqual(Math.round(vp2px(250)));
      expect(Math.abs(Tabs_itemPadMar_002.right - Tabs_itemPadMar_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemPadMar_003.right - Tabs_itemPadMar_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemPadMar] subGreen.bottom - subGreen.top=
        ${Math.round(subGreen.bottom - subGreen.top)}`);
      expect(Math.round(subGreen.bottom - subGreen.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subBlue.bottom - subBlue.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subYellow.bottom - subYellow.top)).assertEqual(Math.round(vp2px(56)));
      expect(Math.round(subGreen.right - subGreen.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subBlue.right - subBlue.left)).assertEqual(Math.round(vp2px(110)));
      expect(Math.round(subYellow.right - subYellow.left)).assertEqual(Math.round(vp2px(110)));
      console.info('[testTabsItemPadMar] END');
      done();
    });
  })
}
