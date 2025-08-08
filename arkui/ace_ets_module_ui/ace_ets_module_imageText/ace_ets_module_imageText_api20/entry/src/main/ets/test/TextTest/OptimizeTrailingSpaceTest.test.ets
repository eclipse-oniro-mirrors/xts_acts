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

export default function OptimizeTrailingSpaceTest() {
  describe('OptimizeTrailingSpaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("OptimizeTrailingSpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/OptimizeTrailingSpaceTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OptimizeTrailingSpaceTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("OptimizeTrailingSpaceTest" == pages.name)) {
          console.info("get OptimizeTrailingSpaceTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push OptimizeTrailingSpaceTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OptimizeTrailingSpaceTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("OptimizeTrailingSpaceTest after each called");
    });

    /*
    * @tc.number       SUB_ACE_BASIC_OPTIMIZE_TRAILING_SPACE_ETS_API_0001
    * @tc.name         OptimizeTrailingSpaceTest0001
    * @tc.desc         test optimizeTrailingSpace set true
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('OptimizeTrailingSpaceTest0001', Level.LEVEL3, async (done: Function) => {
      console.info('OptimizeTrailingSpaceTest0001 START');
      let text = getInspectorByKey('optimizeTrailingSpace_text1');
      let textObj: ESObject = JSON.parse(text);
      console.log('optimizeTrailingSpace----:'+JSON.stringify(textObj.$attrs.optimizeTrailingSpace))
      expect(''+textObj.$attrs.optimizeTrailingSpace).assertEqual('true');
      console.info("[OptimizeTrailingSpaceTest0001] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_OPTIMIZE_TRAILING_SPACE_ETS_API_0002
    * @tc.name         OptimizeTrailingSpaceTest0002
    * @tc.desc         test optimizeTrailingSpace set false
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        3
     */
    it('OptimizeTrailingSpaceTest0002', Level.LEVEL3, async (done: Function) => {
      console.info('OptimizeTrailingSpaceTest0002 START');
      let text = getInspectorByKey('optimizeTrailingSpace_text2');
      let textObj: ESObject = JSON.parse(text);
      console.log('optimizeTrailingSpace----:'+JSON.stringify(textObj.$attrs.optimizeTrailingSpace))
      expect(''+textObj.$attrs.optimizeTrailingSpace).assertEqual('false');
      console.info("[OptimizeTrailingSpaceTest0002] end");
      done();
    });
  })
}