/*
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function dragPreviewOptionsNullAndUndefined() {
  describe('dragPreviewOptionsNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("dragPreviewOptionsNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragPreviewOptions/DragPreviewOptionsNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dragPreviewOptionsNullAndUndefined state success " + JSON.stringify(pages));
        if (!("DragPreviewOptionsNullAndUndefined" == pages.name)) {
          console.info("get dragPreviewOptionsNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push dragPreviewOptionsNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragPreviewOptionsNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("dragPreviewOptionsNullAndUndefined after each called");
    });

    /**
     * @tc.name   dragPreviewOptionsModeEnableDefaultShadowV1001
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_001
     * @tc.desc   Test dragPreviewOptions with mode ENABLE_DEFAULT_SHADOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsModeEnableDefaultShadowV1001', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsModeEnableDefaultShadowV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('modeEnableDefaultShadow'));
      let target = await driver.findComponent(ON.id('targetModeEnableDefaultShadow'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsModeEnableDefaultShadowV1001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('modeEnableDefaultShadow');
      console.info('[dragPreviewOptionsModeEnableDefaultShadowV1001] END');
    });

    /**
     * @tc.name   dragPreviewOptionsModeEnableDefaultRadiusV1002
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_002
     * @tc.desc   Test dragPreviewOptions with mode ENABLE_DEFAULT_RADIUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsModeEnableDefaultRadiusV1002', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsModeEnableDefaultRadiusV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('modeEnableDefaultRadius'));
      let target = await driver.findComponent(ON.id('targetModeEnableDefaultRadius'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsModeEnableDefaultRadiusV1002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('modeEnableDefaultRadius');
      console.info('[dragPreviewOptionsModeEnableDefaultRadiusV1002] END');
    });

    /**
     * @tc.name   dragPreviewOptionsModeEnableDragItemGrayEffectV1003
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_003
     * @tc.desc   Test dragPreviewOptions with mode ENABLE_DRAG_ITEM_GRAY_EFFECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsModeEnableDragItemGrayEffectV1003', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsModeEnableDragItemGrayEffectV1003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('modeEnableDragItemGrayEffect'));
      let target = await driver.findComponent(ON.id('targetModeEnableDragItemGrayEffect'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsModeEnableDragItemGrayEffectV1003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('modeEnableDragItemGrayEffect');
      console.info('[dragPreviewOptionsModeEnableDragItemGrayEffectV1003] END');
    });

    /**
     * @tc.name   dragPreviewOptionsModeEnableMultiTileEffectV1004
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_004
     * @tc.desc   Test dragPreviewOptions with mode ENABLE_MULTI_TILE_EFFECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsModeEnableMultiTileEffectV1004', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsModeEnableMultiTileEffectV1004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('modeEnableMultiTileEffect'));
      let target = await driver.findComponent(ON.id('targetModeEnableMultiTileEffect'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsModeEnableMultiTileEffectV1004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('modeEnableMultiTileEffect');
      console.info('[dragPreviewOptionsModeEnableMultiTileEffectV1004] END');
    });

    /**
     * @tc.name   dragPreviewOptionsModeEnableTouchPointCalculationV1005
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_005
     * @tc.desc   Test dragPreviewOptions with mode ENABLE_TOUCH_POINT_CALCULATION_BASED_ON_FINAL_PREVIEW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsModeEnableTouchPointCalculationV1005', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsModeEnableTouchPointCalculationV1005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('modeEnableTouchPointCalculation'));
      let target = await driver.findComponent(ON.id('targetModeEnableTouchPointCalculation'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsModeEnableTouchPointCalculationV1005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('modeEnableTouchPointCalculation');
      console.info('[dragPreviewOptionsModeEnableTouchPointCalculationV1005] END');
    });

    /**
     * @tc.name   dragPreviewOptionsNumberBadgeTrueV1006
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_006
     * @tc.desc   Test dragPreviewOptions with numberBadge true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsNumberBadgeTrueV1006', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsNumberBadgeTrueV1006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('numberBadgeTrue'));
      let target = await driver.findComponent(ON.id('targetNumberBadgeTrue'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsNumberBadgeTrueV1006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('numberBadgeTrue');
      console.info('[dragPreviewOptionsNumberBadgeTrueV1006] END');
    });

    /**
     * @tc.name   dragPreviewOptionsNumberBadgeFalseV1007
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_007
     * @tc.desc   Test dragPreviewOptions with numberBadge false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsNumberBadgeFalseV1007', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsNumberBadgeFalseV1007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('numberBadgeFalse'));
      let target = await driver.findComponent(ON.id('targetNumberBadgeFalse'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsNumberBadgeFalseV1007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('numberBadgeFalse');
      console.info('[dragPreviewOptionsNumberBadgeFalseV1007] END');
    });

    /**
     * @tc.name   dragPreviewOptionsIsMultiSelectionEnabledFalseV1008
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_008
     * @tc.desc   Test dragPreviewOptions with isMultiSelectionEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsIsMultiSelectionEnabledFalseV1008', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsIsMultiSelectionEnabledFalseV1008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('isMultiSelectionEnabledFalse'));
      let target = await driver.findComponent(ON.id('targetIsMultiSelectionEnabledFalse'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsIsMultiSelectionEnabledFalseV1008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('isMultiSelectionEnabledFalse');
      console.info('[dragPreviewOptionsIsMultiSelectionEnabledFalseV1008] END');
    });

    /**
     * @tc.name   dragPreviewOptionsDefaultAnimationBeforeLiftingFalseV1009
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_009
     * @tc.desc   Test dragPreviewOptions with defaultAnimationBeforeLifting false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsDefaultAnimationBeforeLiftingFalseV1009', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsDefaultAnimationBeforeLiftingFalseV1009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('defaultAnimationBeforeLiftingFalse'));
      let target = await driver.findComponent(ON.id('targetDefaultAnimationBeforeLiftingFalse'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsDefaultAnimationBeforeLiftingFalseV1009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('defaultAnimationBeforeLiftingFalse');
      console.info('[dragPreviewOptionsDefaultAnimationBeforeLiftingFalseV1009] END');
    });

    /**
     * @tc.name   dragPreviewOptionsEnableHapticFeedbackTrueV1010
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_010
     * @tc.desc   Test dragPreviewOptions with enableHapticFeedback true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsEnableHapticFeedbackTrueV1010', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsEnableHapticFeedbackTrueV1010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('enableHapticFeedbackTrue'));
      let target = await driver.findComponent(ON.id('targetEnableHapticFeedbackTrue'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsEnableHapticFeedbackTrueV1010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('enableHapticFeedbackTrue');
      console.info('[dragPreviewOptionsEnableHapticFeedbackTrueV1010] END');
    });

    /**
     * @tc.name   dragPreviewOptionsEnableHapticFeedbackFalseV1011
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_011
     * @tc.desc   Test dragPreviewOptions with enableHapticFeedback false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsEnableHapticFeedbackFalseV1011', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsEnableHapticFeedbackFalseV1011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('enableHapticFeedbackFalse'));
      let target = await driver.findComponent(ON.id('targetEnableHapticFeedbackFalse'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsEnableHapticFeedbackFalseV1011] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('enableHapticFeedbackFalse');
      console.info('[dragPreviewOptionsEnableHapticFeedbackFalseV1011] END');
    });

    /**
     * @tc.name   dragPreviewOptionsEnableEdgeAutoScrollTrueV1012
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_012
     * @tc.desc   Test dragPreviewOptions with enableEdgeAutoScroll true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsEnableEdgeAutoScrollTrueV1012', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsEnableEdgeAutoScrollTrueV1012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('enableEdgeAutoScrollTrue'));
      let target = await driver.findComponent(ON.id('targetEnableEdgeAutoScrollTrue'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsEnableEdgeAutoScrollTrueV1012] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('enableEdgeAutoScrollTrue');
      console.info('[dragPreviewOptionsEnableEdgeAutoScrollTrueV1012] END');
    });

    /**
     * @tc.name   dragPreviewOptionsEnableEdgeAutoScrollFalseV1013
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_013
     * @tc.desc   Test dragPreviewOptions with enableEdgeAutoScroll false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsEnableEdgeAutoScrollFalseV1013', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsEnableEdgeAutoScrollFalseV1013] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('enableEdgeAutoScrollFalse'));
      let target = await driver.findComponent(ON.id('targetEnableEdgeAutoScrollFalse'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsEnableEdgeAutoScrollFalseV1013] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('enableEdgeAutoScrollFalse');
      console.info('[dragPreviewOptionsEnableEdgeAutoScrollFalseV1013] END');
    });

    /**
     * @tc.name   dragPreviewOptionsIsLiftingDisabledTrueV1014
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_014
     * @tc.desc   Test dragPreviewOptions with isLiftingDisabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsIsLiftingDisabledTrueV1014', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsIsLiftingDisabledTrueV1014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('isLiftingDisabledTrue'));
      let target = await driver.findComponent(ON.id('targetIsLiftingDisabledTrue'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsIsLiftingDisabledTrueV1014] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('isLiftingDisabledTrue');
      console.info('[dragPreviewOptionsIsLiftingDisabledTrueV1014] END');
    });

    /**
     * @tc.name   dragPreviewOptionsFirstParamNullV1015
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_015
     * @tc.desc   Test dragPreviewOptions with first param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsFirstParamNullV1015', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsFirstParamNullV1015] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('firstParamNull'));
      let target = await driver.findComponent(ON.id('targetFirstParamNull'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsFirstParamNullV1015] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('firstParamNull');
      console.info('[dragPreviewOptionsFirstParamNullV1015] END');
    });

    /**
     * @tc.name   dragPreviewOptionsFirstParamUndefinedV1016
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_016
     * @tc.desc   Test dragPreviewOptions with first param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsFirstParamUndefinedV1016', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsFirstParamUndefinedV1016] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('firstParamUndefined'));
      let target = await driver.findComponent(ON.id('targetFirstParamUndefined'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsFirstParamUndefinedV1016] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('firstParamUndefined');
      console.info('[dragPreviewOptionsFirstParamUndefinedV1016] END');
    });

    /**
     * @tc.name   dragPreviewOptionsSecondParamNullV1017
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_017
     * @tc.desc   Test dragPreviewOptions with second param null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsSecondParamNullV1017', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsSecondParamNullV1017] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('secondParamNull'));
      let target = await driver.findComponent(ON.id('targetSecondParamNull'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsSecondParamNullV1017] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('secondParamNull');
      console.info('[dragPreviewOptionsSecondParamNullV1017] END');
    });

    /**
     * @tc.name   dragPreviewOptionsSecondParamUndefinedV1018
     * @tc.number SUB_ARKUI_DRAGPREVIEWOPTIONS_PARAM_018
     * @tc.desc   Test dragPreviewOptions with second param undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('dragPreviewOptionsSecondParamUndefinedV1018', Level.LEVEL0, async () => {
      console.info('[dragPreviewOptionsSecondParamUndefinedV1018] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let source = await driver.findComponent(ON.id('secondParamUndefined'));
      let target = await driver.findComponent(ON.id('targetSecondParamUndefined'));
      await source.dragTo(target);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('resultText3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[dragPreviewOptionsSecondParamUndefinedV1018] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('secondParamUndefined');
      console.info('[dragPreviewOptionsSecondParamUndefinedV1018] END');
    });
  })
}
