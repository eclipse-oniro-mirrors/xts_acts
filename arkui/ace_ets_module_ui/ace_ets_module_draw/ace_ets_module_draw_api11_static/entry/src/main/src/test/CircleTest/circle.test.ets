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

// import ohosrouter from '@ohos.router';
import { $r } from '@ohos.arkui.component';
import resourceManager from '@ohos.resourceManager';
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

interface ParamsData {
  data3: number[];
}

interface MyParams {
  data1: string;
  data2: ParamsData;
}

export default function circleNewJsunit() {
  describe('circleNewTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.draw.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Circle/circle',
      }
      try {
        const circle = AppStorage.get<Router>("router") as Router
        circle.clear();
        let pages = circle.getState();
        console.info("get circle state success " + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get circle state success " + JSON.stringify(pages.name));
          // let result = await circle.pushUrl(options);
          circle.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push circle page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("circleNew after each called");
    });




    /**
     * @tc.number   testcircleNew_static_001
     * @tc.name     testcircleNew_static_001
     * @tc.desc     testcircleNew_static_001
     * @tc.level    Level.LEVEL0
     */
it('testcircleNew_static_001', Level.LEVEL0, async (): Promise<void> => {
      console.info('circleNew testcircleNew_static_001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[testcircleNew_static_001] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Circle');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual("100.00px");
      console.info("[testcircleNew_static_001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });


    /**
     * @tc.number   testcircleNew_static_002
     * @tc.name     testcircleNew_static_002
     * @tc.desc     testcircleNew_static_002
     * @tc.level    Level.LEVEL0
     */
it('testcircleNew_static_002', Level.LEVEL0, async (): Promise<void> => {
      console.info('circleNew testcircleNew_static_002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[testcircleNew_static_002] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Circle');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("100.00px");
      console.info("[testcircleNew_static_002] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));

    });

    /**
         * @tc.number   ACE_global_console_debug_static_0100
         * @tc.name     ACE_global_console_debug_static_0100
         * @tc.desc     ACE_global_console_debug_static_0100
         * @tc.level    Level.LEVEL0
         */
    it("ACE_global_console_debug_static_0100", Level.LEVEL0, async (): Promise<void> => {
      let casename = "ACE_global_003";
      console.log("-----------------------ACE_global_console_debug Test is starting-----------------------");
      try {
        console.debug("ACE_global_console_debug test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();

      }
      console.log("-----------------------ACE_global_console_debug Test end-----------------------");

    });

    /**
            * @tc.number   ACE_global_console_error_static_0200
            * @tc.name     ACE_global_console_error_static_0200
            * @tc.desc     ACE_global_console_error_static_0200
            * @tc.level    Level.LEVEL0
            */
    it("ACE_global_console_error_static_0200", Level.LEVEL0, async (): Promise<void> => {
      let casename = "ACE_global_004";
      console.log("-----------------------ACE_global_console_error Test is starting-----------------------");
      try {
        console.error("ACE_global_console_warn test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();

      }
      console.log("-----------------------ACE_global_console_error Test end-----------------------");

    });

    /**
            * @tc.number   ACE_pushUrl_callback_static_0100
            * @tc.name     ACE_pushUrl_callback_static_0100
            * @tc.desc     ACE_pushUrl_callback_static_0100
            * @tc.level    Level.LEVEL0
            */
    it("ACE_pushUrl_callback_static_0100", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_pushUrl_callback_0100 start-----------------------");
      const ohosrouter = AppStorage.get<Router>("router") as Router
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/common',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      } as router.RouterOptions, (err) => {
        if (err) {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info('pushUrl success');
          expect(true).assertTrue();
        }
      })
      console.info("-----------------------ACE_pushUrl_callback_0100 end-----------------------");

    });


    /**
                  * @tc.number   ACE_pushUrl_callback_static_0200
                  * @tc.name     ACE_pushUrl_callback_static_0200
                  * @tc.desc     ACE_pushUrl_callback_static_0200
                  * @tc.level    Level.LEVEL0
                  */
    it("ACE_pushUrl_callback_static_0200", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_pushUrl_promise_0200 start-----------------------");
      const ohosrouter = AppStorage.get<Router>("router") as Router
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Ellipse/ellipse1',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        } as MyParams
      }).then(() => {
        expect(true).assertTrue();
      })
        .catch((err: Error) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        })
      console.info("-----------------------ACE_pushUrl_promise_0200 end-----------------------");

    });

    /**
                  * @tc.number   ACE_showAlertBeforeBackPage_static_0100
                  * @tc.name     ACE_showAlertBeforeBackPage_static_0100
                  * @tc.desc     ACE_showAlertBeforeBackPage_static_0100
                  * @tc.level    Level.LEVEL0
                  */
    it("ACE_showAlertBeforeBackPage_static_0100", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0100-----------------------");
      const ohosrouter = AppStorage.get<Router>("router") as Router
      try {
        ohosrouter.showAlertBeforeBackPage({
          message: 'Message Info'
        });
        expect(true).assertTrue();
      } catch (error) {
        error = error as BusinessError;
        console.error(`ACE_showAlertBeforeBackPage_static_0100 failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });

    /**
                  * @tc.number   ACE_showAlertBeforeBackPage_static_0200
                  * @tc.name     ACE_showAlertBeforeBackPage_static_0200
                  * @tc.desc     ACE_showAlertBeforeBackPage_static_0200
                  * @tc.level    Level.LEVEL0
                  */
    it("ACE_showAlertBeforeBackPage_static_0200", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      const ohosrouter = AppStorage.get<Router>("router") as Router
      try {
        ohosrouter.showAlertBeforeBackPage({
          message: 'undefined'
        });
        expect(true).assertTrue();
      } catch (error) {
        error = error as BusinessError;
        console.error(`ACE_showAlertBeforeBackPage_static_0200, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }

    });

    /**
                  * @tc.number   ACE_hideAlertBeforeBackPage_static_0100
                  * @tc.name     ACE_hideAlertBeforeBackPage_static_0100
                  * @tc.desc     ACE_hideAlertBeforeBackPage_static_0100
                  * @tc.level    Level.LEVEL0
                  */
    it("ACE_hideAlertBeforeBackPage_static_0100", Level.LEVEL0, async (): Promise<void> => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      const ohosrouter = AppStorage.get<Router>("router") as Router
      try {
        ohosrouter.hideAlertBeforeBackPage();
        expect(true).assertTrue();
      } catch (error) {
        error = error as BusinessError;
        console.error(`ACE_hideAlertBeforeBackPage_static_0100, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });


    
    /**
     * @tc.number   testGlobal_attribute_static_0100
     * @tc.name     testGlobal_attribute_static_0100
     * @tc.desc     testGlobal_attribute_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testGlobal_attribute_static_0100', Level.LEVEL0, async (): Promise<void> => {
      console.info('testGlobal_attribute_static_0100 START');
      await CommonFunc.sleep(1000);
      let resource: resourceManager.Resource = {
        bundleName: "com.arkui.ace.draw",
        moduleName: "phone",
        id: $r('app.string.app_name').id,
        params: undefined,
        type: 0
      };
      try { // resource.id as long 原本为 resource
        AppStorage.get<common.UIAbilityContext>('abilityContext')?.resourceManager.getStringValue(resource.id as long,
          (error: BusinessError | null, value: string | undefined) => {
            if (error != null) {
              console.log("error is " + error);
              expect().assertFail();
            } else {
              expect(value).assertEqual('ohosProject');
            }
          });
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error(`callback getStringValue failed, error code: ${code}, message: ${message}.`);
        expect().assertFail();
      }

    });

  })
}
