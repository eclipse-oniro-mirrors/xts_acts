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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON, } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function MeasurableLayoutableReturn2UndefinedTest() {
  describe('MeasurableLayoutableReturn2UndefinedTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('MeasurableLayoutableReturn2UndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MeasurableLayoutable/measurableLayoutableReturn2Undefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get MeasurableLayoutableReturn2UndefinedTest state pages:' + JSON.stringify(pages));
        if (!('measurableLayoutableReturn2Undefined' == pages.name)) {
          console.info('get MeasurableLayoutableReturn2UndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push MeasurableLayoutableReturn2UndefinedTest page error:' + err);
      }
      console.info('MeasurableLayoutableReturn2UndefinedTest beforeEach end');
    });

    /**
     * @tc.number    MeasurableLayoutableReturn2UndefinedTest_static_0001
     * @tc.name      MeasurableLayoutableReturn2UndefinedTest_static_0001
     * @tc.desc      MeasurableLayoutableReturn2UndefinedTest_static_0001
     * @tc.level     Level.LEVEL1
     */
    it('MeasurableLayoutableReturn2UndefinedTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[MeasurableLayoutableReturn2UndefinedTest_static_0001] START.');
      let strJson = inspector.getInspectorByKey('Text_MeasurableLayoutable');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content').asString())
        .assertEqual('Measurable-Layoutable');

      console.info('[MeasurableLayoutableReturn2UndefinedTest_static_0001] END');
      done();
    });

  })
}