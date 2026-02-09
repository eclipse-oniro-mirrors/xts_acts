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

export default function ParagraphStyle1() {
  describe('ParagraphStyle1', () => {
    beforeEach(async (done: Function) => {
      console.info("ParagraphStyle1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyle1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParagraphStyle1 state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("ParagraphStyle1" == pages.name)) {
          console.info("get ParagraphStyle1 state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ParagraphStyle1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParagraphStyle1 page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParagraphStyle1 after each called");
    });

    /**
     * @tc.name   ParagraphStyle10001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   ParagraphStyle10001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ParagraphStyle10001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString ParagraphStyle10001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('text'))
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      console.info('StyledString ParagraphStyle10001 StyledString1_0_textAlign ' + AppStorage.get('StyledString1_0_textAlign'));
      expect('' + AppStorage.get('StyledString1_0_textAlign')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString1_1_textIndent ' + AppStorage.get('StyledString1_1_textIndent'));
      expect('' + AppStorage.get('StyledString1_1_textIndent')).assertEqual('15');
      console.info('StyledString ParagraphStyle10001 StyledString1_1_maxLines ' + AppStorage.get('StyledString1_1_maxLines'));
      expect('' + AppStorage.get('StyledString1_1_maxLines')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString1_1_pixelMap ' + AppStorage.get('StyledString1_1_pixelMap'));
      expect('' + AppStorage.get('StyledString1_1_pixelMap')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString1_1_size ' + AppStorage.get('StyledString1_1_size'));
      expect('' + AppStorage.get('StyledString1_1_size')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString1_2_textAlign ' + AppStorage.get('StyledString1_2_textAlign'));
      expect('' + AppStorage.get('StyledString1_2_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString1_2_pixelMap ' + AppStorage.get('StyledString1_2_pixelMap'));
      expect('' + AppStorage.get('StyledString1_2_pixelMap')).assertEqual('{}');
      console.info('StyledString ParagraphStyle10001 StyledString1_2_size ' + AppStorage.get('StyledString1_2_size'));
      expect('' + AppStorage.get('StyledString1_2_size')).assertEqual('[15,15]');
      console.info('StyledString ParagraphStyle10001 StyledString1_3_textAlign ' + AppStorage.get('StyledString1_3_textAlign'));
      expect('' + AppStorage.get('StyledString1_3_textAlign')).assertEqual('2');
      console.info('StyledString ParagraphStyle10001 StyledString1_3_maxLines ' + AppStorage.get('StyledString1_3_maxLines'));
      expect('' + AppStorage.get('StyledString1_3_maxLines')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString1_3_wordBreak ' + AppStorage.get('StyledString1_3_wordBreak'));
      expect('' + AppStorage.get('StyledString1_3_wordBreak')).assertEqual('1');
      console.info('StyledString ParagraphStyle10001 StyledString1_3_overflow ' + AppStorage.get('StyledString1_3_overflow'));
      expect('' + AppStorage.get('StyledString1_3_overflow')).assertEqual('2');
      AppStorage.delete('StyledString1_0_textAlign')
      AppStorage.delete('StyledString1_1_textIndent')
      AppStorage.delete('StyledString1_1_maxLines')
      AppStorage.delete('StyledString1_1_pixelMap')
      AppStorage.delete('StyledString1_1_size')
      AppStorage.delete('StyledString1_2_textAlign')
      AppStorage.delete('StyledString1_2_pixelMap')
      AppStorage.delete('StyledString1_2_size')
      AppStorage.delete('StyledString1_3_textAlign')
      AppStorage.delete('StyledString1_3_maxLines')
      AppStorage.delete('StyledString1_3_wordBreak')
      AppStorage.delete('StyledString1_3_overflow')
      console.info("[ParagraphStyle10001] end");
      done();
    });
  })
}