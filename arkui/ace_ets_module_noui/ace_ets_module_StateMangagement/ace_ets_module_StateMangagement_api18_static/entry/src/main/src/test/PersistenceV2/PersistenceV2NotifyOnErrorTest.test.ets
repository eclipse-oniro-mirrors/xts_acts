'use static';
/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import {UtilsTest,startAbility} from '../Util.test';
import { PersistenceV2,AppStorage } from '@kit.ArkUI';

export default function PersistenceV2NotifyOnErrorTest() {
  describe('PersistenceV2NotifyOnErrorTest', () => {

    beforeEach(async (): Promise<void> =>  {
      console.info("PersistenceV2NotifyOnErrorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PersistenceV2/PersistenceV2NotifyOnErrorTest",
      }
      try {
        const PersistenceV2NotifyOnErrorTest = AppStorage.get<Router>("router") as Router
        PersistenceV2NotifyOnErrorTest.clear();
        let pages:router.RouterState = PersistenceV2NotifyOnErrorTest.getState();
        console.info("get PersistenceV2NotifyOnErrorTest state pages: " + JSON.stringify(pages));
        if (!("PersistenceV2NotifyOnErrorTest" == pages.name)) {
          console.info("get PersistenceV2NotifyOnErrorTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await PersistenceV2NotifyOnErrorTest.pushUrl(options);
          PersistenceV2NotifyOnErrorTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PersistenceV2NotifyOnErrorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistenceV2NotifyOnErrorTest page error:" + err);
      }
      console.info("PersistenceV2NotifyOnErrorTest beforeEach end");
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
    it('SUB_ARUI_PERSISTENCEV2_NOTIFYONERROR_OLDVALUE_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[PersistenceV2_notifyOnError_oldValue_001] START');

      let oldValue: string| undefined =  AppStorage.get<string| undefined>('PersistenceV2_notifyOnError_oldValue') as string| undefined
      expect(oldValue).assertEqual('isUndefined')
      AppStorage.delete('PersistenceV2_notifyOnError_oldValue');
      PersistenceV2.remove('SampleOld');
      console.info('[PersistenceV2_notifyOnError_oldValue_001] END');
      done();
    });

  });
}