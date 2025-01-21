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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import inputMethod from '@ohos.inputMethod';
import subtype from '@ohos.InputMethodSubtype';

export default function inputMethodAuthorityJSUnit() {
  describe('inputMethodAuthorityJSUnit', function () {
    console.info("====>************* inputMethodAuthorityJSUnit settings Test start*************");

    /*
 * @tc.number  inputmethod_test_switchInputMethod_001
 * @tc.name    Test Indicates the input method which will replace the current one.
 * @tc.desc    Function test
 * @tc.level   2
 */
    it('inputmethod_test_switchInputMethod_001', 0, async function (done) {
      console.info("====>************* inputmethod_test_switchInputMethod_001 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethod_test_switchInputMethod_001 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      inputMethod.switchInputMethod(inputMethodProperty).then(data => {
        console.info("====>inputmethod_test_switchInputMethod_001 data:" + data)
        expect(data == true).assertTrue();
        console.info("====>************* inputmethod_test_switchInputMethod_001 Test end*************");
        done();
      }).catch(err => {
        console.info("====>inputmethod_test_switchInputMethod_001 err:" + err)
        expect().assertFail();
        done();
      });
    });

    /*
     * @tc.number  inputmethod_test_switchInputMethod_002
     * @tc.name    Test Indicates the input method which will replace the current one.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_switchInputMethod_002', 0, async function (done) {
      console.info("====>************* inputmethod_test_switchInputMethod_002 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethod_test_switchInputMethod_002 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
        try {
          if (err) {
            console.info("====>inputmethod_test_switchInputMethod_002 error:" + err);
            expect().assertFail();
            done();
          }
          console.info("====>inputmethod_test_switchInputMethod_002 data:" + data)
          console.info("====>************* inputmethod_test_switchInputMethod_002 Test end*************");
          expect(data == true).assertTrue();
          done();
        } catch (err) {
          console.info("====>inputmethod_test_switchInputMethod_002 catch error:" + err);
          done();
        }
      });
    });

    /*
     * @tc.number  inputmethod_test_showSoftKeyboard_001
     * @tc.name    Test Indicates the input method which will show softboard with calback.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_showSoftKeyboard_001', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.showSoftKeyboard((err) => {
        try {
          if(err == undefined){
            expect().assertFail()
            done();
          }else{
            expect(err.code).assertEqual(12800003)
            console.info("====>************* inputmethod_test_showSoftKeyboard_001 Test end*************");
            done();
          }
        } catch (err) {
          console.info("====>inputmethod_test_showSoftKeyboard_001 err tests fail" + JSON.stringify(err));
          done();
        }
      });
    });

    /*
     * @tc.number  inputmethod_test_showSoftKeyboard_002
     * @tc.name    Test Indicates the input method which will show softboard with Promise.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_showSoftKeyboard_002', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.showSoftKeyboard().then(() => {
        try {
          expect().assertFail()
          done();
        } catch (err) {
          console.info("====>inputmethod_test_showSoftKeyboard_002 err tests fail" + JSON.stringify(err));
          done();
        }
      }).catch((err) => {
        console.info('====>inputmethod_test_showSoftKeyboard_002 promise failed : ' + JSON.stringify(err))
        console.info('====>inputmethod_test_showSoftKeyboard_002 typeof(err.code): ' + typeof(err.code))
        console.info('====>inputmethod_test_showSoftKeyboard_002 typeof(err.code): ' + err.code)
        expect(err.code).assertEqual(12800003)
        console.info("====>************* inputmethod_test_showSoftKeyboard_002 Test end*************");
        done();
      })
    });

    /*
     * @tc.number  inputmethod_test_hideSoftKeyboard_001
     * @tc.name    Test Indicates the input method which will hide softboard with calback.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_hideSoftKeyboard_001', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.hideSoftKeyboard((err) => {
        try {
          if(err == undefined){
            expect().assertFail()
            done();
          }else{
            console.info('====>inputmethod_test_hideSoftKeyboard_001 callbacek failed : ' + JSON.stringify(err))
            expect(err.code).assertEqual(12800003)
            console.info("====>************* inputmethod_test_hideSoftKeyboard_001 Test end*************");
            done();
          }
        } catch (err) {
          console.info('====>inputmethod_test_hideSoftKeyboard_001 callbacek failed : ' + JSON.stringify(err))
          done();
        }
      })
    });

    /*
     * @tc.number  inputmethod_test_hideSoftKeyboard_002
     * @tc.name    Test Indicates the input method which will hide softboard with Promise.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_hideSoftKeyboard_002', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.hideSoftKeyboard().then(() => {
        try {
          expect().assertFail()
          done();
        } catch (err) {
          console.info("====>inputmethod_test_hideSoftKeyboard_002 err tests fail" + JSON.stringify(err));
          done();
        }
      }).catch((err) => {
        console.info('====>inputmethod_test_hideSoftKeyboard_002 promise failed : ' + JSON.stringify(err))
        expect(err.code).assertEqual(12800003);
        console.info("====>************* inputmethod_test_hideSoftKeyboard_002 Test end*************");
        done();
      })
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodAndSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodAndSubtype_001', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_001 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_001 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        labelId: 123,
        icon: "",
        iconId: 124,
        extra:{}
      }
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_001 getCurrentInputMethodSubtype: " +  JSON.stringify(inputMS));
      let inputMethodSubProperty : subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty, (err,data) => {
        try {
          if (err) {
            console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_001 err: ' + JSON.stringify(err));
            expect( err.code === 12800008 ).assertTrue();
            done();
          }
          console.info("====>inputMethod_test_switchCurrentInputMethodAndSubtype_001 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        } catch (error) {
          console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_001 catch error: ' + JSON.stringify(error));
          done();
        }
      });
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_001 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodAndSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodAndSubtype_002', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_002 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_002 getCurrentInputMethod: " +  JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName:inputM.packageName,
        methodId:inputM.methodId,
        name:inputM.packageName,
        id:inputM.methodId,
        label: "",
        labelId: 123,
        icon: "",
        iconId: 124,
        extra:{}
      }
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_002 getCurrentInputMethodSubtype: " +  JSON.stringify(inputMS));
      let inputMethodSubProperty : subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      try {
        inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty).then((data) => {
          console.info("====>inputMethod_test_switchCurrentInputMethodAndSubtype_002 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        }).catch(err => {
          console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_002 err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_002 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_002 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodSubtype_001', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_001 Test start*************");
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype: " +  JSON.stringify(inputMS));
      let inputMethodSubProperty : subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty, (err,data) => {
        try {
          if (err) {
            console.error('inputMethod_test_switchCurrentInputMethodSubtype_001 err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          };
          console.info("====>inputMethod_test_switchCurrentInputMethodSubtype_001 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        } catch (error) {
          console.error('inputMethod_test_switchCurrentInputMethodSubtype_001 catch error: ' + JSON.stringify(error));
          done();
        }
      });
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_001 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodSubtype_002', 0, async function (done) {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_002 Test start*************");
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodSubtype_002 getCurrentInputMethodSubtype: " +  JSON.stringify(inputMS));
      let inputMethodSubProperty : subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      try {
        inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty).then((data) => {
          console.info("====>inputMethod_test_switchCurrentInputMethodSubtype_002 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        }).catch(err => {
          console.error('inputMethod_test_switchCurrentInputMethodSubtype_002 err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodSubtype_002 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      };
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_002 Test end*************");
    });

  });
};
