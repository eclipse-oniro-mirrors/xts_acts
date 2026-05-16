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

export default function Canvas1Test() {
  describe('Canvas1Test', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] Canvas1Test beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.canvas.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] Canvas1Test beforeEach start');
      let options: router.RouterOptions = { url: 'MainAbility/pages/Canvas/CanvasIndex1' };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] Canvas1Test state pages: ' + JSON.stringify(pages));
        if (pages.name !== "CanvasIndex1") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] Canvas1Test replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] Canvas1Test afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] Canvas1Test afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CANVAS_0100
     * @tc.name canvasComponentExists
     * @tc.desc Verify Canvas component renders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canvasComponentExists', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CanvasTest execute: canvasComponentExists START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('canvasComp'));
        expect(node != null).assertTrue();
        console.info('[ARKUI_NEW] CanvasTest execute: canvasComponentExists END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CanvasTest execute: canvasComponentExists error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CANVAS_0200
     * @tc.name canvasAntialiasGet
     * @tc.desc Test CanvasRenderer.antialias getter returns a value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canvasAntialiasGet', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasGet START');
      try {
        await CommonFunc.sleep(2000);
        let val = AppStorage.get<string>('canvasAntialiasGet');
        console.info('[ARKUI_NEW] CanvasTest: canvasAntialiasGet val = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasGet END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CanvasTest execute: canvasAntialiasGet error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CANVAS_0300
     * @tc.name canvasAntialiasSetTrue
     * @tc.desc Test CanvasRenderer.antialias setter with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canvasAntialiasSetTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetTrue START');
      try {
        await CommonFunc.sleep(2000);
        let val = AppStorage.get<string>('canvasAntialiasSetTrue');
        console.info('[ARKUI_NEW] CanvasTest: canvasAntialiasSetTrue val = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetTrue END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CANVAS_0400
     * @tc.name canvasAntialiasSetFalse
     * @tc.desc Test CanvasRenderer.antialias setter with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canvasAntialiasSetFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetFalse START');
      try {
        await CommonFunc.sleep(2000);
        let val = AppStorage.get<string>('canvasAntialiasSetFalse');
        console.info('[ARKUI_NEW] CanvasTest: canvasAntialiasSetFalse val = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetFalse END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetFalse error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_CANVAS_0500
     * @tc.name canvasAntialiasSetUndefined
     * @tc.desc Test CanvasRenderer.antialias setter with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('canvasAntialiasSetUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetUndefined START');
      try {
        await CommonFunc.sleep(2000);
        let val = AppStorage.get<string>('canvasAntialiasSetUndefined');
        console.info('[ARKUI_NEW] CanvasTest: canvasAntialiasSetUndefined val = ' + val);
        expect(val != null && val != undefined).assertTrue();
        console.info('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetUndefined END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] CanvasTest execute: canvasAntialiasSetUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
