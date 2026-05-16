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
import CommonFunc from '../MainAbility/common/Common'

export default function TextDirectionTest() {
  describe('TextDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextDirectionTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextDirectionTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("TextDirectionTest" == pages.name)) {
          console.info("get TextDirectionTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextDirectionTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDirectionTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextDirectionTest after each called");
    });
    afterAll(async ()=>{
      AppStorage.delete('TextDirection')
    })

    /**
     * @tc.name   TextDirectionTest001
     * @tc.number TextDirectionTest001
     * @tc.desc   test Text set TextDirection.LTR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextDirectionTest001', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextDirection TextDirectionTest001 START');
      await CommonFunc.sleep(1000);
      let getTextDirectionTest1 = await driver.findComponent(ON.id('getTextDirectionTest1'))
      await CommonFunc.sleep(500);
      await getTextDirectionTest1.click();
      await CommonFunc.sleep(500);
      console.info('TextDirection TextDirectionTest001 direction ' + AppStorage.get('TextDirection'));
      expect(AppStorage.get('TextDirection')).assertEqual(TextDirection.LTR);
      console.info("[TextDirectionTest001] end");
      done();
    });

    /**
     * @tc.name   TextDirectionTest002
     * @tc.number TextDirectionTest002
     * @tc.desc   test RichEditor set TextDirection.RTL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextDirectionTest002', Level.LEVEL2, async (done: Function) => {
      let driver = Driver.create();
      console.info('StyledString TextDirectionTest002 START');
      await CommonFunc.sleep(1000);
      let getTextDirectionTest2 = await driver.findComponent(ON.id('getTextDirectionTest2'))
      await CommonFunc.sleep(500);
      await getTextDirectionTest2.click();
      await CommonFunc.sleep(500);
      console.info('TextDirection TextDirectionTest002 direction ' + AppStorage.get('TextDirection'));
      expect(AppStorage.get('TextDirection')).assertEqual(TextDirection.RTL);
      console.info("[TextDirectionTest002] end");
      done();
    });
  })
}