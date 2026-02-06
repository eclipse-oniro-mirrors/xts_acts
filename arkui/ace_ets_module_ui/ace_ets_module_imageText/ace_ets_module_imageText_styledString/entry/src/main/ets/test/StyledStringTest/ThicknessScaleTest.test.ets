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

export default function ThicknessScaleTest() {
  describe('ThicknessScaleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ThicknessScaleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ThicknessScaleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ThicknessScaleTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("ThicknessScaleTest" == pages.name)) {
          console.info("get ThicknessScaleTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push ThicknessScaleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ThicknessScaleTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("ThicknessScaleTest after each called");
    });

    /**
     * @tc.name   ThicknessScaleTest0001
     * @tc.number SUB_ACE_BASIC_THICKNESS_SCALE_ETS_API_0001
     * @tc.desc   test ThicknessScale no set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ThicknessScaleTest0001', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('ThicknessScaleTest0001 START');
      let setStyledString1 = await driver.findComponent(ON.id('setStyledString1'))
      await CommonFunc.sleep(500);
      await setStyledString1.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledString1ThicknessScale')).assertEqual('undefined');
      AppStorage.delete('StyledString1ThicknessScale')
      console.info("[ThicknessScaleTest0001] end");
      done();
    });

    /**
     * @tc.name   ThicknessScaleTest0002
     * @tc.number SUB_ACE_BASIC_THICKNESS_SCALE_ETS_API_0002
     * @tc.desc   test ThicknessScale set 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ThicknessScaleTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('ThicknessScaleTest0002 START');
      let setStyledString2 = await driver.findComponent(ON.id('setStyledString2'))
      await CommonFunc.sleep(500);
      await setStyledString2.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledString2ThicknessScale')).assertEqual('2');
      AppStorage.delete('StyledString2ThicknessScale')
      console.info("[ThicknessScaleTest0002] end");
      done();
    });

    /**
     * @tc.name   ThicknessScaleTest0003
     * @tc.number SUB_ACE_BASIC_THICKNESS_SCALE_ETS_API_0003
     * @tc.desc   test ThicknessScale set 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ThicknessScaleTest0003', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('ThicknessScaleTest0003 START');
      let setStyledString3 = await driver.findComponent(ON.id('setStyledString3'))
      await CommonFunc.sleep(500);
      await setStyledString3.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledString3ThicknessScale')).assertEqual('0');
      AppStorage.delete('StyledString3ThicknessScale')
      console.info("[ThicknessScaleTest0003] end");
      done();
    });

    /**
     * @tc.name   ThicknessScaleTest0004
     * @tc.number SUB_ACE_BASIC_THICKNESS_SCALE_ETS_API_0004
     * @tc.desc   test ThicknessScale set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ThicknessScaleTest0004', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('ThicknessScaleTest0004 START');
      let setStyledString4 = await driver.findComponent(ON.id('setStyledString4'))
      await CommonFunc.sleep(500);
      await setStyledString4.click()
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('StyledString4ThicknessScale')).assertEqual('undefined');
      AppStorage.delete('StyledString4ThicknessScale')
      console.info("[ThicknessScaleTest0004] end");
      done();
    });
  })
}