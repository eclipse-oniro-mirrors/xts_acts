/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import { PersistenceV2 } from '@kit.ArkUI';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function PersistenceV2TypeMismatchTest() {
  describe('PersistenceV2TypeMismatchTest', () => {

    beforeEach(async (done: Function) => {
      console.info("PersistenceV2TypeMismatchTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PersistenceV2TypeMismatch",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("PersistenceV2TypeMismatch" == pages.name)) {
          console.info("get PersistenceV2TypeMismatchTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistenceV2TypeMismatchTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistenceV2TypeMismatchTest page error:" + err);
      }
      console.info("PersistenceV2TypeMismatchTest beforeEach end");
      done();
    });

    afterEach(() => {});

    afterAll(async () => {});

    /**
     * @tc.name   PersistenceV2TypeMismatch_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_TYPEMISMATCH_0100
     * @tc.desc   Test PersistenceV2 handling type mismatch in nested object structure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('PersistenceV2TypeMismatch_0100', Level.LEVEL0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'PersistenceV2TypeMismatch_0100 begin');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let btnChangeType = await driver.findComponent(ON.id('btn_change_type'));
      expect(btnChangeType !== undefined).assertTrue();

      await btnChangeType.click();
      await CommonFunc.sleep(1000);

      let textResult = await driver.findComponent(ON.id('text_result'));
      expect(textResult !== undefined).assertTrue();
      let resultText = await textResult.getText();
      hilog.info(0x0000, 'testTag', '%{public}s', 'Result text: ' + resultText);

      expect(resultText).assertEqual('Result: SUCCESS: Type mismatch handled');

      let textFatherSet =await (await driver.findComponent(ON.id('text_father_set'))).getText();
      expect(textFatherSet).assertContain('0');

      let textChildId = await driver.findComponent(ON.id('text_childId'));
      expect(textChildId !== undefined).assertTrue();
      let childIdText = await textChildId.getText();
      hilog.info(0x0000, 'testTag', '%{public}s', 'ChildId text: ' + childIdText);
      expect(childIdText).assertContain('ChildId: 1');
      PersistenceV2.remove('SamplePersistenceV2TypeMismatch')
      hilog.info(0x0000, 'testTag', '%{public}s', 'PersistenceV2TypeMismatch_0100 end');
    });
  });
}