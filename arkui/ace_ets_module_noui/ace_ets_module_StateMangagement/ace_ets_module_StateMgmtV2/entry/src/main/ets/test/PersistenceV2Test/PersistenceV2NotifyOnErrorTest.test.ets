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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { PersistenceV2, Type } from '@kit.ArkUI';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function persistenceV2NotifyOnErrorTest() {
  describe('PersistenceV2NotifyOnErrorTest', () => {

    beforeEach(async (done: Function) => {
      console.info("PersistenceV2NotifyOnErrorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PersistenceV2NotifyOnErrorTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("PersistenceV2NotifyOnErrorTest" == pages.name)) {
          console.info("get PersistenceV2NotifyOnErrorTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistenceV2NotifyOnErrorTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistenceV2NotifyOnErrorTest page error:" + err);
      }
      console.info("PersistenceV2NotifyOnErrorTest beforeEach end");
      done();
    });

    afterEach(() => {
      console.info('[PersistenceV2NotifyOnErrorTest] afterEach called');
    });

    afterAll(() => {
      console.info('[PersistenceV2NotifyOnErrorTest] afterAll called');
    });

    /**
     * @tc.name   SUB_ARUI_PERSISTENCEV2_NOTIFYONERROR_OLDVALUE_0100
     * @tc.number SUB_ARUI_PERSISTENCEV2_NOTIFYONERROR_OLDVALUE_0100
     * @tc.desc   Test PersistenceV2.notifyOnError callback with oldValue parameter (serialization error scenario)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARUI_PERSISTENCEV2_NOTIFYONERROR_OLDVALUE_0100', Level.LEVEL2, async () => {
      console.info('[PersistenceV2_notifyOnError_oldValue_001] START');

      try {
        let oldValue: string| undefined =  AppStorage.get('PersistenceV2_notifyOnError_oldValue')
        expect(oldValue).assertEqual('isUndefined')
        AppStorage.delete('PersistenceV2_notifyOnError_oldValue')
        PersistenceV2.remove('SampleOld')
        console.info('[PersistenceV2_notifyOnError_oldValue_001] END');
      } catch (err) {
        console.error('[PersistenceV2_notifyOnError_oldValue_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
    });

  });
}
