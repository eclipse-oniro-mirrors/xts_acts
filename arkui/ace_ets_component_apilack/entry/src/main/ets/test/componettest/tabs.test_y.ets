/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'

export default function tabsBarPositionJsunit() {
  describe('tabsBarPositionTest1', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'pages/tabs',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabs state success " + JSON.stringify(pages));
        if (!("tabs" == pages.name)) {
          console.info("get tabs state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push tabs page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabs page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("tabsBarPosition after each called");
    });

    /**
     * @tc.name   testtabsBarPosition0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testtabsBarPosition0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0001', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testtabsBarPosition0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testtabsBarPosition0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testtabsBarPosition0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0002', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("70.00vp");
      console.info("[testtabsBarPosition0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testtabsBarPosition0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testtabsBarPosition0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0003', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0003] component fontSize strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("20.00fp");
      console.info("[testtabsBarPosition0003] fontSize value :" + JSON.parse(strJson).$attrs.fontSize);

    });

    /**
     * @tc.name   testtabsBarPosition0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   testtabsBarPosition0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0004', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0004] component opacity strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(1);
      console.info("[testtabsBarPosition0004] opacity value :" + JSON.parse(strJson).$attrs.opacity);

    });

    /**
     * @tc.name   testtabsBarPosition0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   testtabsBarPosition0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0005', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0005] component align strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.align).assertEqual("Alignment.TopStart");
      console.info("[testtabsBarPosition0005] align value :" + JSON.parse(strJson).$attrs.align);

    });

    /**
     * @tc.name   testtabsBarPosition0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   testtabsBarPosition0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0006', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0006] component fontColor strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info("[testtabsBarPosition0006] fontColor value :" + JSON.parse(strJson).$attrs.fontColor);

    });

    /**
     * @tc.name   testtabsBarPosition0007
     * @tc.number SUB_ACE_BASIC_ETS_API_0007
     * @tc.desc   testtabsBarPosition0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0007', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0007] component lineHeight strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.lineHeight).assertEqual("25.00fp");
      console.info("[testtabsBarPosition0007] lineHeight value :" + JSON.parse(strJson).$attrs.lineHeight);

    });

    /**
     * @tc.name   testtabsBarPosition0009
     * @tc.number SUB_ACE_BASIC_ETS_API_0009
     * @tc.desc   testtabsBarPosition0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0009', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0009] component padding strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.padding).assertEqual("10.00vp");
      console.info("[testtabsBarPosition0009] padding value :" + JSON.parse(strJson).$attrs.padding);

    });

    /**
     * @tc.name   testtabsBarPosition0010
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   testtabsBarPosition0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0010', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionText');
      console.info("[testtabsBarPosition0010] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Left");
      console.info("[testtabsBarPosition0010] textAlign value :" + JSON.parse(strJson).$attrs.textAlign);

    });

    /**
     * @tc.name   testtabsBarPosition0011
     * @tc.number SUB_ACE_BASIC_ETS_API_0011
     * @tc.desc   testtabsBarPosition0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testtabsBarPosition0011', Level.LEVEL0, async () => {
      console.info('tabsBarPosition testtabsBarPosition0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('barPositionTabs');
      console.info("[testtabsBarPosition0011] component barPosition strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.Start");
      console.info("[testtabsBarPosition0011] barPosition value :" + JSON.parse(strJson).$attrs.barPosition);

    });
  })
}
