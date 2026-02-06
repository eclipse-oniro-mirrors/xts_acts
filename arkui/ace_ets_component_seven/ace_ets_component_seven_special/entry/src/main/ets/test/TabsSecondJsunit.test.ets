/*
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import Utils from './Utils';
import router from '@ohos.router'

export default function tabsSecondJsunit() {
  describe('tabsSecondTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsSecond beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabsSecond',
      }
      let result: ESObject;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsSecond state pages: " + JSON.stringify(pages));
        if (!("tabsSecond" == pages.name)) {
          console.info("get tabsSecond state pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push tabsSecond page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsSecond page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarOverlap_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_BarOverlap_0200', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0200 start");
      let strJson = getInspectorByKey('TabsOverlapTest2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarOverlap_0200] barOverlap:" + obj.$attrs.barOverlap);
      expect(obj.$attrs.barOverlap).assertEqual("true");
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarBackgroundColor_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_BarBackgroundColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('TabsOverlapTest1');

      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_BarBackgroundColor_0100] barBackgroundColor:" + JSON.stringify(obj.$attrs.barBackgroundColor));
      let barBackgroundColorObject: ESObject = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#00000000");
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_Attrs_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0100 start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.barPosition).assertEqual('BarPosition.End');
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0200
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_Attrs_0200', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0200 start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.vertical).assertEqual('false');
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0300
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_Attrs_0300', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0300 start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.scrollable).assertEqual(true);
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0400
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_Attrs_0400', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0400 start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      console.info("barWidth: "+ Math.round(JSON.parse(strJson).$attrs.barWidth));
      expect(Math.abs(Math.round(JSON.parse(strJson).$attrs.barWidth) -350) <= 0.001).assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0500
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_Attrs_0500', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0500 start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      console.info("barHeight: "+ Math.round(JSON.parse(strJson).$attrs.barHeight));
      expect(Math.abs(Math.round(JSON.parse(strJson).$attrs.barHeight) -70) <= 0.001).assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0600
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('ArkUI_Tabs_Attrs_0600', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0600 start");
      let strJson = getInspectorByKey('TabsOverlapTest1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.animationDuration).assertEqual(200);
      done();
    });


  })
}
