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

export default function inputMethodJSUnit() {
  describe('appInfoTest_input_2', function () {
    console.info("====>************* settings Test start*************");
    it('inputmethoh_test_001', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_001 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.listInputMethod((arr) => {
        console.info("====>appInfoTest_input_2 listInputMethod result---" + JSON.stringify(arr));
        expect(1 == 1).assertTrue();
        done();
      });
    });

    it('inputmethoh_test_002', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_002 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.listInputMethod().then(inputMethodProperty => {
        if (inputMethodProperty.length > 0) {
          let obj = inputMethodProperty[0]
          console.info("====>inputmethoh_test_002 listInputMethod obj---" + JSON.stringify(obj));
          expect(obj.packageName != null).assertTrue();
          expect(obj.methodId != null).assertTrue();
        } else {
          console.info("====>inputmethoh_test_002 listInputMethod is null");
          expect().assertFail()
        }
        done();
      }).catch(err => {
        console.info("====>inputmethoh_test_002 listInputMethod is err: " + JSON.stringify(err));
        done();
      });
    });

    it('inputmethoh_test_003', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_003 result:" + JSON.stringify(inputMethodSetting));
      setTimeout(() => {
        inputMethodSetting.displayOptionalInputMethod((err) => {
          try {
            if (err) {
              console.info("====>inputmethoh_test_003 displayOptionalInputMethod err:" + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(true).assertTrue();
            console.info("====>inputmethoh_test_003 displayOptionalInputMethod---");
            done();
          } catch (err) {
            console.info("====>inputmethoh_test_004 displayOptionalInputMethod throw_err: " + JSON.stringify(err));
            done();
          }
        });
      }, 500)
    });

    it('inputmethoh_test_004', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_004 result:" + JSON.stringify(inputMethodSetting));
      setTimeout(() => {
        inputMethodSetting.displayOptionalInputMethod().then(() => {
          console.info("====>inputmethoh_test_004 displayOptionalInputMethod is called");
          expect(true).assertTrue()
          done();
        }).catch(err => {
          console.info("====>inputmethoh_test_004 displayOptionalInputMethod is err: " + JSON.stringify(err));
          expect().assertFail()
          done();
        });
      }, 500)
    });

    it('inputmethoh_test_005', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      console.info("====>inputmethoh_test_005 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInput((res) => {
        console.info("====>inputmethoh_test_005 stopInput result----" + res);
        done();
      });
    });

    it('inputmethoh_test_006', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      console.info("====>inputmethoh_test_006 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInput().then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        console.info("====>inputmethoh_test_006 stopInput is err: " + JSON.stringify(err));
        expect().assertEqual();
        done();
      });
    });

    /*
     * @tc.number: inputmethod_test_MAX_TYPE_NUM_001
     * @tc.name: inputMethod::MAX_TYPE_NUM
     * @tc.desc: Verify Max_ TYPE_ NUM
     */
    it('inputmethod_test_MAX_TYPE_NUM_001', 0, async function (done) {
      console.info("====>************* inputmethod_test_MAX_TYPE_NUM_001 Test start*************");
      let inputMethodSetting = inputMethod.MAX_TYPE_NUM;
      console.info("====>inputmethod_test_001 result:" + inputMethodSetting);
      expect(inputMethodSetting !== null).assertTrue();
      console.info("====>************* inputmethod_test_MAX_TYPE_NUM_001 Test end*************");
      done();
    });

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
     * @tc.number  inputmethod_test_getCurrentInputMethod_001
     * @tc.name    return The InputMethodProperty object of the current input method.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_getCurrentInputMethod_001', 0, async function (done) {
      let currentIme = inputMethod.getCurrentInputMethod();
      console.info("====>inputmethod_test_getCurrentInputMethod_001 currentIme---" + JSON.stringify(currentIme));
      console.info(currentIme.packageName);
      console.info(currentIme.methodId);
      expect(currentIme.packageName !== null).assertTrue();
      expect(currentIme.methodId !== null).assertTrue();
      console.info("====>************* inputmethod_test_getCurrentInputMethod_001 Test end*************");
      done();
    });

    /*
     * @tc.number  inputmethod_test_getInputMethods_001
     * @tc.name    param enable :
     *             if true, collect enabled input methods.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_getInputMethods_001', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethod_test_getInputMethods_001 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.getInputMethods(true, (err, arr) => {
        try {
          if (err) {
            console.error("inputmethod_test_getInputMethods_001 failed because: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          ;
          console.info("====>inputmethod_test_getInputMethods_001 listInputMethod result---" + JSON.stringify(arr));
          expect(arr != null).assertTrue();
          console.info("====>************* inputmethod_test_getInputMethods_001 Test end*************");
          done();
        } catch (err) {
          console.error("inputmethod_test_getInputMethods_001 catch error: " + err);
          done();
        }
      });
    });

    /*
     * @tc.number  inputmethod_test_getInputMethods_002
     * @tc.name    param enable :
     *             if false, collect disabled input methods.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_getInputMethods_002', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethod_test_getInputMethods_002 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.getInputMethods(false, (err, arr) => {
        try {
          if (err) {
            console.error("inputmethod_test_getInputMethods_002 failed because: " + JSON.stringify(err));
            expect().assertFail();
          }
          ;
          console.info("====>inputmethod_test_getInputMethods_002 listInputMethod result---" + JSON.stringify(arr));
          expect(arr != null).assertTrue();
          done();
        } catch (err) {
          console.error("inputmethod_test_getInputMethods_002 catch error: " + err);
          done();
        }
      });
    });
  });
};
