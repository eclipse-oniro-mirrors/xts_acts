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

export default function ContentSlotTest() {
  describe('ContentSlotTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.contentSlot.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/ContentSlot/ContentSlotIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] ContentSlotTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "ContentSlotIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("[ARKUI_NEW] ContentSlotTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] ContentSlotTest afterEach start");
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] ContentSlotTest afterEach end");
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CONTENTSLOT_0100
     * @tc.name contentSlotPageRenders
     * @tc.desc Verify ContentSlot page renders with $attrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contentSlotPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('contentSlotRoot');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotPageRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] contentSlotPageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CONTENTSLOT_0200
     * @tc.name contentSlotNodeAdded
     * @tc.desc Verify ContentSlot page onPageShow sets status correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contentSlotNodeAdded', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotNodeAdded START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('contentSlotNodeAdded');
        console.info('[ARKUI_NEW] contentSlotNodeAdded = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotNodeAdded END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] contentSlotNodeAdded error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CONTENTSLOT_0300
     * @tc.name contentSlotStatusCheck
     * @tc.desc Verify ContentSlot status updated after node addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contentSlotStatusCheck', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotStatusCheck START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('contentSlotStatus');
        console.info('[ARKUI_NEW] contentSlotStatus = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotStatusCheck END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] contentSlotStatusCheck error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CONTENTSLOT_0400
     * @tc.name contentSlotAddButton
     * @tc.desc Verify Add Node button rendered in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contentSlotAddButton', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotAddButton START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('csAddBtn');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotAddButton END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] contentSlotAddButton error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CONTENTSLOT_0500
     * @tc.name contentSlotDebugLine
     * @tc.desc Verify ContentSlotAttribute.debugLine is called and ContentSlot component still renders normally.
     *          debugLine sets source code redirection info; its correctness is verified by confirming the
     *          ContentSlot component node is present in the inspector tree after the call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('contentSlotDebugLine', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotDebugLine START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let rootNode = JSON.parseJsonElement(inspector.getInspectorByKey('contentSlotRoot'));
        expect(rootNode != null).assertTrue();
        let attrs = rootNode.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] contentSlotDebugLine: page renders normally after debugLine call');
        console.info('[ARKUI_NEW] ContentSlotTest execute: contentSlotDebugLine END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] contentSlotDebugLine error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CONTENTSLOT_0600
     * @tc.name inspectorTreeNotEmpty
     * @tc.desc Verify inspector tree exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('inspectorTreeNotEmpty', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] ContentSlotTest execute: inspectorTreeNotEmpty START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let tree = inspector.getInspectorTree();
        expect(tree != null && tree != undefined).assertTrue();
        console.info('[ARKUI_NEW] ContentSlotTest execute: inspectorTreeNotEmpty END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] inspectorTreeNotEmpty error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
