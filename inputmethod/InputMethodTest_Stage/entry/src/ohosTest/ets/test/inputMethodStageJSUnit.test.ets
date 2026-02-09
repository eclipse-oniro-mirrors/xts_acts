/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import inputMethod from '@ohos.inputMethod';
import subtype from '@ohos.InputMethodSubtype';
import { BusinessError } from '@ohos.base';

export default function inputMethodStageJSUnit() {
  describe('inputMethodTest', () => {
    console.info("====>************* settings Test start*************");
    /**
     * beforeAll: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    beforeAll(async(done: Function) => {
      let inputMethodSetting = inputMethod.getSetting();
      console.info('====> getSetting success!')
      inputMethodSetting.listInputMethod((err: BusinessError, data: Array<inputMethod.InputMethodProperty>) => {
        let t = setTimeout(async ()=>{
          console.info('====>Succeeded in listing inputMethod: ' + JSON.stringify(data));
          clearTimeout(t);
          done();
        }, 3000)
      });
    })

    /**
     * @tc.name   inputMethod_test_getController_001
     * @tc.number inputMethod_test_getController_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_getController_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_getController_001 start---------------------");
      try {
        let inputMethodControl = inputMethod.getController();
        console.info("====>inputMethod_test_getController_001 result:" + typeof inputMethodControl);
        if (typeof inputMethodControl == "object") {
          console.info("====>inputMethod_test_getController_001 getController success");
          expect(true).assertTrue();
        } else {
          console.info("====>inputMethod_test_getController_001 getController failed");
          expect().assertFail();
        }
        ;
      } catch (error) {
        console.info("====>inputMethod_test_getController_001 getController error" + JSON.stringify(error));
        expect().assertFail();
      }
      console.info("====>-----------------inputMethod_test_getController_001 end---------------------");
      done();
    });

    /**
     * @tc.name   inputMethod_test_listInputMethodSubtype_001
     * @tc.number inputMethod_test_listInputMethodSubtype_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_listInputMethodSubtype_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_001 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_001 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra: {}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
        try {
          if (err) {
            console.info("====>inputMethod_test_listInputMethodSubtype_001  failed" + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info("====>inputMethod_test_listInputMethodSubtype_001 listInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.info("====>inputMethod_test_listInputMethodSubtype_001 listInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_001 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_listInputMethodSubtype_002
     * @tc.number inputMethod_test_listInputMethodSubtype_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_listInputMethodSubtype_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_002 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_002 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra: {}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
        try {
          if (err) {
            console.info("====>inputMethod_test_listInputMethodSubtype_002  failed" + JSON.stringify(err));
            expect().assertFail();
            done()
          };
          console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype:" + JSON.stringify(data));
          console.info(`====> inputMethod_test_listInputMethodSubtype_002 success data: ${JSON.stringify(data)}`);
          expect(data.length > 0).assertTrue();
          let inputMethodSubtype = data[0]
          console.info("====>inputMethod_test_listInputMethodSubtype_002 inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
          expect(inputMethodSubtype.id != null).assertTrue();
          expect(inputMethodSubtype.label != null).assertTrue();
          done();
        } catch (error) {
          console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_002 end---------------------");
    });


    /**
     * @tc.name   inputMethod_test_listInputMethodSubtype_003
     * @tc.number inputMethod_test_listInputMethodSubtype_003
     * @tc.desc   inputMethod_test_listInputMethodSubtype_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_listInputMethodSubtype_003', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_003 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_003 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra: {}
      }

      try {
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listInputMethodSubtype_003 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listInputMethodSubtype(inputMethodProperty).then((data) => {
          console.info("====>inputMethod_test_listInputMethodSubtype_003 listInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info("====>inputMethod_test_listInputMethodSubtype_003  failed" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info("====>inputMethod_test_listInputMethodSubtype_003 listInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      }
      ;
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_003 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_listInputMethodSubtype_004
     * @tc.number inputMethod_test_listInputMethodSubtype_004
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_listInputMethodSubtype_004', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_004 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_004 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra: {}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_004 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty).then((data) => {
        try {
          console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype:" + JSON.stringify(data));
          console.info(`====> inputMethod_test_listInputMethodSubtype_004 success data: ${JSON.stringify(data)}`);
          expect(data.length > 0).assertTrue();
          let inputMethodSubtype = data[0]
          console.info("====>inputMethod_test_listInputMethodSubtype_004  inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
          expect(inputMethodSubtype.id != null).assertTrue();
          expect(inputMethodSubtype.label != null).assertTrue();
          done();
        } catch (error) {
          console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype catch error" + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.info("====>inputMethod_test_listInputMethodSubtype_004  failed" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_004 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_listCurrentInputMethodSubtype_001
     * @tc.number inputMethod_test_listCurrentInputMethodSubtype_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_listCurrentInputMethodSubtype_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_001 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listCurrentInputMethodSubtype((err, data) => {
        try {
          if (err) {
            console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001  failed" + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          ;
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype: " + JSON.stringify(data));
          console.info(`====> inputMethod_test_listCurrentInputMethodSubtype_001 success data: ${JSON.stringify(data)}`);
          expect(data.length > 0).assertTrue();
          done();
        } catch (error) {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_001 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_listCurrentInputMethodSubtype_002
     * @tc.number inputMethod_test_listInputMethodSubtype_003
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_listCurrentInputMethodSubtype_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 start---------------------");
      try {
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listCurrentInputMethodSubtype().then((data) => {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype: " + JSON.stringify(data));
          console.info(`====> inputMethod_test_listCurrentInputMethodSubtype_002 success data: ${JSON.stringify(data)}`);
          expect(data.length > 0).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002  failed" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      }
      ;
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_getCurrentInputMethodSubtype_001
     * @tc.number inputMethod_test_getCurrentInputMethodSubtype_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_getCurrentInputMethodSubtype_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_001 start---------------------");
      try {
        let inputMethodSubtype = inputMethod.getCurrentInputMethodSubtype();
        console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 result:" + typeof inputMethodSubtype);
        if (typeof inputMethodSubtype == "object") {
          console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype success");
          expect(true).assertTrue();
        } else {
          console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype failed");
          expect().assertFail();
        }
        ;
      } catch (error) {
        console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype error" + JSON.stringify(error));
        expect().assertFail();
      }
      console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_001 end---------------------");
      done();
    });


    /**
     * @tc.name   inputMethod_test_showOptionalInputMethods_001
     * @tc.number inputMethod_test_showOptionalInputMethods_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_showOptionalInputMethods_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_001 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_showOptionalInputMethods_001 result:" + inputMethodSetting);
      inputMethodSetting.showOptionalInputMethods((err, data) => {
        try {
          if (err) {
            console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods faild: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          ;
          console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods success data is : " + data);
          console.info(`====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods success data is : ${data}`);
          expect(data).assertTrue();
          setTimeout(() => {
            done();
          }, 1500);
        } catch (error) {
          console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods catch error: " + JSON.stringify(error));
          done();
        }
      });
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_001 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_showOptionalInputMethods_002
     * @tc.number inputMethod_test_showOptionalInputMethods_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_showOptionalInputMethods_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_002 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try {
        console.info("====>inputMethod_test_showOptionalInputMethods_002 result:" + JSON.stringify(inputMethodSetting));
        inputMethodSetting.showOptionalInputMethods().then((data) => {
          console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods success data is: " + JSON.stringify(data));
          console.info(`====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods success data is : ${data}`);
          expect(data).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods faild: " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods catch error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
      ;
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_002 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_stopInputSession_002
     * @tc.number inputMethod_test_stopInputSession_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_stopInputSession_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_stopInputSession_002 start---------------------");
      try {
        let inputMethodCtrl = inputMethod.getController();
        console.info("====>inputMethod_test_stopInputSession_002 result:" + typeof inputMethodCtrl);
        await inputMethodCtrl.stopInputSession().then((data) => {
          console.info("====>inputMethod_test_stopInputSession_002 data:" + data);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          expect(err.code).assertEqual(12800003)
          done();
        })
      } catch (error) {
        console.info("====>inputMethod_test_stopInputSession_002 catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      }
      ;
      console.info("====>-----------------inputMethod_test_stopInputSession_002 end---------------------");
    });

    /**
     * @tc.name   inputMethod_test_stopInputSession_001
     * @tc.number inputMethod_test_stopInputSession_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethod_test_stopInputSession_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------inputMethod_test_stopInputSession_001 start---------------------");
      let inputMethodCtrl = inputMethod.getController();
      console.debug("inputMethod_test_stopInputSession_001 result: " + typeof inputMethodCtrl);
      inputMethodCtrl.stopInputSession((err) => {
        try {
          if (err) {
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + JSON.stringify(err));
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + err.code);
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + typeof (err.code));
            expect(err.code).assertEqual(12800003);
            done();
          } else {
            expect().assertFail();
            done();
          }
        } catch (err) {
          done();
        }
      })
    });

    /**
     * @tc.name   Sub_Misc_inputMethod_TextInputType_0100
     * @tc.number Sub_Misc_inputMethod_TextInputType_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_inputMethod_TextInputType_0100', Level.LEVEL2, async (done: Function) => {
      let none = inputMethod.TextInputType.NONE;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 none:" + none);
      expect(none).assertEqual(-1);
      let test = inputMethod.TextInputType.TEXT;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 test:" + test);
      expect(test).assertEqual(0);
      let nultiline = inputMethod.TextInputType.MULTILINE;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 nultiline:" + nultiline);
      expect(nultiline).assertEqual(1);
      let number = inputMethod.TextInputType.NUMBER;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 number:" + number);
      expect(number).assertEqual(2);
      let phone = inputMethod.TextInputType.PHONE;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 phone:" + phone);
      expect(phone).assertEqual(3);
      let datetime = inputMethod.TextInputType.DATETIME;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 datetime:" + datetime);
      expect(datetime).assertEqual(4);
      let email_addres = inputMethod.TextInputType.EMAIL_ADDRESS;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 email_addres:" + email_addres);
      expect(email_addres).assertEqual(5);
      let url = inputMethod.TextInputType.URL;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 url:" + url);
      expect(url).assertEqual(6);
      let visble_password = inputMethod.TextInputType.VISIBLE_PASSWORD;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 visble_password:" + visble_password);
      expect(visble_password).assertEqual(7);
      let number_password = inputMethod.TextInputType.NUMBER_PASSWORD;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 NUMBER_PASSWORD:" + number_password);
      expect(number_password).assertEqual(8);
      let screen_lock_password = inputMethod.TextInputType.SCREEN_LOCK_PASSWORD;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 SCREEN_LOCK_PASSWORD:" + screen_lock_password);
      expect(screen_lock_password).assertEqual(9);
      let user_name = inputMethod.TextInputType.USER_NAME;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 USER_NAME:" + user_name);
      expect(user_name).assertEqual(10);
      let new_password = inputMethod.TextInputType.NEW_PASSWORD;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 NEW_PASSWORD:" + new_password);
      expect(new_password).assertEqual(11);
      let number_decimal = inputMethod.TextInputType.NUMBER_DECIMAL;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 NUMBER_DECIMAL:" + number_decimal);
      expect(number_decimal).assertEqual(12);
      let one_time_code = inputMethod.TextInputType.ONE_TIME_CODE;
      console.info("====>Sub_Misc_inputMethod_TextInputType_0100 ONE_TIME_CODE:" + one_time_code);
      expect(one_time_code).assertEqual(13);
      done();
    });

    /**
     * @tc.name   Sub_Misc_inputMethod_EnterKeyType_0100
     * @tc.number Sub_Misc_inputMethod_EnterKeyType_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_inputMethod_EnterKeyType_0100', Level.LEVEL2, async (done: Function) => {
      let unspecified = inputMethod.EnterKeyType.UNSPECIFIED;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 unspecified:" + unspecified);
      expect(unspecified).assertEqual(0);
      let none = inputMethod.EnterKeyType.NONE;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 none:" + none);
      expect(none).assertEqual(1);
      let go = inputMethod.EnterKeyType.GO;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 go:" + go);
      expect(go).assertEqual(2);
      let search = inputMethod.EnterKeyType.SEARCH;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 search:" + search);
      expect(search).assertEqual(3);
      let send = inputMethod.EnterKeyType.SEND;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 send:" + send);
      expect(send).assertEqual(4);
      let next = inputMethod.EnterKeyType.NEXT;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 next:" + next);
      expect(next).assertEqual(5);
      let done_ = inputMethod.EnterKeyType.DONE;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 done_:" + done_);
      expect(done_).assertEqual(6);
      let previous = inputMethod.EnterKeyType.PREVIOUS;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 previous:" + previous);
      expect(previous).assertEqual(7);
      let newline = inputMethod.EnterKeyType.NEWLINE;
      console.info("====>Sub_Misc_inputMethod_EnterKeyType_0100 previous:" + newline);
      expect(newline).assertEqual(8);
      done();
    });

    /**
     * @tc.name   Sub_Misc_inputMethod_KeyboardStatus_0100
     * @tc.number Sub_Misc_inputMethod_KeyboardStatus_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_inputMethod_KeyboardStatus_0100', Level.LEVEL2, async (done: Function) => {
      let none = inputMethod.KeyboardStatus.NONE;
      console.info("====>Sub_Misc_inputMethod_KeyboardStatus_0100 none:" + none);
      expect(none).assertEqual(0);
      let hide = inputMethod.KeyboardStatus.HIDE;
      console.info("====>Sub_Misc_inputMethod_KeyboardStatus_0100 hide:" + hide);
      expect(hide).assertEqual(1);
      let show = inputMethod.KeyboardStatus.SHOW;
      console.info("====>Sub_Misc_inputMethod_KeyboardStatus_0100 show:" + show);
      expect(show).assertEqual(2);
      done();
    });

    /**
     * @tc.name   Sub_Misc_inputMethod_ExtendAction_0100
     * @tc.number Sub_Misc_inputMethod_ExtendAction_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_inputMethod_ExtendAction_0100', Level.LEVEL2, async (done: Function) => {
      let select_all = inputMethod.ExtendAction.SELECT_ALL;
      console.info("====>Sub_Misc_inputMethod_ExtendAction_0100 select_all:" + select_all);
      expect(select_all).assertEqual(0);
      let cut = inputMethod.ExtendAction.CUT;
      console.info("====>Sub_Misc_inputMethod_ExtendAction_0100 cut:" + cut);
      expect(cut).assertEqual(3);
      let copy = inputMethod.ExtendAction.COPY;
      console.info("====>Sub_Misc_inputMethod_ExtendAction_0100 copy:" + copy);
      expect(copy).assertEqual(4);
      let paste = inputMethod.ExtendAction.PASTE;
      console.info("====>Sub_Misc_inputMethod_ExtendAction_0100 paste:" + paste);
      expect(paste).assertEqual(5);
      done();
    });

    /**
     * @tc.name   Sub_Misc_inputMethod_Direction_0100
     * @tc.number Sub_Misc_inputMethod_Direction_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Misc_inputMethod_Direction_0100', Level.LEVEL2, async (done: Function) => {
      let cursor_up = inputMethod.Direction.CURSOR_UP;
      console.info("====>Sub_Misc_inputMethod_Direction_0100 cursor_up:" + cursor_up);
      expect(cursor_up).assertEqual(1);
      let cursor_down = inputMethod.Direction.CURSOR_DOWN;
      console.info("====>Sub_Misc_inputMethod_Direction_0100 cursor_down:" + cursor_down);
      expect(cursor_down).assertEqual(2);
      let cursor_left = inputMethod.Direction.CURSOR_LEFT;
      console.info("====>Sub_Misc_inputMethod_Direction_0100 cursor_left:" + cursor_left);
      expect(cursor_left).assertEqual(3);
      let cursor_right = inputMethod.Direction.CURSOR_RIGHT;
      console.info("====>Sub_Misc_inputMethod_Direction_0100 cursor_right:" + cursor_right);
      expect(cursor_right).assertEqual(4);
      done();
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_ListControl_0600
     * @tc.number SUB_InputMethod_IMF_ListControl_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_ListControl_0600', Level.LEVEL2, (done: Function) => {
      console.info("====>SUB_InputMethod_IMF_ListControl_0600 start");
      let result: ESObject = {
        kikakeyboard: "com.example.kikakeyboard",
        hmos: "com.huawei.hmos.inputmethod"
      }
      try {
        let defaultIme = inputMethod.getDefaultInputMethod();
        console.info("====>SUB_InputMethod_IMF_ListControl_0600: " + JSON.stringify(defaultIme));
        expect(defaultIme.packageName === result.kikakeyboard || defaultIme.packageName === result.hmos).assertTrue();
        done();
        console.info("====>SUB_InputMethod_IMF_ListControl_0600 try end");
      } catch (err) {
        console.info(`====>Failed to getDefaultInputMethod: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
        console.info("====>SUB_InputMethod_IMF_ListControl_0600 err end");
      }
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_Panel_0600
     * @tc.number SUB_InputMethod_IMF_Panel_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_Panel_0600', Level.LEVEL2, async (done: Function) => {
      console.info("====>SUB_InputMethod_IMF_Panel_0600 start");
      try {
        let inputMethodConfig = inputMethod.getSystemInputMethodConfigAbility();
        console.info("====>SUB_InputMethod_IMF_Panel_0600: " + JSON.stringify(inputMethodConfig));
        let bundleName = inputMethodConfig.bundleName;
        let abilityName = inputMethodConfig.abilityName;
        expect(typeof (bundleName) === 'string').assertTrue();
        expect(typeof (abilityName) === 'string').assertTrue();
        console.info("====>SUB_InputMethod_IMF_Panel_0600 end");
        done();
      } catch (err) {
        console.info(`====>Failed to getSystemInputMethodConfigAbility: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_ListControl_0800
     * @tc.number SUB_InputMethod_IMF_ListControl_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_ListControl_0800', Level.LEVEL2, (done: Function) => {
      console.info("====>SUB_InputMethod_IMF_ListControl_0800 start");
      try {
        let defaultIme: inputMethod.InputMethodProperty = inputMethod.getDefaultInputMethod();
        console.info("====>SUB_InputMethod_IMF_ListControl_0800: " + JSON.stringify(defaultIme));
        expect(typeof (defaultIme.enabledState) === 'number').assertTrue();
        done();
        console.info("====>SUB_InputMethod_IMF_ListControl_0800 try end");
      } catch (err) {
        console.info(`====>Failed to getDefaultInputMethod: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
        console.info("====>SUB_InputMethod_IMF_ListControl_0800 err end");
      }
    });

  });
};
