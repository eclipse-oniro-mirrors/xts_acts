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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

export default function swiperCurveJsunit() {
  describe('swiperCurveTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperNew',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper1" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push swiper page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("swiperCurve after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testswiperCurve0001
     * @tc.desic         aceswiperCurveEtsTest0001
     */
    it('testswiperCurve0001', 0, async () => {
      console.info('swiperCurve testswiperCurve0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.curve).assertEqual("Curves.Linear");
      console.info("[testswiperCurve0001] curve value :" + JSON.parse(strJson).$attrs.curve);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testswiperCurve0002
     * @tc.desic         aceswiperCurveEtsTest0002
     */
    it('testswiperCurve0002', 0, async () => {
      console.info('swiperCurve testswiperCurve0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0002] component cachedCount strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.cachedCount).assertEqual(2);
      console.info("[testswiperCurve0002] cachedCount value :" + JSON.parse(strJson).$attrs.cachedCount);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testswiperCurve0003
     * @tc.desic         aceswiperCurveEtsTest0003
     */
    it('testswiperCurve0003', 0, async () => {
      console.info('swiperCurve testswiperCurve0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0003] component index strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.index).assertEqual("3");
      console.info("[testswiperCurve0003] index value :" + JSON.parse(strJson).$attrs.index);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testswiperCurve0004
     * @tc.desic         aceswiperCurveEtsTest0004
     */
    it('testswiperCurve0004', 0, async () => {
      console.info('swiperCurve testswiperCurve0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0004] component autoPlay strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual("true");
      console.info("[testswiperCurve0004] autoPlay value :" + JSON.parse(strJson).$attrs.autoPlay);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testswiperCurve0005
     * @tc.desic         aceswiperCurveEtsTest0005
     */
    it('testswiperCurve0005', 0, async () => {
      console.info('swiperCurve testswiperCurve0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0005] component interval strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.interval).assertEqual("4000");
      console.info("[testswiperCurve0005] interval value :" + JSON.parse(strJson).$attrs.interval);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testswiperCurve0006
     * @tc.desic         aceswiperCurveEtsTest0006
     */
    it('testswiperCurve0006', 0, async () => {
      console.info('swiperCurve testswiperCurve0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0006] component indicator strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      // let testObj = obj.$attrs.indicator;
      expect(JSON.parse(strJson).$attrs.indicator).assertEqual('true');

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0007
     * @tc.name         testswiperCurve0007
     * @tc.desic         aceswiperCurveEtsTest0007
     */
    it('testswiperCurve0007', 0, async () => {
      console.info('swiperCurve testswiperCurve0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0007] component loop strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual("false");
      console.info("[testswiperCurve0007] loop value :" + JSON.parse(strJson).$attrs.loop);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0008
     * @tc.name         testswiperCurve0008
     * @tc.desic         aceswiperCurveEtsTest0008
     */
    it('testswiperCurve0008', 0, async () => {
      console.info('swiperCurve testswiperCurve0008 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0008] component duration strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.duration).assertEqual("1000");
      console.info("[testswiperCurve0008] duration value :" + JSON.parse(strJson).$attrs.duration);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testswiperCurve0009
     * @tc.desic         aceswiperCurveEtsTest0009
     */
    it('testswiperCurve0009', 0, async () => {
      console.info('swiperCurve testswiperCurve0009 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve0009] component vertical strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual("false");
      console.info("[testswiperCurve0009] vertical value :" + JSON.parse(strJson).$attrs.vertical);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testswiperCurve0010
     * @tc.desic         aceswiperCurveEtsTest0010
     */
    it('testswiperCurve00010', 0, async () => {
      console.info('swiperCurve testswiperCurve00010 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve00010] component itemSpace strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      expect(JSON.parse(strJson).$attrs.itemSpace).assertEqual("0.00px");
      console.info("[testswiperCurve00010] itemSpace value :" + JSON.parse(strJson).$attrs.itemSpace);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0011
     * @tc.name         testswiperCurve0011
     * @tc.desic         aceswiperCurveEtsTest0011
     */
    /***有问题***/
    it('testswiperCurve00011', 0, async () => {
      console.info('swiperCurve testswiperCurve00011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('swiper');
      console.info("[testswiperCurve00011] component onChange strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Swiper');
      try {
        JSON.parse(strJson).$attrs.isOn = !JSON.parse(strJson).$attrs.isOn //尝试用isOn的改变来触发Onchange()事件
      } catch (err) {
        console.info("testswiperCurve00011 on event err : " + JSON.stringify(err));
      }
      console.info("[testswiperCurve00011] onChange value :" + JSON.parse(strJson).$attrs.onChange);

    });
  })
}
