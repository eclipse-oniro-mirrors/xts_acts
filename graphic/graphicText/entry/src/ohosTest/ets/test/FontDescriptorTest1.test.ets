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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON, } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';

export default function FontDescriptorTest1() {
  describe('FontDescriptorTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("FontDescriptorTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FontDescriptor1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FontDescriptorTest1 state pages: " + JSON.stringify(pages));
        if (!("FontDescriptor1" == pages.name)) {
          console.info("get FontDescriptorTest1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(5000);
          console.info("push FontDescriptorTest1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FontDescriptorTest1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number FontDescriptor
     * @tc.name FontDescriptorTest1_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('FontDescriptorTest1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('FontDescriptorTest1_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('FontDescriptor1_2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('FontDescriptor1_1');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('fontSubfamily:Regular');
      console.info('[FontDescriptorTest1_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}