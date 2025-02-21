/*
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
import { describe, it, expect } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import bundle from '@ohos.bundle'

let result;

export default function actsStServiceAbilityTest() {
  describe('ActsStServiceAbilityTest', function () {

    /**
     * @tc.number: ACTS_AExecuteShellCommand_0100
     * @tc.name: Execute a shell command without arguments (AsyncCallback).
     * @tc.desc: Verify that the interface executes the Shell command successfully.
     */
    it('ACTS_AExecuteShellCommand_Callback_0100', 0, async function (done) {
      console.log('ACTS_AExecuteShellCommand_Callback_0100 --- start');
      try {
        let cmd = 'echo test';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, (err, data) => {
          console.log(`ACTS_AExecuteShellCommand_Callback_0100 data: ${JSON.stringify(data)},
          err: ${JSON.stringify(err)}`);

          result = data.stdResult.replace(/[\r\n]/g, '');
          console.log(`ACTS_AExecuteShellCommand_Callback_0100 stdResult = ${data.stdResult}`);
          expect(result).assertEqual('test');

          console.log(`ACTS_AExecuteShellCommand_Callback_0100 exitCode = ${data.exitCode}`);
          expect(data.exitCode).assertEqual(0);

          console.log('ACTS_AExecuteShellCommand_Callback_0100 - executeShellCommand: end');

          done();
        })
      } catch (error) {
        console.log(`ACTS_AExecuteShellCommand_Callback_0100 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: ACTS_AExecuteShellCommand_Promise_0100
     * @tc.name: Execute a shell command without arguments (Promise).
     * @tc.desc: Verify that the interface executes the Shell command successfully.
     */
    it('ACTS_AExecuteShellCommand_Promise_0100', 0, async function (done) {
      console.log('ACTS_AExecuteShellCommand_Promise_0100 --- start');
      try {
        let cmd = 'echo test';
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd, 1).then((data) => {
          console.log(`ACTS_AExecuteShellCommand_Promise_0100 - executeShellCommand: start
          data: ${JSON.stringify(data)}`);

          result = data.stdResult.replace(/[\r\n]/g, '');
          console.log(`ACTS_AExecuteShellCommand_Promise_0100 stdResult = ${data.stdResult}`);
          expect(result).assertEqual('test');

          console.log(`ACTS_AExecuteShellCommand_Promise_0100 exitCode = ${data.exitCode}`);
          expect(data.exitCode).assertEqual(0);
          done();
        });
      } catch (error) {
        console.log(`ACTS_AExecuteShellCommand_Promise_0100 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
      * @tc.number: ACTS_AGetDisplayOrientation_0100
      * @tc.name: GetDisplayOrientation
      * @tc.desc: Check the return value of the interface (by AsyncCallback)
      */
    it('ACTS_AGetDisplayOrientation_0100', 0, async function (done) {
      console.log('ACTS_AGetDisplayOrientation_0100 --- start');
      try {
        let context = featureAbility.getContext();
        context.getDisplayOrientation(
          (err, DisplayOrientation) => {
            console.log(`ACTS_AGetDisplayOrientation_0100====DisplayOrientation>
            ${JSON.stringify(DisplayOrientation)}, err= ${err}`);
            expect(DisplayOrientation == bundle.DisplayOrientation.UNSPECIFIED
              || (DisplayOrientation != bundle.DisplayOrientation.LANDSCAPE
                || DisplayOrientation != bundle.DisplayOrientation.PORTRAIT
                || DisplayOrientation != bundle.DisplayOrientation.FOLLOW_RECENT
              )).assertTrue();
            done();
          });
      } catch (error) {
        console.log(`ACTS_AGetDisplayOrientation_0100 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: ACTS_AGetDisplayOrientation_0200
     * @tc.name: GetDisplayOrientation
     * @tc.desc: Check the return type of the interface (by promise)
     */
    it('ACTS_AGetDisplayOrientation_0200', 0, async function (done) {
      console.log('ACTS_AGetDisplayOrientation_0200 --- start');
      try {
        let context = featureAbility.getContext();
        await context.getDisplayOrientation().then((err, data) => {
          console.log(`ACTS_AGetDisplayOrientation_0200 data: ${JSON.stringify(data)}, err= ${err}`);
          expect(data == bundle.DisplayOrientation.UNSPECIFIED
            || (data != bundle.DisplayOrientation.LANDSCAPE
              || data != bundle.DisplayOrientation.PORTRAIT
              || data != bundle.DisplayOrientation.FOLLOW_RECENT
            )).assertTrue();
          done();
        });
      } catch (error) {
        console.log(`ACTS_AGetDisplayOrientation_0200 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.number: ACTS_ASetDisplayOrientation_0100
    * @tc.name: SetDisplayOrientation
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ASetDisplayOrientation_0100', 0, async function (done) {
      console.log('ACTS_ASetDisplayOrientation_0100 --- start');
      try {
        let context = featureAbility.getContext();
        context.setDisplayOrientation(bundle.DisplayOrientation.UNSPECIFIED,
          (err, data) => {
            console.log(`ACTS_ASetDisplayOrientation_0100 data: ${JSON.stringify(data)}, err= ${err}`);
            expect(data).assertUndefined();
            done();
          });
      } catch (error) {
        console.log(`ACTS_ASetDisplayOrientation_0100 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: ACTS_ASetDisplayOrientation_0200
     * @tc.name: SetDisplayOrientation
     * @tc.desc: Check the return type of the interface (by promise)
     */
    it('ACTS_ASetDisplayOrientation_0200', 0, async function (done) {
      console.log('ACTS_ASetDisplayOrientation_0200 --- start');
      try {
        let context = featureAbility.getContext();
        context.setDisplayOrientation(bundle.DisplayOrientation.UNSPECIFIED).then((err, data) => {
          console.log(`ACTS_ASetDisplayOrientation_0200 data: ${JSON.stringify(data)}, err= ${err}`);
          expect(data).assertUndefined();
          done();
        });
      } catch (error) {
        console.log(`ACTS_ASetDisplayOrientation_0200 : error= ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.number: ACTS_ASetShowOnLockScreen_0100
    * @tc.name: SetShowOnLockScreen
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ASetShowOnLockScreen_0100', 0, async function (done) {
      console.log('ACTS_ASetShowOnLockScreen_0100 --- start');
      try {
        let context = featureAbility.getContext();
        context.setShowOnLockScreen(true, (err, data) => {
          console.log(`ACTS_ASetShowOnLockScreen_0100 data: ${JSON.stringify(data)}, err= ${err}`);
          expect(data).assertEqual(null);
          done()
        });
      } catch (error) {
        console.log(`ACTS_ASetShowOnLockScreen_0100 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: ACTS_ASetShowOnLockScreen_0200
     * @tc.name: SetShowOnLockScreen
     * @tc.desc: Check the return type of the interface (by promise)
     */
    it('ACTS_ASetShowOnLockScreen_0200', 0, async function (done) {
      console.log('ACTS_ASetShowOnLockScreen_0200 --- start');
      try {
        let context = featureAbility.getContext();
        context.setShowOnLockScreen(true).then((err, data) => {
          console.log(`ACTS_ASetShowOnLockScreen_0200 data: ${JSON.stringify(data)}, err= ${err}`);
          expect(data).assertUndefined();
          done();
        });
      } catch (error) {
        console.log(`ACTS_ASetShowOnLockScreen_0200 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
    * @tc.number: ACTS_ASetWakeUpScreen_0100
    * @tc.name: SetWakeUpScreen
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ASetWakeUpScreen_0100', 0, async function (done) {
      console.log('ACTS_ASetWakeUpScreen_0100 --- start');
      try {
        let context = featureAbility.getContext();
        context.setWakeUpScreen(true, (err, data) => {
          console.log(`ACTS_ASetWakeUpScreen_0100 data: ${JSON.stringify(data)}, err= ${err}`);
          expect(data).assertEqual(null);
          done();
        });
      } catch (error) {
        console.log(`ACTS_ASetWakeUpScreen_0100 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number: ACTS_ASetWakeUpScreen_0200
     * @tc.name: SetWakeUpScreen
     * @tc.desc: Check the return type of the interface (by promise)
     */
    it('ACTS_ASetWakeUpScreen_0200', 0, async function (done) {
      console.log('ACTS_ASetWakeUpScreen_0200 --- start');
      try {
        let context = featureAbility.getContext();
        context.setWakeUpScreen(true).then((err, data) => {
          console.log(`ACTS_ASetWakeUpScreen_0200 data: ${JSON.stringify(data)}, err= ${err}`);
          expect(data).assertUndefined();
          done();
        });
      } catch (error) {
        console.log(`ACTS_ASetWakeUpScreen_0200 : error = ${error}`);
        expect().assertFail();
        done();
      }
    })

    /*
    * @tc.number    : ACTS_ATestRunner_0200
    * @tc.name      : start new ability
    * @tc.desc      : Starting mainability2 with startability succeeded.(callback)
    */
    it('ACTS_ATestRunner_0200', 0, async function (done) {
      console.log('ACTS_ATestRunner_0200====<begin');
      try {
        let abilityDelegatorArgs = abilityDelegatorRegistry.getArguments();
        console.log('ACTS_ATestRunner_0200====>getArguments is====>' + JSON.stringify(abilityDelegatorArgs));
        expect(abilityDelegatorArgs.bundleName).assertEqual('com.amsst.actsabilitydelegatorcasetest');
        expect(abilityDelegatorArgs.parameters['-b']).assertEqual('com.amsst.actsabilitydelegatorcasetest');
        expect(abilityDelegatorArgs.parameters['-p']).assertEqual('com.amsst.actsabilitydelegatorcasetest');
        expect(abilityDelegatorArgs.parameters['-s timeout']).assertEqual('7000');
        expect(abilityDelegatorArgs.parameters['-s unittest']).assertEqual('OpenHarmonyTestRunner');
        expect(abilityDelegatorArgs.parameters['-w']).assertEqual('300000');
        expect(abilityDelegatorArgs.parameters['moduleName']).assertEqual('');
        expect(abilityDelegatorArgs.testCaseNames).assertEqual('');
        expect(abilityDelegatorArgs.testRunnerClassName).assertEqual('OpenHarmonyTestRunner');
        console.log('ACTS_ATestRunner_0200====<end');
        done();
      } catch (error) {
        console.log('ACTS_ATestRunner_0200 : error = ' + error);
        expect().assertFail();
        done();
      }
    })
  })
}