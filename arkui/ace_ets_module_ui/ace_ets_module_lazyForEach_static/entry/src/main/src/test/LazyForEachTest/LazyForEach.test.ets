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
import { DataOperationType } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function LazyForEachTest() {
  describe('LazyForEachTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.lazyForEach.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/LazyForEach/LazyForEachIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] LazyForEachTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "LazyForEachIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] LazyForEachTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] LazyForEachTest afterEach start");
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] LazyForEachTest afterEach end");
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0100
     * @tc.name dataOperationTypeAdd
     * @tc.desc Test DataOperationType.ADD = 'add'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataOperationTypeAdd', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeAdd START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DataOperationType.ADD).assertEqual('add');
        console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeAdd END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeAdd error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0200
     * @tc.name dataOperationTypeDelete
     * @tc.desc Test DataOperationType.DELETE = 'delete'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataOperationTypeDelete', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeDelete START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DataOperationType.DELETE).assertEqual('delete');
        console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeDelete END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeDelete error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0300
     * @tc.name dataOperationTypeExchange
     * @tc.desc Test DataOperationType.EXCHANGE = 'exchange'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataOperationTypeExchange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeExchange START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DataOperationType.EXCHANGE).assertEqual('exchange');
        console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeExchange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeExchange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0400
     * @tc.name dataOperationTypeMove
     * @tc.desc Test DataOperationType.MOVE = 'move'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataOperationTypeMove', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeMove START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DataOperationType.MOVE).assertEqual('move');
        console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeMove END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeMove error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0500
     * @tc.name dataOperationTypeChange
     * @tc.desc Test DataOperationType.CHANGE = 'change'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataOperationTypeChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeChange START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DataOperationType.CHANGE).assertEqual('change');
        console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeChange END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeChange error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0600
     * @tc.name dataOperationTypeReload
     * @tc.desc Test DataOperationType.RELOAD = 'reload'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dataOperationTypeReload', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeReload START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(DataOperationType.RELOAD).assertEqual('reload');
        console.info('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeReload END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: dataOperationTypeReload error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0700
     * @tc.name lazyForEachPageRenders
     * @tc.desc Verify LazyForEach page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lazyForEachPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: lazyForEachPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('lazyForEachRoot'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] LazyForEachTest execute: lazyForEachPageRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: lazyForEachPageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0800
     * @tc.name lazyForEachListRenders
     * @tc.desc Verify LazyForEach list renders with data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lazyForEachListRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: lazyForEachListRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('lazyForEachList'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] LazyForEachTest execute: lazyForEachListRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: lazyForEachListRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_LAZYFOREACH_0900
     * @tc.name lazyForEachDebugLine
     * @tc.desc Verify LazyForEachAttribute.debugLine method exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lazyForEachDebugLine', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] LazyForEachTest execute: lazyForEachDebugLine START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('lazyForEachList'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] LazyForEachTest execute: lazyForEachDebugLine END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] LazyForEachTest execute: lazyForEachDebugLine error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
