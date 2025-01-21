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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import inputMethod from '@ohos.inputMethod';
import subtype from '@ohos.InputMethodSubtype';

export default function inputMethodNormalStageJSUnit() {
  describe('inputMethodNormalStageJSUnit', () => {
    console.info("====>************* inputMethodNormalStageJSUnit settings Test start*************");

    /*
     * @tc.number  inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_001', 0, async (done: Function) => {
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

    /*
     * @tc.number  inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodAndSubtype_002', 0, async (done: Function) => {
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

    /*
     * @tc.number  inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodSubtype_001', 0, async (done: Function) => {
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

    /*
     * @tc.number  inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethodNormalStage_test_switchCurrentInputMethodSubtype_002', 0, async (done: Function) => {
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
