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


export default function ParagraphSpacingTest() {
  describe('ParagraphSpacingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ParagraphSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphSpacing',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParagraphSpacingTest state pages: " + JSON.stringify(pages));
        if (!("ParagraphSpacing" == pages.name)) {
          console.info("get ParagraphSpacingTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ParagraphSpacingTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParagraphSpacingTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ParagraphSpacingTest_0010
     * @tc.number SUB_ACE_ParagraphSpacingTest_0010
     * @tc.desc   test StyledString paragraphSpacing: LengthMetrics.vp(10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParagraphSpacingTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('[ParagraphSpacingTest_0010] START');
      await CommonFunc.sleep(500);
      console.info("[ParagraphSpacingTest_0010] value1:" + JSON.stringify(AppStorage.get('paragraphSpacing1')));
      expect(AppStorage.get('paragraphSpacing1')).assertEqual(10);
      AppStorage.delete('paragraphSpacing1')
      console.info('[ParagraphSpacingTest_0010] END');
      done();
    });

    /**
     * @tc.name   ParagraphSpacingTest_0020
     * @tc.number SUB_ACE_ParagraphSpacingTest_0020
     * @tc.desc   test StyledString paragraphSpacing: new LengthMetrics(20, LengthUnit.VP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParagraphSpacingTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('[ParagraphSpacingTest_0020] START');
      await CommonFunc.sleep(500);
      console.info("[ParagraphSpacingTest_0020] value2:" + JSON.stringify(AppStorage.get('paragraphSpacing2')));
      expect(AppStorage.get('paragraphSpacing2')).assertEqual(20);
      AppStorage.delete('paragraphSpacing2')
      console.info('[ParagraphSpacingTest_0020] END');
      done();
    });

    /**
     * @tc.name   ParagraphSpacingTest_0030
     * @tc.number SUB_ACE_ParagraphSpacingTest_0030
     * @tc.desc   test StyledString paragraphSpacing: LengthMetrics.vp(-10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParagraphSpacingTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('[ParagraphSpacingTest_0030] START');
      await CommonFunc.sleep(500);
      console.info("[ParagraphSpacingTest_0030] value3:" + JSON.stringify(AppStorage.get('paragraphSpacing3')));
      expect(AppStorage.get('paragraphSpacing3')).assertEqual(0);
      AppStorage.delete('paragraphSpacing3')
      console.info('[ParagraphSpacingTest_0030] END');
      done();
    });

    /**
     * @tc.name   ParagraphSpacingTest_0040
     * @tc.number SUB_ACE_ParagraphSpacingTest_0040
     * @tc.desc   test StyledString paragraphSpacing: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParagraphSpacingTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('[ParagraphSpacingTest_0040] START');
      await CommonFunc.sleep(500);
      console.info("[ParagraphSpacingTest_0040] value4:" + JSON.stringify(AppStorage.get('paragraphSpacing4')));
      expect(AppStorage.get('paragraphSpacing4')).assertEqual(0);
      AppStorage.delete('paragraphSpacing4')
      console.info('[ParagraphSpacingTest_0040] END');
      done();
    });
  })
}
