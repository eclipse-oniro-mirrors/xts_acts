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
import { Driver, ON} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function RichEditorTextStyleTest() {
  describe('RichEditorTextStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi23/RichEditorTextStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextStyleTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorTextStyle" == pages.name)) {
          console.info("get RichEditorTextStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorTextStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RichEditorTextStyleTest_0010
     * @tc.number SUB_ACE_RichEditorTextStyleTest_0010
     * @tc.desc   test the RichEditorTextStyle.strokeWidth of RichEditor: 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorTextStyleTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorTextStyleTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let richEditor1 = await driver.findComponent(ON.id('getTextStyleValue'));
      await richEditor1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('RichEditorTextStyle_strokeWidth')).assertEqual("10");
      AppStorage.delete('RichEditorTextStyle_strokeWidth');
      console.info('[RichEditorTextStyleTest_0010] END');
      done();
    });

    /**
     * @tc.name   RichEditorTextStyleTest_0020
     * @tc.number SUB_ACE_RichEditorTextStyleTest_0020
     * @tc.desc   test the RichEditorTextSpanResult.strokeColor of RichEditor: '#FFFF0000'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RichEditorTextStyleTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[RichEditorTextStyleTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let richEditor1 = await driver.findComponent(ON.id('getTextStyleValue'));
      await richEditor1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('RichEditorTextStyle_strokeColor')).assertEqual('"#FFFF0000"');
      AppStorage.delete('RichEditorTextStyle_strokeColor');
      console.info('[RichEditorTextStyleTest_0020] END');
      done();
    });
  })
}