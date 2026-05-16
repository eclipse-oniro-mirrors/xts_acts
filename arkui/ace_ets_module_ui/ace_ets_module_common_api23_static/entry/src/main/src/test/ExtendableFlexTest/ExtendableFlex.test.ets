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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function ExtendableFlexTest() {
  describe('ExtendableFlexTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('ExtendableFlexTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.common.api23.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('ExtendableFlexTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ExtendableFlex/ExtendableFlex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('ExtendableFlexTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'ExtendableFlex') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('ExtendableFlexTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('ExtendableFlexTest after each called');
    });

    /**
     * @tc.number ExtendableFlexTest_001
     * @tc.name lifeCycleBuild
     * @tc.desc Test LifeCycle build case on page, verify builder node exists via Driver and Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifeCycleBuild', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ExtendableFlexTest execute: lifeCycleBuild START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('lifeCycleBuildCase');
        console.info('ExtendableFlexTest lifeCycleBuildCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('ExtendableFlexPageState') ?? '';
        console.info('ExtendableFlexTest ExtendableFlexPageState: ' + stateSnapshot);
        expect(stateSnapshot.includes('lifeCycleBuild')).assertEqual(true);

        console.info('ExtendableFlexTest execute: lifeCycleBuild END');
        done();
      } catch (error) {
        console.error('ExtendableFlexTest execute: lifeCycleBuild error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ExtendableFlexTest_002
     * @tc.name flexFunction
     * @tc.desc Test global Flex case on page, verify flex container and child exist via Driver and Inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('flexFunction', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ExtendableFlexTest execute: flexFunction START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let containerRaw = inspector.getInspectorByKey('flexContainerCase');
        console.info('ExtendableFlexTest flexContainerCase inspector length: ' + containerRaw.length);
        expect(containerRaw.length > 0).assertEqual(true);
        let childRaw = inspector.getInspectorByKey('flexFunctionCase');
        console.info('ExtendableFlexTest flexFunctionCase inspector length: ' + childRaw.length);
        expect(childRaw.length > 0).assertEqual(true);

        let stateSnapshot = AppStorage.get<string>('ExtendableFlexPageState') ?? '';
        console.info('ExtendableFlexTest ExtendableFlexPageState: ' + stateSnapshot);
        expect(stateSnapshot.includes('flexFunction')).assertEqual(true);

        console.info('ExtendableFlexTest execute: flexFunction END');
        done();
      } catch (error) {
        console.error('ExtendableFlexTest execute: flexFunction error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
