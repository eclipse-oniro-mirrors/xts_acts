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
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function StepperTest1() {
  describe('StepperTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("StepperTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/StepperTest1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StepperTest1 state success " + JSON.stringify(pages));
        if (!("StepperTest1" == pages.name)) {
          console.info("get StepperTest1 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StepperTest1 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StepperTest1 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StepperTest1 after each called");
    });

    /**
     * @tc.name   StepperTest1_0100
     * @tc.number StepperTest1_0100
     * @tc.desc   Test ItemState.Skip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('StepperTest1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[StepperTest1_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.text('下一步'));
      await text.click()
      console.info('[StepperTest1_0100] text click');
      await CommonFunc.sleep(2000);

      let text2 = await driver.findComponent(ON.text('跳过'));
      await text2.click()
      console.info('[StepperTest1_0100] text2 click');
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('StepperTest1_text');
      await CommonFunc.sleep(1000);
      console.info("[StepperTest1_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('PageFour');

      console.info('[StepperTest1_0100] END');
      done();
    });
  })
}

