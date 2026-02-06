/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';

export default function circleNewJsunit() {
  describe('circleNewTest', () => {
    beforeAll(async () => {
      console.info("circle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/circle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get circle state success " + JSON.stringify(pages));
        if (!("circle" == pages.name)) {
          console.info("get circle state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push circle page success " + JSON.stringify(result));
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
     * @tc.name   testcircleNew001
     * @tc.number SUB_ACE_BASIC_ETS_API_001
     * @tc.desc   testcircleNew001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testcircleNew001', Level.LEVEL0, async () => {
      console.info('circleNew testcircleNew0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('circle');
      console.info("[testcircleNew001] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Circle');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00px");
      console.info("[testcircleNew001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testcircleNew002
     * @tc.number SUB_ACE_BASIC_ETS_API_002
     * @tc.desc   testcircleNew002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testcircleNew002', Level.LEVEL0, async () => {
      console.info('circleNew testcircleNew002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('circle');
      console.info("[testcircleNew002] component textAlign strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Circle');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("100.00px");
      console.info("[testcircleNew002] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   ACE_global_console_debug_0100
     * @tc.number ACE_global_console_debug_0100
     * @tc.desc   Test console debug printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_global_console_debug_0100", Level.LEVEL0, async () => {
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
     * @tc.name   ACE_global_console_error_0200
     * @tc.number ACE_global_console_error_0100
     * @tc.desc   Test console error printing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_global_console_error_0200", Level.LEVEL0, async () => {
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
     * @tc.name   ACE_pushUrl_callback_0100
     * @tc.number pushUrl_callback_0100
     * @tc.desc   Test pushUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_pushUrl_callback_0100", Level.LEVEL0, async () => {
      console.info("-----------------------ACE_pushUrl_callback_0100 start-----------------------");
      router.pushUrl({
        url: 'MainAbility/pages/common',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
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
     * @tc.name   ACE_pushUrl_callback_0200
     * @tc.number pushUrl_promise_0200
     * @tc.desc   Test pushUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_pushUrl_callback_0200", Level.LEVEL0, async () => {
      console.info("-----------------------ACE_pushUrl_promise_0200 start-----------------------");
      router.pushUrl({
        url: 'MainAbility/pages/ellipse',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        expect(true).assertTrue();
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        })
      console.info("-----------------------ACE_pushUrl_promise_0200 end-----------------------");

    });

    /**
     * @tc.name   ACE_showAlertBeforeBackPage_0100
     * @tc.number showAlertBeforeBackPage_0100
     * @tc.desc   Test showAlertBeforeBackPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_showAlertBeforeBackPage_0100", Level.LEVEL0, async () => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0100-----------------------");
      try {
        router.showAlertBeforeBackPage({
          message: 'Message Info'
        });
        expect(true).assertTrue();
      } catch (error) {
        console.error(`showAlertBeforeBackPage_0100 failed, code is ${(error as BusinessError)?.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   ACE_showAlertBeforeBackPage_0200
     * @tc.number showAlertBeforeBackPage_0200
     * @tc.desc   Test showAlertBeforeBackPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_showAlertBeforeBackPage_0200", Level.LEVEL0, async () => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      try {
        router.showAlertBeforeBackPage({
          message: undefined
        });
        expect(true).assertTrue();
      } catch (error) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${(error as BusinessError)?.code}, message is ${error.message}`);
        expect((error as BusinessError)?.code == 401).assertTrue();
      }

    });

    /**
     * @tc.name   ACE_hideAlertBeforeBackPage_0100
     * @tc.number hideAlertBeforeBackPage_0100
     * @tc.desc   Test hideAlertBeforeBackPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACE_hideAlertBeforeBackPage_0100", Level.LEVEL0, async () => {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      try {
        router.hideAlertBeforeBackPage();
        expect(true).assertTrue();
      } catch (error) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${(error as BusinessError)?.code}, message is ${error.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testGlobal_attribute_0100
     * @tc.number SUB_ACE_BASIC_ETS_API_0010
     * @tc.desc   test global attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGlobal_attribute_0100', Level.LEVEL0, async () => {
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
        globalThis.abilityContext.resourceManager.getStringValue(resource, (error: BusinessError, value: string) => {
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
