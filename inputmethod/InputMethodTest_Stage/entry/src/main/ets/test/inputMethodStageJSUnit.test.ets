/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import inputMethod from '@ohos.inputMethod';
import subtype from '@ohos.InputMethodSubtype';

export default function inputMethodStageJSUnit() {
  describe('inputMethodTest', function () {
    console.info("====>************* settings Test start*************");
    /*
     * @tc.number  inputMethod_test_getController_001
     * @tc.name   get inputMethod controller
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_getController_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_getController_001 start---------------------");
      try{
        let inputMethodControl = inputMethod.getController();
        console.info("====>inputMethod_test_getController_001 result:" + typeof inputMethodControl);
        if(typeof inputMethodControl == "object" ){
          console.info("====>inputMethod_test_getController_001 getController success");
          expect(true).assertTrue();
        }else{
          console.info("====>inputMethod_test_getController_001 getController failed");
          expect().assertFail();
        };
      }catch(error){
        console.info("====>inputMethod_test_getController_001 getController error" + JSON.stringify(error));
        expect().assertFail();
      };

      console.info("====>-----------------inputMethod_test_getController_001 end---------------------");
      done();
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_001
     * @tc.name   List subtype of the specified input method
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_listInputMethodSubtype_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_001 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_001 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
        try {
          if(err){
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

    /*
    * @tc.number  inputMethod_test_listInputMethodSubtype_002
    * @tc.name   List subtype of the specified input method
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('inputMethod_test_listInputMethodSubtype_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_002 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_002 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty, (err, data) => {
        try {
          if(err){
            console.info("====>inputMethod_test_listInputMethodSubtype_002  failed" + JSON.stringify(err));
            expect().assertFail();
            done()
          };
          console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype:" + JSON.stringify(data));
          if(data.length >= 1){
            let inputMethodSubtype = data[0]
            console.info("====>inputMethod_test_listInputMethodSubtype_002 inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
            expect(inputMethodSubtype.id != null).assertTrue();
            expect(inputMethodSubtype.label != null).assertTrue();
            done();
          }else{
            console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype length less 1");
            expect().assertFail();
            done();
          };
        } catch (error) {
          console.info("====>inputMethod_test_listInputMethodSubtype_002 listInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_003
     * @tc.name   List subtype of the specified input method
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */

    it('inputMethod_test_listInputMethodSubtype_003', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_003 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_003 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listInputMethodSubtype_003 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listInputMethodSubtype(inputMethodProperty).then((data) => {
          console.info("====>inputMethod_test_listInputMethodSubtype_003 listInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch(err => {
          console.info("====>inputMethod_test_listInputMethodSubtype_003  failed" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch(error){
        console.info("====>inputMethod_test_listInputMethodSubtype_003 listInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_003 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_004
     * @tc.name   List subtype of the specified input method
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_listInputMethodSubtype_004', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_004 start---------------------");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_listInputMethodSubtype_004 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        icon: "",
        iconId: 124,
        extra:{}
      }

      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listInputMethodSubtype_004 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listInputMethodSubtype(inputMethodProperty).then((data) => {
        try{
          console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype:" + JSON.stringify(data));
          if(data.length >= 1){
            let inputMethodSubtype = data[0]
            console.info("====>inputMethod_test_listInputMethodSubtype_004  inputMethodSubtype" + JSON.stringify(inputMethodSubtype));
            expect(inputMethodSubtype.id != null).assertTrue();
            expect(inputMethodSubtype.label != null).assertTrue();
            done();
          }else{
            console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype length less 1");
            expect().assertFail();
            done();
          }
        }catch(error){
          console.info("====>inputMethod_test_listInputMethodSubtype_004 listInputMethodSubtype catch error" + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }).catch(err => {
        console.info("====>inputMethod_test_listInputMethodSubtype_004  failed" + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info("====>-----------------inputMethod_test_listInputMethodSubtype_004 end---------------------");
    });

    /*
    * @tc.number  inputMethod_test_listCurrentInputMethodSubtype_001
    * @tc.name   List subtype of the specified input method
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('inputMethod_test_listCurrentInputMethodSubtype_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_001 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 getSetting result:" + inputMethodSetting);
      inputMethodSetting.listCurrentInputMethodSubtype((err, data) => {
        try {
          if(err){
            console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001  failed" + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_001 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
          done();
        }
      });
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_001 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_listInputMethodSubtype_003
     * @tc.name    List subtype of current input method
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_listCurrentInputMethodSubtype_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 start---------------------");
      try{
        let inputMethodSetting = inputMethod.getSetting();
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 getSetting result:" + inputMethodSetting);
        inputMethodSetting.listCurrentInputMethodSubtype().then((data) => {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch(err => {
          console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002  failed" + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch(error){
        console.info("====>inputMethod_test_listCurrentInputMethodSubtype_002 listCurrentInputMethodSubtype catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_listCurrentInputMethodSubtype_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_getCurrentInputMethodSubtype_001
     * @tc.name    Get the current input method subtype
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_getCurrentInputMethodSubtype_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_001 start---------------------");
      try{
        let inputMethodSubtype = inputMethod.getCurrentInputMethodSubtype();
        console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 result:" + typeof inputMethodSubtype);
        if(typeof inputMethodSubtype == "object" ){
          console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype success");
          expect(true).assertTrue();
        }else{
          console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype failed");
          expect().assertFail();
        };
      }catch(error){
        console.info("====>inputMethod_test_getCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype error" + JSON.stringify(error));
        expect().assertFail();
      }
      console.info("====>-----------------inputMethod_test_getCurrentInputMethodSubtype_001 end---------------------");
      done();
    });


    /*
     * @tc.number  inputMethod_test_showOptionalInputMethods_001
     * @tc.name    Show input method setting extension dialog
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_showOptionalInputMethods_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_001 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      console.info("====>inputMethod_test_showOptionalInputMethods_001 result:" + inputMethodSetting);
      inputMethodSetting.showOptionalInputMethods((err, data) => {
        try {
          if(err){
            console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods faild: " + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_showOptionalInputMethods_001 showOptionalInputMethods success data is : " + data);
          expect(true).assertTrue();
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

    /*
     * @tc.number  inputMethod_test_showOptionalInputMethods_002
     * @tc.name    Show input method setting extension dialog
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_showOptionalInputMethods_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_002 start---------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try {
        console.info("====>inputMethod_test_showOptionalInputMethods_002 result:" + JSON.stringify(inputMethodSetting));
        inputMethodSetting.showOptionalInputMethods().then((data) => {
          console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods success data is: " + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        }).catch(err => {
          console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods faild: " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info("====>inputMethod_test_showOptionalInputMethods_002 showOptionalInputMethods catch error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_showOptionalInputMethods_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_stopInputSession_002
     * @tc.name   Stop input
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_stopInputSession_002', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_stopInputSession_002 start---------------------");
      try{
        let inputMethodCtrl = inputMethod.getController();
        console.info("====>inputMethod_test_stopInputSession_002 result:" + typeof inputMethodCtrl);
        await inputMethodCtrl.stopInputSession().then((data) => {
          console.info("====>inputMethod_test_stopInputSession_002 data:" + data);
          expect().assertFail();
          done();
        }).catch((err) => {
          expect(err.code).assertEqual(12800003)
          done();
        })
      }catch(error){
        console.info("====>inputMethod_test_stopInputSession_002 catch error" + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>-----------------inputMethod_test_stopInputSession_002 end---------------------");
    });

    /*
     * @tc.number  inputMethod_test_stopInputSession_001
     * @tc.name   Stop input
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('inputMethod_test_stopInputSession_001', 0, async function (done) {
      console.info("====>-----------------inputMethod_test_stopInputSession_001 start---------------------");
      let inputMethodCtrl = inputMethod.getController();
      console.debug("inputMethod_test_stopInputSession_001 result: " + typeof inputMethodCtrl);
      inputMethodCtrl.stopInputSession((err)=>{
        try {
          if(err){
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + JSON.stringify(err));
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + err.code);
            console.info("====>inputMethod_test_stopInputSession_001 faild: " + typeof(err.code));
            expect(err.code).assertEqual(12800003);
            done();
          }else{
            expect().assertFail();
            done();
          }
        } catch (err) {
          done();
        }
      })
    });

    /*
     * @tc.number  Sub_Misc_inputMethod_TextInputType_0100
     * @tc.name   Sub_Misc_inputMethod_TextInputType_0100
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('Sub_Misc_inputMethod_TextInputType_0100', 0, async function (done) {
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
      done();
    });

    /*
     * @tc.number  Sub_Misc_inputMethod_EnterKeyType_0100
     * @tc.name   Sub_Misc_inputMethod_EnterKeyType_0100
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('Sub_Misc_inputMethod_EnterKeyType_0100', 0, async function (done) {
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
      done();
    });

    /*
     * @tc.number  Sub_Misc_inputMethod_KeyboardStatus_0100
     * @tc.name   Sub_Misc_inputMethod_KeyboardStatus_0100
     * @tc.desc    Function test
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   2
     */
    it('Sub_Misc_inputMethod_KeyboardStatus_0100', 0, async function (done) {
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

    /*
    * @tc.number  Sub_Misc_inputMethod_ExtendAction_0100
    * @tc.name   Sub_Misc_inputMethod_ExtendAction_0100
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_ExtendAction_0100', 0, async function (done) {
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

    /*
    * @tc.number  Sub_Misc_inputMethod_Direction_0100
    * @tc.name   Sub_Misc_inputMethod_Direction_0100
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethod_Direction_0100', 0, async function (done) {
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

    /*
    * @tc.number  SUB_InputMethod_IMF_ListControl_0600
    * @tc.name   SUB_InputMethod_IMF_ListControl_0600
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('SUB_InputMethod_IMF_ListControl_0600', 0, function (done) {
      console.info("====>SUB_InputMethod_IMF_ListControl_0600 start");
      let result: any = {
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

    /*
    * @tc.number  SUB_InputMethod_IMF_Panel_0600
    * @tc.name   SUB_InputMethod_IMF_Panel_0600
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('SUB_InputMethod_IMF_Panel_0600', 0, async function (done) {
      console.info("====>SUB_InputMethod_IMF_Panel_0600 start");
      try {
        let inputMethodConfig = inputMethod.getSystemInputMethodConfigAbility();
        console.info("====>SUB_InputMethod_IMF_Panel_0600: " + JSON.stringify(inputMethodConfig));
        expect(inputMethodConfig.hasOwnProperty('bundleName')).assertTrue();
        expect(inputMethodConfig.hasOwnProperty('moduleName')).assertTrue();
        expect(inputMethodConfig.hasOwnProperty('abilityName')).assertTrue();
        console.info("====>SUB_InputMethod_IMF_Panel_0600 end");
        done();
      } catch (err) {
        console.info(`====>Failed to getSystemInputMethodConfigAbility: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

  });
};
