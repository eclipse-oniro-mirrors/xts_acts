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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';


export default function slideRange() {
  describe('slideRange', () => {
    beforeEach(async (done: Function) => {
      console.info("slideRange beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/slideRange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get slideRange state success " + JSON.stringify(pages));
        if (!("slideRange" == pages.name)) {
          console.info("get slideRange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push slideRange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push slideRange page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("slideRange after each called");
    });


  /**
    * @tc.number      slideRange_001
    * @tc.name        slideRange_001
    * @tc.desc        Test slideRange, minResponsiveDistance
    * @tc.level       Level 2
    */
    it('slideRange_001', Level.LEVEL1, async (done: Function) => {
      console.info('[slideRange_001] START');
      let strJson = getInspectorByKey('slideRangeValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[slideRange_001] obj is: " + JSON.stringify(obj));
      console.info("[slideRange_001] slideRange is: " + JSON.stringify(obj.$attrs.slideRange));
      expect(JSON.stringify(obj.$attrs.slideRange)).assertEqual('{"from":"20.000000","to":"80.000000"}');
      console.info('[slideRange_001] END');
      done();
    });

  })
}


