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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import Utils from './Utils';

export default function tabsFirstJsunit() {
  describe('tabsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsFirst beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabsFirst',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsFirst state pages: " + JSON.stringify(pages));
        if (!("tabsFirst" == pages.name)) {
          console.info("get tabsFirst state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsFirst page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Divider_0300
     * @tc.name Test the properties of components
     * @tc.desc Set divider values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_Divider_0300', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_Divider_0300 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Divider_0300]:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs.divider))
        .assertEqual('{"strokeWidth":"2.00vp","startMargin":"0.00vp","endMargin":"0.00vp","color":"#FFFF0000"}');
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_FadingEdge_0100
     * @tc.name Test the properties of components
     * @tc.desc Set fadingEdge values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_FadingEdge_0100', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_FadingEdge_0100 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_FadingEdge_0100]:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.fadingEdge).assertEqual('true');
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarOverlap_0200
     * @tc.name Test the properties of components
     * @tc.desc Set barOverlap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_BarOverlap_0200', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_BarOverlap_0200 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarOverlap_0200]:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.barOverlap).assertEqual("true");
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarBackgroundColor_0100
     * @tc.name Test the properties of components
     * @tc.desc Set barBackgroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_BarBackgroundColor_0100', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_BarBackgroundColor start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarBackgroundColor_0100]:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#FFFF64FF");
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0100
     * @tc.name Test the properties of components
     * @tc.desc Set barPosition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_Attrs_0100', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0100 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_0100]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.barPosition).assertEqual('BarPosition.Start');
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0200
     * @tc.name Test the properties of components
     * @tc.desc Set vertical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_Attrs_0200', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0200 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_0200]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.vertical).assertEqual('true');
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0300
     * @tc.name Test the properties of components
     * @tc.desc Set scrollable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_Attrs_0300', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0300 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_0300]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.scrollable).assertEqual(true);
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0400
     * @tc.name Test the properties of components
     * @tc.desc Set barWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_Attrs_0400', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0400 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_0400]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("barWidth: "+ obj.$attrs.barWidth);
	    let barWidth1: number = Math.round(obj.$attrs.barWidth)
      console.info("barWidth1: "+ barWidth1);
      expect(Math.abs(barWidth1 -156) <= 0.001).assertTrue();

      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0500
     * @tc.name Test the properties of components
     * @tc.desc Set barHeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_Attrs_0500', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0500 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_0500]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
	    let barHeight1: number = Math.round(obj.$attrs.barHeight)
      console.info("barHeight1: "+ barHeight1);
      expect(Math.abs(barHeight1 -100) <= 0.001).assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_Attrs_0600
     * @tc.name Test the properties of components
     * @tc.desc Set animationDuration values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_Attrs_0600', 0, async (done: Function) => {
      console.info("ArkUI_Tabs_Attrs_0600 start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_Attrs_0600]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.animationDuration).assertEqual(300);
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarGridAlign_0200
     * @tc.name Test the properties of components
     * @tc.desc Set barGridAlign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_BarGridAlign_0200', 0, async (done: Function) => {
      console.info("[ArkUI_Tabs_BarGridAlign_0200] start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarGridAlign_0200]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);

      expect(obj.$attrs.barGridAlign.margin).assertEqual('10.00vp');
      expect(obj.$attrs.barGridAlign.gutter).assertEqual('15.00px');
      expect(obj.$attrs.barGridAlign.sm).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.md).assertEqual('-1');
      expect(obj.$attrs.barGridAlign.lg).assertEqual('-1');
      console.info("[ArkUI_Tabs_BarGridAlign_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_BarMode_0200
     * @tc.name Test the properties of components
     * @tc.desc Set barMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_BarMode_0200', 0, async (done: Function) => {
      console.info("[ArkUI_Tabs_BarMode_0200] start");
      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_BarMode_0200]: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.barMode)
        .assertEqual('BarMode.Scrollable,{\"margin\":\"0.00vp\",\"nonScrollableLayoutStyle\":\"LayoutStyle.ALWAYS_CENTER\"}');
      console.info("[ArkUI_Tabs_BarMode_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Tabs_0011
     * @tc.name Test the properties of components
     * @tc.desc Change barBackgroundColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Tabs_0011', 0, async (done: Function) => {
      console.info('ArkUI_Tabs_0011 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJson = getInspectorByKey('tabsTest');
      console.info("[ArkUI_Tabs_0011]:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      let barBackgroundColorObject: string = obj.$attrs.barBackgroundColor;
      expect(barBackgroundColorObject).assertEqual("#FF122345");
      console.info('ArkUI_Tabs_0011 END');
      done();
    });
  })
}
