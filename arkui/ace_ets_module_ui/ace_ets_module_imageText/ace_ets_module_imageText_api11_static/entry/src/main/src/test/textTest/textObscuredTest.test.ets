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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import {
  ObscuredReasons
} from '@ohos.arkui.component'
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textObscuredTest() {
  describe('textObscuredTest', () => {
    beforeAll(() => {
      console.info("textObscuredTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textObscuredTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textObscured',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textObscuredTest state pages:" + JSON.stringify(pages));
        if (!("textObscured" == pages.name)) {
          console.info("get textObscuredTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textObscuredTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textObscuredTest page error:" + err);
      }
      console.info("textObscuredTest beforeEach end");
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
     * @tc.number   ArkUX_Redacted_Text_static_0090
     * @tc.name     ArkUX_Redacted_Text_static_0090
     * @tc.desc     ArkUX_Redacted_Text_static_0090
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Redacted_Text_static_0090', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Redacted_Text_static_0090 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Text_static_0090');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Redacted_Text_static_0090 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Text_static_0090 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          console.info("ArkUX_Redacted_Text_static_0090 JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
          expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("30.00fp");
          expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FF");
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");
          console.log("========================== " + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')))
          expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured')[0])).assertEqual(`"${String(ObscuredReasons.PLACEHOLDER)}"`);
          expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual("30");
          console.info('ArkUX_Redacted_Text_static_0090 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_static_0090 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Redacted_Text_static_0100
     * @tc.name     ArkUX_Redacted_Text_static_0100
     * @tc.desc     ArkUX_Redacted_Text_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Redacted_Text_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Redacted_Text_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Text_static_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Redacted_Text_static_0100 START  :' + JSON.stringify(strJson));
          expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("10.00fp");
          expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FE");
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");
          expect(obj.getElement('$attrs').getArray('obscured').length).assertEqual(0);
          expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual("0");
          console.info('ArkUX_Redacted_Text_static_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_static_0100 ERR  ' + err);
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Redacted_Text_static_0110
     * @tc.name     ArkUX_Redacted_Text_static_0110
     * @tc.desc     ArkUX_Redacted_Text_static_0110
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Redacted_Text_static_0110', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Redacted_Text_static_0110 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Text_static_0110');
          console.info('ArkUX_Redacted_Text_static_0110 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("100.00fp");
          expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FD");
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.End");
          expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured')[0])).assertEqual(`"${String(ObscuredReasons.PLACEHOLDER)}"`);
          expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual("100");
          console.info('ArkUX_Redacted_Text_static_0110 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_static_0110 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Redacted_Text_static_0120
     * @tc.name     ArkUX_Redacted_Text_static_0120
     * @tc.desc     ArkUX_Redacted_Text_static_0120
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Redacted_Text_static_0120', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Redacted_Text_static_0120 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Text_static_0120');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Redacted_Text_static_0120 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Text_static_0120 JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
          console.info("ArkUX_Redacted_Text_static_0120 JSON.parseJsonElement(strJson).getElement('$attrs') is: " +
          JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
          expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("1000.00fp");
          expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FC");
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Center");
          expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured')[0])).assertEqual(`"${String(ObscuredReasons.PLACEHOLDER)}"`);
          expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual("1000");
          console.info('ArkUX_Redacted_Text_static_0120 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_static_0120 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Redacted_Text_static_0130
     * @tc.name     ArkUX_Redacted_Text_static_0130
     * @tc.desc     ArkUX_Redacted_Text_static_0130
     * @tc.level    Level.LEVEL1
     */
    it('ArkUX_Redacted_Text_static_0130', Level.LEVEL1, async (done: ()=>void) => {
      console.info('ArkUX_Redacted_Text_static_0130 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Redacted_Text_static_0130');
          let obj = JSON.parseJsonElement(strJson);
          expect(obj.getElement('$attrs').getString('fontSize')).assertEqual("1.00fp");
          expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FB");
          expect(obj.getElement('$attrs').getString('textAlign')).assertEqual("TextAlign.Start");
          expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getArray('obscured')[0])).assertEqual(`"${String(ObscuredReasons.PLACEHOLDER)}"`);
          expect(obj.getElement('$attrs').getString('baselineOffset')).assertEqual("1");
          console.info('ArkUX_Redacted_Text_static_0130 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_static_0130 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}