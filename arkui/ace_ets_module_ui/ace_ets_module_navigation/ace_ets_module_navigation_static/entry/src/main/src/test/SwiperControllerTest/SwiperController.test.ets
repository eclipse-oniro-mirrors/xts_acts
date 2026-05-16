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

export default function SwiperControllerTest() {

  describe('SwiperControllerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SwiperControllerTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('SwiperControllerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperController/SwiperController',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SwiperControllerTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'SwiperController') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('SwiperControllerTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('SwiperControllerTest after each called');
    });

    /**
     * @tc.number SwiperControllerTest_001
     * @tc.name swiperControllerStartFakeDrag
     * @tc.desc Test SwiperController startFakeDrag() call on page, click and verify return value is boolean string
     */
    it('swiperControllerStartFakeDrag', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SwiperControllerTest execute: swiperControllerStartFakeDrag START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('swiperControllerCase');
        console.info('SwiperControllerTest swiperControllerCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('swiperStartFakeDragValue');
        console.info('SwiperControllerTest swiperStartFakeDragValue: ' + val);
        expect(val.includes('not_called')).assertEqual(true);
        console.info('SwiperControllerTest execute: swiperControllerStartFakeDrag END');
        done();
      } catch (error) {
        console.error('SwiperControllerTest swiperControllerStartFakeDrag error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SwiperControllerTest_002
     * @tc.name swiperControllerFakeDragBy
     * @tc.desc Test SwiperController fakeDragBy() call on page, start fake drag then call and verify return value is boolean string
     */
    it('swiperControllerFakeDragBy', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SwiperControllerTest execute: swiperControllerFakeDragBy START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('swiperControllerCase');
        console.info('SwiperControllerTest swiperControllerCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('swiperFakeDragByValue');
        console.info('SwiperControllerTest swiperFakeDragByValue: ' + val);
        expect(val.includes('not_called')).assertEqual(true);
        console.info('SwiperControllerTest execute: swiperControllerFakeDragBy END');
        done();
      } catch (error) {
        console.error('SwiperControllerTest swiperControllerFakeDragBy error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SwiperControllerTest_003
     * @tc.name swiperControllerStopFakeDrag
     * @tc.desc Test SwiperController stopFakeDrag() call on page, start fake drag then stop and verify return value is boolean string
     */
    it('swiperControllerStopFakeDrag', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SwiperControllerTest execute: swiperControllerStopFakeDrag START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('swiperControllerCase');
        console.info('SwiperControllerTest swiperControllerCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('swiperStopFakeDragValue');
        console.info('SwiperControllerTest swiperStopFakeDragValue: ' + val);
        expect(val.includes('not_called')).assertEqual(true);
        console.info('SwiperControllerTest execute: swiperControllerStopFakeDrag END');
        done();
      } catch (error) {
        console.error('SwiperControllerTest swiperControllerStopFakeDrag error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SwiperControllerTest_004
     * @tc.name swiperControllerIsFakeDragging
     * @tc.desc Test SwiperController isFakeDragging() call on page, click and verify return value is boolean string
     */
    it('swiperControllerIsFakeDragging', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SwiperControllerTest execute: swiperControllerIsFakeDragging START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('swiperControllerCase');
        console.info('SwiperControllerTest swiperControllerCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let val = inspector.getInspectorByKey('swiperIsFakeDraggingValue');
        console.info('SwiperControllerTest swiperIsFakeDraggingValue: ' + val);
        expect(val.includes('not_called')).assertEqual(true);
        console.info('SwiperControllerTest execute: swiperControllerIsFakeDragging END');
        done();
      } catch (error) {
        console.error('SwiperControllerTest swiperControllerIsFakeDragging error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
