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
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';

export default function noBarrierComponentsTest() {
  describe('noBarrierComponentsTest', () => {
    beforeAll(() => {
      console.info("noBarrierComponentsTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.nowear.api11.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/noBarrierComponents',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get noBarrierComponents state success " + JSON.stringify(pages));
        if (!("noBarrierComponents" == pages.name)) {
          console.info("get noBarrierComponents state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err: Error) {
        console.error("push noBarrierComponents page error: " + err);
      }
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    
    
/**
     * @tc.number   noBarrierComponents025_static
     * @tc.name     noBarrierComponents025_static
     * @tc.desc     noBarrierComponents025_static
     * @tc.level    Level.LEVEL0
     */
it('noBarrierComponents025_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('noBarrierComponents025 START');
      setTimeout(() => {
      try {
        let strJson = inspector.getInspectorByKey("Select");
        await CommonFunc.sleep(1000);
        console.info(' START  :' + JSON.stringify(strJson));
        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Select");
        console.info('noBarrierComponents025 END ');
      } catch (err: Error) {
        expect().assertFail()
        console.info('noBarrierComponents025 ERR  ' + JSON.stringify(err));
      }
      done();
      }, 500)
    });

    
    
    /**
     * @tc.number   noBarrierComponents029_static
     * @tc.name     noBarrierComponents029_static
     * @tc.desc     noBarrierComponents029_static
     * @tc.level    Level.LEVEL0
     */
// it('noBarrierComponents029_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   console.info('noBarrierComponents029 START');
    //   setTimeout(() => {
    //     try {
    //       let strJson = inspector.getInspectorByKey("Web");
    //       await CommonFunc.sleep(1000);
    //       console.info(' START  :' + JSON.stringify(strJson));
    //       expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual("Web");
    //       console.info('noBarrierComponents029 END ');
    //     } catch (err: Error) {
    //       expect().assertFail()
    //       console.info('noBarrierComponents029 ERR  ' + JSON.stringify(err));
    //     }
    //     done();
    //   }, 500)
    // });
  })
}