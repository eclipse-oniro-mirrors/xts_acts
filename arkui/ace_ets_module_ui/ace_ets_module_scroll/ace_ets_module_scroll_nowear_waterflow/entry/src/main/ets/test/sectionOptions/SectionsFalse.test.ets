/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SectionsFalse() {
  describe('SectionsFalse', () => {
    beforeEach(async (done: Function) => {
      console.info("SectionsFalse beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/sectionOptions/SectionsFalse",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SectionsFalse state pages:" + JSON.stringify(pages));
        if (!("SectionsFalse" == pages.name)) {
          console.info("get SectionsFalse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SectionsFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SectionsFalse page error:" + err);
      }
      console.info("SectionsFalse beforeEach end");
      done();
    });

    /**
     * @tc.name   SectionsFalse_0100
     * @tc.number SectionsFalse_001
     * @tc.desc   Waterfall grouping returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SectionsFalse_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SectionsFalse_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('sections_false'));
      await btn.click();
      console.info("[SectionsFalse_0100] Click WaterFlowSections false.");
      await CommonFunc.sleep(1500);
      console.info("[SectionsFalse_0100] splice False: " + AppStorage.get('spliceFalse'));
      expect(AppStorage.get('spliceFalse')).assertEqual(false);
      console.info("[SectionsFalse_0100] push False: " + AppStorage.get('pushFalse'));
      expect(AppStorage.get('pushFalse')).assertEqual(false);
      console.info("[SectionsFalse_0100] update False: " + AppStorage.get('updateFalse'));
      expect(AppStorage.get('updateFalse')).assertEqual(false);
      console.info("[SectionsFalse_0100] values Length: " + AppStorage.get('valuesNull'));
      let result: SectionOptions[] | undefined = AppStorage.get('valuesNull')
      expect(result && result.length == 0).assertTrue();

      AppStorage.delete('spliceFalse')
      AppStorage.delete('pushFalse')
      AppStorage.delete('updateFalse')
      AppStorage.delete('valuesNull')
      console.info('SectionsFalse_0100 END');
      done();
    });
  })
}