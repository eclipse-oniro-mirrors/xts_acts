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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import display from '@ohos.display';

export default function inputMethodNormalJSUnit() {
  describe('inputMethodNormalJSUnit', function () {
    console.info("====>************* inputMethodNormalJSUnit settings Test start*************");

    beforeAll(async (done)=>{
      let display_info;
      let getFocusCmd = '';
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      display_info = display.getDefaultDisplaySync();
      getFocusCmd = `uinput -T -c ${display_info.width*0.5}  ${ Math.round(display_info.height*0.4) }`;
      console.debug('====>runCmd info:' + getFocusCmd);
      await abilityDelegator.executeShellCommand(getFocusCmd);
      done();
    })

    /*
     * @tc.number  inputmethodNomal_test_switchInputMethod_001
     * @tc.name    Test Indicates the input method which will replace the current one.
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethodNomal_test_switchInputMethod_001', 0, async function (done) {
      console.info("====>************* inputmethodNomal_test_switchInputMethod_001 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethodNomal_test_switchInputMethod_001 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      try{
        console.info('====>inputmethodNomal_test_switchInputMethod_001 switchInputMethod permission fail')
        await inputMethod.switchInputMethod(inputMethodProperty);
        expect().assertFail();
        done();
      }catch(err){
        console.error('====>inputmethodNomal_test_switchInputMethod_001 switchInputMethod catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputmethodNomal_test_switchInputMethod_001 end");
      }
    });

    /*
     * @tc.number  inputmethodNomal_test_switchInputMethod_002
     * @tc.name    Test Indicates the input method which will replace the current one.
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethodNomal_test_switchInputMethod_002', 0, async function (done) {
      console.info("====>************* inputmethodNomal_test_switchInputMethod_002 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethodNomal_test_switchInputMethod_002 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
        try{
          if(err){
            console.info("====>inputmethodNomal_test_switchInputMethod_002 switchInputMethod permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          }else{
            console.info('====>inputmethodNomal_test_switchInputMethod_002 success: ' + data);
            expect().assertFail();
            done();
          }
        }catch(err){
          console.error("====>inputmethodNomal_test_switchInputMethod_002 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputmethodNomal_test_switchInputMethod_002 end");
        }
      });
    });

    /*
     * @tc.number  inputmethodNomal_test_showSoftKeyboard_001
     * @tc.name    Test Indicates the input method which will show softboard with calback.
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethodNomal_test_showSoftKeyboard_001', 0, async function (done) {
      console.info("====>*************inputmethodNomal_test_showSoftKeyboard_001 start******************");
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.showSoftKeyboard((err, data) => {
        try{
          if(err){
            console.info("====>inputmethodNomal_test_showSoftKeyboard_001 showSoftKeyboard permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          }else{
            console.info('====>inputmethodNomal_test_showSoftKeyboard_001 success: ' + data);
            expect().assertFail();
            done();
          }
        }catch(err){
          console.error("====>inputmethodNomal_test_showSoftKeyboard_001 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputmethodNomal_test_showSoftKeyboard_001 end");
        }
      });
    });

    /*
     * @tc.number  inputmethodNomal_test_showSoftKeyboard_002
     * @tc.name    Test Indicates the input method which will show softboard with Promise.
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethodNomal_test_showSoftKeyboard_002', 0, async function (done) {
      console.info("====>*********inputmethodNomal_test_showSoftKeyboard_002 start************");
      let inputMethodCtrl = inputMethod.getInputMethodController();
      try{
        console.info('====>inputmethodNomal_test_showSoftKeyboard_002 showSoftKeyboard permission fail')
        await inputMethodCtrl.showSoftKeyboard();
        expect().assertFail();
        done();
      }catch(err){
        console.error('====>inputmethodNomal_test_showSoftKeyboard_002 showSoftKeyboard catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputmethodNomal_test_showSoftKeyboard_002 end");
      }
    });

    /*
     * @tc.number  inputmethodNomal_test_hideSoftKeyboard_001
     * @tc.name    Test Indicates the input method which will hide softboard with calback.
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethodNomal_test_hideSoftKeyboard_001', 0, async function (done) {
      console.info("====>*********inputmethodNomal_test_hideSoftKeyboard_001 start************");
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.hideSoftKeyboard((err, data) => {
        try{
          if(err){
            console.info("====>inputmethodNomal_test_hideSoftKeyboard_001 hideSoftKeyboard permission fail: " + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done();
          }else{
            console.info('====>inputmethodNomal_test_hideSoftKeyboard_001 success: ' + data);
            expect().assertFail();
            done();
          }
        }catch(err){
          console.error("====>inputmethodNomal_test_hideSoftKeyboard_001 catch err: " + JSON.stringify(err));
          done();
          console.info("====>inputmethodNomal_test_hideSoftKeyboard_001 end");
        }
      });
    });

    /*
     * @tc.number  inputmethodNomal_test_hideSoftKeyboard_002
     * @tc.name    Test Indicates the input method which will hide softboard with Promise.
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('inputmethodNomal_test_hideSoftKeyboard_002', 0, async function (done) {
      console.info("====>*********inputmethodNomal_test_hideSoftKeyboard_002 start************");
      let inputMethodCtrl = inputMethod.getInputMethodController()
      try{
        console.info('====>inputmethodNomal_test_hideSoftKeyboard_002 hideSoftKeyboard permission fail')
        await inputMethodCtrl.hideSoftKeyboard();
        expect().assertFail();
        done();
      }catch(err){
        console.error('====>inputmethodNomal_test_hideSoftKeyboard_002 hideSoftKeyboard catch err' + JSON.stringify(err))
        expect(err.code).assertEqual(201);
        expect(err.message).assertContain("the permissions check fails");
        done();
        console.info("====>inputmethodNomal_test_hideSoftKeyboard_002 end");
      }
    });

  });
};
