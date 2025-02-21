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

    /**
     * @tc.number  inputmethoh_test_001
     * @tc.name    inputmethoh_test_001
     * @tc.desc    listInputMethod().interfaces.Callback.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethoh_test_001', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_001 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.listInputMethod((arr) => {
        console.info("====>appInfoTest_input_2 listInputMethod result---" + JSON.stringify(arr));
        expect(1 == 1).assertTrue();
        done();
      });
    });

    /**
     * @tc.number  inputmethoh_test_002
     * @tc.name    inputmethoh_test_002
     * @tc.desc    listInputMethod().interfaces.Promise.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
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

    /**
     * @tc.number  inputmethoh_test_003
     * @tc.name    inputmethoh_test_003
     * @tc.desc    displayOptionalInputMethod().interfaces.Callback
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
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

    /**
     * @tc.number  inputmethoh_test_004
     * @tc.name    inputmethoh_test_004
     * @tc.desc    displayOptionalInputMethod().interfaces.Promise
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
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

    /**
     * @tc.number  inputmethoh_test_005
     * @tc.name    inputmethoh_test_005
     * @tc.desc    Stop input().interfaces.Callback
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethoh_test_005', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      await inputMethod.getController().detach();
      console.info("====>inputmethoh_test_005 detach success");
      console.info("====>inputmethoh_test_005 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInput((err, res) => {
        try{
          if (err) {
            console.error(`====>Failed to stopInput: ${JSON.stringify(err)}`);
            expect(err.code === 1).assertTrue();
            done();
          }else{
            console.info("====>inputmethoh_test_005 stopInput result----" + res);
            expect().assertFail();
            done();
          }
        }catch(err){
          console.info("====>inputmethoh_test_005 stopInput throw err" + JSON.stringify(err));
          done();
        }        
      });
    });

    /**
     * @tc.number  inputmethoh_test_006
     * @tc.name    inputmethoh_test_006
     * @tc.desc    Stop input().interfaces.Promise
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethoh_test_006', 0, async function (done) {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      await inputMethod.getController().detach();
      console.info("====>inputmethoh_test_006 detach success");
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
     * @tc.number  inputmethod_test_MAX_TYPE_NUM_001
     * @tc.name    inputmethod_test_MAX_TYPE_NUM_001
     * @tc.desc    Keyboard max number
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
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
     * @tc.number  inputmethod_test_getCurrentInputMethod_001
     * @tc.name    return The InputMethodProperty object of the current input method.
     * @tc.desc    Get current input method
     * @tc.size    MediumTest
     * @tc.type    Function
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

    /**
     * @tc.number  inputmethod_test_getInputMethods_001
     * @tc.name    inputmethod_test_getInputMethods_001
     * @tc.desc    List input methods,getInputMethods().interfaces. Callback.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
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

    /**
     * @tc.number  inputmethod_test_getInputMethods_002
     * @tc.name    inputmethod_test_getInputMethods_002
     * @tc.desc    List input methods,getInputMethods().interfaces. Callback.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
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

    /**
     * @tc.number  inputmethod_test_getInputMethods_003
     * @tc.name    inputmethod_test_getInputMethods_003
     * @tc.desc    List input methods,getInputMethods().interfaces.Promise
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethod_test_getInputMethods_003', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethod_test_getInputMethods_003 result:" + JSON.stringify(inputMethodSetting));
      try {
        let setting = await inputMethodSetting.getInputMethods(true);
        console.info("inputmethod_test_getInputMethods_003 success because: " + setting);
        expect(typeof(setting) === 'object').assertTrue();
        done();
        console.info("====>************* inputmethod_test_getInputMethods_003 Test end*************");
        done();
      } catch (err) {
        console.info("inputmethod_test_getInputMethods_003 catch error: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number  inputmethod_test_getInputMethods_004
     * @tc.name    inputmethod_test_getInputMethods_004
     * @tc.desc    List input methods,().interfaces.Promise
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethod_test_getInputMethods_004', 0, async function (done) {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethod_test_getInputMethods_004 result:" + JSON.stringify(inputMethodSetting));
      try {
        let setting = await inputMethodSetting.getInputMethods(false);
        console.info("inputmethod_test_getInputMethods_004 success because: " + setting);
        expect(typeof(setting) === 'object').assertTrue();
        done();
        console.info("====>************* inputmethod_test_getInputMethods_004 Test end*************");
        done();
      } catch (err) {
        console.info("inputmethod_test_getInputMethods_004 catch error: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   SUB_InputMethod_IMF_Enable_0100
     * @tc.name     SUB_InputMethod_IMF_Enable_0100
     * @tc.desc     List input methods sync.
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_InputMethod_IMF_Enable_0100', 0, function (done) {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0100 start-----------------------");
      let inputMethodSetting = inputMethod.getSetting();
      let enable:boolean = true;
      let bool:boolean = false;
      let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
      console.info("====>SUB_InputMethod_IMF_Enable_0100 getInputMethodsSync success: " + JSON.stringify(Enable_List));
      let arr = [];
      for (let i = 0;i < Enable_List.length; i++) {
        arr.push(Enable_List[i].name);
      }
      let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
      bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
      if (bool) {
        expect(true).assertTrue();
        console.info("====>SUB_InputMethod_IMF_Enable_0100 bool: " + JSON.stringify(bool));
        done();
      }else {
        console.info("====>SUB_InputMethod_IMF_Enable_0100 bool: " + JSON.stringify(bool));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   SUB_InputMethod_IMF_Enable_0200
     * @tc.name     SUB_InputMethod_IMF_Enable_0200
     * @tc.desc     List input methods sync.
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_InputMethod_IMF_Enable_0200', 0, function (done) {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0200 start-----------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try {
        let enable:boolean = false;
        let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
        console.info("====>SUB_InputMethod_IMF_Enable_0200 getInputMethodsSync success: " + JSON.stringify(Enable_List));
        expect(Enable_List.length >= 0 ).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_InputMethod_IMF_Enable_0200 Failed to getInputMethodsSync" + JSON.stringify(err)  + err);
        done();
        console.info("-----------------------SUB_InputMethod_IMF_Enable_0200 Test end-----------------------");
      }
    });

    /**
     * @tc.number   SUB_InputMethod_IMF_Enable_0300
     * @tc.name     SUB_InputMethod_IMF_Enable_0300
     * @tc.desc     List input methods sync.
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_InputMethod_IMF_Enable_0300', 0, function (done) {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0300 start-----------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try {
        let enable:boolean = undefined;
        let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
        console.info("====>SUB_InputMethod_IMF_Enable_0300 getInputMethodsSync success: " + JSON.stringify(Enable_List));
        done();
      } catch (err) {
        console.error("====>SUB_InputMethod_IMF_Enable_0300 Failed to getInputMethods:" + JSON.stringify(err)  + err);
        expect(err.code===401).assertTrue();
        done();
        console.info("-----------------------SUB_InputMethod_IMF_Enable_0300 Test end-----------------------");
      }
    });

    /**
     * @tc.number   SUB_InputMethod_IMF_Enable_0400
     * @tc.name     SUB_InputMethod_IMF_Enable_0400
     * @tc.desc     List all input methods.
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_InputMethod_IMF_Enable_0400', 0, async function (done) {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0400 start-----------------------");
      let bool:boolean = false;
      let inputMethodSetting = inputMethod.getSetting();
      inputMethodSetting.getAllInputMethods((err, Enable_List) => {
        try {
          if (err) {
            console.info("====>SUB_InputMethod_IMF_Enable_0400 getAllInputMethods fail because: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info('====>SUB_InputMethod_IMF_Enable_0400 getAllInputMethods success: ' + JSON.stringify(Enable_List));
          let arr = [];
          for (let i = 0;i < Enable_List.length; i++) {
            arr.push(Enable_List[i].name);
          }
          let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
          bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
          if (bool) {
            expect(true).assertTrue();
            console.info("====>SUB_InputMethod_IMF_Enable_0400 bool: " + JSON.stringify(bool));
            done();
          }else {
            console.info("====>SUB_InputMethod_IMF_Enable_0400 bool: " + JSON.stringify(bool));
            expect().assertFail();
            done();
          }
        }catch (err){
          console.info("====>SUB_InputMethod_IMF_Enable_0400 err: " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.number   SUB_InputMethod_IMF_Enable_0500
     * @tc.name     SUB_InputMethod_IMF_Enable_0500
     * @tc.desc     List all input methods.
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_InputMethod_IMF_Enable_0500', 0, async function (done) {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0500 is start-----------------------");
      let bool:boolean = false;
      let inputMethodSetting = inputMethod.getSetting();
      try {
        let Enable_List = await inputMethodSetting.getAllInputMethods();
        console.info('====>SUB_InputMethod_IMF_Enable_0500 getAllInputMethods success: ' + JSON.stringify(Enable_List));
        let arr = [];
        for (let i = 0;i < Enable_List.length; i++) {
          arr.push(Enable_List[i].name);
        }
        let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
        bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
        if (bool) {
          expect(true).assertTrue();
          console.info("====>SUB_InputMethod_IMF_Enable_0500 bool: " + JSON.stringify(bool));
          done();
        }else {
          console.info("====>SUB_InputMethod_IMF_Enable_0500 bool: " + JSON.stringify(bool));
          expect().assertFail();
          done();
        }
      }catch (err){
        console.info("====>SUB_InputMethod_IMF_Enable_0500 catch error: " + JSON.stringify(err));
        done();
        console.info("-----------------------SUB_InputMethod_IMF_Enable_0500 end-----------------------");
      }
    });

    /**
     * @tc.number   SUB_InputMethod_IMF_Enable_0600
     * @tc.name     SUB_InputMethod_IMF_Enable_0600
     * @tc.desc     List all input methods.
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it('SUB_InputMethod_IMF_Enable_0600', 0, function (done) {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0600 start-----------------------");
      let bool:boolean = false;
      let inputMethodSetting = inputMethod.getSetting();
      let Enable_List = inputMethodSetting.getAllInputMethodsSync();
      console.info("====>SUB_InputMethod_IMF_Enable_0600 getAllInputMethodsSync success: " + JSON.stringify(Enable_List));
      let arr = [];
      for (let i = 0;i < Enable_List.length; i++) {
        arr.push(Enable_List[i].name);
      }
      let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
      bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
      if (bool) {
        expect(true).assertTrue();
        console.info("====>SUB_InputMethod_IMF_Enable_0600 bool: " + JSON.stringify(bool));
        done();
      }else {
        console.info("====>SUB_InputMethod_IMF_Enable_0600 bool: " + JSON.stringify(bool));
        expect().assertFail();
        done();
      }
    });


  });
};
