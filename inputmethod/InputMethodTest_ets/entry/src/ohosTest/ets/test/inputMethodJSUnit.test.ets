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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import inputMethod from '@ohos.inputMethod';
import { BusinessError } from '@ohos.base';

export default function inputMethodJSUnit() {
  describe('appInfoTest_input_2', () => {
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
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          try {
            let data = await inputMethod.getController().attach(false, ATTRIBUTE);
            console.info(`====> execution success, data: ${JSON.stringify(data)}`);
          } catch (error) {
            console.info(`====> catch error, error: [${error.code}, ${error.message}]`);
          }
          clearTimeout(t);
          done();
        }, 3000)
      });
    })

    /**
     * @tc.name   inputmethoh_test_001
     * @tc.number inputmethoh_test_001
     * @tc.desc   listInputMethod().interfaces.Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethoh_test_001', Level.LEVEL2, async (done: Function) => {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_001 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.listInputMethod((err, arr) => {
        console.info("====>appInfoTest_input_2 listInputMethod result---" + JSON.stringify(arr));
        console.info(`====> inputmethoh_test_001 success data: ${JSON.stringify(arr)}`);
        expect(arr.length > 0).assertTrue();
        done();
      });
    });

    /**
     * @tc.name   inputmethoh_test_002
     * @tc.number inputmethoh_test_002
     * @tc.desc   listInputMethod().interfaces.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethoh_test_002', Level.LEVEL2, async (done: Function) => {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_002 result:" + JSON.stringify(inputMethodSetting));
      inputMethodSetting.listInputMethod().then(inputMethodProperty => {
        console.info(`====> inputMethod_test_listCurrentInputMethodSubtype_002 success data: ${JSON.stringify(inputMethodProperty)}`);
        expect(inputMethodProperty.length > 0).assertTrue();
        let obj = inputMethodProperty[0]
        console.info("====>inputmethoh_test_002 listInputMethod obj---" + JSON.stringify(obj));
        expect(obj.packageName != null).assertTrue();
        expect(obj.methodId != null).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.info("====>inputmethoh_test_002 listInputMethod is err: " + JSON.stringify(err));
        done();
      });
    });

    /**
     * @tc.name   inputmethoh_test_003
     * @tc.number inputmethoh_test_003
     * @tc.desc   displayOptionalInputMethod().interfaces.Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethoh_test_003', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   inputmethoh_test_004
     * @tc.number inputmethoh_test_004
     * @tc.desc   displayOptionalInputMethod().interfaces.Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethoh_test_004', Level.LEVEL2, async (done: Function) => {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethoh_test_004 result:" + JSON.stringify(inputMethodSetting));
      setTimeout(() => {
        inputMethodSetting.displayOptionalInputMethod().then(() => {
          console.info("====>inputmethoh_test_004 displayOptionalInputMethod is called");
          expect(true).assertTrue()
          done();
        }).catch((err: BusinessError) => {
          console.info("====>inputmethoh_test_004 displayOptionalInputMethod is err: " + JSON.stringify(err));
          expect().assertFail()
          done();
        });
      }, 500)
    });

    /**
     * @tc.name   inputmethoh_test_005
     * @tc.number inputmethoh_test_005
     * @tc.desc   Stop input().interfaces.Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethoh_test_005', Level.LEVEL2, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      await inputMethod.getController().detach();
      console.info("====>inputmethoh_test_005 detach success");
      console.info("====>inputmethoh_test_005 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInput((err, res) => {
        try {
          if (err) {
            console.error(`====>Failed to stopInput: ${JSON.stringify(err)}`);
            expect(err.code === 1).assertTrue();
            done();
          } else {
            console.info("====>inputmethoh_test_005 stopInput result----" + res);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>inputmethoh_test_005 stopInput throw err" + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   inputmethoh_test_006
     * @tc.number inputmethoh_test_006
     * @tc.desc   Stop input().interfaces.Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethoh_test_006', Level.LEVEL2, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      await inputMethod.getController().detach();
      console.info("====>inputmethoh_test_006 detach success");
      console.info("====>inputmethoh_test_006 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInput().then(() => {
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        console.info("====>inputmethoh_test_006 stopInput is err: " + JSON.stringify(err));
        expect(inputMethodCtrl !== null).assertTrue();
        done();
      });
    });


    /**
     * @tc.name   inputmethod_test_MAX_TYPE_NUM_001
     * @tc.number inputmethod_test_MAX_TYPE_NUM_001
     * @tc.desc   Keyboard max number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethod_test_MAX_TYPE_NUM_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputmethod_test_MAX_TYPE_NUM_001 Test start*************");
      let inputMethodSetting = inputMethod.MAX_TYPE_NUM;
      console.info("====>inputmethod_test_001 result:" + inputMethodSetting);
      expect(inputMethodSetting !== null).assertTrue();
      console.info("====>************* inputmethod_test_MAX_TYPE_NUM_001 Test end*************");
      done();
    });

    /**
     * @tc.name   inputmethod_test_getCurrentInputMethod_001
     * @tc.number inputmethod_test_getCurrentInputMethod_001
     * @tc.desc   Get current input method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('inputmethod_test_getCurrentInputMethod_001', Level.LEVEL1, async (done: Function) => {
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
     * @tc.name   inputmethod_test_getInputMethods_001
     * @tc.number inputmethod_test_getInputMethods_001
     * @tc.desc   List input methods,getInputMethods().interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethod_test_getInputMethods_001', Level.LEVEL2, async (done: Function) => {
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
          console.info(`====> inputmethod_test_getInputMethods_001 success data: ${JSON.stringify(arr)}`);
          expect(arr.length > 0).assertTrue();
          console.info("====>************* inputmethod_test_getInputMethods_001 Test end*************");
          done();
        } catch (err) {
          console.error("inputmethod_test_getInputMethods_001 catch error: " + err);
          done();
        }
      });
    });

    /**
     * @tc.name   inputmethod_test_getInputMethods_002
     * @tc.number inputmethod_test_getInputMethods_002
     * @tc.desc   List input methods,getInputMethods().interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethod_test_getInputMethods_002', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   inputmethod_test_getInputMethods_003
     * @tc.number inputmethod_test_getInputMethods_003
     * @tc.desc   List input methods,getInputMethods().interfaces.Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethod_test_getInputMethods_003', Level.LEVEL2, async (done: Function) => {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethod_test_getInputMethods_003 result:" + JSON.stringify(inputMethodSetting));
      try {
        let setting = await inputMethodSetting.getInputMethods(true);
        console.info("inputmethod_test_getInputMethods_003 success because: " + setting);
        expect(typeof (setting) === 'object').assertTrue();
        console.info(`====> inputmethod_test_getInputMethods_003 success data: ${JSON.stringify(setting)}`);
        expect(setting.length > 0).assertTrue();
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
     * @tc.name   inputmethod_test_getInputMethods_004
     * @tc.number inputmethod_test_getInputMethods_004
     * @tc.desc   List input methods,().interfaces.Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethod_test_getInputMethods_004', Level.LEVEL2, async (done: Function) => {
      let inputMethodSetting = inputMethod.getInputMethodSetting();
      console.info("====>inputmethod_test_getInputMethods_004 result:" + JSON.stringify(inputMethodSetting));
      try {
        let setting = await inputMethodSetting.getInputMethods(false);
        console.info("inputmethod_test_getInputMethods_004 success because: " + setting);
        expect(typeof (setting) === 'object').assertTrue();
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
     * @tc.name   SUB_InputMethod_IMF_Enable_0100
     * @tc.number SUB_InputMethod_IMF_Enable_0100
     * @tc.desc   List input methods sync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_IMF_Enable_0100', Level.LEVEL1, (done: Function) => {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0100 start-----------------------");
      let inputMethodSetting = inputMethod.getSetting();
      let enable: boolean = true;
      let bool: boolean = false;
      let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
      console.info(`====> SUB_InputMethod_IMF_Enable_0100 success data: ${JSON.stringify(Enable_List)}`);
      expect(Enable_List.length > 0).assertTrue();
      console.info("====>SUB_InputMethod_IMF_Enable_0100 getInputMethodsSync success: " + JSON.stringify(Enable_List));
      let arr = Array<string>();
      for (let i = 0; i < Enable_List.length; i++) {
        arr.push(Enable_List[i].name);
      }
      let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
      bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
      if (bool) {
        expect(true).assertTrue();
        console.info("====>SUB_InputMethod_IMF_Enable_0100 bool: " + JSON.stringify(bool));
        done();
      } else {
        console.info("====>SUB_InputMethod_IMF_Enable_0100 bool: " + JSON.stringify(bool));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_Enable_0200
     * @tc.number SUB_InputMethod_IMF_Enable_0200
     * @tc.desc   List input methods sync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_Enable_0200', Level.LEVEL2, (done: Function) => {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0200 start-----------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try {
        let enable: boolean = false;
        let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
        console.info("====>SUB_InputMethod_IMF_Enable_0200 getInputMethodsSync success: " + JSON.stringify(Enable_List));
        expect(Enable_List.length >= 0).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_InputMethod_IMF_Enable_0200 Failed to getInputMethodsSync" + JSON.stringify(err) + err);
        done();
        console.info("-----------------------SUB_InputMethod_IMF_Enable_0200 Test end-----------------------");
      }
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_Enable_0300
     * @tc.number SUB_InputMethod_IMF_Enable_0300
     * @tc.desc   List input methods sync.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_Enable_0300', Level.LEVEL2, (done: Function) => {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0300 start-----------------------");
      let inputMethodSetting = inputMethod.getSetting();
      try {
        let enable: boolean | undefined = undefined;
        let Enable_List = inputMethodSetting.getInputMethodsSync(enable);
        console.info("====>SUB_InputMethod_IMF_Enable_0300 getInputMethodsSync success: " + JSON.stringify(Enable_List));
        done();
      } catch (err) {
        console.error("====>SUB_InputMethod_IMF_Enable_0300 Failed to getInputMethods:" + JSON.stringify(err) + err);
        expect(err.code === 401).assertTrue();
        done();
        console.info("-----------------------SUB_InputMethod_IMF_Enable_0300 Test end-----------------------");
      }
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_Enable_0400
     * @tc.number SUB_InputMethod_IMF_Enable_0400
     * @tc.desc   List all input methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_Enable_0400', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0400 start-----------------------");
      let bool: boolean = false;
      let inputMethodSetting = inputMethod.getSetting();
      inputMethodSetting.getAllInputMethods((err, Enable_List) => {
        try {
          if (err) {
            console.info("====>SUB_InputMethod_IMF_Enable_0400 getAllInputMethods fail because: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info(`====> SUB_InputMethod_IMF_Enable_0400 success data: ${JSON.stringify(Enable_List)}`);
          expect(Enable_List.length > 0).assertTrue();
          console.info('====>SUB_InputMethod_IMF_Enable_0400 getAllInputMethods success: ' + JSON.stringify(Enable_List));
          let arr = Array<string>();
          for (let i = 0; i < Enable_List.length; i++) {
            arr.push(Enable_List[i].name);
          }
          let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
          bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
          if (bool) {
            expect(true).assertTrue();
            console.info("====>SUB_InputMethod_IMF_Enable_0400 bool: " + JSON.stringify(bool));
            done();
          } else {
            console.info("====>SUB_InputMethod_IMF_Enable_0400 bool: " + JSON.stringify(bool));
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.info("====>SUB_InputMethod_IMF_Enable_0400 err: " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_Enable_0500
     * @tc.number SUB_InputMethod_IMF_Enable_0500
     * @tc.desc   List all input methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_Enable_0500', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0500 is start-----------------------");
      let bool: boolean = false;
      let inputMethodSetting = inputMethod.getSetting();
      try {
        let Enable_List = await inputMethodSetting.getAllInputMethods();
        console.info(`====> SUB_InputMethod_IMF_Enable_0500 success data: ${JSON.stringify(Enable_List)}`);
        expect(Enable_List.length > 0).assertTrue();
        console.info('====>SUB_InputMethod_IMF_Enable_0500 getAllInputMethods success: ' + JSON.stringify(Enable_List));
        let arr = Array<string>();
        for (let i = 0; i < Enable_List.length; i++) {
          arr.push(Enable_List[i].name);
        }
        let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
        bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
        if (bool) {
          expect(true).assertTrue();
          console.info("====>SUB_InputMethod_IMF_Enable_0500 bool: " + JSON.stringify(bool));
          done();
        } else {
          console.info("====>SUB_InputMethod_IMF_Enable_0500 bool: " + JSON.stringify(bool));
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.info("====>SUB_InputMethod_IMF_Enable_0500 catch error: " + JSON.stringify(err));
        done();
        console.info("-----------------------SUB_InputMethod_IMF_Enable_0500 end-----------------------");
      }
    });

    /**
     * @tc.name   SUB_InputMethod_IMF_Enable_0600
     * @tc.number SUB_InputMethod_IMF_Enable_0600
     * @tc.desc   List all input methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_InputMethod_IMF_Enable_0600', Level.LEVEL2, (done: Function) => {
      console.info("-----------------------SUB_InputMethod_IMF_Enable_0600 start-----------------------");
      let bool: boolean = false;
      let inputMethodSetting = inputMethod.getSetting();
      let Enable_List = inputMethodSetting.getAllInputMethodsSync();
      console.info(`====> SUB_InputMethod_IMF_Enable_0600 success data: ${JSON.stringify(Enable_List)}`);
      expect(Enable_List.length > 0).assertTrue();
      console.info("====>SUB_InputMethod_IMF_Enable_0600 getAllInputMethodsSync success: " + JSON.stringify(Enable_List));
      let arr = Array<string>();
      for (let i = 0; i < Enable_List.length; i++) {
        arr.push(Enable_List[i].name);
      }
      let arr1 = ["com.example.kikakeyboard", "com.huawei.hmos.inputmethod"];
      bool = arr.includes(arr1[0]) || arr.includes(arr1[1]);
      if (bool) {
        expect(true).assertTrue();
        console.info("====>SUB_InputMethod_IMF_Enable_0600 bool: " + JSON.stringify(bool));
        done();
      } else {
        console.info("====>SUB_InputMethod_IMF_Enable_0600 bool: " + JSON.stringify(bool));
        expect().assertFail();
        done();
      }
    });

  });
};
