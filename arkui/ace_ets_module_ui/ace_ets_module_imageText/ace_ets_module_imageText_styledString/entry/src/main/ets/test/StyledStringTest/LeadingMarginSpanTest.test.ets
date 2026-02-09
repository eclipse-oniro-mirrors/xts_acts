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

export default function LeadingMarginSpanTest() {
  describe('LeadingMarginSpanTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LeadingMarginSpanTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/LeadingMarginSpanTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LeadingMarginSpanTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("LeadingMarginSpanTest" == pages.name)) {
          console.info("get LeadingMarginSpanTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push LeadingMarginSpanTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LeadingMarginSpanTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LeadingMarginSpanTest after each called");
    });
    afterAll(async ()=>{
      AppStorage.delete('StyledStringOptionsX')
      AppStorage.delete('StyledStringOptionsTop')
      AppStorage.delete('StyledStringOptionsBottom')
      AppStorage.delete('StyledStringOptionsBaseline')
      AppStorage.delete('StyledStringOptionsDirection')
      AppStorage.delete('StyledStringOptionsStart')
      AppStorage.delete('StyledStringOptionsEnd')
      AppStorage.delete('StyledStringOptionsFirst')
      AppStorage.delete('ParagraphStyleLeadingMarginSpan')
    })

    /**
     * @tc.name   LeadingMarginSpanTest001
     * @tc.number LeadingMarginSpanTest001
     * @tc.desc   test Text set StyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LeadingMarginSpanTest001', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString LeadingMarginSpanTest001 START');
      await CommonFunc.sleep(1000);
      let setLeadingMarginSpan1 = await driver.findComponent(ON.id('setLeadingMarginSpan1'))
      await CommonFunc.sleep(500);
      await setLeadingMarginSpan1.click();
      await CommonFunc.sleep(500);
      let getLeadingMarginSpan1 = await driver.findComponent(ON.id('getLeadingMarginSpan1'))
      await CommonFunc.sleep(500);
      await getLeadingMarginSpan1.click();
      await CommonFunc.sleep(500);
      console.info('StyledString LeadingMarginSpanTest001 x ' + AppStorage.get('StyledStringOptionsX'));
      expect(AppStorage.get('StyledStringOptionsX') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest001 top ' + AppStorage.get('StyledStringOptionsTop'));
      expect(AppStorage.get('StyledStringOptionsTop') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest001 bottom ' + AppStorage.get('StyledStringOptionsBottom'));
      expect(AppStorage.get('StyledStringOptionsBottom') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest001 baseline ' + AppStorage.get('StyledStringOptionsBaseline'));
      expect(AppStorage.get('StyledStringOptionsBaseline') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest001 direction ' + AppStorage.get('StyledStringOptionsDirection'));
      expect(AppStorage.get('StyledStringOptionsDirection')).assertEqual(0);

      console.info('StyledString LeadingMarginSpanTest001 start ' + AppStorage.get('StyledStringOptionsStart'));
      expect(AppStorage.get('StyledStringOptionsStart') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest001 end ' + AppStorage.get('StyledStringOptionsEnd'));
      expect(AppStorage.get('StyledStringOptionsEnd') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest001 first ' + AppStorage.get('StyledStringOptionsFirst'));
      expect(AppStorage.get('StyledStringOptionsFirst')).assertTrue();

      console.info('StyledString LeadingMarginSpanTest001 getText ' + AppStorage.get('ParagraphStyleLeadingMarginSpan'));
      expect( AppStorage.get('ParagraphStyleLeadingMarginSpan')).assertEqual('●');

      console.info("[LeadingMarginSpanTest001] end");
      done();
    });

    /**
     * @tc.name   LeadingMarginSpanTest002
     * @tc.number LeadingMarginSpanTest002
     * @tc.desc   test RichEditor set StyledString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LeadingMarginSpanTest002', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString LeadingMarginSpanTest002 START');
      await CommonFunc.sleep(1000);
      let setLeadingMarginSpan2 = await driver.findComponent(ON.id('setLeadingMarginSpan2'))
      await CommonFunc.sleep(500);
      await setLeadingMarginSpan2.click();
      await CommonFunc.sleep(500);
      let getLeadingMarginSpan2 = await driver.findComponent(ON.id('getLeadingMarginSpan2'))
      await CommonFunc.sleep(500);
      await getLeadingMarginSpan2.click();
      await CommonFunc.sleep(500);
      console.info('StyledString LeadingMarginSpanTest002 x ' + AppStorage.get('StyledStringOptionsX'));
      expect(AppStorage.get('StyledStringOptionsX') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest002 top ' + AppStorage.get('StyledStringOptionsTop'));
      expect(AppStorage.get('StyledStringOptionsTop') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest002 bottom ' + AppStorage.get('StyledStringOptionsBottom'));
      expect(AppStorage.get('StyledStringOptionsBottom') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest002 baseline ' + AppStorage.get('StyledStringOptionsBaseline'));
      expect(AppStorage.get('StyledStringOptionsBaseline') as number >= 0).assertTrue();


      console.info('StyledString LeadingMarginSpanTest002 direction ' + AppStorage.get('StyledStringOptionsDirection'));
      expect(AppStorage.get('StyledStringOptionsDirection')).assertEqual(1);

      console.info('StyledString LeadingMarginSpanTest002 start ' + AppStorage.get('StyledStringOptionsStart'));
      expect(AppStorage.get('StyledStringOptionsStart') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest002 end ' + AppStorage.get('StyledStringOptionsEnd'));
      expect(AppStorage.get('StyledStringOptionsEnd') as number >= 0).assertTrue();

      console.info('StyledString LeadingMarginSpanTest002 first ' + AppStorage.get('StyledStringOptionsFirst'));
      expect(!AppStorage.get('StyledStringOptionsFirst')).assertTrue();

      console.info('StyledString LeadingMarginSpanTest002 getText ' + AppStorage.get('ParagraphStyleLeadingMarginSpan'));
      expect( AppStorage.get('ParagraphStyleLeadingMarginSpan')).assertEqual('①');

      console.info("[LeadingMarginSpanTest002] end");
      done();
    });
  })
}