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


export default function TextGetParagraphsTest() {
  describe('TextGetParagraphsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextGetParagraphsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextGetparagraphs',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextGetParagraphsTest state pages: " + JSON.stringify(pages));
        if (!("TextGetparagraphs" == pages.name)) {
          console.info("get TextGetParagraphsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextGetParagraphsTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextGetParagraphsTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextGetParagraphsTest_0010
     * @tc.name      TextGetParagraphsTest_0010
     * @tc.desc      test getUIContext().getMeasureUtils().getParagraphs(): getMaxWidth
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextGetParagraphsTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextGetParagraphsTest_0010] START');
      console.info('[TextGetParagraphsTest_0010] value: ' + AppStorage.get('getMaxWidth'));
      expect(AppStorage.get('getMaxWidth')).assertEqual(500);
      AppStorage.delete('getMaxWidth');
      console.info('[TextGetParagraphsTest_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextGetParagraphsTest_0020
     * @tc.name      TextGetParagraphsTest_0020
     * @tc.desc      test getUIContext().getMeasureUtils().getParagraphs(): didExceedMaxLines
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextGetParagraphsTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextGetParagraphsTest_0020] START');
      console.info('[TextGetParagraphsTest_0020] value: ' + AppStorage.get('didExceedMaxLines'));
      expect(AppStorage.get('didExceedMaxLines')).assertEqual('false');
      AppStorage.delete('didExceedMaxLines');
      console.info('[TextGetParagraphsTest_0020] END');
      done();
    });
  })
}