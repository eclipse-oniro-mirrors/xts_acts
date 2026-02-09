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

export default function inputMethodNormalStageJSUnit() {
  describe('inputMethodNormalStageJSUnit', () => {
    console.info("====>************* inputMethodNormalStageJSUnit settings Test start*************");
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
     * @tc.name   inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001
     * @tc.number inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 getCurrentInputMethod: " + JSON.stringify(inputM));
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
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty, (err, data) => {
        try {
          if (err) {
            console.info("====>inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.info('====>inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 success: ' + data);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error("====>inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 end");
        }
      });
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001 Test end*************");
    });

    /**
     * @tc.name   inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002
     * @tc.number inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002 getCurrentInputMethod: " + JSON.stringify(inputM));
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
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      try {
        console.info('====>inputMethodNormalStage_test_switchInputMethod_001 switchCurrentInputMethodAndSubtype permission fail');
        await inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty);
        expect().assertFail();
        done();
      } catch (err) {
        console.error('====>inputMethodNormalStage_test_switchInputMethod_001 switchCurrentInputMethodAndSubtype catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputMethodNormalStage_test_switchInputMethod_001 end");
      }
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002 Test end*************");
    });

    /**
     * @tc.name   inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001
     * @tc.number inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001 Test start*************");
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty, (err, data) => {
        try {
          if (err) {
            console.info("====>inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001 permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.info('====>inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001 success: ' + data);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error("====>inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001 end");
        }
      });
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001 Test end*************");
    });

    /**
     * @tc.name   inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002
     * @tc.number inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002 Test start*************");
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      try {
        console.info('====>inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002 switchCurrentInputMethodSubtype permission fail');
        await inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty);
        expect().assertFail();
        done();
      } catch (err) {
        console.error('====>inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002 switchCurrentInputMethodSubtype catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002 end");
      }
      console.info("====>************* inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002 Test end*************");
    });

  });
};
