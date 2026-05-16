'use static';
/*
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

export default function RefreshTest() {
  describe('RefreshTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshux',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("refreshux" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          router.pushUrl(options);
          // console.info("push Index page success " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CommonFunc page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUX_Refresh_Visual_static_0010
     * @tc.name     ArkUX_Refresh_Visual_static_0010
     * @tc.desc     ArkUX_Refresh_Visual_static_0010
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Refresh_Visual_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Refresh_Visual_static_0010 START');
      try {
        let strJson = inspector.getInspectorByKey('ArkUX_Refresh_Visual_0010');
        console.info('ArkUX_Refresh_Visual_static_0010 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Refresh_Visual_static_0010 obj is: " + JSON.stringifyJsonElement(obj));
        let promptText: string = obj.getElement('$attrs').getString('promptText')
        expect(promptText).assertEqual("pull down and refresh : 0");
        console.info('ArkUX_Refresh_Visual_static_0010 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Refresh_Visual_static_0010 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Refresh_Visual_static_0020
     * @tc.name     ArkUX_Refresh_Visual_static_0020
     * @tc.desc     ArkUX_Refresh_Visual_static_0020
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Refresh_Visual_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Refresh_Visual_static_0020 START');
      try {
        let strJson = inspector.getInspectorByKey('ArkUX_Refresh_Visual_0020');
        console.info('ArkUX_Refresh_Visual_static_0020 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Refresh_Visual_static_0020 obj is: " + JSON.stringifyJsonElement(obj));
        let promptText: string = obj.getElement('$attrs').getString('promptText')
        expect(promptText).assertEqual("*************************");
        console.info('ArkUX_Refresh_Visual_static_0020 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Refresh_Visual_static_0020 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Refresh_Visual_static_0030
     * @tc.name     ArkUX_Refresh_Visual_static_0030
     * @tc.desc     ArkUX_Refresh_Visual_static_0030
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Refresh_Visual_static_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Refresh_Visual_static_0030 START');
      try {
        let strJson = inspector.getInspectorByKey('ArkUX_Refresh_Visual_0030');
        console.info('ArkUX_Refresh_Visual_static_0030 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Refresh_Visual_static_0030 obj is: " + JSON.stringifyJsonElement(obj));
        let promptText: string = obj.getElement('$attrs').getString('promptText')
        expect(promptText).assertEqual("1234567890987654321");
        console.info('ArkUX_Refresh_Visual_static_0030 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Refresh_Visual_static_0030 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Refresh_Visual_static_0040
     * @tc.name     ArkUX_Refresh_Visual_static_0040
     * @tc.desc     ArkUX_Refresh_Visual_static_0040
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Refresh_Visual_static_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Refresh_Visual_static_0040 START');
      try {
        let strJson = inspector.getInspectorByKey('ArkUX_Refresh_Visual_0040');
        console.info('ArkUX_Refresh_Visual_static_0040 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Refresh_Visual_static_0040 obj is: " + JSON.stringifyJsonElement(obj));
        let promptText: string = obj.getElement('$attrs').getString('promptText')
        expect(promptText).assertEqual("");
        console.info('ArkUX_Refresh_Visual_static_0040 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Refresh_Visual_static_0040 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Refresh_Visual_static_0050
     * @tc.name     ArkUX_Refresh_Visual_static_0050
     * @tc.desc     ArkUX_Refresh_Visual_static_0050
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Refresh_Visual_static_0050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Refresh_Visual_static_0050 START');
      try {
        let strJson = inspector.getInspectorByKey('ArkUX_Refresh_Visual_0050');
        console.info('ArkUX_Refresh_Visual_static_0050 START  :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("ArkUX_Refresh_Visual_static_0050 obj is: " + JSON.stringifyJsonElement(obj));
        let promptText: string = obj.getElement('$attrs').getString('promptText')
        expect(promptText).assertEqual("测试是否可以显示汉字");
        console.info('ArkUX_Refresh_Visual_static_0050 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Refresh_Visual_static_0050 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}
