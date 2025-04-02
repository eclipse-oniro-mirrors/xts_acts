/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import GlobalContext from '../../MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function GridJsunit() {
  describe('GridJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("GridJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridJsunit state pages: " + JSON.stringify(pages));
        if (!("GridPage" == pages.name)) {
          console.info("get GridJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number GridJsunit_0100
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0100', 0, async (done: Function) => {
      // Get the information of the Grid component
      console.info('[GridJsunit_0100] START');
      let strJson1 = getInspectorByKey('grid1');
      let obj: ESObject = JSON.parse(strJson1);
      console.info("[GridJsunit_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.columnsGap).assertEqual('10.00vp');
      expect(obj.$attrs.rowsGap).assertEqual('10.00vp');
      expect(obj.$attrs.cachedCount).assertEqual(1);
      expect(obj.$attrs.multiSelectable).assertEqual('false');
      expect(obj.$attrs.supportAnimation).assertEqual('false');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('grid2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[GridJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.scrollBar).assertEqual('BarState.Off');
      expect(obj2.$attrs.scrollBarColor).assertEqual('#FF808080');
      expect(obj2.$attrs.scrollBarWidth).assertEqual('20.00vp');
      console.info('[GridJsunit_0100] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0200
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0200', 0, async (done: Function) => {
      // Modify the properties of component Grid
      console.info('[GridJsunit_0200] START');
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'columnsGap', value: 15
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'rowsGap', value: 20
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<BarState>('value').message.notify({
        name: 'scrollBar', value: BarState.On
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'scrollBarColor', value: 'Color.Blue'
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'scrollBarWidth', value: 30
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'cachedCount', value: 2
      })
      await CommonFunc.sleep(2000);

      // Get the propoties value of the Grid component
      let strJson = getInspectorByKey('grid1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.columnsGap).assertEqual('15.00vp');
      expect(obj.$attrs.rowsGap).assertEqual('20.00vp');
      expect(obj.$attrs.cachedCount).assertEqual(2);
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('grid2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[GridJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.scrollBarColor).assertEqual(obj.$attrs.scrollBarColor);
      expect(obj2.$attrs.scrollBarWidth).assertEqual('30.00vp');
      console.info('[GridJsunit_0200] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0300
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0300', 0, async (done: Function) => {
      // Illegal modification of properties of component grid
      console.info('[GridJsunit_0300] START');
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'columnsGap', value: 'a'
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'rowsGap', value: -10
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'scrollBar', value: '123'
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'scrollBarColor', value: 'aaa'
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'scrollBarWidth', value: -10
      })
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'cachedCount', value: 'a'
      })
      await CommonFunc.sleep(200);

      // Get the propoties value of the Grid component
      let strJson = getInspectorByKey('grid1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.columnsGap).assertEqual('0.00vp');
      expect(obj.$attrs.rowsGap).assertEqual('0.00vp');
      expect(obj.$attrs.cachedCount).assertEqual(1);
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('grid2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[GridJsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.scrollBar).assertEqual('BarState.Auto');
      expect(obj2.$attrs.scrollBarColor).assertEqual(obj.$attrs.scrollBarColor);
      expect(obj2.$attrs.scrollBarWidth).assertEqual('4.00vp');
      console.info('[GridJsunit_0300] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0400
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0400', 0, async (done: Function) => {
      // Verify the event of the Grid component
      console.info('[GridJsunit_0400] START');
      await CommonFunc.sleep(1000);

      // Verify onScrollIndex event
      let grid2 = CommonFunc.getComponentRect('grid2');
      let top = grid2.top
      let bottom = grid2.bottom
      let left = grid2.left
      let right = grid2.right
      let driver = await UiDriver.create()
      await driver.swipe(Math.round((right - left) / 2), Math.round(bottom - 10), Math.round((right - left) / 2), Math.round(top + 10));
      await driver.swipe(Math.round((right - left) / 2), Math.round(bottom - 10), Math.round((right - left) / 2), Math.round(top + 10));
      let onScrollIndex1 = await driver.findComponent(BY.key('onScrollIndex'));
      let text1 = await onScrollIndex1.getText();
      expect(text1).assertEqual('onScrollIndex:2');
      await CommonFunc.sleep(1000);

      await driver.swipe(Math.round((right - left) / 2), Math.round(bottom - 10), Math.round((right - left) / 2), Math.round(top + 10));
      await driver.swipe(Math.round((right - left) / 2), Math.round(bottom - 10), Math.round((right - left) / 2), Math.round(top + 10));
      let onScrollIndex2 = await driver.findComponent(BY.key('onScrollIndex'));
      let text2 = await onScrollIndex2.getText();
      expect(text2).assertEqual('onScrollIndex:2');

      // Verify common attribute click event
      let button = await driver.findComponent(BY.key('button'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('button');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GridJsunit_0400] component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.label).assertEqual('clicked');
      console.info('[GridJsunit_0400] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0500
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0500', 0, async (done: Function) => {
      // Get the default attribute value of the Grid component
      console.info('[GridJsunit_0500] START');
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('grid_default');
      let obj: ESObject = JSON.parse(strJson1);
      console.info("[GridJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[GridJsunit_0500] columnsGap: " + JSON.stringify(obj.$attrs.columnsGap));
      console.info("[GridJsunit_0500] rowsGap: " + JSON.stringify(obj.$attrs.rowsGap));
      console.info("[GridJsunit_0500] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[GridJsunit_0500] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[GridJsunit_0500] supportAnimation: " + JSON.stringify(obj.$attrs.supportAnimation));
      expect(obj.$attrs.columnsGap).assertEqual('0.00vp');
      expect(obj.$attrs.rowsGap).assertEqual('0.00vp');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      expect(obj.$attrs.cachedCount).assertEqual(1);
      expect(obj.$attrs.supportAnimation).assertEqual('false');
      console.info('[GridJsunit_0500] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0600
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0600', 0, async (done: Function) => {
      // Verify that rowsTemplate and columnsTemplate are set at the same time
      console.info('[GridJsunit_0600] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'columnsTemplate', value: '1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'rowsTemplate', value: '1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      let gridItem1 = CommonFunc.getComponentRect('0');
      let bottom = gridItem1.bottom
      let gridItem2 = CommonFunc.getComponentRect('2');
      let top = gridItem2.top
      expect(top > bottom).assertTrue();

      // Verify grid componentcan cannot scroll
      let driver = await UiDriver.create()
      let grid_1 = await driver.findComponent(BY.key('grid1'));
      let result = await grid_1.isScrollable()
      expect(result).assertFalse();
      console.info('[GridJsunit_0600] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0700
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0700', 0, async (done: Function) => {
      // Verify only setting columnsTemplate of Grid component
      console.info('[GridJsunit_0700] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'columnsTemplate', value: '1fr 1fr 1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'rowsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      let gridItem1 = CommonFunc.getComponentRect('0');
      let left1 = gridItem1.left
      let gridItem2 = CommonFunc.getComponentRect('4');
      let left2 = gridItem2.left
      expect(left1).assertEqual(left2);
      console.info('[GridJsunit_0700] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0800
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0800', 0, async (done: Function) => {
      // Verify only setting rowsTemplate of grid component
      console.info('[GridJsunit_0800] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'columnsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'rowsTemplate', value: '1fr 1fr 1fr 1fr'
      })
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      let gridItem1 = CommonFunc.getComponentRect('0');
      let left1 = gridItem1.left
      let gridItem2 = CommonFunc.getComponentRect('1');
      let left2 = gridItem2.left
      expect(Math.round(left1)).assertEqual(Math.round(left2));
      console.info('[GridJsunit_0800] END');
      done();
    });

    /**
     * @tc.number GridJsunit_0900
     * @tc.name testGridProperties
     * @tc.desc testGridProperties
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('GridJsunit_0900', 0, async (done: Function) => {
      // Verify Neither rowsTemplate nor columnsTemplate is set
      console.info('[GridJsunit_0900] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'columnsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'rowsTemplate', value: ''
      })
      await CommonFunc.sleep(1000);
      // Verify grid componentcan cannot scroll
      let driver = await UiDriver.create()
      let grid_1 = await driver.findComponent(BY.key('grid1'));
      let result = await grid_1.isScrollable()
      expect(result).assertFalse();
      console.info('[GridJsunit_0900] END');
      done();
    });
  })
}
