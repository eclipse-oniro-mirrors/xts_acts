'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function EditDecorationThicknessScaleTest() {
  describe('EditDecorationThicknessScaleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('EditDecorationThicknessScaleTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textCommon.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      console.info("EditDecorationThicknessScaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EditCommon/EditDecorationThicknessScale',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('EditDecorationThicknessScaleTest state pages: ' + JSON.stringify(pages));
        if (!("EditDecorationThicknessScale" == pages.name)) {
           routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push EditDecorationThicknessScaleTest page error:" + err);
        expect().assertFail();
      }
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
    it('textAreaDecorationThicknessScale_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_default_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_default');

      console.info("[textAreaDecorationThicknessScale_default_0100] decoration is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_default_0100] END');
      done();
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
    it('textAreaDecorationThicknessScale_1_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_1_0_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_thicknessScale_1_0');  

      console.info("[textAreaDecorationThicknessScale_1_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_1_0_0100] END');
      done();
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
    it('textAreaDecorationThicknessScale_2_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_2_0_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_thicknessScale_2_0');

      console.info("[textAreaDecorationThicknessScale_2_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"2.000000"');
      console.info('[textAreaDecorationThicknessScale_2_0_0100] END');
      done();
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
    it('textAreaDecorationThicknessScale_0_5_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_0_5_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_thicknessScale_0_5');

      console.info("[textAreaDecorationThicknessScale_0_5_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"0.500000"');
      console.info('[textAreaDecorationThicknessScale_0_5_0100] END');
      done();
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
    it('textAreaDecorationThicknessScale_3_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_3_0_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_thicknessScale_3_0');

      console.info("[textAreaDecorationThicknessScale_3_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"3.000000"');
      console.info('[textAreaDecorationThicknessScale_3_0_0100] END');
      done();
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
    it('textAreaDecorationThicknessScale_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_0_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_thicknessScale_0');

      console.info("[textAreaDecorationThicknessScale_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"0.000000"');
      console.info('[textAreaDecorationThicknessScale_0_0100] END');
      done();
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
    it('textAreaDecorationThicknessScale_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_negative_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_thicknessScale_negative');

      console.info("[textAreaDecorationThicknessScale_negative_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_negative_0100] END');
      done();
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
    it('textAreaDecorationThicknessScale_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaDecorationThicknessScale_undefined_0100] START');

      let strJson = inspector.getInspectorByKey('textarea_decoration_thicknessScale_undefined');

      console.info("[textAreaDecorationThicknessScale_undefined_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextArea');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textAreaDecorationThicknessScale_undefined_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_default_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_default');

      console.info("[textInputDecorationThicknessScale_default_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_default_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_1_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_1_0_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_thicknessScale_1_0');

      console.info("[textInputDecorationThicknessScale_1_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_1_0_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_2_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_2_0_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_thicknessScale_2_0');

      console.info("[textInputDecorationThicknessScale_2_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"2.000000"');
      console.info('[textInputDecorationThicknessScale_2_0_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_0_5_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_0_5_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_thicknessScale_0_5');

      console.info("[textInputDecorationThicknessScale_0_5_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"0.500000"');
      console.info('[textInputDecorationThicknessScale_0_5_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_3_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_3_0_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_thicknessScale_3_0');

      console.info("[textInputDecorationThicknessScale_3_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"3.000000"');
      console.info('[textInputDecorationThicknessScale_3_0_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_0_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_thicknessScale_0');

      console.info("[textInputDecorationThicknessScale_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"0.000000"');
      console.info('[textInputDecorationThicknessScale_0_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_negative_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_thicknessScale_negative');

      console.info("[textInputDecorationThicknessScale_negative_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_negative_0100] END');
      done();
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
    it('textInputDecorationThicknessScale_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textInputDecorationThicknessScale_undefined_0100] START');

      let strJson = inspector.getInspectorByKey('textinput_decoration_thicknessScale_undefined');

      console.info("[textInputDecorationThicknessScale_undefined_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextInput');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[textInputDecorationThicknessScale_undefined_0100] END');
      done();
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
    it('searchDecorationThicknessScale_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_default_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_default');

      console.info("[searchDecorationThicknessScale_default_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_default_0100] END');
      done();
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
    it('searchDecorationThicknessScale_1_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_1_0_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_thicknessScale_1_0');

      console.info("[searchDecorationThicknessScale_1_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_1_0_0100] END');
      done();
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
    it('searchDecorationThicknessScale_2_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_2_0_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_thicknessScale_2_0');
       
      console.info("[searchDecorationThicknessScale_2_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"2.000000"');
      console.info('[searchDecorationThicknessScale_2_0_0100] END');
      done();
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
    it('searchDecorationThicknessScale_0_5_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_0_5_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_thicknessScale_0_5');

      console.info("[searchDecorationThicknessScale_0_5_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"0.500000"');
      console.info('[searchDecorationThicknessScale_0_5_0100] END');
      done();
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
    it('searchDecorationThicknessScale_3_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_3_0_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_thicknessScale_3_0');

      console.info("[searchDecorationThicknessScale_3_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"3.000000"');
      console.info('[searchDecorationThicknessScale_3_0_0100] END');
      done();
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
    it('searchDecorationThicknessScale_0_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_0_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_thicknessScale_0');

      console.info("[searchDecorationThicknessScale_0_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"0.000000"');
      console.info('[searchDecorationThicknessScale_0_0100] END');
      done();
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
    it('searchDecorationThicknessScale_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_negative_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_thicknessScale_negative');

      console.info("[searchDecorationThicknessScale_negative_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_negative_0100] END');
      done();
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
    it('searchDecorationThicknessScale_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchDecorationThicknessScale_undefined_0100] START');

      let strJson = inspector.getInspectorByKey('search_decoration_thicknessScale_undefined');

      console.info("[searchDecorationThicknessScale_undefined_0100] decoration is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Search');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('decoration')).assertContain('"thicknessScale":"1.000000"');
      console.info('[searchDecorationThicknessScale_undefined_0100] END');
      done();
    })

  })
}