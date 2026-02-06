'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function textpickerJsunit() {
  describe('textpickerJsunit', () => {
    beforeAll(() => {
      console.info("textpickerJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("textpickerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/textPicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textpicker state pages: " + JSON.stringify(pages));
        if (!("textPicker" == pages.name)) {
          console.info("get textpicker state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(5000);
        }
      } catch (err) {
        console.error("push textpicker page error: " + err);
      }
    });

    
    
/**
     * @tc.number   ArkUI_textpicker_static_001
     * @tc.name     ArkUI_textpicker_static_001
     * @tc.desc     ArkUI_textpicker_static_001
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_textpicker_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_textpicker_static_001] START');
      let strJson = inspector.getInspectorByKey('textPickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_textpicker_static_001] obj:" + JSON.stringify(obj.getElement('$attrs')));

      let strJson1 = inspector.getInspectorByKey('textPickerDefault1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ArkUI_textpicker_static_001] obj1:" + JSON.stringify(obj1.getElement('$attrs')));
      //得到json值与 设置不一致，与原生json返回做对比验证
      expect(JSON.stringify(obj.getElement('$attrs').getElement('selectedIndex'))).assertEqual(JSON.stringify(obj1.getElement('$attrs').getElement('selectedIndex')));
      done();
    });

    
    
/**
     * @tc.number   ArkUI_textpicker_static_002
     * @tc.name     ArkUI_textpicker_static_002
     * @tc.desc     ArkUI_textpicker_static_002
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_textpicker_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_textpicker_static_002] START');
      let strJson = inspector.getInspectorByKey('textPickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_textpicker_static_002] obj:" + JSON.stringify(obj.getElement('$attrs')));

      let textStyle = obj.getElement('$attrs').getElement('textStyle');

      expect(textStyle.getString('color')).assertEqual('#FFFF0000');
      expect(textStyle.getElement('font').getString('size')).assertEqual('10.00px');
      expect(textStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Normal');

      done();
    });

    
    
/**
     * @tc.number   ArkUI_textpicker_static_003
     * @tc.name     ArkUI_textpicker_static_003
     * @tc.desc     ArkUI_textpicker_static_003
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_textpicker_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_textpicker_static_003] START');
      let strJson = inspector.getInspectorByKey('textPickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_textpicker_static_003] obj:" + JSON.stringify(obj.getElement('$attrs')));
      let selectedTextStyle = obj.getElement('$attrs').getElement('selectedTextStyle');

      expect(selectedTextStyle.getString('color')).assertEqual('#FF0000FF');
      expect(selectedTextStyle.getElement('font').getString('size')).assertEqual('20.00px');
      expect(selectedTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Bold');


      done();
    });

    
    
/**
     * @tc.number   ArkUI_textpicker_static_004
     * @tc.name     ArkUI_textpicker_static_004
     * @tc.desc     ArkUI_textpicker_static_004
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_textpicker_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_textpicker_static_004] START');
      let strJson = inspector.getInspectorByKey('textPickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_textpicker_static_004] obj:" + JSON.stringify(obj.getElement('$attrs')));

      let disappearTextStyle = obj.getElement('$attrs').getElement('disappearTextStyle');

      expect(disappearTextStyle.getString('color')).assertEqual('#FF000000');
      expect(disappearTextStyle.getElement('font').getString('size')).assertEqual('8.00fp');
      expect(disappearTextStyle.getElement('font').getString('weight')).assertEqual('FontWeight.Lighter');

      done();
    });

    
    
/**
     * @tc.number   ArkUI_textpicker_static_005
     * @tc.name     ArkUI_textpicker_static_005
     * @tc.desc     ArkUI_textpicker_static_005
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_textpicker_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_textpicker_static_005] START');
      let strJson = inspector.getInspectorByKey('textPickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_textpicker_static_005] obj:" + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('canLoop')).assertEqual("false");

      done();
    });

    
    
/**
     * @tc.number   ArkUI_textpicker_static_006
     * @tc.name     ArkUI_textpicker_static_006
     * @tc.desc     ArkUI_textpicker_static_006
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_textpicker_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ArkUI_textpicker_static_006] START');
      let strJson = inspector.getInspectorByKey('textPickerDefault');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUI_textpicker_static_006] obj:" + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('defaultPickerItemHeight')).assertEqual('60.00px');
      done();
    });
  })
}
