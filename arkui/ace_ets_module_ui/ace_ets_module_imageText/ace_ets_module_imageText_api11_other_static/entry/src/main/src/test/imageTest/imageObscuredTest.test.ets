'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { ObscuredReasons } from '@ohos.arkui.component';

export default function imageObscuredTest() {
  describe('imageObscuredTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/imageObscuredTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageObscuredTest state pages:" + JSON.stringify(pages));
        if (!("imageObscuredTest" == pages.name)) {
          console.info("get imageObscuredTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageObscuredTest page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push imageObscuredTest page error: " + err);
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
     * @tc.number   ArkUX_Redacted_Image_static_0150
     * @tc.name     ArkUX_Redacted_Image_static_0150
     * @tc.desc     ArkUX_Redacted_Image_static_0150
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Redacted_Image_static_0150', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Redacted_Image_0150 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Image_0150');
          console.info('ArkUX_Redacted_Image_0150 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0150 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          console.info("ArkUX_Redacted_Image_0150 JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
          console.info("ArkUX_Redacted_Image_0150 JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured')[0] is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured')[0]));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("400.00px");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("400.00px");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderRadius')).assertEqual("20.00vp");
          expect(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured')[0].asString())).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0150 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0150 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_Redacted_Image_static_0160
     * @tc.name     ArkUX_Redacted_Image_static_0160
     * @tc.desc     ArkUX_Redacted_Image_static_0160
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Redacted_Image_static_0160', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Redacted_Image_0160 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Image_0160');
          console.info('ArkUX_Redacted_Image_0160 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0160 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          console.info("ArkUX_Redacted_Image_0160 JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured').length).assertEqual(0);
          console.info('ArkUX_Redacted_Image_0020 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0160 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_Redacted_Image_static_0170
     * @tc.name     ArkUX_Redacted_Image_static_0170
     * @tc.desc     ArkUX_Redacted_Image_static_0170
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Redacted_Image_static_0170', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Redacted_Image_0170 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Image_0170');
          console.info('ArkUX_Redacted_Image_0170 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0170 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          console.info("ArkUX_Redacted_Image_0170 JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("width")).assertEqual("700.00px");
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("200.00px");
          expect(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getArray("obscured")[0].asString())).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0170 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0170 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_Redacted_Image_static_0180
     * @tc.name     ArkUX_Redacted_Image_static_0180
     * @tc.desc     ArkUX_Redacted_Image_static_0180
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Redacted_Image_static_0180', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Redacted_Image_0180 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Image_0180');
          console.info('ArkUX_Redacted_Image_0180 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0180 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          console.info("ArkUX_Redacted_Image_0180 JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
          expect(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getArray("obscured")[0].asString())).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0180 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0180 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
/**
     * @tc.number   ArkUX_Redacted_Image_static_0190
     * @tc.name     ArkUX_Redacted_Image_static_0190
     * @tc.desc     ArkUX_Redacted_Image_static_0190
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Redacted_Image_static_0190', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Redacted_Image_0190 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Image_0190');
          console.info('ArkUX_Redacted_Image_0190 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0190 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          console.info("ArkUX_Redacted_Image_0190 JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
          expect(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getArray("obscured")[0].asString())).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0190 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0190 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}