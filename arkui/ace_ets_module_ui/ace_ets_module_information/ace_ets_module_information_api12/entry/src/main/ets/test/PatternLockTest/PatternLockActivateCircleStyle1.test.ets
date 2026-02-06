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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function PatternLockActivateCircleStyle1() {
  describe('PatternLockActivateCircleStyle1', () => {
    beforeEach(async (done: Function) => {
      console.info("PatternLockActivateCircleStyle1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PatternLock/PatternLockActivateCircleStyle1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PatternLockActivateCircleStyle1 state success " + JSON.stringify(pages));
        if (!("PatternLockActivateCircleStyle1" == pages.name)) {
          console.info("get PatternLockActivateCircleStyle1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PatternLockActivateCircleStyle1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PatternLockActivateCircleStyle1 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PatternLockActivateCircleStyle1 after each called");
    });

    /**
     * @tc.number PatternLockActivateCircleStyle1_0100
     * @tc.name PatternLockActivateCircleStyle1_0100
     * @tc.desc Test PatternLock activateCircleStyle
     * @tc.level Level 2
     */
    it('PatternLockActivateCircleStyle1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[PatternLockActivateCircleStyle1_0100] START');
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('PatternLock_activateCircleStyle');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[VideoReset1_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.activeCircleColor).assertEqual('#FF90EE90');
      expect(obj1.$attrs.activeCircleRadius).assertEqual('16.00vp');
      expect(obj1.$attrs.enableWaveEffect).assertEqual('true');

      console.info('[PatternLockActivateCircleStyle1_0100] END');
      done();
    });
  })
}

