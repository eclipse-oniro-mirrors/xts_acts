/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/common/Utils'

export default function gestureParallelJsunit() {
  describe('gestureParallelTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureGroup/gesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gesture state success " + JSON.stringify(pages));
        if (!("gesture" == pages.name)) {
          console.info("get gesture state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push gesture page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gesture page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gestureParallel after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgestureParallel0001
     * @tc.desic         acegestureParallelEtsTest0001
     */
    it('testgestureParallel0001', 0, async (done: Function) => {
      console.info('gestureParallel testgestureParallel0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('ParallelText');
      console.info("[testgestureParallel0001] component width strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("320.00vp");
      console.info("[testgestureParallel0001] width value :" + JSON.parse(strJson).$attrs.width);
      done();
    });
  })
}
