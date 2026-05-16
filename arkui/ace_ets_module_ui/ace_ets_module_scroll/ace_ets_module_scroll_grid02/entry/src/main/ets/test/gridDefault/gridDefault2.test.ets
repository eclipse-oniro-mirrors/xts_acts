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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridDefaultTest2() {
  describe('gridDefaultTest2', () => {
    beforeEach(async (done: Function) => {
      console.info("gridDefaultTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridDefault/gridDefault2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("gridDefault2" == pages.name)) {
          console.info("get gridDefaultTest2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridDefaultTest2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridDefaultTest2 page error:" + err);
      }
      console.info("gridDefaultTest2 beforeEach end");
      done();
    });

    // ========== editMode tests (boolean) ==========
    /**
     * @tc.name   gridEditModeNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_EDITMODE_NULL_0100
     * @tc.desc   Test Grid editMode property with null, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridEditModeNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_editMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_editMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEditModeNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.editMode));
      console.info("[gridEditModeNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.editMode));

      // null 应该恢复为默认值 (false)
      expect(objCompare.$attrs.editMode).assertEqual('false');
      expect(obj.$attrs.editMode).assertEqual(objCompare.$attrs.editMode);
      console.info('[gridEditModeNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridEditModeNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_EDITMODE_NULL_0200
     * @tc.desc   Test Grid editMode property with undefined, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridEditModeNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_editMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_editMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEditModeNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.editMode));
      console.info("[gridEditModeNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.editMode));

      // undefined 应该恢复为默认值 (false)
      expect(objCompare.$attrs.editMode).assertEqual('false');
      expect(obj.$attrs.editMode).assertEqual(objCompare.$attrs.editMode);
      console.info('[gridEditModeNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridEditModeNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_EDITMODE_TRUE_0100
     * @tc.desc   Test Grid editMode property with true (对照)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridEditModeNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_editMode_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEditModeNullUndefined_0300] true obj is: " + JSON.stringify(obj.$attrs.editMode));

      // true 应该设置为 true
      expect(obj.$attrs.editMode).assertEqual('true');
      console.info('[gridEditModeNullUndefined_0300] END');
    })

    // ========== multiSelectable tests (boolean) ==========
    /**
     * @tc.name   gridMultiSelectableNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_MULTISELECTABLE_NULL_0100
     * @tc.desc   Test Grid multiSelectable property with null, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridMultiSelectableNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridMultiSelectableNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_multiSelectable_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_multiSelectable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridMultiSelectableNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.multiSelectable));
      console.info("[gridMultiSelectableNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.multiSelectable));

      // null 应该恢复为默认值 (false)
      expect(objCompare.$attrs.multiSelectable).assertEqual('false');
      expect(obj.$attrs.multiSelectable).assertEqual(objCompare.$attrs.multiSelectable);
      console.info('[gridMultiSelectableNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridMultiSelectableNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_MULTISELECTABLE_NULL_0200
     * @tc.desc   Test Grid multiSelectable property with undefined, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridMultiSelectableNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridMultiSelectableNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_multiSelectable_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_multiSelectable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridMultiSelectableNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.multiSelectable));
      console.info("[gridMultiSelectableNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.multiSelectable));

      // undefined 应该恢复为默认值 (false)
      expect(objCompare.$attrs.multiSelectable).assertEqual('false');
      expect(obj.$attrs.multiSelectable).assertEqual(objCompare.$attrs.multiSelectable);
      console.info('[gridMultiSelectableNullUndefined_0200] END');
    })

    // ========== maxCount tests ==========
    /**
     * @tc.name   gridMaxCountNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_MAXCOUNT_NULL_0100
     * @tc.desc   Test Grid maxCount property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridMaxCountNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridMaxCountNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_maxCount_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_maxCount_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridMaxCountNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.maxCount));
      console.info("[gridMaxCountNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.maxCount));

      // null 应该恢复为默认值
      expect(obj.$attrs.maxCount).assertEqual(objCompare.$attrs.maxCount);
      console.info('[gridMaxCountNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridMaxCountNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_MAXCOUNT_NULL_0200
     * @tc.desc   Test Grid maxCount property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridMaxCountNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridMaxCountNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_maxCount_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_maxCount_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridMaxCountNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.maxCount));
      console.info("[gridMaxCountNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.maxCount));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxCount).assertEqual(objCompare.$attrs.maxCount);
      console.info('[gridMaxCountNullUndefined_0200] END');
    })

    // ========== minCount tests ==========
    /**
     * @tc.name   gridMinCountNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_MINCOUNT_NULL_0100
     * @tc.desc   Test Grid minCount property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridMinCountNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridMinCountNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_minCount_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_minCount_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridMinCountNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.minCount));
      console.info("[gridMinCountNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.minCount));

      // null 应该恢复为默认值
      expect(obj.$attrs.minCount).assertEqual(objCompare.$attrs.minCount);
      console.info('[gridMinCountNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridMinCountNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_MINCOUNT_NULL_0200
     * @tc.desc   Test Grid minCount property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridMinCountNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridMinCountNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_minCount_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_minCount_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridMinCountNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.minCount));
      console.info("[gridMinCountNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.minCount));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minCount).assertEqual(objCompare.$attrs.minCount);
      console.info('[gridMinCountNullUndefined_0200] END');
    })

    // ========== cellLength tests ==========
    /**
     * @tc.name   gridCellLengthNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_CELLLENGTH_NULL_0100
     * @tc.desc   Test Grid cellLength property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridCellLengthNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridCellLengthNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_cellLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_cellLength_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridCellLengthNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.cellLength));
      console.info("[gridCellLengthNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.cellLength));

      // null 应该恢复为默认值
      expect(obj.$attrs.cellLength).assertEqual(objCompare.$attrs.cellLength);
      console.info('[gridCellLengthNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridCellLengthNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_CELLLENGTH_NULL_0200
     * @tc.desc   Test Grid cellLength property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridCellLengthNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridCellLengthNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_cellLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_cellLength_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridCellLengthNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.cellLength));
      console.info("[gridCellLengthNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.cellLength));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.cellLength).assertEqual(objCompare.$attrs.cellLength);
      console.info('[gridCellLengthNullUndefined_0200] END');
    })

    // ========== supportAnimation tests (boolean) ==========
    /**
     * @tc.name   gridSupportAnimationNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_SUPPORTANIMATION_NULL_0100
     * @tc.desc   Test Grid supportAnimation property with null, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridSupportAnimationNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridSupportAnimationNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_supportAnimation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_supportAnimation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridSupportAnimationNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.supportAnimation));
      console.info("[gridSupportAnimationNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.supportAnimation));

      // null 应该恢复为默认值 (false)
      expect(objCompare.$attrs.supportAnimation).assertEqual('false');
      expect(obj.$attrs.supportAnimation).assertEqual(objCompare.$attrs.supportAnimation);
      console.info('[gridSupportAnimationNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridSupportAnimationNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_SUPPORTANIMATION_NULL_0200
     * @tc.desc   Test Grid supportAnimation property with undefined, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridSupportAnimationNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridSupportAnimationNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_supportAnimation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_supportAnimation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridSupportAnimationNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.supportAnimation));
      console.info("[gridSupportAnimationNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.supportAnimation));

      // undefined 应该恢复为默认值 (false)
      expect(objCompare.$attrs.supportAnimation).assertEqual('false');
      expect(obj.$attrs.supportAnimation).assertEqual(objCompare.$attrs.supportAnimation);
      console.info('[gridSupportAnimationNullUndefined_0200] END');
    })

    // ========== edgeEffect tests ==========
    /**
     * @tc.name   gridEdgeEffectNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_EDGEEFFECT_NULL_0100
     * @tc.desc   Test Grid edgeEffect property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEdgeEffectNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridEdgeEffectNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_edgeEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_edgeEffect_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEdgeEffectNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.edgeEffect));
      console.info("[gridEdgeEffectNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.edgeEffect));

      // null 应该恢复为默认值
      expect(obj.$attrs.edgeEffect).assertEqual(objCompare.$attrs.edgeEffect);
      console.info('[gridEdgeEffectNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridEdgeEffectNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_EDGEEFFECT_NULL_0200
     * @tc.desc   Test Grid edgeEffect property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEdgeEffectNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridEdgeEffectNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_edgeEffect_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_edgeEffect_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEdgeEffectNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.edgeEffect));
      console.info("[gridEdgeEffectNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.edgeEffect));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.edgeEffect).assertEqual(objCompare.$attrs.edgeEffect);
      console.info('[gridEdgeEffectNullUndefined_0200] END');
    })
  })
}
