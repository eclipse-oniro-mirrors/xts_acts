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

export default function ParagraphStyle3Test() {
  describe('ParagraphStyle3Test', () => {
    beforeEach(async (done: Function) => {
      console.info("ParagraphStyle3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyle3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParagraphStyle3 state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("ParagraphStyle3" == pages.name)) {
          console.info("get ParagraphStyle3 state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ParagraphStyle3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParagraphStyle3 page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParagraphStyle3 after each called");
    });

    /**
     * @tc.name   ParagraphStyle30001
     * @tc.number ParagraphStyle30001
     * @tc.desc   The ParagraphStyle Attributes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParagraphStyle30001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ParagraphStyle30001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('textParagraphStyle3Test'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ParagraphStyle10001 StyledString5_textAlign ' + AppStorage.get('StyledString5_textAlign'));
      expect('' + AppStorage.get('StyledString5_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString5_textIndent ' + AppStorage.get('StyledString5_textIndent'));
      expect('' + AppStorage.get('StyledString5_textIndent')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString5_maxLines ' + AppStorage.get('StyledString5_maxLines'));
      expect('' + AppStorage.get('StyledString5_maxLines')).assertEqual('-5');
      console.info('StyledString ParagraphStyle10001 StyledString5_wordBreak ' + AppStorage.get('StyledString5_wordBreak'));
      expect('' + AppStorage.get('StyledString5_wordBreak')).assertEqual('2');
      console.info('StyledString ParagraphStyle10001 StyledString5_leadingMargin ' + AppStorage.get('StyledString5_leadingMargin'));
      expect('' + AppStorage.get('StyledString5_leadingMargin')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString5_overflow ' + AppStorage.get('StyledString5_overflow'));
      expect('' + AppStorage.get('StyledString5_overflow')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString6_textAlign ' + AppStorage.get('StyledString6_textAlign'));
      expect('' + AppStorage.get('StyledString6_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString6_leadingMargin ' + AppStorage.get('StyledString6_leadingMargin'));
      expect('' + AppStorage.get('StyledString6_leadingMargin')).assertEqual('30');
      AppStorage.delete('StyledString5_textAlign')
      AppStorage.delete('StyledString5_textIndent')
      AppStorage.delete('StyledString5_maxLines')
      AppStorage.delete('StyledString5_wordBreak')
      AppStorage.delete('StyledString5_leadingMargin')
      AppStorage.delete('StyledString5_overflow')
      AppStorage.delete('StyledString6_textAlign')
      AppStorage.delete('StyledString6_leadingMargin')
      console.info("[ParagraphStyle30001] end");
      done();
    });
  })
}