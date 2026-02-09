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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
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
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { startAbility, stopApplication, UtilsTest } from './Util.test'

export default function SelectTest() {
  describe('SelectTest', () => {
    beforeAll(() => {
      console.info("SelectTest beforeEach start");
      await UtilsTest.startAbility("com.example.Select.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Index',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUX_Select_Visual_static_0030
     * @tc.name     ArkUX_Select_Visual_static_0030
     * @tc.desc     ArkUX_Select_Visual_static_0030
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Select_Visual_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_static_0030 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0030');
          console.info('ArkUX_Select_Visual_static_0030 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_static_0030 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("300.000000");
          expect(optionHeight).assertEqual("300.000000");
          console.info('ArkUX_Select_Visual_static_0030 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_static_0030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Select_Visual_static_0040
     * @tc.name     ArkUX_Select_Visual_static_0040
     * @tc.desc     ArkUX_Select_Visual_static_0040
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Select_Visual_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_static_0040 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0040');
          console.info('ArkUX_Select_Visual_static_0040 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_static_0040 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("600.000000");
          expect(optionHeight).assertEqual("600.000000");
          console.info('ArkUX_Select_Visual_static_0040 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_static_0040 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Select_Visual_static_0050
     * @tc.name     ArkUX_Select_Visual_static_0050
     * @tc.desc     ArkUX_Select_Visual_static_0050
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Select_Visual_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_static_0050 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0050');
          console.info('ArkUX_Select_Visual_static_0050 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_static_0050 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("900.000000");
          expect(optionHeight).assertEqual("900.000000");
          console.info('ArkUX_Select_Visual_static_0050 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_static_0050 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Select_Visual_static_0060
     * @tc.name     ArkUX_Select_Visual_static_0060
     * @tc.desc     ArkUX_Select_Visual_static_0060
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Select_Visual_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_static_0060 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0060');
          console.info('ArkUX_Select_Visual_static_0060 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_static_0060 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("1200.000000");
          expect(optionHeight).assertEqual("1200.000000");
          console.info('ArkUX_Select_Visual_static_0060 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_static_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    
    /**
     * @tc.number   ArkUX_Select_Visual_static_0070
     * @tc.name     ArkUX_Select_Visual_static_0070
     * @tc.desc     ArkUX_Select_Visual_static_0070
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Select_Visual_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_static_0070 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0070');
          console.info('ArkUX_Select_Visual_static_0070 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_static_0070 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("1500.000000");
          expect(optionHeight).assertEqual("1500.000000");
          console.info('ArkUX_Select_Visual_static_0070 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_static_0070 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

  })
}