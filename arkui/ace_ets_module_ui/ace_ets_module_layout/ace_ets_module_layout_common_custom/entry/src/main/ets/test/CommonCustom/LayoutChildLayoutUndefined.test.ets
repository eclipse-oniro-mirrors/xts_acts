/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function LayoutChildLayoutUndefinedTest() {
  describe('LayoutChildLayoutUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("LayoutChildLayoutUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonCustom/LayoutChildLayoutUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LayoutChildLayoutUndefined state success " + JSON.stringify(pages));
        if (!("LayoutChildLayoutUndefined" == pages.name)) {
          console.info("get LayoutChildLayoutUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LayoutChildLayoutUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LayoutChildLayoutUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   LayoutChildLayoutUndefinedTest_0100
     * @tc.number LayoutChildLayoutUndefinedTest_0100
     * @tc.desc   test layout with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LayoutChildLayoutUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('LayoutChildLayoutUndefinedTest_0100 START');

      let child_1 = CommonFunc.getComponentRect('LayoutChildLayoutUndefinedTest_1');
      let child_2 = CommonFunc.getComponentRect('LayoutChildLayoutUndefinedTest_2');
      let child_3 = CommonFunc.getComponentRect('LayoutChildLayoutUndefinedTest_3');

      // test layout is invalid
      expect(Math.abs(child_1.left - child_2.left)).assertLess(1);
      expect(Math.abs(child_3.left - child_2.left)).assertLess(1);
      expect(Math.abs(child_1.top - child_2.top)).assertLess(1);
      expect(Math.abs(child_3.top - child_2.top)).assertLess(1);

      console.info('LayoutChildLayoutUndefinedTest_0100 END');
      done();
    });
  })
}

