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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function InspectorTest() {
  describe('InspectorTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] InspectorTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.inspector.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] InspectorTest beforeEach start");
      let options: router.RouterOptions = { url: 'MainAbility/pages/Inspector/InspectorIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ARKUI_NEW] InspectorTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "InspectorIndex") { routerInstance.replaceUrl(options); }
        await Utils.sleep(500);
      } catch (err) { console.error("[ARKUI_NEW] InspectorTest replaceUrl error: " + err); expect().assertFail(); }
    });
    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] InspectorTest afterEach start");
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] InspectorTest afterEach end");
    });

    /**
     * @tc.number SUB_ARKUI_ACE_INSPECTOR_0100
     * @tc.name inspectorPageRenders
     * @tc.desc Verify Inspector test page renders with $attrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('inspectorPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] InspectorTest: inspectorPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('inspectorRoot');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_INSPECTOR_0200
     * @tc.name inspectorParentRendered
     * @tc.desc Verify inspectorParent Column with List renders with $attrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('inspectorParentRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] InspectorTest: inspectorParentRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('inspectorParent');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_INSPECTOR_0300
     * @tc.name observerCreatedInPage
     * @tc.desc Verify UIInspector.createComponentObserver was called in page onPageShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('observerCreatedInPage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] InspectorTest: observerCreatedInPage START');
      try {
        await CommonFunc.sleep(SLEEP_TIME + 500);
        let val = AppStorage.get<string>('observerCreated');
        console.info('[ARKUI_NEW] observerCreated = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_INSPECTOR_0400
     * @tc.name onDrawChildrenRegisteredInPage
     * @tc.desc Verify onDrawChildren was registered in page onPageShow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onDrawChildrenRegisteredInPage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] InspectorTest: onDrawChildrenRegisteredInPage START');
      try {
        await CommonFunc.sleep(SLEEP_TIME + 500);
        let val = AppStorage.get<string>('onDrawChildrenRegistered');
        console.info('[ARKUI_NEW] onDrawChildrenRegistered = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_INSPECTOR_0500
     * @tc.name offDrawChildrenCalledInPage
     * @tc.desc Verify offDrawChildren was called after timeout in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('offDrawChildrenCalledInPage', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] InspectorTest: offDrawChildrenCalledInPage START');
      try {
        await CommonFunc.sleep(3000);
        let val = AppStorage.get<string>('offDrawChildrenCalled');
        console.info('[ARKUI_NEW] offDrawChildrenCalled = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_INSPECTOR_0600
     * @tc.name inspectorRefreshButtonRendered
     * @tc.desc Verify Refresh button rendered in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('inspectorRefreshButtonRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] InspectorTest: inspectorRefreshButtonRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('inspRefreshBtn');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) { console.error('[ARKUI_NEW] error:' + error); expect().assertFail(); done(); }
    });
  });
}
