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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { XComponentController, SurfaceConfig } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function XComponentTest() {
  describe('XComponentTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('XComponentTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.xComponent.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('XComponentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('XComponentTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'XComponentIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('XComponentTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(200);
    });

    // ============================================================
    // SurfaceConfig.isOpaque
    // ============================================================

    /**
     * @tc.number XComponentTest_001
     * @tc.name surfaceConfigIsOpaqueTrue
     * @tc.desc Test SurfaceConfig.isOpaque with true
     */
    it('surfaceConfigIsOpaqueTrue', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: surfaceConfigIsOpaqueTrue START');
      let config: SurfaceConfig = { isOpaque: true };
      expect(config.isOpaque).assertEqual(true);
      done();
    });

    /**
     * @tc.number XComponentTest_002
     * @tc.name surfaceConfigIsOpaqueFalse
     * @tc.desc Test SurfaceConfig.isOpaque with false
     */
    it('surfaceConfigIsOpaqueFalse', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: surfaceConfigIsOpaqueFalse START');
      let config: SurfaceConfig = { isOpaque: false };
      expect(config.isOpaque).assertEqual(false);
      done();
    });

    /**
     * @tc.number XComponentTest_003
     * @tc.name surfaceConfigIsOpaqueTrueFalse
     * @tc.desc Test SurfaceConfig.isOpaque with true and false differ
     */
    it('surfaceConfigIsOpaqueTrueFalse', Level.LEVEL1, (done: () => void): void => {
      console.info('XComponentTest execute: surfaceConfigIsOpaqueTrueFalse START');
      let configTrue: SurfaceConfig = { isOpaque: true };
      let configFalse: SurfaceConfig = { isOpaque: false };
      expect(configTrue.isOpaque).assertEqual(true);
      expect(configFalse.isOpaque).assertEqual(false);
      expect(configTrue.isOpaque === configFalse.isOpaque).assertEqual(false);
      done();
    });

    // ============================================================
    // XComponentController methods
    // ============================================================

    /**
     * @tc.number XComponentTest_004
     * @tc.name xComponentControllerLockCanvas
     * @tc.desc Test XComponentController.lockCanvas method exists on page-created controller
     */
    it('xComponentControllerLockCanvas', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('XComponentTest execute: xComponentControllerLockCanvas START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const ctrl = AppStorage.get<XComponentController>('xController') as XComponentController;
        expect(typeof ctrl.lockCanvas === 'function').assertTrue();
        console.info('XComponentTest execute: xComponentControllerLockCanvas END');
        done();
      } catch (error) {
        console.error('XComponentTest execute: xComponentControllerLockCanvas error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number XComponentTest_005
     * @tc.name xComponentControllerUnlockCanvasAndPost
     * @tc.desc Test XComponentController.unlockCanvasAndPost method exists on page-created controller
     */
    it('xComponentControllerUnlockCanvasAndPost', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('XComponentTest execute: xComponentControllerUnlockCanvasAndPost START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const ctrl = AppStorage.get<XComponentController>('xController') as XComponentController;
        expect(typeof ctrl.unlockCanvasAndPost === 'function').assertTrue();
        console.info('XComponentTest execute: xComponentControllerUnlockCanvasAndPost END');
        done();
      } catch (error) {
        console.error('XComponentTest execute: xComponentControllerUnlockCanvasAndPost error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number XComponentTest_006
     * @tc.name xComponentControllerSetSurfaceConfig
     * @tc.desc Test XComponentController.setXComponentSurfaceConfig method exists on page-created controller
     */
    it('xComponentControllerSetSurfaceConfig', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('XComponentTest execute: xComponentControllerSetSurfaceConfig START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const ctrl = AppStorage.get<XComponentController>('xController') as XComponentController;
        expect(typeof ctrl.setXComponentSurfaceConfig === 'function').assertTrue();
        console.info('XComponentTest execute: xComponentControllerSetSurfaceConfig END');
        done();
      } catch (error) {
        console.error('XComponentTest execute: xComponentControllerSetSurfaceConfig error: ' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // XComponent global function - UI rendering
    // ============================================================

    /**
     * @tc.number XComponentTest_007
     * @tc.name xComponentPageRenders
     * @tc.desc Test XComponent page title renders
     */
    it('xComponentPageRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('XComponentTest execute: xComponentPageRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('xComponentPageTitle'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('XComponentTest execute: xComponentPageRenders error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number XComponentTest_008
    * @tc.name xComponentViewRenders
     * @tc.desc Test XComponent page title renders
     */
    it('xComponentViewRenders', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('XComponentTest execute: xComponentViewRenders START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('xComponentView'));
        expect(node !== null).assertTrue();
        console.info('XComponentTest execute: xComponentViewRenders END');
        done();
      } catch (error) {
        console.error('XComponentTest execute: xComponentViewRenders error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
