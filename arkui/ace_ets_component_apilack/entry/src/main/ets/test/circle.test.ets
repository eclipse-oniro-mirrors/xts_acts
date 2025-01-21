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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'
import ohosrouter from '@ohos.router';
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';

export default function circleNewJsunit() {
  describe('circleNewTest', function () {
    beforeAll(async function (done) {
      console.info("circle beforeEach start");
      let options = {
        uri: 'MainAbility/pages/circle',
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
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("circleNew after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_001
     * @tc.name         testcircleNew001
     * @tc.desic         acecircleNewEtsTest001
     */
    it('testcircleNew001', 0, async function (done) {
      console.info('circleNew testcircleNew0011 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('circle');
      console.info("[testcircleNew001] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Circle');
      expect(obj.$attrs.width).assertEqual("100.00px");
      console.info("[testcircleNew001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_002
     * @tc.name         testcircleNew002
     * @tc.desic         acecircleNewEtsTest002
     */
    it('testcircleNew002', 0, async function (done) {
      console.info('circleNew testcircleNew002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('circle');
      console.info("[testcircleNew002] component textAlign strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Circle');
      expect(obj.$attrs.height).assertEqual("100.00px");
      console.info("[testcircleNew002] width value :" + obj.$attrs.width);
      done();
    });

    /**
     * @tc.number ACE_global_console_debug_0100
     * @tc.name console::debug
     * @tc.desc Test console debug printing
     */
    it("ACE_global_console_debug_0100", 0, async function (done) {
      var casename = "ACE_global_003";
      console.log("-----------------------ACE_global_console_debug Test is starting-----------------------");
      try {
        console.debug("ACE_global_console_debug test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_debug Test end-----------------------");
      done();
    }); 

    /**
     * @tc.number ACE_global_console_error_0100
     * @tc.name console::error
     * @tc.desc Test console error printing
     */
    it("ACE_global_console_error_0200", 0, async function (done) {
      var casename = "ACE_global_004";
      console.log("-----------------------ACE_global_console_error Test is starting-----------------------");
      try {
        console.error("ACE_global_console_warn test ok");
        expect(true).assertTrue();
      } catch (error) {
        console.log(casename + "errorcode: " + casename);
        expect().assertFail();
        done();
      }
      console.log("-----------------------ACE_global_console_error Test end-----------------------");
      done();
    }); 
   
    /**
     * @tc.number pushUrl_callback_0100 
     * @tc.name ACE_pushUrl_callback_0100
     * @tc.desc Test pushUrl 
     */
    it("ACE_pushUrl_callback_0100", 0, async function (done) {
        console.info("-----------------------ACE_pushUrl_callback_0100 start-----------------------");
        ohosrouter.pushUrl({
            url: 'MainAbility/pages/common',
            params: {
                data1: 'message',
                data2: {
                    data3: [123, 456, 789]
                }
            }
        }, (err) => {
            if (err) {
                console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
                expect().assertFail();         
            } else {
                console.info('pushUrl success');
                expect(true).assertTrue();
            } 
        })
        console.info("-----------------------ACE_pushUrl_callback_0100 end-----------------------");
        done();     
    });

     /**
     * @tc.number pushUrl_promise_0200 
     * @tc.name ACE_pushUrl_promise_0200
     * @tc.desc Test pushUrl 
     */
    it("ACE_pushUrl_callback_0200", 0, async function (done) {
        console.info("-----------------------ACE_pushUrl_promise_0200 start-----------------------");
        ohosrouter.pushUrl({
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
            .catch(err => {
                console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
                expect().assertFail();      
            })
        console.info("-----------------------ACE_pushUrl_promise_0200 end-----------------------");
        done();     
    });

    /**
     * @tc.number showAlertBeforeBackPage_0100
     * @tc.name ACE_showAlertBeforeBackPage_0100
     * @tc.desc Test showAlertBeforeBackPage
     */
    it("ACE_showAlertBeforeBackPage_0100", 0, async function (done) {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0100-----------------------");
      try {
         ohosrouter.showAlertBeforeBackPage({
            message: 'Message Info'
        });
        expect(true).assertTrue();
      } catch(error) {
        console.error(`showAlertBeforeBackPage_0100 failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number showAlertBeforeBackPage_0200
     * @tc.name ACE_showAlertBeforeBackPage_0200
     * @tc.desc Test showAlertBeforeBackPage
     */
    it("ACE_showAlertBeforeBackPage_0200", 0, async function (done) {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      try {
        ohosrouter.showAlertBeforeBackPage({
          message:undefined
        });
        expect(true).assertTrue();
      } catch(error) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      done();
    });

    /**
     * @tc.number hideAlertBeforeBackPage_0100
     * @tc.name ACE_hideAlertBeforeBackPage_0100
     * @tc.desc Test hideAlertBeforeBackPage
     */
    it("ACE_hideAlertBeforeBackPage_0100", 0, async function (done) {
      console.info("-----------------------ACE_showAlertBeforeBackPage_0200-----------------------");
      try {
        ohosrouter.hideAlertBeforeBackPage();
        expect(true).assertTrue();
      } catch(error) {
        console.error(`ACE_showAlertBeforeBackPage_0200, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testGlobal_attribute_0100
    * @tc.desc          test global attribute
   */
    it('testGlobal_attribute_0100', 0, async function (done) {
      console.info('testGlobal_attribute_0100 START');
      await Utils.sleep(1000);
      let resource: resourceManager.Resource = {
        bundleName: "com.open.harmony.aceEtsApiLack",
        moduleName: "phone",
        id: $r('app.string.app_name').id,
        params: null,
        type: 0
      };
      try {
        globalThis.abilityContext.resourceManager.getStringValue(resource, (error, value) => {
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
      done();
    });

  })
}
