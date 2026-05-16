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
import { CustomComponentLifecycleState, CustomComponentInvokeOptions } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function CustomComponentTest() {
  describe('CustomComponentTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.customComponent.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/CustomComponent/CustomComponentIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] CustomComponentTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "CustomComponentIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] CustomComponentTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] CustomComponentTest afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0100
     * @tc.name lifecycleStateInit
     * @tc.desc Test CustomComponentLifecycleState.INIT = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleStateInit', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateInit START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleStateInit');
        console.info('[ARKUI_NEW] lifecycleStateInit = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('0');
        console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateInit END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleStateInit error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0200
     * @tc.name lifecycleStateAppeared
     * @tc.desc Test CustomComponentLifecycleState.APPEARED = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleStateAppeared', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateAppeared START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleStateAppeared');
        console.info('[ARKUI_NEW] lifecycleStateAppeared = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('1');
        console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateAppeared END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleStateAppeared error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0300
     * @tc.name lifecycleStateBuilt
     * @tc.desc Test CustomComponentLifecycleState.BUILT = 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleStateBuilt', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateBuilt START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleStateBuilt');
        console.info('[ARKUI_NEW] lifecycleStateBuilt = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('2');
        console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateBuilt END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleStateBuilt error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0400
     * @tc.name lifecycleStateRecycled
     * @tc.desc Test CustomComponentLifecycleState.RECYCLED = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleStateRecycled', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateRecycled START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleStateRecycled');
        console.info('[ARKUI_NEW] lifecycleStateRecycled = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('3');
        console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateRecycled END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleStateRecycled error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0500
     * @tc.name lifecycleStateDisappeared
     * @tc.desc Test CustomComponentLifecycleState.DISAPPEARED = 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleStateDisappeared', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateDisappeared START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleStateDisappeared');
        console.info('[ARKUI_NEW] lifecycleStateDisappeared = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('4');
        console.info('[ARKUI_NEW] CustomComponentTest execute: lifecycleStateDisappeared END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleStateDisappeared error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0600
     * @tc.name invokeOptionsDefaultSClass
     * @tc.desc Test CustomComponentInvokeOptions.sClass is undefined by default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('invokeOptionsDefaultSClass', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: invokeOptionsDefaultSClass START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('invokeOptionsResult');
        console.info('[ARKUI_NEW] invokeOptionsResult = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentTest execute: invokeOptionsDefaultSClass END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] invokeOptionsDefaultSClass error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0700
     * @tc.name customComponentPageRenders
     * @tc.desc Verify custom component test page renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customComponentPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: customComponentPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('customCompRoot');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentTest execute: customComponentPageRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] customComponentPageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0800
     * @tc.name childV2CompRendered
     * @tc.desc Verify @ComponentV2 ChildV2Comp renders in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('childV2CompRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: childV2CompRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('childV2Comp');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] childV2CompRendered error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_0900
     * @tc.name childV2AboutToAppearCalled
     * @tc.desc Verify ChildV2Comp aboutToAppear lifecycle was called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('childV2AboutToAppearCalled', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: childV2AboutToAppearCalled START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('childV2AboutToAppear');
        console.info('[ARKUI_NEW] childV2AboutToAppear = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] childV2AboutToAppearCalled error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_1000
     * @tc.name childV2OnDidBuildCalled
     * @tc.desc Verify ChildV2Comp onDidBuild lifecycle was called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('childV2OnDidBuildCalled', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentTest execute: childV2OnDidBuildCalled START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('childV2OnDidBuild');
        console.info('[ARKUI_NEW] childV2OnDidBuild = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] childV2OnDidBuildCalled error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
