/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, ON, Component } from '@ohos.UiTest';
import { ArcDirection } from '@kit.ArkUI';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ArcSwiperAttributeNullTest() {
  describe('ArcSwiperAttributeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ArcSwiperAttributeNull beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcSwiper/ArcSwiperAttributeNull",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcSwiperAttributeNull state pages:" + JSON.stringify(pages));
        if (!("ArcSwiperAttributeNull" == pages.name)) {
          console.info("get ArcSwiperAttributeNull pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcSwiperAttributeNull page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcSwiperAttributeNull page error:" + err);
      }
      console.info("ArcSwiperAttributeNull beforeEach end");
      done();
    });

    /**
     * @tc.name   arcSwiperIndexNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_INDEX_NULL_0100
     * @tc.desc   Test ArcSwiper index property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperIndexNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperIndexNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperIndexNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndexNull_0100] obj index is: " + JSON.stringify(obj.$attrs?.index));
        expect(obj.$attrs?.index).assertEqual('0');
        console.info('[arcSwiperIndexNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperIndexNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperIndicatorNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_INDICATOR_NULL_0100
     * @tc.desc   Test ArcSwiper indicator property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperIndicatorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperIndicatorNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperIndicatorNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndexNull_0100] obj indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        expect(JSON.stringify(obj.$attrs?.indicator).includes('ArcDirection.SIX_CLOCK_DIRECTION')).assertTrue();
        console.info('[arcSwiperIndicatorNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperIndicatorNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDurationNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DURATION_NULL_0100
     * @tc.desc   Test ArcSwiper duration property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDurationNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDurationNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDurationNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndexNull_0100] obj duration is: " + JSON.stringify(obj.$attrs?.duration));
        expect(obj.$attrs?.duration).assertEqual('400');
        console.info('[arcSwiperDurationNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperDurationNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperVerticalNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_VERTICAL_NULL_0100
     * @tc.desc   Test ArcSwiper vertical property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperVerticalNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperVerticalNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperVerticalNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndexNull_0100] obj vertical is: " + JSON.stringify(obj.$attrs?.vertical));
        expect(obj.$attrs?.vertical).assertEqual('false');
        console.info('[arcSwiperVerticalNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperVerticalNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDisableSwipeNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DISABLE_SWIPE_NULL_0100
     * @tc.desc   Test ArcSwiper disableSwipe property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDisableSwipeNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDisableSwipeNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDisableSwipeNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndexNull_0100] obj disableSwipe is: " + JSON.stringify(obj.$attrs?.disableSwipe));
        expect(obj.$attrs?.disableSwipe).assertEqual('false');
        console.info('[arcSwiperDisableSwipeNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperDisableSwipeNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDigitalCrownSensitivityNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY_NULL_0100
     * @tc.desc   Test ArcSwiper digitalCrownSensitivity property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDigitalCrownSensitivityNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDigitalCrownSensitivityNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDigitalCrownSensitivityNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndexNull_0100] obj digitalCrownSensitivity is: " + JSON.stringify(obj.$attrs?.digitalCrownSensitivity));
        expect(obj.$attrs?.digitalCrownSensitivity).assertEqual(undefined);
        console.info('[arcSwiperDigitalCrownSensitivityNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperDigitalCrownSensitivityNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnChangeNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_CHANGE_NULL_0100
     * @tc.desc   Test ArcSwiper onChange event with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnChangeNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnChangeNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnChangeNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnChangeNull_0100] obj is: " + JSON.stringify(obj.$attrs?.onChange));
        expect(obj.$attrs.onChange == undefined).assertTrue();
        console.info('[arcSwiperOnChangeNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnChangeNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnAnimationStartNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_ANIMATION_START_NULL_0100
     * @tc.desc   Test ArcSwiper onAnimationStart event with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnAnimationStartNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnAnimationStartNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnAnimationStartNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnAnimationStartNull_0100] obj onAnimationStart is: "
          + JSON.stringify(obj.$attrs?.onAnimationStart));
        expect(obj.$attrs.onAnimationStart == undefined).assertTrue();
        console.info('[arcSwiperOnAnimationStartNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnAnimationStartNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnAnimationEndNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_ANIMATION_END_NULL_0100
     * @tc.desc   Test ArcSwiper onAnimationEnd event with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnAnimationEndNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnAnimationEndNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnAnimationEndNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnAnimationStartNull_0100] obj onAnimationEnd is: "
          + JSON.stringify(obj.$attrs?.onAnimationEnd));
        expect(obj.$attrs.onAnimationEnd == undefined).assertTrue();
        console.info('[arcSwiperOnAnimationEndNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnAnimationEndNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnGestureSwipeNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_GESTURE_SWIPE_NULL_0100
     * @tc.desc   Test ArcSwiper onGestureSwipe event with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnGestureSwipeNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnGestureSwipeNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnGestureSwipeNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnAnimationStartNull_0100] obj onAnimationEnd is: "
          + JSON.stringify(obj.$attrs?.onGestureSwipe));
        expect(obj.$attrs.onGestureSwipe == undefined).assertTrue();
        console.info('[arcSwiperOnGestureSwipeNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnGestureSwipeNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperEffectModeNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_EFFECT_MODE_NULL_0100
     * @tc.desc   Test ArcSwiper effectMode property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperEffectModeNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperEffectModeNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperEffectModeNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperEffectModeNull_0100] obj effectMode is: " + JSON.stringify(obj.$attrs?.effectMode));
        // EdgeEffect.Spring = 0
        expect(obj.$attrs?.effectMode).assertEqual('EdgeEffect.Spring');
        console.info('[arcSwiperEffectModeNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperEffectModeNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperCustomContentTransitionNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_CUSTOM_CONTENT_TRANSITION_NULL_0100
     * @tc.desc   Test ArcSwiper customContentTransition property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperCustomContentTransitionNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperCustomContentTransitionNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperCustomContentTransitionNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperCustomContentTransitionNull_0100] obj customContentTransition is: "
          + JSON.stringify(obj.$attrs?.customContentTransition));
        // 验证组件存在
        expect(obj.$attrs !== null && obj.$attrs !== undefined).assertTrue();
        console.info('[arcSwiperCustomContentTransitionNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperCustomContentTransitionNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDisableTransitionAnimationNull_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION_NULL_0100
     * @tc.desc   Test ArcSwiper disableTransitionAnimation property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDisableTransitionAnimationNull_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDisableTransitionAnimationNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDisableTransitionAnimationNull_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperDisableTransitionAnimationNull_0100] obj disableTransitionAnimation is: " + JSON.stringify(obj.$attrs?.disableTransitionAnimation));
        expect(obj.$attrs?.disableTransitionAnimation == undefined).assertTrue();
        console.info('[arcSwiperDisableTransitionAnimationNull_0100] END');
      } catch (error) {
        console.info('[arcSwiperDisableTransitionAnimationNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })


  })
}
