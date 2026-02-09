/**
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function StyledStringTextDirectionTest() {
  describe('StyledStringTextDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledStringTextDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyleTextDirection',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledStringTextDirectionTest state pages: " + JSON.stringify(pages));
        if (!("ParagraphStyleTextDirection" == pages.name)) {
          console.info("get StyledStringTextDirectionTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StyledStringTextDirectionTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledStringTextDirectionTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   StyledStringTextDirectionTest_0010
     * @tc.number SUB_ACE_StyledStringTextDirectionTest_0010
     * @tc.desc   test the textDirection of StyledString: TextDirection.LTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StyledStringTextDirectionTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[StyledStringTextDirectionTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('StyledString_textDirection_get'));
      await Button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('StyledString_textDirection')).assertEqual("0");
      AppStorage.delete('StyledString_textDirection');
      console.info('[StyledStringTextDirectionTest_0010] END');
      done();
    });

    /**
     * @tc.name   StyledStringTextDirectionTest_0020
     * @tc.number SUB_ACE_StyledStringTextDirectionTest_0020
     * @tc.desc   test the textDirection of StyledString: TextDirection.RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StyledStringTextDirectionTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[StyledStringTextDirectionTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('StyledString_textDirection_RTL'));
      await Button.click();
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('StyledString_textDirection_get'));
      await Button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('StyledString_textDirection')).assertEqual('1');
      AppStorage.delete('StyledString_textDirection');
      console.info('[StyledStringTextDirectionTest_0020] END');
      done();
    });

    /**
     * @tc.name   StyledStringTextDirectionTest_0030
     * @tc.number SUB_ACE_StyledStringTextDirectionTest_0030
     * @tc.desc   test the textDirection of StyledString: TextDirection.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StyledStringTextDirectionTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[StyledStringTextDirectionTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('StyledString_textDirection_DEFAULT'));
      await Button.click();
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('StyledString_textDirection_get'));
      await Button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('StyledString_textDirection')).assertEqual('2');
      AppStorage.delete('StyledString_textDirection');
      console.info('[StyledStringTextDirectionTest_0030] END');
      done();
    });

    /**
     * @tc.name   StyledStringTextDirectionTest_0040
     * @tc.number SUB_ACE_StyledStringTextDirectionTest_0040
     * @tc.desc   test the textDirection of StyledString: TextDirection.AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StyledStringTextDirectionTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[StyledStringTextDirectionTest_0040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('StyledString_textDirection_AUTO'));
      await Button.click();
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('StyledString_textDirection_get'));
      await Button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('StyledString_textDirection')).assertEqual('3');
      AppStorage.delete('StyledString_textDirection');
      console.info('[StyledStringTextDirectionTest_0040] END');
      done();
    });

    /**
     * @tc.name   StyledStringTextDirectionTest_0050
     * @tc.number SUB_ACE_StyledStringTextDirectionTest_0050
     * @tc.desc   test the textDirection of StyledString: undefined(TextDirection.DEFAULT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StyledStringTextDirectionTest_0050', Level.LEVEL2, async (done: Function) => {
      console.info('[StyledStringTextDirectionTest_0050] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Button = await driver.findComponent(ON.id('StyledString_textDirection_undefined'));
      await Button.click();
      await CommonFunc.sleep(1000);
      let Button2 = await driver.findComponent(ON.id('StyledString_textDirection_get'));
      await Button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('StyledString_textDirection')).assertEqual('2');
      AppStorage.delete('StyledString_textDirection');
      console.info('[StyledStringTextDirectionTest_0050] END');
      done();
    });
  })
}