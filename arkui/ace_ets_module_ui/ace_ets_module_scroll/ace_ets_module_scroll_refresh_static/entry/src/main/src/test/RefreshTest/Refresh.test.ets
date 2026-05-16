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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function RefreshTest() {
  describe('RefreshTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RefreshTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.refresh.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('RefreshTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refresh',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('RefreshTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'refresh') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RefreshTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('RefreshTest after each called');
    });

    /**
     * @tc.number RefreshTest_001
     * @tc.name refreshPullUpToCancelRefresh
     * @tc.desc Test RefreshAttribute.pullUpToCancelRefresh(boolean) by toggling state and asserting inspector/AppStorage values.
     * @tc.level  Level.LEVEL1
     */
    it('refreshPullUpToCancelRefresh', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RefreshTest execute: refreshPullUpToCancelRefresh START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('refreshCase');
        console.info('RefreshTest refreshCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let pullUpVal = inspector.getInspectorByKey('refreshPullUpToCancelRefreshValue');
        console.info('RefreshTest refreshPullUpToCancelRefreshValue: ' + pullUpVal);
        expect(pullUpVal.includes('=true')).assertEqual(true);
        let stateSnapshot = AppStorage.get<string>('RefreshPageState') ?? '';
        console.info('RefreshTest RefreshPageState: ' + stateSnapshot);
        expect(stateSnapshot.includes('pullUpToCancelRefreshValue=true')).assertEqual(true);

        console.info('RefreshTest execute: refreshPullUpToCancelRefresh END');
        done();
      } catch (error) {
        console.error('RefreshTest refreshPullUpToCancelRefresh error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RefreshTest_002
     * @tc.name refreshPullUpToCancelRefreshFalse
     * @tc.desc refresh.d.ets RefreshAttribute.pullUpToCancelRefresh - boolean false variant
     * @tc.level  Level.LEVEL1
     */
    it('refreshPullUpToCancelRefreshFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RefreshTest: refreshPullUpToCancelRefreshFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('refreshPullFalse');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('RefreshTest refreshPullUpToCancelRefreshFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RefreshTest_003
     * @tc.name refreshPullUpToCancelRefreshUndefined
     * @tc.desc refresh.d.ets RefreshAttribute.pullUpToCancelRefresh - undefined variant
     * @tc.level  Level.LEVEL1
     */
    it('refreshPullUpToCancelRefreshUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RefreshTest: refreshPullUpToCancelRefreshUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('refreshPullUndef');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('RefreshTest refreshPullUpToCancelRefreshUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
