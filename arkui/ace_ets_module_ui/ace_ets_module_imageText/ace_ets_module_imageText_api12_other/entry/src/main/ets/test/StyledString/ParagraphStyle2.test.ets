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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function ParagraphStyle2() {
  describe('ParagraphStyle2', () => {
    beforeEach(async (done: Function) => {
      console.info("ParagraphStyle2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyle2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParagraphStyle2 state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("ParagraphStyle2" == pages.name)) {
          console.info("get ParagraphStyle2 state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ParagraphStyle2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParagraphStyle2 page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParagraphStyle2 after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         ParagraphStyle20001
    * @tc.desic        The ParagraphStyle Attributes
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        1
     */
    it('ParagraphStyle20001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ParagraphStyle20001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('text'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ParagraphStyle10001 StyledString2_textAlign ' + AppStorage.get('StyledString2_textAlign'));
      expect('' + AppStorage.get('StyledString2_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString2_textIndent ' + AppStorage.get('StyledString2_textIndent'));
      expect('' + AppStorage.get('StyledString2_textIndent')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString2_maxLines ' + AppStorage.get('StyledString2_maxLines'));
      expect('' + AppStorage.get('StyledString2_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString2_wordBreak ' + AppStorage.get('StyledString2_wordBreak'));
      expect('' + AppStorage.get('StyledString2_wordBreak')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString2_leadingMargin ' + AppStorage.get('StyledString2_leadingMargin'));
      expect('' + AppStorage.get('StyledString2_leadingMargin')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString2_overflow ' + AppStorage.get('StyledString2_overflow'));
      expect('' + AppStorage.get('StyledString2_overflow')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString3_textAlign ' + AppStorage.get('StyledString3_textAlign'));
      expect('' + AppStorage.get('StyledString3_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString3_textIndent ' + AppStorage.get('StyledString3_textIndent'));
      expect('' + AppStorage.get('StyledString3_textIndent')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString3_maxLines ' + AppStorage.get('StyledString3_maxLines'));
      expect('' + AppStorage.get('StyledString3_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString3_wordBreak ' + AppStorage.get('StyledString3_wordBreak'));
      expect('' + AppStorage.get('StyledString3_wordBreak')).assertEqual('2');
      console.info('StyledString ParagraphStyle10001 StyledString3_leadingMargin ' + AppStorage.get('StyledString3_leadingMargin'));
      expect('' + AppStorage.get('StyledString3_leadingMargin')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString3_overflow ' + AppStorage.get('StyledString3_overflow'));
      expect('' + AppStorage.get('StyledString3_overflow')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString4_textAlign ' + AppStorage.get('StyledString4_textAlign'));
      expect('' + AppStorage.get('StyledString4_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString4_textIndent ' + AppStorage.get('StyledString4_textIndent'));
      expect('' + AppStorage.get('StyledString4_textIndent')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString4_maxLines ' + AppStorage.get('StyledString4_maxLines'));
      expect('' + AppStorage.get('StyledString4_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString4_wordBreak ' + AppStorage.get('StyledString4_wordBreak'));
      expect('' + AppStorage.get('StyledString4_wordBreak')).assertEqual('3');
      console.info('StyledString ParagraphStyle10001 StyledString4_leadingMargin ' + AppStorage.get('StyledString4_leadingMargin'));
      expect('' + AppStorage.get('StyledString4_leadingMargin')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString4_overflow ' + AppStorage.get('StyledString4_overflow'));
      expect('' + AppStorage.get('StyledString4_overflow')).assertEqual('3');
      AppStorage.delete('StyledString2_textAlign')
      AppStorage.delete('StyledString2_textIndent')
      AppStorage.delete('StyledString2_maxLines')
      AppStorage.delete('StyledString2_wordBreak')
      AppStorage.delete('StyledString2_leadingMargin')
      AppStorage.delete('StyledString2_overflow')
      AppStorage.delete('StyledString3_textAlign')
      AppStorage.delete('StyledString3_textIndent')
      AppStorage.delete('StyledString3_maxLines')
      AppStorage.delete('StyledString3_wordBreak')
      AppStorage.delete('StyledString3_leadingMargin')
      AppStorage.delete('StyledString3_overflow')
      AppStorage.delete('StyledString4_textAlign')
      AppStorage.delete('StyledString4_textIndent')
      AppStorage.delete('StyledString4_maxLines')
      AppStorage.delete('StyledString4_wordBreak')
      AppStorage.delete('StyledString4_leadingMargin')
      AppStorage.delete('StyledString4_overflow')
      console.info("[ParagraphStyle20001] end");
      done();
    });
  })
}