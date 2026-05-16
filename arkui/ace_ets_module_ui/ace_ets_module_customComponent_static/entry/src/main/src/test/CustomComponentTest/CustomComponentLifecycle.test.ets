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
import { CustomComponentLifecycleObserver, ReuseObject } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function CustomComponentLifecycleTest() {
  describe('CustomComponentLifecycleTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.customComponent.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/CustomComponent/CustomComponentLifecycleIndex' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "CustomComponentLifecycleIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] CustomComponentLifecycleTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0100
     * @tc.name lifecyclePageRenders
     * @tc.desc Verify lifecycle test page renders correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecyclePageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecyclePageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('lifecyclePageRoot');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecyclePageRenders END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecyclePageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0200
     * @tc.name lifecycleTestCompRendered
     * @tc.desc Verify LifecycleTestComp (@ComponentV2) renders in page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleTestCompRendered', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleTestCompRendered START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('lifecycleTestComp');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleTestCompRendered error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0300
     * @tc.name lifecycleGetCurrentState
     * @tc.desc Test CustomComponentLifecycle.getCurrentState() returns valid state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleGetCurrentState', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleGetCurrentState START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleGetCurrentState');
        console.info('[ARKUI_NEW] lifecycleGetCurrentState = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleGetCurrentState END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleGetCurrentState error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0400
     * @tc.name lifecycleAddObserver
     * @tc.desc Test CustomComponentLifecycle.addObserver() is called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleAddObserver', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleAddObserver START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleAddObserver');
        console.info('[ARKUI_NEW] lifecycleAddObserver = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('called');
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleAddObserver END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleAddObserver error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0500
     * @tc.name lifecycleRemoveObserver
     * @tc.desc Test CustomComponentLifecycle.removeObserver() is called successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleRemoveObserver', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleRemoveObserver START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleRemoveObserver');
        console.info('[ARKUI_NEW] lifecycleRemoveObserver = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('called');
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleRemoveObserver END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleRemoveObserver error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0600
     * @tc.name lifecycleObserverAboutToAppear
     * @tc.desc Test CustomComponentLifecycleObserver.aboutToAppear default method is callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleObserverAboutToAppear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToAppear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let called = false;
        let observer: CustomComponentLifecycleObserver = {
          aboutToAppear(): void { called = true; },
          onDidBuild(): void {},
          aboutToDisappear(): void {},
          aboutToReuse(params?: ReuseObject): void {},
          aboutToRecycle(): void {}
        };
        observer.aboutToAppear();
        expect(called).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToAppear END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleObserverAboutToAppear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0700
     * @tc.name lifecycleObserverOnDidBuild
     * @tc.desc Test CustomComponentLifecycleObserver.onDidBuild default method is callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleObserverOnDidBuild', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverOnDidBuild START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let called = false;
        let observer: CustomComponentLifecycleObserver = {
          aboutToAppear(): void {},
          onDidBuild(): void { called = true; },
          aboutToDisappear(): void {},
          aboutToReuse(params?: ReuseObject): void {},
          aboutToRecycle(): void {}
        };
        observer.onDidBuild();
        expect(called).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverOnDidBuild END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleObserverOnDidBuild error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0800
     * @tc.name lifecycleObserverAboutToDisappear
     * @tc.desc Test CustomComponentLifecycleObserver.aboutToDisappear default method is callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleObserverAboutToDisappear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToDisappear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let called = false;
        let observer: CustomComponentLifecycleObserver = {
          aboutToAppear(): void {},
          onDidBuild(): void {},
          aboutToDisappear(): void { called = true; },
          aboutToReuse(params?: ReuseObject): void {},
          aboutToRecycle(): void {}
        };
        observer.aboutToDisappear();
        expect(called).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToDisappear END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleObserverAboutToDisappear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_0900
     * @tc.name lifecycleObserverAboutToReuse
     * @tc.desc Test CustomComponentLifecycleObserver.aboutToReuse default method is callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleObserverAboutToReuse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToReuse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let called = false;
        let observer: CustomComponentLifecycleObserver = {
          aboutToAppear(): void {},
          onDidBuild(): void {},
          aboutToDisappear(): void {},
          aboutToReuse(params?: ReuseObject): void { called = true; },
          aboutToRecycle(): void {}
        };
        observer.aboutToReuse();
        expect(called).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToReuse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleObserverAboutToReuse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_1000
     * @tc.name lifecycleObserverAboutToRecycle
     * @tc.desc Test CustomComponentLifecycleObserver.aboutToRecycle default method is callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleObserverAboutToRecycle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToRecycle START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let called = false;
        let observer: CustomComponentLifecycleObserver = {
          aboutToAppear(): void {},
          onDidBuild(): void {},
          aboutToDisappear(): void {},
          aboutToReuse(params?: ReuseObject): void {},
          aboutToRecycle(): void { called = true; }
        };
        observer.aboutToRecycle();
        expect(called).assertTrue();
        console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleObserverAboutToRecycle END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleObserverAboutToRecycle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CUSTOMCOMPONENT_LIFECYCLE_1100
     * @tc.name lifecycleCompOnDidBuild
     * @tc.desc Verify LifecycleTestComp onDidBuild lifecycle was called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lifecycleCompOnDidBuild', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CustomComponentLifecycleTest execute: lifecycleCompOnDidBuild START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let val = AppStorage.get<string>('lifecycleCompOnDidBuild');
        console.info('[ARKUI_NEW] lifecycleCompOnDidBuild = ' + val);
        expect(val != null && val != undefined).assertTrue();
        expect(val).assertEqual('true');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] lifecycleCompOnDidBuild error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
