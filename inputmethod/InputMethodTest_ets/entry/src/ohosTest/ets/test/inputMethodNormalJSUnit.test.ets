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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import inputMethod from '@ohos.inputMethod';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';

export default function inputMethodNormalJSUnit() {
  describe('inputMethodNormalJSUnit', () => {
    console.info("====>************* inputMethodNormalJSUnit settings Test start*************");

    beforeAll(async (done: Function) => {
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
      let display_info = display.getDefaultDisplaySync();
      let getFocusCmd = '';
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      getFocusCmd = `uinput -T -c ${display_info.width * 0.5}  ${Math.round(display_info.height * 0.4)}`;
      console.debug('====>runCmd info:' + getFocusCmd);
      await abilityDelegator.executeShellCommand(getFocusCmd);
    })

    /**
     * @tc.name   inputmethodNomal_test_switchInputMethod_001
     * @tc.number inputmethodNomal_test_switchInputMethod_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethodNomal_test_switchInputMethod_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputmethodNomal_test_switchInputMethod_001 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethodNomal_test_switchInputMethod_001 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      try {
        console.info('====>inputmethodNomal_test_switchInputMethod_001 switchInputMethod permission fail')
        await inputMethod.switchInputMethod(inputMethodProperty);
        expect().assertFail();
        done();
      } catch (err) {
        console.error('====>inputmethodNomal_test_switchInputMethod_001 switchInputMethod catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputmethodNomal_test_switchInputMethod_001 end");
      }
    });

    /**
     * @tc.name   inputmethodNomal_test_switchInputMethod_002
     * @tc.number inputmethodNomal_test_switchInputMethod_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethodNomal_test_switchInputMethod_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputmethodNomal_test_switchInputMethod_002 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethodNomal_test_switchInputMethod_002 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
        try {
          if (err) {
            console.info("====>inputmethodNomal_test_switchInputMethod_002 switchInputMethod permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.info('====>inputmethodNomal_test_switchInputMethod_002 success: ' + data);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error("====>inputmethodNomal_test_switchInputMethod_002 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputmethodNomal_test_switchInputMethod_002 end");
        }
      });
    });

    /**
     * @tc.name   inputmethodNomal_test_showSoftKeyboard_001
     * @tc.number inputmethodNomal_test_showSoftKeyboard_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('inputmethodNomal_test_showSoftKeyboard_001', Level.LEVEL0, async (done: Function) => {
      console.info("====>*************inputmethodNomal_test_showSoftKeyboard_001 start******************");
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.showSoftKeyboard((err, data) => {
        try {
          if (err) {
            console.info("====>inputmethodNomal_test_showSoftKeyboard_001 showSoftKeyboard permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.info('====>inputmethodNomal_test_showSoftKeyboard_001 success: ' + data);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error("====>inputmethodNomal_test_showSoftKeyboard_001 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputmethodNomal_test_showSoftKeyboard_001 end");
        }
      });
    });

    /**
     * @tc.name   inputmethodNomal_test_showSoftKeyboard_002
     * @tc.number inputmethodNomal_test_showSoftKeyboard_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethodNomal_test_showSoftKeyboard_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>*********inputmethodNomal_test_showSoftKeyboard_002 start************");
      let inputMethodCtrl = inputMethod.getInputMethodController();
      try {
        console.info('====>inputmethodNomal_test_showSoftKeyboard_002 showSoftKeyboard permission fail')
        await inputMethodCtrl.showSoftKeyboard();
        expect().assertFail();
        done();
      } catch (err) {
        console.error('====>inputmethodNomal_test_showSoftKeyboard_002 showSoftKeyboard catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputmethodNomal_test_showSoftKeyboard_002 end");
      }
    });

    /**
     * @tc.name   inputmethodNomal_test_hideSoftKeyboard_001
     * @tc.number inputmethodNomal_test_hideSoftKeyboard_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethodNomal_test_hideSoftKeyboard_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>*********inputmethodNomal_test_hideSoftKeyboard_001 start************");
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.hideSoftKeyboard((err, data) => {
        try {
          if (err) {
            console.info("====>inputmethodNomal_test_hideSoftKeyboard_001 hideSoftKeyboard permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          } else {
            console.info('====>inputmethodNomal_test_hideSoftKeyboard_001 success: ' + data);
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error("====>inputmethodNomal_test_hideSoftKeyboard_001 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputmethodNomal_test_hideSoftKeyboard_001 end");
        }
      });
    });

    /**
     * @tc.name   inputmethodNomal_test_hideSoftKeyboard_002
     * @tc.number inputmethodNomal_test_hideSoftKeyboard_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('inputmethodNomal_test_hideSoftKeyboard_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>*********inputmethodNomal_test_hideSoftKeyboard_002 start************");
      let inputMethodCtrl = inputMethod.getInputMethodController()
      try {
        console.info('====>inputmethodNomal_test_hideSoftKeyboard_002 hideSoftKeyboard permission fail')
        await inputMethodCtrl.hideSoftKeyboard();
        expect().assertFail();
        done();
      } catch (err) {
        console.error('====>inputmethodNomal_test_hideSoftKeyboard_002 hideSoftKeyboard catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputmethodNomal_test_hideSoftKeyboard_002 end");
      }
    });

  });
};
