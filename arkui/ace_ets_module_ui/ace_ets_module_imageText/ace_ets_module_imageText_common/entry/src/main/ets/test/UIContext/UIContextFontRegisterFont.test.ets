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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function UIContextFontRegisterFontTest() {
  describe('UIContextFontRegisterFontTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextFontRegisterFontTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/UIContextFontRegisterFont',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextFontRegisterFontTest state pages: " + JSON.stringify(pages));
        if (!("UIContextFontRegisterFont" == pages.name)) {
          console.info("get UIContextFontRegisterFontTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContextFontRegisterFontTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextFontRegisterFontTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   fontRegisterFontNull_0100
     * @tc.number SUB_ARKUI_FONT_REGISTERFONT_NULL_0100
     * @tc.desc   测试 UIContext Font.registerFont 方法，options 参数为 null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('fontRegisterFontNull_0100', Level.LEVEL2, async () => {
      console.log('' + 'fontRegisterFontNull_0100 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_registerFont_null'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('registerFont_null')).assertEqual('registerFont null succ');
      AppStorage.delete('registerFont_null')
      console.log('' + 'fontRegisterFontNull_0100 END')
    });

    /**
     * @tc.name   fontRegisterFontUndefined_0100
     * @tc.number SUB_ARKUI_FONT_REGISTERFONT_UNDEFINED_0100
     * @tc.desc   测试 UIContext Font.registerFont 方法，options 参数为 undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('fontRegisterFontUndefined_0100', Level.LEVEL2, async () => {
      console.log('' + 'fontRegisterFontUndefined_0100 START')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('button_registerFont_undefined'))
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('registerFont_undefined')).assertEqual('registerFont undefined succ');
      AppStorage.delete('registerFont_undefined')
      console.log('' + 'fontRegisterFontUndefined_0100 END')
    });
  });
}
