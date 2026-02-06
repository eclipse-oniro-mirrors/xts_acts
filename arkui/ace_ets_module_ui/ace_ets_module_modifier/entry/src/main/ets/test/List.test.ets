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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function list() {
  describe('listTest', () => {
    beforeEach(async (done: Function) => {
      console.info("listJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/list',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get list state pages: " + JSON.stringify(pages));
        if (!("list" == pages.name)) {
          console.info("get list state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push list page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   ListJsunit_0100
     * @tc.number ListJsunit_0100
     * @tc.desc   Set scrollSnapAlign values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0100] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0100] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.scrollSnapAlign).assertEqual("ScrollSnapAlign.NONE");
      console.info('[ListJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0101
     * @tc.number ListJsunit_0101
     * @tc.desc   Set lanes values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0101', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0101] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0101] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.lanes).assertEqual("1");
      console.info('[ListJsunit_0101] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0102
     * @tc.number ListJsunit_0102
     * @tc.desc   Set friction values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0102', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0102] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0102] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.friction).assertEqual(1);
      console.info('[ListJsunit_0102] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0103
     * @tc.number ListJsunit_0103
     * @tc.desc   Set enableScrollInteraction values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0103', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0103] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0103] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.enableScrollInteraction).assertEqual(true);
      console.info('[ListJsunit_0103] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0105
     * @tc.number ListJsunit_0105
     * @tc.desc   Set chainAnimationOptions values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0105', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0105] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0105] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.chainAnimationOptions).assertEqual(undefined);
      console.info('[ListJsunit_0105] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0106
     * @tc.number ListJsunit_0106
     * @tc.desc   Set alignListItem values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0106', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0106] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0106] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.alignListItem).assertEqual("ListItemAlign.Start");
      console.info('[ListJsunit_0106] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0107
     * @tc.number ListJsunit_0107
     * @tc.desc   Set listDirection values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0107', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0107] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0107] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.listDirection).assertEqual("Axis.Vertical");
      console.info('[ListJsunit_0107] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0108
     * @tc.number ListJsunit_0108
     * @tc.desc   Set scrollBar values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0108', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0108] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0108] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.scrollBar).assertEqual("BarState.Off");
      console.info('[ListJsunit_0108] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0109
     * @tc.number ListJsunit_0109
     * @tc.desc   Set edgeEffect values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0109', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0109] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0109] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.edgeEffect).assertEqual("EdgeEffect.Spring");
      console.info('[ListJsunit_0109] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0110
     * @tc.number ListJsunit_0110
     * @tc.desc   Set divider values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0110', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0110] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0110] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.divider.strokeWidth).assertEqual("1.00vp");
      expect(JSON.parse(strJson).$attrs.divider.startMargin).assertEqual("2.00vp");
      expect(JSON.parse(strJson).$attrs.divider.endMargin).assertEqual("3.00vp");
      expect(JSON.parse(strJson).$attrs.divider.color).assertEqual("#FF00FFFF");
      console.info('[ListJsunit_0110] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0111
     * @tc.number ListJsunit_0111
     * @tc.desc   Set editMode values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0111', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0111] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0111] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.editMode).assertEqual(true);
      console.info('[ListJsunit_0111] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0112
     * @tc.number ListJsunit_0112
     * @tc.desc   Set multiSelectable values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0112', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0112] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0112] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.multiSelectable).assertEqual(true);
      console.info('[ListJsunit_0112] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0113
     * @tc.number ListJsunit_0113
     * @tc.desc   Set cachedCount values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0113', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0113] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0113] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.cachedCount).assertEqual("2");
      console.info('[ListJsunit_0113] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0114
     * @tc.number ListJsunit_0114
     * @tc.desc   Set chainAnimation values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0114', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0114] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0114] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.chainAnimation).assertEqual(true);
      console.info('[ListJsunit_0114] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0115
     * @tc.number ListJsunit_0115
     * @tc.desc   Set sticky values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0115', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0115] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0115] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.sticky).assertEqual("StickyStyle.Header");
      console.info('[ListJsunit_0115] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0116
     * @tc.number ListJsunit_0116
     * @tc.desc   Set contentEndOffset values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0116', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0116] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0116] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.contentEndOffset).assertEqual("1.000000");
      console.info('[ListJsunit_0116] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0117
     * @tc.number ListJsunit_0117
     * @tc.desc   Set contentStartOffset values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0117', Level.LEVEL0, async (done: Function) => {
      console.info('[ListJsunit_0117] START');
      let strJson = getInspectorByKey('ListKey1');
      
      console.info("[ListJsunit_0117] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs));

      expect(JSON.parse(strJson).$attrs.contentStartOffset).assertEqual("1.000000");
      console.info('[ListJsunit_0117] END');
      done();
    });

    /**
     * @tc.name   ListJsunit_0118
     * @tc.number ListJsunit_0118
     * @tc.desc   Change lanes values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ListJsunit_0118', Level.LEVEL0, async (done: Function) => {
      console.info('ListJsunit_0118 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('ListKey1');
      console.info("ListJsunit_0118 component  is: " + JSON.stringify(JSON.parse(strJsonNew).$attrs));
      expect(JSON.parse(strJsonNew).$attrs.lanes).assertEqual('1');
      console.info('ListJsunit_0118 END');
      done();
    });
  })
}
