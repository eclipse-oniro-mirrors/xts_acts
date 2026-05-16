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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function UniversalAttributesTest() {
  describe('UniversalAttributesTest', () => {
    beforeEach(async (done: Function) => {
      console.info('UniversalAttributesTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/nullandundefinedTest/UniversalAttributesTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get UniversalAttributesTest state pages: ' + JSON.stringify(pages));
        if (!('UniversalAttributesTest' == pages.name)) {
          console.info('get UniversalAttributesTest  state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info('push UniversalAttributesTest  success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UniversalAttributesTest page error:' + err);
      }
      console.info('UniversalAttributesTest beforeEach end');
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('UniversalAttributesTest after each called');
    });

    // ========== freeze(value: boolean) tests ==========

    /**
     * @tc.name   freezeTrue_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_FREEZE_TRUE_0100
     * @tc.desc   测试freeze接口传入true值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('freezeTrue_0100', Level.LEVEL0, async () => {
      console.info('[freezeTrue_0100] START');

      let strJson: string = getInspectorByKey('freeze_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[freezeTrue_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.freezing == undefined).assertTrue();
      console.info('[freezeTrue_0100] END');
    });

    /**
     * @tc.name   freezeFalse_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_FREEZE_FALSE_0100
     * @tc.desc   测试freeze接口传入false值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('freezeFalse_0100', Level.LEVEL0, async () => {
      console.info('[freezeFalse_0100] START');

      let strJson: string = getInspectorByKey('freeze_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[freezeFalse_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.freezing == undefined).assertTrue();
      console.info('[freezeFalse_0100] END');
    });

    // ========== translate tests ==========

    /**
     * @tc.name   translateNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_TRANSLATE_NORMAL_0100
     * @tc.desc   测试translate接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('translateNormal_0100', Level.LEVEL0, async () => {
      console.info('[translateNormal_0100] START');

      let strJson: string = getInspectorByKey('translate_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[translateNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.translate !== undefined).assertTrue();
      console.info('[translateNormal_0100] END');
    });

    /**
     * @tc.name   translateXEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_TRANSLATE_X_EMPTY_0100
     * @tc.desc   测试translate接口x属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('translateXEmpty_0100', Level.LEVEL0, async () => {
      console.info('[translateXEmpty_0100] START');

      let strJson: string = getInspectorByKey('translate_x_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[translateXEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.translate !== undefined).assertTrue();
      console.info('[translateXEmpty_0100] END');
    });

    /**
     * @tc.name   translateYEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_TRANSLATE_Y_EMPTY_0100
     * @tc.desc   测试translate接口y属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('translateYEmpty_0100', Level.LEVEL0, async () => {
      console.info('[translateYEmpty_0100] START');

      let strJson: string = getInspectorByKey('translate_y_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[translateYEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.translate !== undefined).assertTrue();
      console.info('[translateYEmpty_0100] END');
    });

    /**
     * @tc.name   translateZEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_TRANSLATE_Z_EMPTY_0100
     * @tc.desc   测试translate接口z属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('translateZEmpty_0100', Level.LEVEL0, async () => {
      console.info('[translateZEmpty_0100] START');

      let strJson: string = getInspectorByKey('translate_z_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[translateZEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.translate !== undefined).assertTrue();
      console.info('[translateZEmpty_0100] END');
    });

    /**
     * @tc.name   translateNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_TRANSLATE_NULL_0100
     * @tc.desc   测试translate接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('translateNull_0100', Level.LEVEL0, async () => {
      console.info('[translateNull_0100] START');

      let strJson: string = getInspectorByKey('translate_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[translateNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.translate !== undefined).assertTrue();
      console.info('[translateNull_0100] END');
    });

    /**
     * @tc.name   translateUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_TRANSLATE_UNDEFINED_0100
     * @tc.desc   测试translate接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('translateUndefined_0100', Level.LEVEL0, async () => {
      console.info('[translateUndefined_0100] START');

      let strJson: string = getInspectorByKey('translate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[translateUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.translate !== undefined).assertTrue();
      console.info('[translateUndefined_0100] END');
    });

    // ========== scale tests ==========

    /**
     * @tc.name   scaleNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SCALE_NORMAL_0100
     * @tc.desc   测试scale接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scaleNormal_0100', Level.LEVEL0, async () => {
      console.info('[scaleNormal_0100] START');

      let strJson: string = getInspectorByKey('scale_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scaleNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scale !== undefined).assertTrue();
      console.info('[scaleNormal_0100] END');
    });

    /**
     * @tc.name   scaleCenterXEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SCALE_CENTERX_EMPTY_0100
     * @tc.desc   测试scale接口centerX属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scaleCenterXEmpty_0100', Level.LEVEL0, async () => {
      console.info('[scaleCenterXEmpty_0100] START');

      let strJson: string = getInspectorByKey('scale_centerX_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scaleCenterXEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scale !== undefined).assertTrue();
      console.info('[scaleCenterXEmpty_0100] END');
    });

    /**
     * @tc.name   scaleCenterYEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SCALE_CENTERY_EMPTY_0100
     * @tc.desc   测试scale接口centerY属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scaleCenterYEmpty_0100', Level.LEVEL0, async () => {
      console.info('[scaleCenterYEmpty_0100] START');

      let strJson: string = getInspectorByKey('scale_centerY_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scaleCenterYEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scale !== undefined).assertTrue();
      console.info('[scaleCenterYEmpty_0100] END');
    });

    /**
     * @tc.name   scaleNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SCALE_NULL_0100
     * @tc.desc   测试scale接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scaleNull_0100', Level.LEVEL0, async () => {
      console.info('[scaleNull_0100] START');

      let strJson: string = getInspectorByKey('scale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scaleNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scale !== undefined).assertTrue();
      console.info('[scaleNull_0100] END');
    });

    /**
     * @tc.name   scaleUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SCALE_UNDEFINED_0100
     * @tc.desc   测试scale接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('scaleUndefined_0100', Level.LEVEL0, async () => {
      console.info('[scaleUndefined_0100] START');

      let strJson: string = getInspectorByKey('scale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[scaleUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.scale !== undefined).assertTrue();
      console.info('[scaleUndefined_0100] END');
    });

    // ========== rotate tests ==========

    /**
     * @tc.name   rotateNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_ROTATE_NORMAL_0100
     * @tc.desc   测试rotate接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rotateNormal_0100', Level.LEVEL0, async () => {
      console.info('[rotateNormal_0100] START');

      let strJson: string = getInspectorByKey('rotate_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[rotateNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rotate !== undefined).assertTrue();
      console.info('[rotateNormal_0100] END');
    });

    /**
     * @tc.name   rotateAngleEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_ROTATE_ANGLE_EMPTY_0100
     * @tc.desc   测试rotate接口angle属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rotateAngleEmpty_0100', Level.LEVEL0, async () => {
      console.info('[rotateAngleEmpty_0100] START');

      let strJson: string = getInspectorByKey('rotate_angle_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[rotateAngleEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rotate !== undefined).assertTrue();
      console.info('[rotateAngleEmpty_0100] END');
    });

    /**
     * @tc.name   rotateNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_ROTATE_NULL_0100
     * @tc.desc   测试rotate接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rotateNull_0100', Level.LEVEL0, async () => {
      console.info('[rotateNull_0100] START');

      let strJson: string = getInspectorByKey('rotate_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[rotateNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rotate !== undefined).assertTrue();
      console.info('[rotateNull_0100] END');
    });

    /**
     * @tc.name   rotateUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_ROTATE_UNDEFINED_0100
     * @tc.desc   测试rotate接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rotateUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rotateUndefined_0100] START');

      let strJson: string = getInspectorByKey('rotate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[rotateUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.rotate !== undefined).assertTrue();
      console.info('[rotateUndefined_0100] END');
    });

    // ========== sharedTransition tests ==========

    /**
     * @tc.name   sharedTransitionNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_NORMAL_0100
     * @tc.desc   测试sharedTransition接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionNormal_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionNormal_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionNormal_0100] END');
    });

    /**
     * @tc.name   sharedTransitionCurveEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_CURVE_EMPTY_0100
     * @tc.desc   测试sharedTransition接口curve属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionCurveEmpty_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionCurveEmpty_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_curve_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionCurveEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionCurveEmpty_0100] END');
    });

    /**
     * @tc.name   sharedTransitionRotatableTrue_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_ROTATABLE_TRUE_0100
     * @tc.desc   测试sharedTransition接口motionPath.rotatable为true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionRotatableTrue_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionRotatableTrue_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_rotatable_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionRotatableTrue_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionRotatableTrue_0100] END');
    });

    /**
     * @tc.name   sharedTransitionRotatableFalse_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_ROTATABLE_FALSE_0100
     * @tc.desc   测试sharedTransition接口motionPath.rotatable为false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionRotatableFalse_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionRotatableFalse_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_rotatable_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionRotatableFalse_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionRotatableFalse_0100] END');
    });

    /**
     * @tc.name   sharedTransitionIdEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_ID_EMPTY_0100
     * @tc.desc   测试sharedTransition接口id属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionIdEmpty_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionIdEmpty_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_id_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionIdEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionIdEmpty_0100] END');
    });

    /**
     * @tc.name   sharedTransitionIdNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_ID_NULL_0100
     * @tc.desc   测试sharedTransition接口id属性为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionIdNull_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionIdNull_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_id_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionIdNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionIdNull_0100] END');
    });

    /**
     * @tc.name   sharedTransitionIdUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_ID_UNDEFINED_0100
     * @tc.desc   测试sharedTransition接口id属性为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionIdUndefined_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionIdUndefined_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_id_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionIdUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionIdUndefined_0100] END');
    });

    /**
     * @tc.name   sharedTransitionOptionsNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_OPTIONS_NULL_0100
     * @tc.desc   测试sharedTransition接口options为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionOptionsNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionOptionsNull_0100] END');
    });

    /**
     * @tc.name   sharedTransitionOptionsUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SHARED_TRANSITION_OPTIONS_UNDEFINED_0100
     * @tc.desc   测试sharedTransition接口options为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sharedTransitionOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[sharedTransitionOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('sharedTransition_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sharedTransitionOptionsUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sharedTransition == undefined).assertTrue();
      console.info('[sharedTransitionOptionsUndefined_0100] END');
    });

    // ========== clickEffect tests ==========

    /**
     * @tc.name   clickEffectNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_CLICK_EFFECT_NORMAL_0100
     * @tc.desc   测试clickEffect接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('clickEffectNormal_0100', Level.LEVEL0, async () => {
      console.info('[clickEffectNormal_0100] START');

      let strJson: string = getInspectorByKey('clickEffect_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[clickEffectNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.clickEffect !== undefined).assertTrue();
      console.info('[clickEffectNormal_0100] END');
    });

    /**
     * @tc.name   clickEffectNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_CLICK_EFFECT_NULL_0100
     * @tc.desc   测试clickEffect接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('clickEffectNull_0100', Level.LEVEL0, async () => {
      console.info('[clickEffectNull_0100] START');

      let strJson: string = getInspectorByKey('clickEffect_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[clickEffectNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.clickEffect !== undefined).assertTrue();
      console.info('[clickEffectNull_0100] END');
    });

    // ========== linearGradient tests ==========

    /**
     * @tc.name   linearGradientNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_LINEAR_GRADIENT_NORMAL_0100
     * @tc.desc   测试linearGradient接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('linearGradientNormal_0100', Level.LEVEL0, async () => {
      console.info('[linearGradientNormal_0100] START');

      let strJson: string = getInspectorByKey('linearGradient_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[linearGradientNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.linearGradient !== undefined).assertTrue();
      console.info('[linearGradientNormal_0100] END');
    });

    /**
     * @tc.name   linearGradientAngleEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_LINEAR_GRADIENT_ANGLE_EMPTY_0100
     * @tc.desc   测试linearGradient接口angle属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('linearGradientAngleEmpty_0100', Level.LEVEL0, async () => {
      console.info('[linearGradientAngleEmpty_0100] START');

      let strJson: string = getInspectorByKey('linearGradient_angle_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[linearGradientAngleEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.linearGradient !== undefined).assertTrue();
      console.info('[linearGradientAngleEmpty_0100] END');
    });

    /**
     * @tc.name   linearGradientNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_LINEAR_GRADIENT_NULL_0100
     * @tc.desc   测试linearGradient接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('linearGradientNull_0100', Level.LEVEL0, async () => {
      console.info('[linearGradientNull_0100] START');

      let strJson: string = getInspectorByKey('linearGradient_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[linearGradientNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.linearGradient !== undefined).assertTrue();
      console.info('[linearGradientNull_0100] END');
    });

    /**
     * @tc.name   linearGradientUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_LINEAR_GRADIENT_UNDEFINED_0100
     * @tc.desc   测试linearGradient接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('linearGradientUndefined_0100', Level.LEVEL0, async () => {
      console.info('[linearGradientUndefined_0100] START');

      let strJson: string = getInspectorByKey('linearGradient_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[linearGradientUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.linearGradient !== undefined).assertTrue();
      console.info('[linearGradientUndefined_0100] END');
    });

    // ========== sweepGradient tests ==========

    /**
     * @tc.name   sweepGradientNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SWEEP_GRADIENT_NORMAL_0100
     * @tc.desc   测试sweepGradient接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sweepGradientNormal_0100', Level.LEVEL0, async () => {
      console.info('[sweepGradientNormal_0100] START');

      let strJson: string = getInspectorByKey('sweepGradient_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sweepGradientNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sweepGradient !== undefined).assertTrue();
      console.info('[sweepGradientNormal_0100] END');
    });

    /**
     * @tc.name   sweepGradientStartEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SWEEP_GRADIENT_START_EMPTY_0100
     * @tc.desc   测试sweepGradient接口start属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sweepGradientStartEmpty_0100', Level.LEVEL0, async () => {
      console.info('[sweepGradientStartEmpty_0100] START');

      let strJson: string = getInspectorByKey('sweepGradient_start_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sweepGradientStartEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sweepGradient !== undefined).assertTrue();
      console.info('[sweepGradientStartEmpty_0100] END');
    });

    /**
     * @tc.name   sweepGradientEndEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SWEEP_GRADIENT_END_EMPTY_0100
     * @tc.desc   测试sweepGradient接口end属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sweepGradientEndEmpty_0100', Level.LEVEL0, async () => {
      console.info('[sweepGradientEndEmpty_0100] START');

      let strJson: string = getInspectorByKey('sweepGradient_end_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sweepGradientEndEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sweepGradient !== undefined).assertTrue();
      console.info('[sweepGradientEndEmpty_0100] END');
    });

    /**
     * @tc.name   sweepGradientRotationEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SWEEP_GRADIENT_ROTATION_EMPTY_0100
     * @tc.desc   测试sweepGradient接口rotation属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sweepGradientRotationEmpty_0100', Level.LEVEL0, async () => {
      console.info('[sweepGradientRotationEmpty_0100] START');

      let strJson: string = getInspectorByKey('sweepGradient_rotation_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sweepGradientRotationEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sweepGradient !== undefined).assertTrue();
      console.info('[sweepGradientRotationEmpty_0100] END');
    });

    /**
     * @tc.name   sweepGradientRepeatingFalse_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SWEEP_GRADIENT_REPEATING_FALSE_0100
     * @tc.desc   测试sweepGradient接口repeating为false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sweepGradientRepeatingFalse_0100', Level.LEVEL0, async () => {
      console.info('[sweepGradientRepeatingFalse_0100] START');

      let strJson: string = getInspectorByKey('sweepGradient_repeating_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sweepGradientRepeatingFalse_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sweepGradient !== undefined).assertTrue();
      console.info('[sweepGradientRepeatingFalse_0100] END');
    });

    /**
     * @tc.name   sweepGradientNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SWEEP_GRADIENT_NULL_0100
     * @tc.desc   测试sweepGradient接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sweepGradientNull_0100', Level.LEVEL0, async () => {
      console.info('[sweepGradientNull_0100] START');

      let strJson: string = getInspectorByKey('sweepGradient_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sweepGradientNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sweepGradient !== undefined).assertTrue();
      console.info('[sweepGradientNull_0100] END');
    });

    /**
     * @tc.name   sweepGradientUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_SWEEP_GRADIENT_UNDEFINED_0100
     * @tc.desc   测试sweepGradient接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('sweepGradientUndefined_0100', Level.LEVEL0, async () => {
      console.info('[sweepGradientUndefined_0100] START');

      let strJson: string = getInspectorByKey('sweepGradient_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[sweepGradientUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.sweepGradient !== undefined).assertTrue();
      console.info('[sweepGradientUndefined_0100] END');
    });

    // ========== radialGradient tests ==========

    /**
     * @tc.name   radialGradientNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_RADIAL_GRADIENT_NORMAL_0100
     * @tc.desc   测试radialGradient接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('radialGradientNormal_0100', Level.LEVEL0, async () => {
      console.info('[radialGradientNormal_0100] START');

      let strJson: string = getInspectorByKey('radialGradient_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[radialGradientNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.radialGradient !== undefined).assertTrue();
      console.info('[radialGradientNormal_0100] END');
    });

    /**
     * @tc.name   radialGradientRepeatingFalse_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_RADIAL_GRADIENT_REPEATING_FALSE_0100
     * @tc.desc   测试radialGradient接口repeating为false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('radialGradientRepeatingFalse_0100', Level.LEVEL0, async () => {
      console.info('[radialGradientRepeatingFalse_0100] START');

      let strJson: string = getInspectorByKey('radialGradient_repeating_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[radialGradientRepeatingFalse_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.radialGradient !== undefined).assertTrue();
      console.info('[radialGradientRepeatingFalse_0100] END');
    });

    /**
     * @tc.name   radialGradientNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_RADIAL_GRADIENT_NULL_0100
     * @tc.desc   测试radialGradient接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('radialGradientNull_0100', Level.LEVEL0, async () => {
      console.info('[radialGradientNull_0100] START');

      let strJson: string = getInspectorByKey('radialGradient_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[radialGradientNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.radialGradient !== undefined).assertTrue();
      console.info('[radialGradientNull_0100] END');
    });

    /**
     * @tc.name   radialGradientUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_RADIAL_GRADIENT_UNDEFINED_0100
     * @tc.desc   测试radialGradient接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('radialGradientUndefined_0100', Level.LEVEL0, async () => {
      console.info('[radialGradientUndefined_0100] START');

      let strJson: string = getInspectorByKey('radialGradient_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[radialGradientUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.radialGradient !== undefined).assertTrue();
      console.info('[radialGradientUndefined_0100] END');
    });

    // ========== geometryTransition tests ==========

    /**
     * @tc.name   geometryTransitionNormal_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_GEOMETRY_TRANSITION_NORMAL_0100
     * @tc.desc   测试geometryTransition接口正常参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('geometryTransitionNormal_0100', Level.LEVEL0, async () => {
      console.info('[geometryTransitionNormal_0100] START');

      let strJson: string = getInspectorByKey('geometryTransition_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[geometryTransitionNormal_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.geometryTransition == undefined).assertTrue();
      console.info('[geometryTransitionNormal_0100] END');
    });

    /**
     * @tc.name   geometryTransitionIdEmpty_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_GEOMETRY_TRANSITION_ID_EMPTY_0100
     * @tc.desc   测试geometryTransition接口id属性为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('geometryTransitionIdEmpty_0100', Level.LEVEL0, async () => {
      console.info('[geometryTransitionIdEmpty_0100] START');

      let strJson: string = getInspectorByKey('geometryTransition_id_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[geometryTransitionIdEmpty_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.geometryTransition == undefined).assertTrue();
      console.info('[geometryTransitionIdEmpty_0100] END');
    });

    /**
     * @tc.name   geometryTransitionIdNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_GEOMETRY_TRANSITION_ID_NULL_0100
     * @tc.desc   测试geometryTransition接口id属性为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('geometryTransitionIdNull_0100', Level.LEVEL0, async () => {
      console.info('[geometryTransitionIdNull_0100] START');

      let strJson: string = getInspectorByKey('geometryTransition_id_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[geometryTransitionIdNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.geometryTransition == undefined).assertTrue();
      console.info('[geometryTransitionIdNull_0100] END');
    });

    /**
     * @tc.name   geometryTransitionIdUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_GEOMETRY_TRANSITION_ID_UNDEFINED_0100
     * @tc.desc   测试geometryTransition接口id属性为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('geometryTransitionIdUndefined_0100', Level.LEVEL0, async () => {
      console.info('[geometryTransitionIdUndefined_0100] START');

      let strJson: string = getInspectorByKey('geometryTransition_id_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[geometryTransitionIdUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.geometryTransition == undefined).assertTrue();
      console.info('[geometryTransitionIdUndefined_0100] END');
    });

    /**
     * @tc.name   geometryTransitionFollowFalse_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_GEOMETRY_TRANSITION_FOLLOW_FALSE_0100
     * @tc.desc   测试geometryTransition接口options.follow为false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('geometryTransitionFollowFalse_0100', Level.LEVEL0, async () => {
      console.info('[geometryTransitionFollowFalse_0100] START');

      let strJson: string = getInspectorByKey('geometryTransition_follow_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[geometryTransitionFollowFalse_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.geometryTransition == undefined).assertTrue();
      console.info('[geometryTransitionFollowFalse_0100] END');
    });

    /**
     * @tc.name   geometryTransitionOptionsNull_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_GEOMETRY_TRANSITION_OPTIONS_NULL_0100
     * @tc.desc   测试geometryTransition接口options为null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('geometryTransitionOptionsNull_0100', Level.LEVEL0, async () => {
      console.info('[geometryTransitionOptionsNull_0100] START');

      let strJson: string = getInspectorByKey('geometryTransition_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[geometryTransitionOptionsNull_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.geometryTransition == undefined).assertTrue();
      console.info('[geometryTransitionOptionsNull_0100] END');
    });

    /**
     * @tc.name   geometryTransitionOptionsUndefined_0100
     * @tc.number SUB_ARKUI_UNIVERSAL_GEOMETRY_TRANSITION_OPTIONS_UNDEFINED_0100
     * @tc.desc   测试geometryTransition接口options为undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('geometryTransitionOptionsUndefined_0100', Level.LEVEL0, async () => {
      console.info('[geometryTransitionOptionsUndefined_0100] START');

      let strJson: string = getInspectorByKey('geometryTransition_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[geometryTransitionOptionsUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.geometryTransition == undefined).assertTrue();
      console.info('[geometryTransitionOptionsUndefined_0100] END');
    });
  });
}