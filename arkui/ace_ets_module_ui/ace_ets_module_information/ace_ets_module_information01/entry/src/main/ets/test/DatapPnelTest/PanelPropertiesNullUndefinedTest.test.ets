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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import CommonFunc from '../../MainAbility/common/Common';

export default function PanelPropertiesNullUndefinedTest() {
  describe('PanelPropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("DataPanelPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/PanelPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gauge state success " + JSON.stringify(pages));
        if (!("PanelPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get PanelPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push PanelPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PanelPropertiesNullUndefinedTest page error: " + err);
      }
    });

    /**
     * @tc.name   panelMode_null_0100
     * @tc.number SUB_ARKUI_PANEL_MODE_NULL_0100
     * @tc.desc   Test Panel mode property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelMode_null_0100', Level.LEVEL2, async () => {
      console.info('[panelMode_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_mode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_mode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelMode_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelMode_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelMode_null_0100] default mode is: " + JSON.stringify(objCompare.$attrs.mode));
      console.info("[panelMode_null_0100] null mode is: " + JSON.stringify(obj.$attrs.mode));

      // null 应该恢复为默认值
      expect(obj.$attrs.mode).assertEqual(objCompare.$attrs.mode);
      console.info('[panelMode_null_0100] END');
    })

    /**
     * @tc.name   panelMode_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_MODE_UNDEFINED_0100
     * @tc.desc   Test Panel mode property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelMode_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelMode_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_mode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_mode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelMode_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelMode_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelMode_undefined_0100] default mode is: " + JSON.stringify(objCompare.$attrs.mode));
      console.info("[panelMode_undefined_0100] undefined mode is: " + JSON.stringify(obj.$attrs.mode));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.mode).assertEqual(objCompare.$attrs.mode);
      console.info('[panelMode_undefined_0100] END');
    })

    /**
     * @tc.name   panelType_null_0100
     * @tc.number SUB_ARKUI_PANEL_TYPE_NULL_0100
     * @tc.desc   Test Panel type property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelType_null_0100', Level.LEVEL2, async () => {
      console.info('[panelType_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_type_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_type_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelType_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelType_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelType_null_0100] default type is: " + JSON.stringify(objCompare.$attrs.type));
      console.info("[panelType_null_0100] null type is: " + JSON.stringify(obj.$attrs.type));

      // null 应该恢复为默认值
      expect(obj.$attrs.type).assertEqual(objCompare.$attrs.type);
      console.info('[panelType_null_0100] END');
    })

    /**
     * @tc.name   panelType_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_TYPE_UNDEFINED_0100
     * @tc.desc   Test Panel type property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelType_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelType_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_type_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_type_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelType_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelType_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelType_undefined_0100] default type is: " + JSON.stringify(objCompare.$attrs.type));
      console.info("[panelType_undefined_0100] undefined type is: " + JSON.stringify(obj.$attrs.type));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.type).assertEqual(objCompare.$attrs.type);
      console.info('[panelType_undefined_0100] END');
    })

    /**
     * @tc.name   panelDragBar_null_0100
     * @tc.number SUB_ARKUI_PANEL_DRAGBAR_NULL_0100
     * @tc.desc   Test Panel dragBar property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelDragBar_null_0100', Level.LEVEL2, async () => {
      console.info('[panelDragBar_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_dragBar_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_dragBar_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelDragBar_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelDragBar_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelDragBar_null_0100] default dragBar is: " + JSON.stringify(objCompare.$attrs.dragBar));
      console.info("[panelDragBar_null_0100] null dragBar is: " + JSON.stringify(obj.$attrs.dragBar));

      // null 应该恢复为默认值
      expect(obj.$attrs.dragBar).assertEqual(objCompare.$attrs.dragBar);
      console.info('[panelDragBar_null_0100] END');
    })

    /**
     * @tc.name   panelDragBar_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_DRAGBAR_UNDEFINED_0100
     * @tc.desc   Test Panel dragBar property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelDragBar_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelDragBar_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_dragBar_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_dragBar_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelDragBar_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelDragBar_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelDragBar_undefined_0100] default dragBar is: " + JSON.stringify(objCompare.$attrs.dragBar));
      console.info("[panelDragBar_undefined_0100] undefined dragBar is: " + JSON.stringify(obj.$attrs.dragBar));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.dragBar).assertEqual(objCompare.$attrs.dragBar);
      console.info('[panelDragBar_undefined_0100] END');
    })

    /**
     * @tc.name   panelCustomHeight_null_0100
     * @tc.number SUB_ARKUI_PANEL_CUSTOMHEIGHT_NULL_0100
     * @tc.desc   Test Panel customHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelCustomHeight_null_0100', Level.LEVEL2, async () => {
      console.info('[panelCustomHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_customHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_customHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelCustomHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelCustomHeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelCustomHeight_null_0100] default customHeight is: " + JSON.stringify(objCompare.$attrs.customHeight));
      console.info("[panelCustomHeight_null_0100] null customHeight is: " + JSON.stringify(obj.$attrs.customHeight));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.customHeight)).assertEqual(JSON.stringify(objCompare.$attrs.customHeight));
      console.info('[panelCustomHeight_null_0100] END');
    })

    /**
     * @tc.name   panelCustomHeight_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_CUSTOMHEIGHT_UNDEFINED_0100
     * @tc.desc   Test Panel customHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelCustomHeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelCustomHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_customHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_customHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelCustomHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelCustomHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelCustomHeight_undefined_0100] default customHeight is: " + JSON.stringify(objCompare.$attrs.customHeight));
      console.info("[panelCustomHeight_undefined_0100] undefined customHeight is: " + JSON.stringify(obj.$attrs.customHeight));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.customHeight)).assertEqual(JSON.stringify(objCompare.$attrs.customHeight));
      console.info('[panelCustomHeight_undefined_0100] END');
    })

    /**
     * @tc.name   panelFullHeight_null_0100
     * @tc.number SUB_ARKUI_PANEL_FULLHEIGHT_NULL_0100
     * @tc.desc   Test Panel fullHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelFullHeight_null_0100', Level.LEVEL2, async () => {
      console.info('[panelFullHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_fullHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_fullHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelFullHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelFullHeight_null_0100] null obj obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelFullHeight_null_0100] default fullHeight is: " + JSON.stringify(objCompare.$attrs.fullHeight));
      console.info("[panelFullHeight_null_0100] null fullHeight is: " + JSON.stringify(obj.$attrs.fullHeight));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.fullHeight)).assertEqual(JSON.stringify(objCompare.$attrs.fullHeight));
      console.info('[panelFullHeight_null_0100] END');
    })

    /**
     * @tc.name   panelFullHeight_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_FULLHEIGHT_UNDEFINED_0100
     * @tc.desc   Test Panel fullHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelFullHeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelFullHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_fullHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_fullHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelFullHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelFullHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelFullHeight_undefined_0100] default fullHeight is: " + JSON.stringify(objCompare.$attrs.fullHeight));
      console.info("[panelFullHeight_undefined_0100] undefined fullHeight is: " + JSON.stringify(obj.$attrs.fullHeight));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.fullHeight)).assertEqual(JSON.stringify(objCompare.$attrs.fullHeight));
      console.info('[panelFullHeight_undefined_0100] END');
    })

    /**
     * @tc.name   panelFullHeight_emptyString_0100
     * @tc.number SUB_ARKUI_PANEL_FULLHEIGHT_EMPTYSTRING_0100
     * @tc.desc   Test Panel fullHeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelFullHeight_emptyString_0100', Level.LEVEL2, async () => {
      console.info('[panelFullHeight_emptyString_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_fullHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_fullHeight_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelFullHeight_emptyString_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelFullHeight_emptyString_0100] emptyString obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelFullHeight_emptyString_0100] default fullHeight is: " + JSON.stringify(objCompare.$attrs.fullHeight));
      console.info("[panelFullHeight_emptyString_0100] emptyString fullHeight is: " + JSON.stringify(obj.$attrs.fullHeight));

      // empty string 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.type)).assertEqual(JSON.stringify(objCompare.$attrs.type));
      console.info('[panelFullHeight_emptyString_0100] END');
    })

    /**
     * @tc.name   panelHalfHeight_null_0100
     * @tc.number SUB_ARKUI_PANEL_HALFHEIGHT_NULL_0100
     * @tc.desc   Test Panel halfHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelHalfHeight_null_0100', Level.LEVEL2, async () => {
      console.info('[panelHalfHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_halfHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_halfHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelHalfHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelHalfHeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelHalfHeight_null_0100] default halfHeight is: " + JSON.stringify(objCompare.$attrs.halfHeight));
      console.info("[panelHalfHeight_null_0100] null halfHeight is: " + JSON.stringify(obj.$attrs.halfHeight));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.halfHeight)).assertEqual(JSON.stringify(objCompare.$attrs.halfHeight));
      console.info('[panelHalfHeight_null_0100] END');
    })

    /**
     * @tc.name   panelHalfHeight_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_HALFHEIGHT_UNDEFINED_0100
     * @tc.desc   Test Panel halfHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelHalfHeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelHalfHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_halfHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_halfHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelHalfHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelHalfHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelHalfHeight_undefined_0100] default halfHeight is: " + JSON.stringify(objCompare.$attrs.halfHeight));
      console.info("[panelHalfHeight_undefined_0100] undefined halfHeight is: " + JSON.stringify(obj.$attrs.halfHeight));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.halfHeight)).assertEqual(JSON.stringify(objCompare.$attrs.halfHeight));
      console.info('[panelHalfHeight_undefined_0100] END');
    })

    /**
     * @tc.name   panelHalfHeight_emptyString_0100
     * @tc.number SUB_ARKUI_PANEL_HALFHEIGHT_EMPTYSTRING_0100
     * @tc.desc   Test Panel halfHeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST

     * @tc.level  LEVEL2
     */
    it('panelHalfHeight_emptyString_0100', Level.LEVEL2, async () => {
      console.info('[panelHalfHeight_emptyString_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_halfHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_halfHeight_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelHalfHeight_emptyString_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelHalfHeight_emptyString_0100] emptyString obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelHalfHeight_emptyString_0100] default halfHeight is: " + JSON.stringify(objCompare.$attrs.halfHeight));
      console.info("[panelHalfHeight_emptyString_0100] emptyString halfHeight is: " + JSON.stringify(obj.$attrs.halfHeight));

      // empty string 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.type)).assertEqual(JSON.stringify(objCompare.$attrs.type));
      console.info('[panelHalfHeight_emptyString_0100] END');
    })

    /**
     * @tc.name   panelMiniHeight_null_0100
     * @tc.number SUB_ARKUI_PANEL_MINIHEIGHT_NULL_0100
     * @tc.desc   Test Panel miniHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelMiniHeight_null_0100', Level.LEVEL2, async () => {
      console.info('[panelMiniHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_miniHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_miniHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelMiniHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelMiniHeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelMiniHeight_null_0100] default miniHeight is: " + JSON.stringify(objCompare.$attrs.miniHeight));
      console.info("[panelMiniHeight_null_0100] null miniHeight is: " + JSON.stringify(obj.$attrs.miniHeight));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.miniHeight)).assertEqual(JSON.stringify(objCompare.$attrs.miniHeight));
      console.info('[panelMiniHeight_null_0100] END');
    })

    /**
     * @tc.name   panelMiniHeight_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_MINIHEIGHT_UNDEFINED_0100
     * @tc.desc   Test Panel miniHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelMiniHeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelMiniHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_miniHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_miniHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelMiniHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelMiniHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelMiniHeight_undefined_0100] default miniHeight is: " + JSON.stringify(objCompare.$attrs.miniHeight));
      console.info("[panelMiniHeight_undefined_0100] undefined miniHeight is: " + JSON.stringify(obj.$attrs.miniHeight));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.miniHeight)).assertEqual(JSON.stringify(objCompare.$attrs.miniHeight));
      console.info('[panelMiniHeight_undefined_0100] END');
    })

    /**
     * @tc.name   panelMiniHeight_emptyString_0100
     * @tc.number SUB_ARKUI_PANEL_MINIHEIGHT_EMPTYSTRING_0100
     * @tc.desc   Test Panel miniHeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelMiniHeight_emptyString_0100', Level.LEVEL2, async () => {
      console.info('[panelMiniHeight_emptyString_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_miniHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_miniHeight_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelMiniHeight_emptyString_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelMiniHeight_emptyString_0100] emptyString obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelMiniHeight_emptyString_0100] default miniHeight is: " + JSON.stringify(objCompare.$attrs.miniHeight));
      console.info("[panelMiniHeight_emptyString_0100] emptyString miniHeight is: " + JSON.stringify(obj.$attrs.miniHeight));

      // empty string 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.type)).assertEqual(JSON.stringify(objCompare.$attrs.type));
      console.info('[panelMiniHeight_emptyString_0100] END');
    })

    /**
     * @tc.name   panelShow_null_0100
     * @tc.number SUB_ARKUI_PANEL_SHOW_NULL_0100
     * @tc.desc   Test Panel show property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelShow_null_0100', Level.LEVEL2, async () => {
      console.info('[panelShow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_show_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_show_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelShow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelShow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelShow_null_0100] default show is: " + JSON.stringify(objCompare.$attrs.show));
      console.info("[panelShow_null_0100] null show is: " + JSON.stringify(obj.$attrs.show));

      // null 应该恢复为默认值
      expect(obj.$attrs.show).assertEqual(objCompare.$attrs.show);
      console.info('[panelShow_null_0100] END');
    })

    /**
     * @tc.name   panelShow_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_SHOW_UNDEFINED_0100
     * @tc.desc   Test Panel show property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelShow_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelShow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_show_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_show_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelShow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelShow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelShow_undefined_0100] default show is: " + JSON.stringify(objCompare.$attrs.show));
      console.info("[panelShow_undefined_0100] undefined show is: " + JSON.stringify(obj.$attrs.show));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.show).assertEqual(objCompare.$attrs.show);
      console.info('[panelShow_undefined_0100] END');
    })

    /**
     * @tc.name   panelShow_false_0100
     * @tc.number SUB_ARKUI_PANEL_SHOW_FALSE_0100
     * @tc.desc   Test Panel show property with false, should hide the panel
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelShow_false_0100', Level.LEVEL2, async () => {
      console.info('[panelShow_false_0100] START');

      let strJson: string = getInspectorByKey('Panel_show_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelShow_false_0100] false obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelShow_false_0100] false show is: " + JSON.stringify(obj.$attrs.show));

      // false 应该设置为 false
      expect(obj.$attrs.show).assertEqual('false');
      console.info('[panelShow_false_0100] END');
    })

    /**
     * @tc.name   panelBackgroundMask_null_0100
     * @tc.number SUB_ARKUI_PANEL_BACKGROUNDMASK_NULL_0100
     * @tc.desc   Test Panel backgroundMask property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelBackgroundMask_null_0100', Level.LEVEL2, async () => {
      console.info('[panelBackgroundMask_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_backgroundMask_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_backgroundMask_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelBackgroundMask_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelBackgroundMask_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelBackgroundMask_null_0100] default backgroundMask is: " + JSON.stringify(objCompare.$attrs.backgroundMask));
      console.info("[panelBackgroundMask_null_0100] null backgroundMask is: " + JSON.stringify(obj.$attrs.backgroundMask));

      // null 应该恢复为默认值
      expect(obj.$attrs.backgroundMask).assertEqual(objCompare.$attrs.backgroundMask);
      console.info('[panelBackgroundMask_null_0100] END');
    })

    /**
     * @tc.name   panelBackgroundMask_undefined_0100
     * @tc.number SUB_ARKUI_PANEL_BACKGROUNDMASK_UNDEFINED_0100
     * @tc.desc   Test Panel backgroundMask property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelBackgroundMask_undefined_0100', Level.LEVEL2, async () => {
      console.info('[panelBackgroundMask_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_backgroundMask_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_backgroundMask_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelBackgroundMask_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelBackgroundMask_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelBackgroundMask_undefined_0100] default backgroundMask is: " + JSON.stringify(objCompare.$attrs.backgroundMask));
      console.info("[panelBackgroundMask_undefined_0100] undefined backgroundMask is: " + JSON.stringify(obj.$attrs.backgroundMask));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.backgroundMask).assertEqual(objCompare.$attrs.backgroundMask);
      console.info('[panelBackgroundMask_undefined_0100] END');
    })

    /**
     * @tc.name   panelBackgroundMask_emptyString_0100
     * @tc.number SUB_ARKUI_PANEL_BACKGROUNDMASK_EMPTYSTRING_0100
     * @tc.desc   Test Panel backgroundMask property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('panelBackgroundMask_emptyString_0100', Level.LEVEL2, async () => {
      console.info('[panelBackgroundMask_emptyString_0100] START');

      let strJsonCompare: string = getInspectorByKey('Panel_backgroundMask_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Panel_backgroundMask_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[panelBackgroundMask_emptyString_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[panelBackgroundMask_emptyString_0100] emptyString obj is: " + JSON.stringify(obj.$attrs));
      console.info("[panelBackgroundMask_emptyString_0100] default backgroundMask is: " + JSON.stringify(objCompare.$attrs.backgroundMask));
      console.info("[panelBackgroundMask_emptyString_0100] emptyString backgroundMask is: " + JSON.stringify(obj.$attrs.backgroundMask));

      // empty string 应该恢复为默认值
      expect(obj.$attrs.backgroundMask).assertEqual(objCompare.$attrs.backgroundMask);
      console.info('[panelBackgroundMask_emptyString_0100] END');
    })
  })
}
