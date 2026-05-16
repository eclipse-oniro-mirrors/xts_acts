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
import CommonFunc from '../../MainAbility/common/Common';
import router from '@ohos.router';

export default function EditDecorationThicknessScaleTest() {
  describe('EditDecorationThicknessScaleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("EditDecorationThicknessScaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EditCommon/EditDecorationThicknessScale',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get EditDecorationThicknessScaleTest state pages:" + JSON.stringify(pages));
        if (!("EditDecorationThicknessScale" == pages.name)) {
          console.info("get EditDecorationThicknessScaleTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push EditDecorationThicknessScaleTest success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push EditDecorationThicknessScaleTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    // ==================== TextArea Tests ====================

    /**
     * @tc.name   textAreaDecorationThicknessScale_default_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0100
     * @tc.desc   Test TextArea decoration thicknessScale with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_default_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_default_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_default_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_default_0100] decoration is: " + obj.$attrs.decoration);
      
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_default_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_1_0_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0200
     * @tc.desc   Test TextArea decoration thicknessScale with value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_1_0_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_1_0_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_1_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_1_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_1_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_1_0_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_2_0_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0300
     * @tc.desc   Test TextArea decoration thicknessScale with value 2.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_2_0_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_2_0_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_2_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_2_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_2_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));
      
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"2.000000"');
      console.info('[textAreaDecorationThicknessScale_2_0_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_0_5_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0400
     * @tc.desc   Test TextArea decoration thicknessScale with value 0.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_0_5_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_0_5_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_0_5');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_0_5_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_0_5_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));
      
      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"0.500000"');
      console.info('[textAreaDecorationThicknessScale_0_5_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_3_0_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0500
     * @tc.desc   Test TextArea decoration thicknessScale with value 3.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_3_0_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_3_0_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_3_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_3_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_3_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"3.000000"');
      console.info('[textAreaDecorationThicknessScale_3_0_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_0_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0600
     * @tc.desc   Test TextArea decoration thicknessScale with value 0 (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_0_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_0_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"0.000000"');
      console.info('[textAreaDecorationThicknessScale_0_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_negative_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0700
     * @tc.desc   Test TextArea decoration thicknessScale with negative value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_negative_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_negative_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_negative');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_negative_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_negative_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_negative_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0800
     * @tc.desc   Test TextArea decoration thicknessScale with null value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_null_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_null_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_null_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_null_0100] END');
    })

    /**
     * @tc.name   textAreaDecorationThicknessScale_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_DECORATION_THICKNESSSCALE_0900
     * @tc.desc   Test TextArea decoration thicknessScale with undefined value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textAreaDecorationThicknessScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaDecorationThicknessScale_undefined_0100] START');

      let strJson: string = getInspectorByKey('textarea_decoration_thicknessScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaDecorationThicknessScale_undefined_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaDecorationThicknessScale_undefined_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextArea');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_undefined_0100] END');
    })

    // ==================== TextInput Tests ====================

    /**
     * @tc.name   textInputDecorationThicknessScale_default_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0100
     * @tc.desc   Test TextInput decoration thicknessScale with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_default_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_default_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_default_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_default_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_default_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_1_0_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0200
     * @tc.desc   Test TextInput decoration thicknessScale with value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_1_0_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_1_0_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_1_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_1_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_1_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_1_0_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_2_0_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0300
     * @tc.desc   Test TextInput decoration thicknessScale with value 2.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_2_0_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_2_0_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_2_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_2_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_2_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"2.000000"');
      console.info('[textInputDecorationThicknessScale_2_0_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_0_5_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0400
     * @tc.desc   Test TextInput decoration thicknessScale with value 0.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_0_5_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_0_5_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_0_5');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_0_5_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_0_5_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"0.500000"');
      console.info('[textInputDecorationThicknessScale_0_5_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_3_0_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0500
     * @tc.desc   Test TextInput decoration thicknessScale with value 3.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_3_0_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_3_0_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_3_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_3_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_3_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"3.000000"');
      console.info('[textInputDecorationThicknessScale_3_0_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_0_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0600
     * @tc.desc   Test TextInput decoration thicknessScale with value 0 (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_0_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_0_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"0.000000"');
      console.info('[textInputDecorationThicknessScale_0_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_negative_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0700
     * @tc.desc   Test TextInput decoration thicknessScale with negative value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_negative_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_negative_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_negative');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_negative_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_negative_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_negative_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0800
     * @tc.desc   Test TextInput decoration thicknessScale with null value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_null_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_null_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_null_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_null_0100] END');
    })

    /**
     * @tc.name   textInputDecorationThicknessScale_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_THICKNESSSCALE_0900
     * @tc.desc   Test TextInput decoration thicknessScale with undefined value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('textInputDecorationThicknessScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecorationThicknessScale_undefined_0100] START');

      let strJson: string = getInspectorByKey('textinput_decoration_thicknessScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecorationThicknessScale_undefined_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecorationThicknessScale_undefined_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('TextInput');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_undefined_0100] END');
    })

    // ==================== Search Tests ====================

    /**
     * @tc.name   searchDecorationThicknessScale_default_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0100
     * @tc.desc   Test Search decoration thicknessScale with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_default_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_default_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_default_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_default_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_default_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_1_0_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0200
     * @tc.desc   Test Search decoration thicknessScale with value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_1_0_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_1_0_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_1_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_1_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_1_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_1_0_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_2_0_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0300
     * @tc.desc   Test Search decoration thicknessScale with value 2.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_2_0_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_2_0_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_2_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_2_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_2_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"2.000000"');
      console.info('[searchDecorationThicknessScale_2_0_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_0_5_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0400
     * @tc.desc   Test Search decoration thicknessScale with value 0.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_0_5_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_0_5_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_0_5');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_0_5_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_0_5_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"0.500000"');
      console.info('[searchDecorationThicknessScale_0_5_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_3_0_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0500
     * @tc.desc   Test Search decoration thicknessScale with value 3.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_3_0_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_3_0_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_3_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_3_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_3_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"3.000000"');
      console.info('[searchDecorationThicknessScale_3_0_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_0_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0600
     * @tc.desc   Test Search decoration thicknessScale with value 0 (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_0_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_0_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_0');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_0_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_0_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"0.000000"');
      console.info('[searchDecorationThicknessScale_0_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_negative_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0700
     * @tc.desc   Test Search decoration thicknessScale with negative value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_negative_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_negative_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_negative');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_negative_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_negative_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_negative_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_null_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0800
     * @tc.desc   Test Search decoration thicknessScale with null value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_null_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_null_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_null_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_null_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_null_0100] END');
    })

    /**
     * @tc.name   searchDecorationThicknessScale_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_THICKNESSSCALE_0900
     * @tc.desc   Test Search decoration thicknessScale with undefined value, should use default value 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     * @tc.since  26.0.0
     */
    it('searchDecorationThicknessScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchDecorationThicknessScale_undefined_0100] START');

      let strJson: string = getInspectorByKey('search_decoration_thicknessScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecorationThicknessScale_undefined_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecorationThicknessScale_undefined_0100] decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(obj.$type).assertEqual('Search');
      expect(obj.$attrs.decoration).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_undefined_0100] END');
    })

  })
}