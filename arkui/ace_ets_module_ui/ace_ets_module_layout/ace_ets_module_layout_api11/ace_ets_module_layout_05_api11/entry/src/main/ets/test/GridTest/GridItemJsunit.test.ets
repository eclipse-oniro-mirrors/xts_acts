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


export default function GridItemJsunit() {
  describe('GridItemJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("GridItemJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridItemPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridItemJsunit state pages: " + JSON.stringify(pages));
        if (!("GridItemPage" == pages.name)) {
          console.info("get GridItemJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridItemJsunit success: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridItemJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_001
     * @tc.name       Test GridItemJsunit_0100
     * @tc.desc       Test Get GridItem attribute
     */
    it('GridItemJsunit_0100', 0, async (done: Function) => {
      // Get the information of the GridItem component
      console.info('[GridItemJsunit_0100] START');
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('gridItem1');
      let obj: ESObject = JSON.parse(strJson1);
      console.info("[GridItemJsunit_0100] component obj is: " + JSON.stringify(obj));
      //expect(obj.$attrs.rowStart).assertEqual('1');
      //expect(obj.$attrs.rowEnd).assertEqual('4');
      expect(obj.$attrs.selectable).assertEqual('false');
      // Verify the default value of forceRebuild
      expect(obj.$attrs.forceRebuild).assertEqual('false');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('gridItem2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[GridItemJsunit_0100] component obj2 is: " + JSON.stringify(obj2));
      //expect(obj2.$attrs.columnStart).assertEqual('1');
      //expect(obj2.$attrs.columnEnd).assertEqual('5');
      expect(obj2.$attrs.forceRebuild).assertEqual('true');
      // Verify the default value of selectable
      expect(obj2.$attrs.selectable).assertEqual('true');
      console.info('[GridItemJsunit_0100] END');
      done();
    });

    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       Test GridItemJsunit_0200
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_0200', 0, async (done: Function) => {
      // Modify the properties of component GridItem
      console.info('[GridItemJsunit_0200] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowStart',value:'2'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowEnd',value:'5'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'columnStart',value:'2'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'columnEnd',value:'4'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'forceRebuild',value:'false'})
      await CommonFunc.sleep(2000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'selectable',value:'true'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the GridItem component
      let strJson = getInspectorByKey('gridItem1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridItemJsunit_0200] component obj is: " + JSON.stringify(obj));
      //expect(obj.$attrs.rowStart).assertEqual('2');
      //expect(obj.$attrs.rowEnd).assertEqual('5');
      expect(obj.$attrs.selectable).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('gridItem2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[GridItemJsunit_0200] component obj2 is: " + JSON.stringify(obj2));
      //expect(obj2.$attrs.columnStart).assertEqual('2');
      //expect(obj2.$attrs.columnEnd).assertEqual('4');
      expect(obj2.$attrs.forceRebuild).assertEqual('false');
      console.info('[GridItemJsunit_0200] END');
      done();
    });

    it('GridItemJsunit_0300', 0, async (done: Function) => {
      // Illegal modification of properties of component gridItem
      console.info('[GridItemJsunit_0300] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowStart',value:'test'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowEnd',value:'#'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'columnStart',value:'-10'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'columnEnd',value:'%a'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'forceRebuild',value:'0'})
      await CommonFunc.sleep(200);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'selectable',value:'test'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the GridItem component
      let strJson = getInspectorByKey('gridItem1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridItemJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(Math.abs(Number(obj.$attrs.rowStart)) <= 1).assertTrue();
      expect(Math.abs(Number(obj.$attrs.rowEnd)) <= 1).assertTrue();
      expect(obj.$attrs.selectable).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('gridItem2');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[GridItemJsunit_0300] component obj2 is: " + JSON.stringify(obj2));
      expect(Math.abs(Number(obj.$attrs.columnStart)) <= 1).assertTrue();
      expect(Math.abs(Number(obj.$attrs.columnEnd)) <= 1).assertTrue();
      expect(obj2.$attrs.forceRebuild).assertEqual('false');
      console.info('[GridItemJsunit_0300] END');
      done();
    });

    it('GridItemJsunit_0400', 0, async (done: Function) => {
      // Verify the function of onSelect of GridItem component 
      console.info('[GridItemJsunit_0400] START');
      let grid1 = CommonFunc.getComponentRect('grid1');
      let left_x = Math.round(grid1.left)
      let bottom_y = Math.round(grid1.bottom / 2)
      let driver = await UiDriver.create()
      await driver.swipe(Math.round(globalThis.winLeft + left_x + vp2px(100)), bottom_y, Math.round(globalThis.winLeft + left_x + vp2px(120)), bottom_y);
      await CommonFunc.sleep(500);
      let textComponent = await driver.findComponent(BY.key('onSelect'));
      let text = await textComponent.getText();
      await CommonFunc.sleep(500);
      expect(text).assertEqual('a');
      console.info('[GridItemJsunit_0400] END');
      done();
    });

    it('GridItemJsunit_0500', 0, async (done: Function) => {
      // Verify the columnsTemplate of Grid component
      console.info('[GridItemJsunit_0500] START');
      let gridItem1 = CommonFunc.getComponentRect('0');
      let right1 = gridItem1.right;
      await CommonFunc.sleep(1000);
      let gridItem3 = CommonFunc.getComponentRect('1');
      let left3 = gridItem3.left;
      expect(Math.abs(Math.ceil(left3 - right1) - Math.ceil(vp2px(4))) <= 1).assertTrue();
      console.info('[GridItemJsunit_0500] END');
      done();
    });

    it('GridItemJsunit_0600', 0, async (done: Function) => {
      // Verify the rowsTemplate of Grid component 
      console.info('[GridItemJsunit_0600] START');
      await CommonFunc.sleep(1000);
      let gridItem1 = CommonFunc.getComponentRect('0');
      let bottom1 = gridItem1.bottom;
      let gridItem3 = CommonFunc.getComponentRect('4');
      let top3 = gridItem3.top;
      expect(Math.abs((top3 - bottom1) - vp2px(5)) <= 1).assertTrue();
      console.info('[GridItemJsunit_0600] END');
      done();
    });

    it('GridItemJsunit_0700', 0, async (done: Function) => {
      // Verify the columnsGap of Grid component 
      console.info('[GridItemJsunit_0700] START');
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      let gridItem1 = CommonFunc.getComponentRect('gridItem1');
      let right1 = gridItem1.right;
      let gridItem2 = CommonFunc.getComponentRect('0');
      let left1 = gridItem2.left;
	  expect(Math.abs((left1 - right1) - vp2px(4)) <= 1).assertTrue();
      console.info('[GridItemJsunit_0700] END');
      done();
    });

    it('GridItemJsunit_0800', 0, async (done: Function) => {
      // Verify the rowsGap of Grid component 
      console.info('[GridItemJsunit_0800] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowStart',value:'1'})
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<string>('value').message.notify({name:'rowEnd',value:'4'})
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      let gridItem1 = CommonFunc.getComponentRect('gridItem1');
      let bottom1 = gridItem1.bottom;
      let gridItem2 = CommonFunc.getComponentRect('gridItem3');
      let top1 = gridItem2.top;
      expect(Math.abs((top1 - bottom1) - vp2px(5)) <= 1).assertTrue();
      console.info('[GridItemJsunit_0800] END');
      done();
    });

    
  })
}
