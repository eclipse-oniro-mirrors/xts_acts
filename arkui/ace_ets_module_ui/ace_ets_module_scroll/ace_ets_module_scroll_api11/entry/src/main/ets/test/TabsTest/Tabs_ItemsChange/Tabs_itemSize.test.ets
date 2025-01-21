/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function Tabs_itemSize() {
  describe('Tabs_itemSize', () => {
    beforeEach(async (done: Function) => {
      console.info("Tabs_itemSize beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/Tabs_ItemsChange/Tabs_itemSize",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Tabs_itemSize state pages:" + JSON.stringify(pages));
        if (!("Tabs_itemSize" == pages.name)) {
          console.info("get Tabs_itemSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Tabs_itemSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Tabs_itemSize page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Tabs_itemSize beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Tabs_itemSize after each called")
      globalThis.value.message.notify({
        name: 'currentIndex', value: 0
      });
    });
    /**
     * @tc.number SUB_ACE_TABS_ITEMSIZE_TEST_0100
     * @tc.name testTabsItemSize
     * @tc.desc Set width to 200 and height to 200 for TabContent
     */
    it('testTabsItemSize', 0, async (done: Function) => {
      console.info('[testTabsItemSize] START');
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Tabs_itemSize_01');

      console.info(`[testTabsItemSize] type: ${JSON.stringify(JSON.parse(strJson).$type)}`);
      console.info("[testTabsItemSize] barPosition: " + JSON.stringify(JSON.parse(strJson).$attrs.barPosition));
      console.info("[testTabsItemSize] index: " + JSON.stringify(JSON.parse(strJson).$attrs.index));
      console.info("[testTabsItemSize] scrollable: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollable));
      console.info("[testTabsItemSize] barMode: " + JSON.stringify(JSON.parse(strJson).$attrs.barMode));
      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      expect(JSON.parse(strJson).$attrs.index).assertEqual("0");
      expect(JSON.parse(strJson).$attrs.scrollable).assertEqual(true);
      expect(JSON.parse(strJson).$attrs.barMode).assertEqual('BarMode.Fixed');
      let Tabs_itemSize_001: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_001');
      let Tabs_itemSize_011: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_011');
      let driver = Driver.create();
      await driver.swipe(Math.round(Tabs_itemSize_011.right - 30),
        Math.round(Tabs_itemSize_011.top + ((Tabs_itemSize_011.bottom - Tabs_itemSize_011.top) / 2)),
        Math.round(Tabs_itemSize_011.left + 30),
        Math.round(Tabs_itemSize_011.top + ((Tabs_itemSize_011.bottom - Tabs_itemSize_011.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemSize_002: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_002');
      let Tabs_itemSize_012: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_012');
      await driver.swipe(Math.round(Tabs_itemSize_012.right - 30),
        Math.round(Tabs_itemSize_012.top + ((Tabs_itemSize_012.bottom - Tabs_itemSize_012.top) / 2)),
        Math.round(Tabs_itemSize_012.left + 30),
        Math.round(Tabs_itemSize_012.top + ((Tabs_itemSize_012.bottom - Tabs_itemSize_012.top) / 2)));
      await CommonFunc.sleep(1000);
      let Tabs_itemSize_003: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_003');
      let Tabs_itemSize_013: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_013');
      let Tabs_itemSize_01: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_01');
      let subGreen: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_green');
      let subBlue: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_blue');
      let subYellow: RectValue = CommonFunc.getComponentRectOnScreen('Tabs_itemSize_yellow');

      console.info(`[testTabsItemSize]Tabs_itemSize_011.left equal Tabs_itemSize_001.left=
        ${Tabs_itemSize_011.left} === ${Tabs_itemSize_001.left}`);
      expect(Math.abs(Tabs_itemSize_011.left - Tabs_itemSize_001.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.left - Tabs_itemSize_002.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.left - Tabs_itemSize_003.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_011.top - Tabs_itemSize_001.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.top - Tabs_itemSize_002.top) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.top - Tabs_itemSize_003.top) <= 1).assertTrue();

      console.info(`[testTabsItemSize]Tabs_itemSize_011.left equal Tabs_itemSize_01.left=
        ${Tabs_itemSize_011.left} === ${Tabs_itemSize_01.left}`);
      expect(Math.abs(Tabs_itemSize_011.left - Tabs_itemSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.left - Tabs_itemSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.left - Tabs_itemSize_01.left) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_011.top - subGreen.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.top - subBlue.bottom) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.top - subYellow.bottom) <= 1).assertTrue();

      console.info(`[testTabsItemSize]Tabs_itemSize_011.bottom - Tabs_itemSize_011.top=
        ${Math.round(Tabs_itemSize_011.bottom - Tabs_itemSize_011.top)}`);
      
      expect(Math.abs(Math.round(Tabs_itemSize_011.bottom - Tabs_itemSize_011.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_012.bottom - Tabs_itemSize_012.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_013.bottom - Tabs_itemSize_013.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Tabs_itemSize_011.right - Tabs_itemSize_011.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_012.right - Tabs_itemSize_012.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_013.right - Tabs_itemSize_013.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemSize]Tabs_itemSize_001.bottom - Tabs_itemSize_001.top=
        ${Math.round(Tabs_itemSize_001.bottom - Tabs_itemSize_001.top)}`);
     
      expect(Math.abs(Math.round(Tabs_itemSize_001.bottom - Tabs_itemSize_001.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_002.bottom - Tabs_itemSize_002.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Math.round(Tabs_itemSize_003.bottom - Tabs_itemSize_003.top)-Math.round(vp2px(244)))<=1).assertTrue();
      expect(Math.abs(Tabs_itemSize_001.right - Tabs_itemSize_001.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_002.right - Tabs_itemSize_002.left - vp2px(330)) <= 1).assertTrue();
      expect(Math.abs(Tabs_itemSize_003.right - Tabs_itemSize_003.left - vp2px(330)) <= 1).assertTrue();

      console.info(`[testTabsItemSize]subGreen.bottom - subGreen.top = ${Math.round(subGreen.bottom - subGreen.top)}`);
  
      expect(Math.abs(Math.round(subGreen.bottom - subGreen.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.bottom - subBlue.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.bottom - subYellow.top)-Math.round(vp2px(56)))<=1).assertTrue();
      expect(Math.abs(Math.round(subGreen.right - subGreen.left)-Math.round(vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subBlue.right - subBlue.left)-Math.round(vp2px(110)))<=1).assertTrue();
      expect(Math.abs(Math.round(subYellow.right - subYellow.left)-Math.round(vp2px(110)))<=1).assertTrue();

      console.info('[testTabsItemSize] END');
      done();
    });
  })
}
