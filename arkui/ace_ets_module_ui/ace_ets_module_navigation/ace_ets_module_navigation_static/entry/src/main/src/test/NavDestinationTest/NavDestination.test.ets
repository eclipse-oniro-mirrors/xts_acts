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
import { VisibilityChangeReason } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function NavDestinationTest() {
  describe('NavDestinationTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('NavDestinationTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('NavDestinationTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/NavDestination',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('NavDestinationTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'NavDestination') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('NavDestinationTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('NavDestinationTest after each called');
    });

    /**
     * @tc.number NavDestinationTest01
     * @tc.name visibilityChangeReasonTransition
     * @tc.desc visibilityChangeReasonTransition
     */
    it('visibilityChangeReasonTransition', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('NavDestinationTest execute: visibilityChangeReasonTransition START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('visibilityChangeReasonCurrentValue');
        console.info('NavDestinationTest visibilityChangeReasonCurrentValue length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(VisibilityChangeReason.TRANSITION).assertEqual(0);

        console.info('NavDestinationTest execute: visibilityChangeReasonTransition END');
        done();
      } catch (error) {
        console.error('NavDestinationTest visibilityChangeReasonTransition error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number NavDestinationTest02
     * @tc.name visibilityChangeReasonContentCover
     * @tc.desc visibilityChangeReasonContentCover
     */
    it('visibilityChangeReasonContentCover', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('NavDestinationTest execute: visibilityChangeReasonContentCover START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('visibilityChangeReasonCurrentValue');
        console.info('NavDestinationTest visibilityChangeReasonCurrentValue length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(VisibilityChangeReason.CONTENT_COVER).assertEqual(1);

        console.info('NavDestinationTest execute: visibilityChangeReasonContentCover END');
        done();
      } catch (error) {
        console.error('NavDestinationTest visibilityChangeReasonContentCover error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number NavDestinationTest03
     * @tc.name visibilityChangeReasonAppState
     * @tc.desc visibilityChangeReasonAppState
     */
    it('visibilityChangeReasonAppState', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('NavDestinationTest execute: visibilityChangeReasonAppState START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('visibilityChangeReasonCurrentValue');
        console.info('NavDestinationTest visibilityChangeReasonCurrentValue length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        expect(VisibilityChangeReason.APP_STATE).assertEqual(2);

        console.info('NavDestinationTest execute: visibilityChangeReasonAppState END');
        done();
      } catch (error) {
        console.error('NavDestinationTest visibilityChangeReasonAppState error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
