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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import bundle from '@ohos.bundle.bundleManager';

export default function panelJsunit() {
  describe('panelTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/panel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panel state success " + JSON.stringify(pages));
        if (!("panel" == pages.name)) {
          console.info("get panel pages success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push panel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panel page error: " + err);
      }
      done();
    });

    /**
     * @tc.number test_panel_001
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_001', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_001] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_001] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.type).assertEqual("PanelType.Foldable");

      console.info('[test_panel_001] END');
      done();
    });

    /**
     * @tc.number test_panel_002
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_002', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_002] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_002] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.showCloseIcon).assertEqual("true");

      console.info('[test_panel_002] END');
      done();
    });

    /**
     * @tc.number test_panel_003
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_003', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_003] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_003] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.show).assertEqual("true");

      console.info('[test_panel_003] END');
      done();
    });

    /**
     * @tc.number test_panel_004
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_004', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_004] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_004] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.mode).assertEqual("PanelMode.Full");

      console.info('[test_panel_004] END');
      done();
    });

    /**
     * @tc.number test_panel_005
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_005', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_005] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_005] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.dragBar).assertEqual("true");

      console.info('[test_panel_005] END');
      done();
    });

    /**
     * @tc.number test_panel_006
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_006', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_006] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_006] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.miniHeight).assertEqual("20.00vp");

      console.info('[test_panel_006] END');
      done();
    });

    /**
     * @tc.number test_panel_007
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_007', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_007] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_007] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.halfHeight).assertEqual("300.00vp");

      console.info('[test_panel_007] END');
      done();
    });

    /**
     * @tc.number test_panel_008
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_008', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_008] START');
      let strJson = getInspectorByKey('PanelKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_008] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fullHeight).assertEqual("800.00vp");

      console.info('[test_panel_008] END');
      done();
    });

    /**
     * @tc.number test_panel_009
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_009', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_009] START');
      let strJson = getInspectorByKey('PanelKey2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_009] obj  is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.customHeight).assertEqual("10.00vp");
      console.info('[test_panel_009] END');
      done();
    });

    /**
     * @tc.number test_panel_0010
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_panel_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[test_panel_0010] START');
      let strJson = getInspectorByKey('PanelKey2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_panel_0010] obj is: " + JSON.stringify(obj.$attrs));

      let strJson3 = getInspectorByKey('PanelKey3');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[test_panel_0010] obj is: " + JSON.stringify(obj3.$attrs));
      // 得到json值与 设置不一致，与原生json返回做对比
      expect(obj.$attrs.backgroundMask).assertEqual(obj3.$attrs.backgroundMask);

      console.info('[test_panel_002] END');
      done();
    });
  })
}