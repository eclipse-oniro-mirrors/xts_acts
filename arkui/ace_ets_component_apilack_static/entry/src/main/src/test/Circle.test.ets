'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';
import resourceManager from '@ohos.resourceManager'
import { $r, Color } from '@ohos.arkui.component'
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Component, Driver, MouseButton, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';


let domain: number = 0x0000;
let tag: string = 'testTag';

interface MainData {
  data1: string
  data2: DataParam
}

interface DataParam {
  data3: number[]
}

export default function circleNewJsunit() {
  describe('circleNewTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.aceEtsApiLack.static", "EntryAbility")
      
    });
    beforeEach(async () => {
      console.info("circle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/circle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get circle state success " + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get circle state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("circleNew after each called");
    });



    
    
/**
     * @tc.number   testcircleNew_static_001
     * @tc.name     testcircleNew_static_001
     * @tc.desc     testcircleNew_static_001
     * @tc.level    Level.LEVEL0
     */
it('testcircleNew_static_001', Level.LEVEL0, async () => {
      console.info('circleNew testcircleNew0011 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[testcircleNew001] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Circle');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00px");
      console.info("[testcircleNew001] width value :" + obj.getElement('$attrs').getString('width'));

    });



    
    
/**
     * @tc.number   testcircleNew_static_002
     * @tc.name     testcircleNew_static_002
     * @tc.desc     testcircleNew_static_002
     * @tc.level    Level.LEVEL0
     */
it('testcircleNew_static_002', Level.LEVEL0, async () => {
      console.info('circleNew testcircleNew002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('circle');
      console.info("[testcircleNew002] component textAlign strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Circle');
      expect(obj.getElement('$attrs').getString('height')).assertEqual("100.00px");
      console.info("[testcircleNew002] width value :" + obj.getElement('$attrs').getString('width'));

    });

    
    /**
     * @tc.number   ACE_global_console_debug_static_0100
     * @tc.name     ACE_global_console_debug_static_0100
     * @tc.desc     ACE_global_console_debug_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ACE_global_console_debug_static_0100', Level.LEVEL0, async () => {
      let casename: string = "ACE_global_003";
      console.log("-----------------------ACE_global_console_debug Test is starting-----------------------");
      try {
        console.debug("ACE_global_console_debug test ok");
        expect(true).assertTrue();
      } catch (error: Error) {
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
it('ACE_global_console_error_static_0200', Level.LEVEL0, async () => {
      let casename: string = "ACE_global_004";
      console.log("-----------------------ACE_global_console_error Test is starting-----------------------");
      try {
        console.error("ACE_global_console_warn test ok");
        expect(true).assertTrue();
      } catch (error: Error) {
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
it('ACE_pushUrl_callback_static_0100', Level.LEVEL0, async () => {
      console.info("-----------------------ACE_pushUrl_callback_0100 start-----------------------");
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({
        url: 'MainAbility/pages/common',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as DataParam
        } as MainData
      }, (err) => {
        if (err) {
          console.error(`pushUrl failed, code is ${(err as BusinessError)?.code}, message is ${(err as Error)?.message}`);
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
it('ACE_pushUrl_callback_static_0200', Level.LEVEL0, async () => {
      console.info("-----------------------ACE_pushUrl_promise_0200 start-----------------------");
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.pushUrl({
        url: 'MainAbility/pages/ellipse',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          } as DataParam
        } as MainData
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
it('ACE_showAlertBeforeBackPage_static_0100', Level.LEVEL0, async () => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0100-----------------------");
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.showAlertBeforeBackPage({
          message: 'Message Info'
        });
        expect(true).assertTrue();
      } catch (error: Error) {
        console.error(`showAlertBeforeBackPage_0100 failed, code is ${(error as BusinessError)?.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });

    
    /**
     * @tc.number   ACE_showAlertBeforeBackPage_static_0200
     * @tc.name     ACE_showAlertBeforeBackPage_static_0200
     * @tc.desc     ACE_showAlertBeforeBackPage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ACE_showAlertBeforeBackPage_static_0200', Level.LEVEL0, async () => { //异常参数undefined
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        // routerInstance.showAlertBeforeBackPage({
        //   message: undefined
        // });
        expect(true).assertTrue();
      } catch (error: Error) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${(error as BusinessError)?.code}, message is ${error.message}`);
        expect((error as BusinessError)?.code == 401).assertTrue();
      }

    });

    
    /**
     * @tc.number   ACE_hideAlertBeforeBackPage_static_0100
     * @tc.name     ACE_hideAlertBeforeBackPage_static_0100
     * @tc.desc     ACE_hideAlertBeforeBackPage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ACE_hideAlertBeforeBackPage_static_0100', Level.LEVEL0, async () => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      const routerInstance = AppStorage.get<Router>("router") as Router
      try {
        routerInstance.hideAlertBeforeBackPage();
        expect(true).assertTrue();
      } catch (error: Error) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${(error as BusinessError)?.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });



    
    
/**
     * @tc.number   testGlobal_attribute_static_0100
     * @tc.name     testGlobal_attribute_static_0100
     * @tc.desc     testGlobal_attribute_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testGlobal_attribute_static_0100', Level.LEVEL0, async () => {
      console.info('testGlobal_attribute_0100 START');
      await Utils.sleep(1000);
      let resource: resourceManager.Resource = {
        bundleName: "com.open.harmony.aceEtsApiLack",
        moduleName: "entry",
        id: $r('app.string.app_name').id,
        params: undefined,
        type: 0
      };
      try {
        AppStorage.get<common.Context>('context')!.resourceManager.getStringValue(resource.id,
          (error: BusinessError<void> | null, value: string | undefined) => {
            if (error != null) {
              console.log("error is " + error);
              expect().assertFail();
            } else {
              expect(value).assertEqual('ohosProject');
            }
          });
      } catch (error: Error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        console.error(`callback getStringValue failed, error code: ${code}, message: ${message}.`);
        expect().assertFail();
      }

    });

  })
}
