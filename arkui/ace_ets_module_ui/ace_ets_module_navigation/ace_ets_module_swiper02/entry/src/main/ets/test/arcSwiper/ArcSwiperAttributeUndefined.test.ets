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

export default function ArcSwiperAttributeUndefinedTest() {
  describe('ArcSwiperAttributeUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ArcSwiperAttributeUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/arcSwiper/ArcSwiperAttributeUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcSwiperAttributeUndefined state pages:" + JSON.stringify(pages));
        if (!("ArcSwiperAttributeUndefined" == pages.name)) {
          console.info("get ArcSwiperAttributeUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcSwiperAttributeUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcSwiperAttributeUndefined page error:" + err);
      }
      console.info("ArcSwiperAttributeUndefined beforeEach end");
      done();
    });

    /**
     * @tc.name   arcSwiperIndexUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_INDEX_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper index property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperIndexUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperIndexUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperIndexUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndexUndefined_0100] obj index is: " + JSON.stringify(obj.$attrs?.index));
        expect(obj.$attrs?.index).assertEqual('0');
        console.info('[arcSwiperIndexUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperIndexUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperIndicatorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_INDICATOR_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper indicator property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperIndicatorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperIndicatorUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperIndicatorUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperIndicatorUndefined_0100] obj indicator is: " + JSON.stringify(obj.$attrs?.indicator));
        expect(JSON.stringify(obj.$attrs?.indicator).includes('ArcDirection.SIX_CLOCK_DIRECTION')).assertTrue();
        console.info('[arcSwiperIndicatorUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperIndicatorUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDurationUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DURATION_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper duration property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDurationUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDurationUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDurationUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperDurationUndefined_0100] obj duration is: " + JSON.stringify(obj.$attrs?.duration));
        expect(obj.$attrs?.duration).assertEqual('400');
        console.info('[arcSwiperDurationUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperDurationUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperVerticalUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_VERTICAL_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper vertical property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperVerticalUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperVerticalUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperVerticalUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperVerticalUndefined_0100] obj vertical is: " + JSON.stringify(obj.$attrs?.vertical));
        expect(obj.$attrs?.vertical).assertEqual('false');
        console.info('[arcSwiperVerticalUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperVerticalUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDisableSwipeUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DISABLE_SWIPE_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper disableSwipe property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDisableSwipeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDisableSwipeUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDisableSwipeUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperDisableSwipeUndefined_0100] obj disableSwipe is: " + JSON.stringify(obj.$attrs?.disableSwipe));
        expect(obj.$attrs?.disableSwipe).assertEqual('false');
        console.info('[arcSwiperDisableSwipeUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperDisableSwipeUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDigitalCrownSensitivityUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper digitalCrownSensitivity property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDigitalCrownSensitivityUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDigitalCrownSensitivityUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDigitalCrownSensitivityUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperDigitalCrownSensitivityUndefined_0100] obj digitalCrownSensitivity is: " + JSON.stringify(obj.$attrs?.digitalCrownSensitivity));
        expect(obj.$attrs?.digitalCrownSensitivity).assertEqual(undefined);
        console.info('[arcSwiperDigitalCrownSensitivityUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperDigitalCrownSensitivityUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnChangeUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_CHANGE_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper onChange event with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnChangeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnChangeUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnChangeUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnChangeUndefined_0100] obj is: " + JSON.stringify(obj.$attrs?.onChange));
        expect(obj.$attrs.onChange == undefined).assertTrue();
        console.info('[arcSwiperOnChangeUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnChangeUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnAnimationStartUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_ANIMATION_START_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper onAnimationStart event with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnAnimationStartUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnAnimationStartUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnAnimationStartUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnAnimationStartUndefined_0100] obj onAnimationStart is: "
          + JSON.stringify(obj.$attrs?.onAnimationStart));
        expect(obj.$attrs.onAnimationStart == undefined).assertTrue();
        console.info('[arcSwiperOnAnimationStartUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnAnimationStartUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnAnimationEndUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_ANIMATION_END_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper onAnimationEnd event with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnAnimationEndUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnAnimationEndUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnAnimationEndUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnAnimationStartUndefined_0100] obj onAnimationEnd is: "
          + JSON.stringify(obj.$attrs?.onAnimationEnd));
        expect(obj.$attrs.onAnimationEnd == undefined).assertTrue();
        console.info('[arcSwiperOnAnimationEndUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnAnimationEndUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperOnGestureSwipeUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_ON_GESTURE_SWIPE_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper onGestureSwipe event with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperOnGestureSwipeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperOnGestureSwipeUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperOnGestureSwipeUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperOnAnimationStartUndefined_0100] obj onAnimationEnd is: "
          + JSON.stringify(obj.$attrs?.onGestureSwipe));
        expect(obj.$attrs.onGestureSwipe == undefined).assertTrue();
        console.info('[arcSwiperOnGestureSwipeUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperOnGestureSwipeUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperEffectModeUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_EFFECT_MODE_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper effectMode property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperEffectModeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperEffectModeUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperEffectModeUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperEffectModeUndefined_0100] obj effectMode is: " + JSON.stringify(obj.$attrs?.effectMode));
        // EdgeEffect.Spring = 0
        expect(obj.$attrs?.effectMode).assertEqual('EdgeEffect.Spring');
        console.info('[arcSwiperEffectModeUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperEffectModeUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperCustomContentTransitionUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_CUSTOM_CONTENT_TRANSITION_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper customContentTransition property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperCustomContentTransitionUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperCustomContentTransitionUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperCustomContentTransitionUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperCustomContentTransitionUndefined_0100] obj customContentTransition is: "
          + JSON.stringify(obj.$attrs?.customContentTransition));
        // 验证组件存在
        expect(obj.$attrs !== null && obj.$attrs !== undefined).assertTrue();
        console.info('[arcSwiperCustomContentTransitionUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperCustomContentTransitionUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcSwiperDisableTransitionAnimationUndefined_0100
     * @tc.number SUB_ARKUI_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION_UNDEFINED_0100
     * @tc.desc   Test ArcSwiper disableTransitionAnimation property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcSwiperDisableTransitionAnimationUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcSwiperDisableTransitionAnimationUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('arcSwiper_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcSwiperDisableTransitionAnimationUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcSwiperDisableTransitionAnimationUndefined_0100] obj disableTransitionAnimation is: " + JSON.stringify(obj.$attrs?.disableTransitionAnimation));
        expect(obj.$attrs?.disableTransitionAnimation == undefined).assertTrue();
        console.info('[arcSwiperDisableTransitionAnimationUndefined_0100] END');
      } catch (error) {
        console.info('[arcSwiperDisableTransitionAnimationUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

  })
}
