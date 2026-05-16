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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function PatternLockPropertiesNullUndefinedTest() {
  describe('PatternLockPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PatternLockPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PatternLock/PatternLockPropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PatternLockPropertiesNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("PatternLockPropertiesNullUndefined" == pages.name)) {
          console.info("get PatternLockPropertiesNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PatternLockPropertiesNullUndefinedTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PatternLockPropertiesNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   patternLockSideLength_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SIDELENGTH_NULL_0100
     * @tc.desc   Test PatternLock sideLength property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSideLength_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSideLength_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_sideLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_sideLength_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSideLength_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSideLength_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSideLength_null_0100] default sideLength is: " + objCompare.$attrs.sideLength);
      console.info("[patternLockSideLength_null_0100] null sideLength is: " + obj.$attrs.sideLength);

      // null 应该恢复为默认值
      expect(obj.$attrs.sideLength).assertEqual(objCompare.$attrs.sideLength);
      console.info('[patternLockSideLength_null_0100] END');
    })

    /**
     * @tc.name   patternLockSideLength_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SIDELENGTH_UNDEFINED_0100
     * @tc.desc   Test PatternLock sideLength property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSideLength_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSideLength_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_sideLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_sideLength_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSideLength_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSideLength_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSideLength_undefined_0100] default sideLength is: " + objCompare.$attrs.sideLength);
      console.info("[patternLockSideLength_undefined_0100] undefined sideLength is: " + obj.$attrs.sideLength);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.sideLength).assertEqual(objCompare.$attrs.sideLength);
      console.info('[patternLockSideLength_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockSideLength_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SIDELENGTH_EMPTY_0100
     * @tc.desc   Test PatternLock sideLength property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSideLength_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSideLength_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_sideLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_sideLength_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSideLength_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSideLength_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSideLength_empty_0100] default sideLength is: " + objCompare.$attrs.sideLength);
      console.info("[patternLockSideLength_empty_0100] empty sideLength is: " + obj.$attrs.sideLength);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.sideLength).assertEqual(objCompare.$attrs.sideLength);
      console.info('[patternLockSideLength_empty_0100] END');
    })

    /**
     * @tc.name   patternLockCircleRadius_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_CIRCLERADIUS_NULL_0100
     * @tc.desc   Test PatternLock circleRadius property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockCircleRadius_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockCircleRadius_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_circleRadius_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_circleRadius_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockCircleRadius_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockCircleRadius_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockCircleRadius_null_0100] default circleRadius is: " + objCompare.$attrs.circleRadius);
      console.info("[patternLockCircleRadius_null_0100] null circleRadius is: " + obj.$attrs.circleRadius);

      // null 应该恢复为默认值
      expect(obj.$attrs.circleRadius).assertEqual(objCompare.$attrs.circleRadius);
      console.info('[patternLockCircleRadius_null_0100] END');
    })

    /**
     * @tc.name   patternLockCircleRadius_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_CIRCLERADIUS_UNDEFINED_0100
     * @tc.desc   Test PatternLock circleRadius property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockCircleRadius_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockCircleRadius_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_circleRadius_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_circleRadius_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockCircleRadius_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockCircleRadius_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockCircleRadius_undefined_0100] default circleRadius is: " + objCompare.$attrs.circleRadius);
      console.info("[patternLockCircleRadius_undefined_0100] undefined circleRadius is: " + obj.$attrs.circleRadius);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.circleRadius).assertEqual(objCompare.$attrs.circleRadius);
      console.info('[patternLockCircleRadius_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockCircleRadius_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_CIRCLERADIUS_EMPTY_0100
     * @tc.desc   Test PatternLock circleRadius property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockCircleRadius_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockCircleRadius_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_circleRadius_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_circleRadius_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockCircleRadius_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockCircleRadius_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockCircleRadius_empty_0100] default circleRadius is: " + objCompare.$attrs.circleRadius);
      console.info("[patternLockCircleRadius_empty_0100] empty circleRadius is: " + obj.$attrs.circleRadius);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.circleRadius).assertEqual(objCompare.$attrs.circleRadius);
      console.info('[patternLockCircleRadius_empty_0100] END');
    })

    /**
     * @tc.name   patternLockBackgroundColor_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_BACKGROUNDCOLOR_NULL_0100
     * @tc.desc   Test PatternLock backgroundColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockBackgroundColor_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockBackgroundColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_backgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_backgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockBackgroundColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockBackgroundColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockBackgroundColor_null_0100] default backgroundColor is: " + objCompare.$attrs.backgroundColor);
      console.info("[patternLockBackgroundColor_null_0100] null backgroundColor is: " + obj.$attrs.backgroundColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.backgroundColor as string;
      let nullColor: string = obj.$attrs.backgroundColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[patternLockBackgroundColor_null_0100] END');
    })

    /**
     * @tc.name   patternLockBackgroundColor_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_BACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.desc   Test PatternLock backgroundColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockBackgroundColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockBackgroundColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_backgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_backgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockBackgroundColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockBackgroundColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockBackgroundColor_undefined_0100] default backgroundColor is: " + objCompare.$attrs.backgroundColor);
      console.info("[patternLockBackgroundColor_undefined_0100] undefined backgroundColor is: " + obj.$attrs.backgroundColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.backgroundColor as string;
      let undefinedColor: string = obj.$attrs.backgroundColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[patternLockBackgroundColor_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockBackgroundColor_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_BACKGROUNDCOLOR_EMPTY_0100
     * @tc.desc   Test PatternLock backgroundColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockBackgroundColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockBackgroundColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_backgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_backgroundColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockBackgroundColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockBackgroundColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockBackgroundColor_empty_0100] default backgroundColor is: " + objCompare.$attrs.backgroundColor);
      console.info("[patternLockBackgroundColor_empty_0100] empty backgroundColor is: " + obj.$attrs.backgroundColor);

      // 空字符串应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.backgroundColor as string;
      let emptyColor: string = obj.$attrs.backgroundColor as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[patternLockBackgroundColor_empty_0100] END');
    })

    /**
     * @tc.name   patternLockRegularColor_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_REGULARCOLOR_NULL_0100
     * @tc.desc   Test PatternLock regularColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockRegularColor_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockRegularColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_regularColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_regularColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockRegularColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockRegularColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockRegularColor_null_0100] default regularColor is: " + objCompare.$attrs.regularColor);
      console.info("[patternLockRegularColor_null_0100] null regularColor is: " + obj.$attrs.regularColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.regularColor as string;
      let nullColor: string = obj.$attrs.regularColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[patternLockRegularColor_null_0100] END');
    })

    /**
     * @tc.name   patternLockRegularColor_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_REGULARCOLOR_UNDEFINED_0100
     * @tc.desc   Test PatternLock regularColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockRegularColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockRegularColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_regularColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_regularColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockRegularColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockRegularColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockRegularColor_undefined_0100] default regularColor is: " + objCompare.$attrs.regularColor);
      console.info("[patternLockRegularColor_undefined_0100] undefined regularColor is: " + obj.$attrs.regularColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.regularColor as string;
      let undefinedColor: string = obj.$attrs.regularColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[patternLockRegularColor_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockRegularColor_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_REGULARCOLOR_EMPTY_0100
     * @tc.desc   Test PatternLock regularColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockRegularColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockRegularColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_regularColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_regularColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockRegularColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockRegularColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockRegularColor_empty_0100] default regularColor is: " + objCompare.$attrs.regularColor);
      console.info("[patternLockRegularColor_empty_0100] empty regularColor is: " + obj.$attrs.regularColor);

      // 空字符串应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.regularColor as string;
      let emptyColor: string = obj.$attrs.regularColor as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[patternLockRegularColor_empty_0100] END');
    })

    /**
     * @tc.name   patternLockSelectedColor_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SELECTEDCOLOR_NULL_0100
     * @tc.desc   Test PatternLock selectedColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSelectedColor_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSelectedColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_selectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_selectedColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSelectedColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSelectedColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSelectedColor_null_0100] default selectedColor is: " + objCompare.$attrs.selectedColor);
      console.info("[patternLockSelectedColor_null_0100] null selectedColor is: " + obj.$attrs.selectedColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.selectedColor as string;
      let nullColor: string = obj.$attrs.selectedColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[patternLockSelectedColor_null_0100] END');
    })

    /**
     * @tc.name   patternLockSelectedColor_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SELECTEDCOLOR_UNDEFINED_0100
     * @tc.desc   Test PatternLock selectedColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSelectedColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSelectedColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_selectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_selectedColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSelectedColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSelectedColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSelectedColor_undefined_0100] default selectedColor is: " + objCompare.$attrs.selectedColor);
      console.info("[patternLockSelectedColor_undefined_0100] undefined selectedColor is: " + obj.$attrs.selectedColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.selectedColor as string;
      let undefinedColor: string = obj.$attrs.selectedColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[patternLockSelectedColor_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockSelectedColor_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SELECTEDCOLOR_EMPTY_0100
     * @tc.desc   Test PatternLock selectedColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSelectedColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSelectedColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_selectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_selectedColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSelectedColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSelectedColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSelectedColor_empty_0100] default selectedColor is: " + objCompare.$attrs.selectedColor);
      console.info("[patternLockSelectedColor_empty_0100] empty selectedColor is: " + obj.$attrs.selectedColor);

      // 空字符串应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.selectedColor as string;
      let emptyColor: string = obj.$attrs.selectedColor as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[patternLockSelectedColor_empty_0100] END');
    })

    /**
     * @tc.name   patternLockActiveColor_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_ACTIVECOLOR_NULL_0100
     * @tc.desc   Test PatternLock activeColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockActiveColor_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockActiveColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_activeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_activeColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockActiveColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockActiveColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockActiveColor_null_0100] default activeColor is: " + objCompare.$attrs.activeColor);
      console.info("[patternLockActiveColor_null_0100] null activeColor is: " + obj.$attrs.activeColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.activeColor as string;
      let nullColor: string = obj.$attrs.activeColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[patternLockActiveColor_null_0100] END');
    })

    /**
     * @tc.name   patternLockActiveColor_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_ACTIVECOLOR_UNDEFINED_0100
     * @tc.desc   Test PatternLock activeColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockActiveColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockActiveColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_activeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_activeColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockActiveColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockActiveColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockActiveColor_undefined_0100] default activeColor is: " + objCompare.$attrs.activeColor);
      console.info("[patternLockActiveColor_undefined_0100] undefined activeColor is: " + obj.$attrs.activeColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.activeColor as string;
      let undefinedColor: string = obj.$attrs.activeColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[patternLockActiveColor_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockActiveColor_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_ACTIVECOLOR_EMPTY_0100
     * @tc.desc   Test PatternLock activeColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockActiveColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockActiveColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_activeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_activeColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockActiveColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockActiveColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockActiveColor_empty_0100] default activeColor is: " + objCompare.$attrs.activeColor);
      console.info("[patternLockActiveColor_empty_0100] empty activeColor is: " + obj.$attrs.activeColor);

      // 空字符串应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.activeColor as string;
      let emptyColor: string = obj.$attrs.activeColor as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[patternLockActiveColor_empty_0100] END');
    })

    /**
     * @tc.name   patternLockPathColor_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_PATHCOLOR_NULL_0100
     * @tc.desc   Test PatternLock pathColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockPathColor_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockPathColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_pathColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_pathColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockPathColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockPathColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockPathColor_null_0100] default pathColor is: " + objCompare.$attrs.pathColor);
      console.info("[patternLockPathColor_null_0100] null pathColor is: " + obj.$attrs.pathColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.pathColor as string;
      let nullColor: string = obj.$attrs.pathColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[patternLockPathColor_null_0100] END');
    })

    /**
     * @tc.name   patternLockPathColor_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_PATHCOLOR_UNDEFINED_0100
     * @tc.desc   Test PatternLock pathColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockPathColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockPathColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_pathColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_pathColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockPathColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockPathColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockPathColor_undefined_0100] default pathColor is: " + objCompare.$attrs.pathColor);
      console.info("[patternLockPathColor_undefined_0100] undefined pathColor is: " + obj.$attrs.pathColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.pathColor as string;
      let undefinedColor: string = obj.$attrs.pathColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[patternLockPathColor_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockPathColor_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_PATHCOLOR_EMPTY_0100
     * @tc.desc   Test PatternLock pathColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockPathColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockPathColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_pathColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_pathColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockPathColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockPathColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockPathColor_empty_0100] default pathColor is: " + objCompare.$attrs.pathColor);
      console.info("[patternLockPathColor_empty_0100] empty pathColor is: " + obj.$attrs.pathColor);

      // 空字符串应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.pathColor as string;
      let emptyColor: string = obj.$attrs.pathColor as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[patternLockPathColor_empty_0100] END');
    })

    /**
     * @tc.name   patternLockPathStrokeWidth_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_PATHSTROKEWIDTH_NULL_0100
     * @tc.desc   Test PatternLock pathStrokeWidth property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockPathStrokeWidth_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockPathStrokeWidth_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_pathStrokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_pathStrokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockPathStrokeWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockPathStrokeWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockPathStrokeWidth_null_0100] default pathStrokeWidth is: " + objCompare.$attrs.pathStrokeWidth);
      console.info("[patternLockPathStrokeWidth_null_0100] null pathStrokeWidth is: " + obj.$attrs.pathStrokeWidth);

      // null 应该恢复为默认值
      expect(obj.$attrs.pathStrokeWidth).assertEqual(objCompare.$attrs.pathStrokeWidth);
      console.info('[patternLockPathStrokeWidth_null_0100] END');
    })

    /**
     * @tc.name   patternLockPathStrokeWidth_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_PATHSTROKEWIDTH_UNDEFINED_0100
     * @tc.desc   Test PatternLock pathStrokeWidth property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockPathStrokeWidth_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockPathStrokeWidth_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_pathStrokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_pathStrokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockPathStrokeWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockPathStrokeWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockPathStrokeWidth_undefined_0100] default pathStrokeWidth is: " + objCompare.$attrs.pathStrokeWidth);
      console.info("[patternLockPathStrokeWidth_undefined_0100] undefined pathStrokeWidth is: " + obj.$attrs.pathStrokeWidth);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.pathStrokeWidth).assertEqual(objCompare.$attrs.pathStrokeWidth);
      console.info('[patternLockPathStrokeWidth_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockPathStrokeWidth_empty_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_PATHSTROKEWIDTH_EMPTY_0100
     * @tc.desc   Test PatternLock pathStrokeWidth property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockPathStrokeWidth_empty_0100', Level.LEVEL2, async () => {
      console.info('[patternLockPathStrokeWidth_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_pathStrokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_pathStrokeWidth_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockPathStrokeWidth_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockPathStrokeWidth_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockPathStrokeWidth_empty_0100] default pathStrokeWidth is: " + objCompare.$attrs.pathStrokeWidth);
      console.info("[patternLockPathStrokeWidth_empty_0100] empty pathStrokeWidth is: " + obj.$attrs.pathStrokeWidth);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.pathStrokeWidth).assertEqual(objCompare.$attrs.pathStrokeWidth);
      console.info('[patternLockPathStrokeWidth_empty_0100] END');
    })

    /**
     * @tc.name   patternLockActivateCircleStyle_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_ACTIVATECIRCLESTYLE_NULL_0100
     * @tc.desc   Test PatternLock activateCircleStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockActivateCircleStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockActivateCircleStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_activateCircleStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_activateCircleStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockActivateCircleStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockActivateCircleStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockActivateCircleStyle_null_0100] default activateCircleStyle is: " + JSON.stringify(objCompare.$attrs.activateCircleStyle));
      console.info("[patternLockActivateCircleStyle_null_0100] null activateCircleStyle is: " + JSON.stringify(obj.$attrs.activateCircleStyle));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.activateCircleStyle)).assertEqual(JSON.stringify(objCompare.$attrs.activateCircleStyle));
      console.info('[patternLockActivateCircleStyle_null_0100] END');
    })

    /**
     * @tc.name   patternLockActivateCircleStyle_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_ACTIVATECIRCLESTYLE_UNDEFINED_0100
     * @tc.desc   Test PatternLock activateCircleStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockActivateCircleStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockActivateCircleStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_activateCircleStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_activateCircleStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockActivateCircleStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockActivateCircleStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockActivateCircleStyle_undefined_0100] default activateCircleStyle is: " + JSON.stringify(objCompare.$attrs.activateCircleStyle));
      console.info("[patternLockActivateCircleStyle_undefined_0100] undefined activateCircleStyle is: " + JSON.stringify(obj.$attrs.activateCircleStyle));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.activateCircleStyle)).assertEqual(JSON.stringify(objCompare.$attrs.activateCircleStyle));
      console.info('[patternLockActivateCircleStyle_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockAutoReset_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_AUTORESET_NULL_0100
     * @tc.desc   Test PatternLock autoReset property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockAutoReset_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockAutoReset_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_autoReset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_autoReset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockAutoReset_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockAutoReset_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockAutoReset_null_0100] default autoReset is: " + objCompare.$attrs.autoReset);
      console.info("[patternLockAutoReset_null_0100] null autoReset is: " + obj.$attrs.autoReset);

      // null 应该恢复为默认值
      expect(obj.$attrs.autoReset).assertEqual(objCompare.$attrs.autoReset);
      console.info('[patternLockAutoReset_null_0100] END');
    })

    /**
     * @tc.name   patternLockAutoReset_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_AUTORESET_UNDEFINED_0100
     * @tc.desc   Test PatternLock autoReset property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockAutoReset_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockAutoReset_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_autoReset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_autoReset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockAutoReset_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockAutoReset_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockAutoReset_undefined_0100] default autoReset is: " + objCompare.$attrs.autoReset);
      console.info("[patternLockAutoReset_undefined_0100] undefined autoReset is: " + obj.$attrs.autoReset);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.autoReset).assertEqual(objCompare.$attrs.autoReset);
      console.info('[patternLockAutoReset_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockAutoReset_true_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_AUTORESET_TRUE_0100
     * @tc.desc   Test PatternLock autoReset property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockAutoReset_true_0100', Level.LEVEL2, async () => {
      console.info('[patternLockAutoReset_true_0100] START');

      let strJson: string = getInspectorByKey('PatternLock_autoReset_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockAutoReset_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockAutoReset_true_0100] autoReset is: " + obj.$attrs.autoReset);

      // 设置为 true 应该是 true
      expect(obj.$attrs.autoReset).assertEqual('true');
      console.info('[patternLockAutoReset_true_0100] END');
    })

    /**
     * @tc.name   patternLockAutoReset_false_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_AUTORESET_FALSE_0100
     * @tc.desc   Test PatternLock autoReset property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockAutoReset_false_0100', Level.LEVEL2, async () => {
      console.info('[patternLockAutoReset_false_0100] START');

      let strJson: string = getInspectorByKey('PatternLock_autoReset_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockAutoReset_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockAutoReset_false_0100] autoReset is: " + obj.$attrs.autoReset);

      // 设置为 false 应该是 false
      expect(obj.$attrs.autoReset).assertEqual('false');
      console.info('[patternLockAutoReset_false_0100] END');
    })

    /**
     * @tc.name   patternLockSkipUnselectedPoint_null_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SKIPUNSELECTEDPOINT_NULL_0100
     * @tc.desc   Test PatternLock skipUnselectedPoint property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSkipUnselectedPoint_null_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSkipUnselectedPoint_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_skipUnselectedPoint_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_skipUnselectedPoint_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSkipUnselectedPoint_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSkipUnselectedPoint_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSkipUnselectedPoint_null_0100] default skipUnselectedPoint is: " + objCompare.$attrs.skipUnselectedPoint);
      console.info("[patternLockSkipUnselectedPoint_null_0100] null skipUnselectedPoint is: " + obj.$attrs.skipUnselectedPoint);

      // null 应该恢复为默认值
      expect(obj.$attrs.skipUnselectedPoint).assertEqual(objCompare.$attrs.skipUnselectedPoint);
      console.info('[patternLockSkipUnselectedPoint_null_0100] END');
    })

    /**
     * @tc.name   patternLockSkipUnselectedPoint_undefined_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SKIPUNSELECTEDPOINT_UNDEFINED_0100
     * @tc.desc   Test PatternLock skipUnselectedPoint property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSkipUnselectedPoint_undefined_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSkipUnselectedPoint_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('PatternLock_skipUnselectedPoint_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('PatternLock_skipUnselectedPoint_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSkipUnselectedPoint_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[patternLockSkipUnselectedPoint_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSkipUnselectedPoint_undefined_0100] default skipUnselectedPoint is: " + objCompare.$attrs.skipUnselectedPoint);
      console.info("[patternLockSkipUnselectedPoint_undefined_0100] undefined skipUnselectedPoint is: " + obj.$attrs.skipUnselectedPoint);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.skipUnselectedPoint).assertEqual(objCompare.$attrs.skipUnselectedPoint);
      console.info('[patternLockSkipUnselectedPoint_undefined_0100] END');
    })

    /**
     * @tc.name   patternLockSkipUnselectedPoint_true_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SKIPUNSELECTEDPOINT_TRUE_0100
     * @tc.desc   Test PatternLock skipUnselectedPoint property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSkipUnselectedPoint_true_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSkipUnselectedPoint_true_0100] START');

      let strJson: string = getInspectorByKey('PatternLock_skipUnselectedPoint_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSkipUnselectedPoint_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSkipUnselectedPoint_true_0100] skipUnselectedPoint is: " + obj.$attrs.skipUnselectedPoint);

      // 设置为 true 应该是 true
      expect(obj.$attrs.skipUnselectedPoint).assertEqual('true');
      console.info('[patternLockSkipUnselectedPoint_true_0100] END');
    })

    /**
     * @tc.name   patternLockSkipUnselectedPoint_false_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_SKIPUNSELECTEDPOINT_FALSE_0100
     * @tc.desc   Test PatternLock skipUnselectedPoint property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('patternLockSkipUnselectedPoint_false_0100', Level.LEVEL2, async () => {
      console.info('[patternLockSkipUnselectedPoint_false_0100] START');

      let strJson: string = getInspectorByKey('PatternLock_skipUnselectedPoint_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[patternLockSkipUnselectedPoint_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[patternLockSkipUnselectedPoint_false_0100] skipUnselectedPoint is: " + obj.$attrs.skipUnselectedPoint);

      // 设置为 false 应该是 false
      expect(obj.$attrs.skipUnselectedPoint).assertEqual('false');
      console.info('[patternLockSkipUnselectedPoint_false_0100] END');
    })


    /**
     * @tc.name   PatternLockChallengeResult_CORRECT_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_CHALLENGE_RESULT_CORRECT_0100
     * @tc.desc   Test PatternLock PatternLockChallengeResult CORRECT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PatternLockChallengeResult_CORRECT_0100', Level.LEVEL2, async () => {
      console.info('[PatternLockChallengeResult_CORRECT_0100] START');

      expect(PatternLockChallengeResult.CORRECT).assertEqual(1);
      console.info('[PatternLockChallengeResult_CORRECT_0100] END');
    })

    /**
     * @tc.name   PatternLockChallengeResult_WRONG_0100
     * @tc.number SUB_ARKUI_PATTERNLOCK_CHALLENGE_RESULT_WRONG_0100
     * @tc.desc   Test PatternLock PatternLockChallengeResult WRONG
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('PatternLockChallengeResult_WRONG_0100', Level.LEVEL2, async () => {
      console.info('[PatternLockChallengeResult_WRONG_0100] START');

      expect(PatternLockChallengeResult.WRONG).assertEqual(2);
      console.info('[PatternLockChallengeResult_WRONG_0100] END');
    })
  })
}
