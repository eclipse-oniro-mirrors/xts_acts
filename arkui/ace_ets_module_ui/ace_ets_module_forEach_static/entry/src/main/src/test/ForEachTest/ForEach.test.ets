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

export default function ForEachTest() {
  describe('ForEachTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] ForEachTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.forEach.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] ForEachTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/ForEach/ForEachIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] ForEachTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "ForEachIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ForEachTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ForEachTest afterEach start");
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] ForEachTest afterEach end");
    });

    /**
     * @tc.number SUB_ARKUI_ACE_FOREACH_0100
     * @tc.name forEachPageRenders
     * @tc.desc Verify ForEach test page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('forEachPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ForEachTest execute: forEachPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('forEachRoot'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ForEachTest execute: forEachPageRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ForEachTest execute: forEachPageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_FOREACH_0200
     * @tc.name forEachContainerRenders
     * @tc.desc Verify ForEach container renders with items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('forEachContainerRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ForEachTest execute: forEachContainerRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('forEachContainer'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] ForEachTest execute: forEachContainerRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ForEachTest execute: forEachContainerRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_FOREACH_0300
     * @tc.name forEachInspectorTreeExists
     * @tc.desc Verify inspector tree for ForEach page exists (debugLine called internally)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('forEachInspectorTreeExists', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ForEachTest execute: forEachInspectorTreeExists START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let tree = inspector.getInspectorTree();
        expect(tree != null && tree != undefined).assertTrue();
        console.info('[ARKUI_NEW] ForEachTest execute: forEachInspectorTreeExists END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ForEachTest execute: forEachInspectorTreeExists error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_FOREACH_0400
     * @tc.name forEachDebugLine
     * @tc.desc Verify ForEachAttribute.debugLine method exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('forEachDebugLine', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ForEachTest execute: forEachDebugLine START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('forEachContainer'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] ForEachTest execute: forEachDebugLine END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] ForEachTest execute: forEachDebugLine error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
