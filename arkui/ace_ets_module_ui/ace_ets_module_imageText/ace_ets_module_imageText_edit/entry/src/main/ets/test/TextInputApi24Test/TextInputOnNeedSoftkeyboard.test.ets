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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import { inputMethod } from '@kit.IMEKit';


export default function TextInputOnNeedSoftkeyboardTest() {
  describe('TextInputOnNeedSoftkeyboardTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputOnNeedSoftkeyboardTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi24/TextInputOnNeedSoftkeyboard',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputOnNeedSoftkeyboardTest state pages: " + JSON.stringify(pages));
        if (!("TextInputOnNeedSoftkeyboard" == pages.name)) {
          console.info("get TextInputOnNeedSoftkeyboardTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputOnNeedSoftkeyboardTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputOnNeedSoftkeyboardTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_TRUE_PARAM_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_TRUE_PARAM_0100
     * @tc.desc   Test TextInput onNeedSoftkeyboard callback with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_TRUE_PARAM_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_TRUE_PARAM_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Button_onNeedSoftkeyboard_true'))
      await button.click();
      await CommonFunc.sleep(1000);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('onNeedSoftkeyboard_true')).assertEqual('true');
      AppStorage.delete('onNeedSoftkeyboard_true')
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_TRUE_PARAM_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_FALSE_PARAM_0200
     * @tc.number SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_FALSE_PARAM_0200
     * @tc.desc   Test Button onNeedSoftkeyboard callback with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_FALSE_PARAM_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_FALSE_PARAM_0200 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Button_onNeedSoftkeyboard_false'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('onNeedSoftkeyboard_false')).assertEqual('false');
      AppStorage.delete('onNeedSoftkeyboard_false')
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_FALSE_PARAM_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0300
     * @tc.number SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0300
     * @tc.desc   Test Button onNeedSoftkeyboard callback with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0300 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Button_onNeedSoftkeyboard_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('Button_onNeedSoftkeyboard_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.onNeedSoftkeyboard).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0400
     * @tc.number SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0400
     * @tc.desc   Test TextInput onNeedSoftkeyboard callback with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0400 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('TextInput_onNeedSoftkeyboard_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('TextInput_onNeedSoftkeyboard_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.onNeedSoftkeyboard).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_DEFAULT_PARAM_0500
     * @tc.number SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_DEFAULT_PARAM_0500
     * @tc.desc   Test TextInput onNeedSoftkeyboard callback with default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_DEFAULT_PARAM_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_DEFAULT_PARAM_0500 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('TextInput_onNeedSoftkeyboard_default'))
      await button.click();
      await CommonFunc.sleep(1000);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('TextInput_onNeedSoftkeyboard_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.onNeedSoftkeyboard).assertEqual(undefined);
      console.info('SUB_ARKUI_TEXTINPUT_ONEEDSOFTKEYBOARD_UNDEFINED_PARAM_0400 END');
    });
  });
}
