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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function shouldBuiltInRecognizerParallelWithUndefinedTest() {
  describe('shouldBuiltInRecognizerParallelWithUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("shouldBuiltInRecognizerParallelWithUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/shouldBuiltInRecognizerParallelWithUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get shouldBuiltInRecognizerParallelWithUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("shouldBuiltInRecognizerParallelWithUndefined" == pages.name)) {
          console.info("get shouldBuiltInRecognizerParallelWithUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push shouldBuiltInRecognizerParallelWithUndefinedTest page error:" + err);
      }
      console.info("shouldBuiltInRecognizerParallelWithUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    shouldBuiltInRecognizerParallelWithUndefinedTest_static_0100
     * @tc.name      shouldBuiltInRecognizerParallelWithUndefinedTest_static_0100
     * @tc.desc      shouldBuiltInRecognizerParallelWithUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('shouldBuiltInRecognizerParallelWithUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[shouldBuiltInRecognizerParallelWithUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let shouldBuiltInRecognizerParallelWith1 = await driver1.findComponent(ON.id('commonmethod_shouldBuiltInRecognizerParallelWith41')) as Component;
      await CommonFunc.sleep(500);
      let shouldBuiltInRecognizerParallelWith2 = await driver1.findComponent(ON.id('commonmethod_shouldBuiltInRecognizerParallelWith40')) as Component;
      await CommonFunc.sleep(500);
      await (shouldBuiltInRecognizerParallelWith1?.dragTo(shouldBuiltInRecognizerParallelWith2) as Promise<void>);

      let strJson = inspector.getInspectorByKey('commonmethod_shouldBuiltInRecognizerParallelWith3');
      let shouldBuiltInRecognizerParallelWithValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(shouldBuiltInRecognizerParallelWithValue.asString()).assertEqual('Count1');

      let btn2: Component = await driver1.findComponent(ON.id('button_shouldBuiltInRecognizerParallelWith')) as Component;
      btn2?.click();
      await CommonFunc.sleep(500);
      await (shouldBuiltInRecognizerParallelWith2?.dragTo(shouldBuiltInRecognizerParallelWith1) as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('commonmethod_shouldBuiltInRecognizerParallelWith3');
      let shouldBuiltInRecognizerParallelWithValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(shouldBuiltInRecognizerParallelWithValue1.asString()).assertEqual('Count1');
      await CommonFunc.sleep(2000);

      console.info('[shouldBuiltInRecognizerParallelWithUndefinedTest_static_0100] END');
      done();
    });

  })
}