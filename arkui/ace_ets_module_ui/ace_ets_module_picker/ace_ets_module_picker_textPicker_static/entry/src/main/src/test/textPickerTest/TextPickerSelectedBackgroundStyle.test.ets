'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index'
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function TextPickerSelectedBackgroundStyleTest() {
  describe('TextPickerSelectedBackgroundStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextPickerSelectedBackgroundStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPicker.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("TextPickerSelectedBackgroundStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPicker/TextPicker_selectedBackgroundStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("TextPicker_selectedBackgroundStyle" == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerSelectedBackgroundStyleTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextPickerSelectedBackgroundStyleTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100
     * @tc.desc     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100 START');
      let strJson = inspector.getInspectorByKey('textPicker1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')));
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')));
      expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')).assertEqual("radiusTopLeft: [15.00vp]radiusTopRight: [15.00vp]radiusBottomLeft: [15.00vp]radiusBottomRight: [15.00vp]");
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0100 END ');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200
     * @tc.desc     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200 START');
      let strJson = inspector.getInspectorByKey('textPicker2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')));
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')));
      expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')).assertEqual("radiusTopLeft: [15.00vp]radiusTopRight: [15.00vp]radiusBottomLeft: [15.00vp]radiusBottomRight: [15.00vp]");
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0200 END ');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300
     * @tc.desc     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300 START');
      let strJson = inspector.getInspectorByKey('textPicker3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')));
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')));expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')).assertEqual("radiusTopLeft: [15.00vp]radiusTopRight: [15.00vp]radiusBottomLeft: [15.00vp]radiusBottomRight: [15.00vp]");
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0300 END ');
      done();
    })

    /**
     * @tc.number   SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400
     * @tc.name     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400
     * @tc.desc     SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400 START');
      let strJson = inspector.getInspectorByKey('textPicker4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')));
      console.info("SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400 : " + JSON.stringify(JSON.parseJsonElement(strJson)
        .getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')));expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('color')).assertEqual('#FFFFFFFF');
      expect(obj.getElement('$attrs').getElement('selectedBackgroundStyle').getString('borderRadius')).assertEqual("radiusTopLeft: [24.00vp]radiusTopRight: [24.00vp]radiusBottomLeft: [24.00vp]radiusBottomRight: [24.00vp]");
      console.info('SUB_ARKUI_TEXTPICKER_SELECTEDBACKGROUMDSTYLE_STATIC_0400 END ');
      done();
    })
  })
}
