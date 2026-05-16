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

export default function GridFillPolicy() {
  describe('GridFillPolicy', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFillPolicy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/GridFillPolicy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridFillPolicy state pages:" + JSON.stringify(pages));
        if (!("GridFillPolicy" == pages.name)) {
          console.info("get GridFillPolicy pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridFillPolicy page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridFillPolicy page error:" + err);
      }
      console.info("GridFillPolicy beforeEach end");
      done();
    });

    /**
     * @tc.name   GridFillPolicy_0100
     * @tc.number GridFillPolicy_001
     * @tc.desc   Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GridFillPolicy_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[GridFillPolicy_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('grid_fillType_0'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('grid_fillType_text');
      console.info("[GridFillPolicy_0100] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 0");

      let strJson2 = getInspectorByKey('grid_fillType');
      console.info("[GridFillPolicy_0100] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_DEFAULT");

      let gridItem1 = CommonFunc.getComponentRectOnScreen('gridType_1');
      console.info('[GridFillPolicy_0100] gridItem1.right: ' + gridItem1.right);
      let gridItem2 = CommonFunc.getComponentRectOnScreen('gridType_2');
      console.info('[GridFillPolicy_0100] gridItem2.left: ' + gridItem2.left);
      await CommonFunc.sleep(500);
      expect(Math.abs(Math.floor(gridItem2.left - gridItem1.right)) <= 1 ).assertTrue();
      console.info('[GridFillPolicy_0100] END');
      done();
    });

    /**
     * @tc.name   GridFillPolicy_0200
     * @tc.number GridFillPolicy_002
     * @tc.desc   Display 1 column when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GridFillPolicy_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[GridFillPolicy_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('grid_fillType_1'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('grid_fillType_text');
      console.info("[GridFillPolicy_0200] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 1");

      let strJson2 = getInspectorByKey('grid_fillType');
      console.info("[GridFillPolicy_0200] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_SM1MD2LG3");

      let gridItem1 = CommonFunc.getComponentRectOnScreen('gridType_1');
      console.info('[GridFillPolicy_0200] gridItem1.bottom: ' + gridItem1.bottom);
      let gridItem2 = CommonFunc.getComponentRectOnScreen('gridType_2');
      console.info('[GridFillPolicy_0200] gridItem2.top: ' + gridItem2.top);
      await CommonFunc.sleep(500);
      expect(Math.abs(Math.floor(gridItem2.top - gridItem1.bottom)) <= 1 ).assertTrue();
      console.info('[GridFillPolicy_0200] END');
      done();
    });

    /**
     * @tc.name   GridFillPolicy_0300
     * @tc.number GridFillPolicy_003
     * @tc.desc   Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GridFillPolicy_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[GridFillPolicy_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('grid_fillType_2'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('grid_fillType_text');
      console.info("[GridFillPolicy_0300] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 2");

      let strJson2 = getInspectorByKey('grid_fillType');
      console.info("[GridFillPolicy_0300] itemFillPolicy: " + JSON.stringify(JSON.parse(strJson2).$attrs.itemFillPolicy));
      expect(JSON.parse(strJson2).$attrs.itemFillPolicy).assertEqual("PresetFillType.BREAKPOINT_SM2MD3LG5");

      let gridItem1 = CommonFunc.getComponentRectOnScreen('gridType_1');
      console.info('[GridFillPolicy_0300] gridItem1.right: ' + gridItem1.right);
      let gridItem2 = CommonFunc.getComponentRectOnScreen('gridType_2');
      console.info('[GridFillPolicy_0300] gridItem2.left: ' + gridItem2.left);
      await CommonFunc.sleep(500);
      expect(Math.abs(Math.floor(gridItem2.left - gridItem1.right)) <= 1 ).assertTrue();
      console.info('[GridFillPolicy_0300] END');
      done();
    });
  })
}
