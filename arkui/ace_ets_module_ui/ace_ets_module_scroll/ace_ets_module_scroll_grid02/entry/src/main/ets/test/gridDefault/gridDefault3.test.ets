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

export default function gridDefaultTest3() {
  describe('gridDefaultTest3', () => {
    beforeEach(async (done: Function) => {
      console.info("gridDefaultTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridDefault/gridDefault3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("gridDefault3" == pages.name)) {
          console.info("get gridDefaultTest3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridDefaultTest3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridDefaultTest3 page error:" + err);
      }
      console.info("gridDefaultTest3 beforeEach end");
      done();
    });
    
    // ========== nestedScroll tests ==========
    /**
     * @tc.name   gridNestedScrollNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_NESTEDSCROLL_NULL_0100
     * @tc.desc   Test Grid nestedScroll property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridNestedScrollNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridNestedScrollNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_nestedScroll_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[gridNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[gridNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[gridNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // null 应该恢复为默认值
      expect(JSON.parse(strJsonCompare).$type).assertEqual('Grid');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);
      console.info('[gridNestedScrollNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridNestedScrollNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_NESTEDSCROLL_NULL_0200
     * @tc.desc   Test Grid nestedScroll property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridNestedScrollNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridNestedScrollNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_nestedScroll_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridNestedScrollNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[gridNestedScrollNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[gridNestedScrollNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[gridNestedScrollNullUndefined_0200] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // undefined 应该恢复为默认值
      expect(JSON.parse(strJsonCompare).$type).assertEqual('Grid');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);
      console.info('[gridNestedScrollNullUndefined_0200] END');
    })

    // ========== enableScrollInteraction tests (boolean) ==========
    /**
     * @tc.name   gridEnableScrollInteractionNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLINTERACTION_NULL_0100
     * @tc.desc   Test Grid enableScrollInteraction property with null, should restore to default value (true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableScrollInteractionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridEnableScrollInteractionNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_enableScrollInteraction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_enableScrollInteraction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEnableScrollInteractionNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.enableScrollInteraction));
      console.info("[gridEnableScrollInteractionNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // null 应该恢复为默认值 (true)
      expect(objCompare.$attrs.enableScrollInteraction).assertEqual(true);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(objCompare.$attrs.enableScrollInteraction);
      console.info('[gridEnableScrollInteractionNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridEnableScrollInteractionNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLINTERACTION_NULL_0200
     * @tc.desc   Test Grid enableScrollInteraction property with undefined, should restore to default value (true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableScrollInteractionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridEnableScrollInteractionNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_enableScrollInteraction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_enableScrollInteraction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEnableScrollInteractionNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.enableScrollInteraction));
      console.info("[gridEnableScrollInteractionNullUndefined_0200] undefined obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // undefined 应该恢复为默认值 (true)
      expect(objCompare.$attrs.enableScrollInteraction).assertEqual(true);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(objCompare.$attrs.enableScrollInteraction);
      console.info('[gridEnableScrollInteractionNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridEnableScrollInteractionNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_ENABLESCROLLINTERACTION_FALSE_0100
     * @tc.desc   Test Grid enableScrollInteraction property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableScrollInteractionNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridEnableScrollInteractionNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_enableScrollInteraction_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableScrollInteractionNullUndefined_0300] false obj is: " +
      JSON.stringify(obj.$attrs.enableScrollInteraction));

      // false 应该设置为 false
      expect(obj.$attrs.enableScrollInteraction).assertEqual(false);
      console.info('[gridEnableScrollInteractionNullUndefined_0300] END');
    })

    // ========== friction tests ==========
    /**
     * @tc.name   gridFrictionNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_FRICTION_NULL_0100
     * @tc.desc   Test Grid friction property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridFrictionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridFrictionNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_friction_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridFrictionNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[gridFrictionNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.friction));

      // null 应该恢复为默认值
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[gridFrictionNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridFrictionNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_FRICTION_NULL_0200
     * @tc.desc   Test Grid friction property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridFrictionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridFrictionNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_friction_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_friction_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridFrictionNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.friction));
      console.info("[gridFrictionNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.friction));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.friction).assertEqual(objCompare.$attrs.friction);
      console.info('[gridFrictionNullUndefined_0200] END');
    })

    // ========== alignItems tests ==========

    /**
     * @tc.name   gridAlignItemsNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_ALIGNITEMS_NULL_0100
     * @tc.desc   Test Grid alignItems property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridAlignItemsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridAlignItemsNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_alignItems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_alignItems_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridAlignItemsNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.alignItems));
      console.info("[gridAlignItemsNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.alignItems));

      // null 应该恢复为默认值
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      console.info('[gridAlignItemsNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridAlignItemsNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_ALIGNITEMS_NULL_0200
     * @tc.desc   Test Grid alignItems property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridAlignItemsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridAlignItemsNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_alignItems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_alignItems_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridAlignItemsNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.alignItems));
      console.info("[gridAlignItemsNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.alignItems));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      console.info('[gridAlignItemsNullUndefined_0200] END');
    })

    // ========== focusWrapMode tests ==========

    /**
     * @tc.name   gridFocusWrapModeNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_FOCUSWRAPMODE_NULL_0100
     * @tc.desc   Test Grid focusWrapMode property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridFocusWrapModeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridFocusWrapModeNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_focusWrapMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_focusWrapMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridFocusWrapModeNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.focusWrapMode));
      console.info("[gridFocusWrapModeNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.focusWrapMode));

      // null 应该恢复为默认值
      expect(obj.$attrs.focusWrapMode).assertEqual(objCompare.$attrs.focusWrapMode);
      console.info('[gridFocusWrapModeNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridFocusWrapModeNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_FOCUSWRAPMODE_NULL_0200
     * @tc.desc   Test Grid focusWrapMode property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridFocusWrapModeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridFocusWrapModeNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_focusWrapMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_focusWrapMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridFocusWrapModeNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.focusWrapMode));
      console.info("[gridFocusWrapModeNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.focusWrapMode));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.focusWrapMode).assertEqual(objCompare.$attrs.focusWrapMode);
      console.info('[gridFocusWrapModeNullUndefined_0200] END');
    })

    // ========== syncLoad tests (boolean) ==========
    /**
     * @tc.name   gridSyncLoadNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_SYNCLOAD_NULL_0100
     * @tc.desc   Test Grid syncLoad property with null, should restore to default value (true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridSyncLoadNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridSyncLoadNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_syncLoad_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridSyncLoadNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.syncLoad));

      // null 应该恢复为默认值 (true)
      expect(obj.$attrs.syncLoad).assertEqual(true);
      console.info('[gridSyncLoadNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridSyncLoadNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_SYNCLOAD_NULL_0200
     * @tc.desc   Test Grid syncLoad property with undefined, should restore to default value (true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridSyncLoadNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridSyncLoadNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('grid_syncLoad_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridSyncLoadNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.syncLoad));

      // undefined 应该恢复为默认值 (true)
      expect(obj.$attrs.syncLoad).assertEqual(true);
      console.info('[gridSyncLoadNullUndefined_0200] END');
    })

    // ========== editModeOptions tests ==========

    /**
     * @tc.name   gridEditModeOptionsNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_NULL_0100
     * @tc.desc   Test Grid editModeOptions property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptionsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridEditModeOptionsNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('grid_editModeOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_editModeOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEditModeOptionsNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));
      console.info("[gridEditModeOptionsNullUndefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));

      // null 应该恢复为默认值
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation)
        .assertEqual(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation);
      console.info('[gridEditModeOptionsNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridEditModeOptionsNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_NULL_0200
     * @tc.desc   Test Grid editModeOptions property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptionsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridEditModeOptionsNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('grid_editModeOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_editModeOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridEditModeOptionsNullUndefined_0200] default obj is: " +
      JSON.stringify(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));
      console.info("[gridEditModeOptionsNullUndefined_0200] undefined obj is: " +
      JSON.stringify(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation)
        .assertEqual(objCompare.$attrs.editModeOptions.enableGatherSelectedItemsAnimation);
      console.info('[gridEditModeOptionsNullUndefined_0200] END');
    })
  })
}
