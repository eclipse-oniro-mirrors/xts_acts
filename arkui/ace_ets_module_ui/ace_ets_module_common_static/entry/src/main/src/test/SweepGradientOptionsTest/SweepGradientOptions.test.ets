'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/SweepGradientOptions/SweepGradientOptionsIndex';
const PAGE_NAME = 'SweepGradientOptionsIndex';

export default function SweepGradientOptionsTest() {
  describe('SweepGradientOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number SweepGradientOptionsTest_001
     * @tc.name SweepGradientOpticmetricsColors
     * @tc.desc Verify SweepGradient.metricsColors property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SweepGradientOpticmetricsColors', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const text = await driver.findComponent(ON.id('SweepGradientOpticmetricsColors'));
        expect(text !== null).assertTrue();
        await CommonFunc.sleep(1000);
        const inspectorText = inspector.getInspectorByKey('SweepGradientOpticmetricsColors');
        expect(inspectorText.includes('sweepGradient')).assertTrue();
        expect(inspectorText.includes('metricsColors')).assertTrue();
        expect(inspectorText.includes('#FF00FF00')).assertTrue();
        expect(inspectorText.includes('0.500000')).assertTrue();
      } catch (error) {
        console.error('SweepGradientOpticmetricsColors error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
