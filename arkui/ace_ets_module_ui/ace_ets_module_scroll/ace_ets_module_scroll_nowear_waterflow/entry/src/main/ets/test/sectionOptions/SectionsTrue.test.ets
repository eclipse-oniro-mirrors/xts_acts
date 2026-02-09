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

export default function SectionsTrue() {
  describe('SectionsTrue', () => {
    beforeEach(async (done: Function) => {
      console.info("SectionsTrue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/sectionOptions/SectionsTrue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SectionsTrue state pages:" + JSON.stringify(pages));
        if (!("SectionsTrue" == pages.name)) {
          console.info("get SectionsTrue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SectionsTrue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SectionsTrue page error:" + err);
      }
      console.info("SectionsTrue beforeEach end");
      done();
    });

    /**
     * @tc.name   SectionsTrue_0100
     * @tc.number SectionsTrue_001
     * @tc.desc   Waterfall grouping splice returns true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SectionsTrue_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SectionsTrue_0100] START');
      await CommonFunc.sleep(1000);
      console.info("[SectionsTrue_0100] splice true: " + AppStorage.get('spliceTrue'));
      expect(AppStorage.get('spliceTrue')).assertEqual(true);
      AppStorage.delete('spliceTrue')
      console.info('SectionsTrue_0100 END');
      done();
    });

    /**
     * @tc.name   SectionsTrue_0200
     * @tc.number SectionsTrue_002
     * @tc.desc   Waterfall grouping returns true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SectionsTrue_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SectionsTrue_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('sections_true_values'));
      await btn1.click();
      console.info("[SectionsTrue_0200] Click WaterFlowSections values.");
      await CommonFunc.sleep(1500);
      console.info("[SectionsTrue_0200] values Length: " + AppStorage.get('values'));
      let result: SectionOptions[] | undefined = AppStorage.get('values')
      expect(result && result.length > 0).assertTrue();

      let btn2: Component = await driver.findComponent(ON.id('sections_true_update'));
      await btn2.click();
      console.info("[SectionsTrue_0200] Click WaterFlowSections update.");
      await CommonFunc.sleep(1500);
      console.info("[SectionsTrue_0200] update True: " + AppStorage.get('updateTrue'));
      expect(AppStorage.get('updateTrue')).assertEqual(true);

      let btn3: Component = await driver.findComponent(ON.id('sections_true_push'));
      await btn3.click();
      console.info("[SectionsTrue_0200] Click WaterFlowSections push.");
      await CommonFunc.sleep(1500);
      console.info("[SectionsTrue_0200] push True: " + AppStorage.get('pushTrue'));
      expect(AppStorage.get('pushTrue')).assertEqual(true);

      AppStorage.delete('values')
      AppStorage.delete('updateTrue')
      AppStorage.delete('pushTrue')
      console.info('SectionsTrue_0200 END');
      done();
    });
  })
}