'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import events_emitter from '@ohos.events.emitter';
import { RefreshStatus } from '@ohos.arkui.component'

export default function refreshJsunit() {
  describe('refreshTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("refresh beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refresh',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get refresh state pages:" + JSON.stringify(pages));
        if (!("refresh" == pages.name)) {
          console.info("get refresh state pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push refresh page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push refresh page error:" + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("refresh after each called");
    });


    
    /**
     * @tc.number   testRefresh_static_01
     * @tc.name     testRefresh_static_01
     * @tc.desc     testRefresh_static_01
     * @tc.level    Level.LEVEL1
     */
it('testRefresh_static_01', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[testRefresh_static_01] START');
          await CommonFunc.sleep(1000);
          let strJson: string = inspector.getInspectorByKey('refresh');
          console.info('[testRefresh_static_01 strJson]' + strJson);
          console.info('[testRefresh_static_01] END');
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   testRefresh_static_02
     * @tc.name     testRefresh_static_02
     * @tc.desc     testRefresh_static_02
     * @tc.level    Level.LEVEL1
     */
it('testRefresh_static_02', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testRefresh_static_02] START');
      console.info("[testRefresh_static_02] OverDrag: " + JSON.stringify(RefreshStatus.OverDrag));
      expect(RefreshStatus.OverDrag).assertEqual(2);
      console.info('[testRefresh_static_02] END');
      done();
    });


    
    /**
     * @tc.number   testRefresh_static_03
     * @tc.name     testRefresh_static_03
     * @tc.desc     testRefresh_static_03
     * @tc.level    Level.LEVEL1
     */
it('testRefresh_static_03', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[testRefresh_static_03] START');
      console.info("[testRefresh_static_03] Inactive: " + JSON.stringify(RefreshStatus.Inactive));
      expect(RefreshStatus.Inactive).assertEqual(0);
      console.info('[testRefresh_static_03] END');
      done();
    });


    
    /**
     * @tc.number   testRefresh_static_04
     * @tc.name     testRefresh_static_04
     * @tc.desc     testRefresh_static_04
     * @tc.level    Level.LEVEL0
     */
it('testRefresh_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRefresh_static_04] START');
      console.info("[testRefresh_static_04] Drag: " + JSON.stringify(RefreshStatus.Drag));
      expect(RefreshStatus.Drag).assertEqual(1);
      console.info('[testRefresh_static_04] END');
      done();
    });


    
    /**
     * @tc.number   testRefresh_static_05
     * @tc.name     testRefresh_static_05
     * @tc.desc     testRefresh_static_05
     * @tc.level    Level.LEVEL0
     */
it('testRefresh_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRefresh_static_05] START');
      console.info("[testRefresh_static_05] Refresh: " + JSON.stringify(RefreshStatus.Refresh));
      expect(RefreshStatus.Refresh).assertEqual(3);
      console.info('[testRefresh_static_05] END');
      done();
    });


    
    /**
     * @tc.number   testRefresh_static_06
     * @tc.name     testRefresh_static_06
     * @tc.desc     testRefresh_static_06
     * @tc.level    Level.LEVEL0
     */
it('testRefresh_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testRefresh_static_06] START');
      console.info("[testRefresh_static_06] Done: " + JSON.stringify(RefreshStatus.Done));
      expect(RefreshStatus.Done).assertEqual(4);
      console.info('[testRefresh_static_06] END');
      done();
    });
  });
}
