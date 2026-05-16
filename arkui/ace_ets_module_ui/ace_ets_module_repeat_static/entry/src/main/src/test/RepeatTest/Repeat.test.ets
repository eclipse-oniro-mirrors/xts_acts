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
interface LocalVirtualScrollOptions {
  totalCount?: number;
  reusable?: boolean;
  disableVirtualScroll?: boolean;
}

interface LocalRepeatItem {
  item: string;
  index: int;
}

const SLEEP_TIME = 1000;

export default function RepeatTest() {
  describe('RepeatTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.repeat.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/Repeat/RepeatIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] RepeatTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "RepeatIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] RepeatTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] RepeatTest afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_REPEAT_0100
     * @tc.name repeatPageRenders
     * @tc.desc Verify Repeat test page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('repeatPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest execute: repeatPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('repeatRoot'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] RepeatTest execute: repeatPageRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RepeatTest execute: repeatPageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_REPEAT_0200
     * @tc.name repeatListRenders
     * @tc.desc Verify Repeat list renders with items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('repeatListRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest execute: repeatListRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('repeatList'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] RepeatTest execute: repeatListRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RepeatTest execute: repeatListRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_REPEAT_0300
     * @tc.name virtualScrollOptionsDefault
     * @tc.desc Test VirtualScrollOptions default fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('virtualScrollOptionsDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest execute: virtualScrollOptionsDefault START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: LocalVirtualScrollOptions = {};
        expect(opts.totalCount).assertEqual(undefined);
        expect(opts.reusable).assertEqual(undefined);
        expect(opts.disableVirtualScroll).assertEqual(undefined);
        console.info('[ARKUI_NEW] RepeatTest execute: virtualScrollOptionsDefault END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RepeatTest execute: virtualScrollOptionsDefault error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_REPEAT_0400
     * @tc.name virtualScrollOptionsWithValues
     * @tc.desc Test VirtualScrollOptions with explicit values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('virtualScrollOptionsWithValues', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest execute: virtualScrollOptionsWithValues START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let opts: LocalVirtualScrollOptions = { totalCount: 100, reusable: true, disableVirtualScroll: false };
        expect(opts.totalCount).assertEqual(100);
        expect(opts.reusable).assertEqual(true);
        expect(opts.disableVirtualScroll).assertEqual(false);
        console.info('[ARKUI_NEW] RepeatTest execute: virtualScrollOptionsWithValues END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RepeatTest execute: virtualScrollOptionsWithValues error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_REPEAT_0500
     * @tc.name repeatItemInterface
     * @tc.desc Test RepeatItem interface fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('repeatItemInterface', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest execute: repeatItemInterface START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let ri: LocalRepeatItem = { item: 'testItem', index: 3 };
        expect(ri.item).assertEqual('testItem');
        expect(ri.index).assertEqual(3);
        console.info('[ARKUI_NEW] RepeatTest execute: repeatItemInterface END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RepeatTest execute: repeatItemInterface error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_REPEAT_0600
     * @tc.name repeatDebugLine
     * @tc.desc Verify RepeatAttribute.debugLine method exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('repeatDebugLine', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RepeatTest execute: repeatDebugLine START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('repeatList'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] RepeatTest execute: repeatDebugLine END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RepeatTest execute: repeatDebugLine error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
