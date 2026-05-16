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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { TextMenuController, UIContext } from '@kit.ArkUI';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function TextMenuControllerTest() {
  describe('TextMenuControllerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMenuControllerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextMenuControllerTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMenuControllerTest state pages: " + JSON.stringify(pages));
        if (!("TextMenuControllerTestPage" == pages.name)) {
          console.info("get TextMenuControllerTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextMenuControllerTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMenuControllerTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_NULL_001
     * @tc.number SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_NULL_001
     * @tc.desc   测试 TextMenuController setMenuOptions 属性参数 options为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_setMenuOptions_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('setMenuOptions_null')).assertEqual('setMenuOptions null succ');
      AppStorage.delete('setMenuOptions_null')
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_UNDEFINED_001
     * @tc.desc   测试 TextMenuController setMenuOptions 属性参数 options为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_setMenuOptions_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('setMenuOptions_undefined')).assertEqual('setMenuOptions undefined succ');
      AppStorage.delete('setMenuOptions_undefined')
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_SETMENUOPTIONS_OPTIONS_UNDEFINED_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_NULL_001
     * @tc.number SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_NULL_001
     * @tc.desc   测试 TextMenuController disableMenuItems 属性参数 items为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_NULL_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_disableMenuItems_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('disableMenuItems_null')).assertEqual('disableMenuItems null succ');
      AppStorage.delete('disableMenuItems_null')
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_NULL_001 end");
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_UNDEFINED_001
     * @tc.desc   测试 TextMenuController disableMenuItems 属性参数 items为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_UNDEFINED_001 start");
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_disableMenuItems_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('disableMenuItems_undefined')).assertEqual('disableMenuItems undefined succ');
      AppStorage.delete('disableMenuItems_undefined')
      console.info("SUB_ARKUI_TEXTMENUCONTROLLER_DISABLEMENUITEMS_ITEMS_UNDEFINED_001 end");
      done();
    });
  });
}
