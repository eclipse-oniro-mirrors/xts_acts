/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';
let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTestStatic() {
  describe('ACTS_ExecuteShellCommandTest_Static', () => {
    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
    })
    
    /**
     * @tc.name   ACTS_ExecuteShellCommand_Callback_Static_0100
     * @tc.number ACTS_ExecuteShellCommand_Callback_Static_0100
     * @tc.desc   Execute a shell command without arguments (AsyncCallback).,Verify that the interface executes the Shell command successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Callback_Static_0100', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Callback_Static_0100 --- start")
      let cmd = 'aa help'
      let escresult = 'usage: aa <command> <options>'
      abilityDelegator.executeShellCommand(cmd, (err: BusinessError | null, data: AbilityDelegatorRegistry.ShellCmdResult | undefined) => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0100 - executeShellCommand: start '+ JSON.stringify(data))
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0100 stdResult = ' + data?.stdResult)
        let i = data?.stdResult.indexOf(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0100 query string i = ' + i);
        expect(data?.stdResult).assertContain(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0100 exitCode = ' + data?.exitCode)
        expect(data?.exitCode).assertEqual(0);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0100 - executeShellCommand: end')
        done()
      })
    })

    /**
     * @tc.name   ACTS_ExecuteShellCommand_Callback_Static_0300
     * @tc.number ACTS_ExecuteShellCommand_Callback_Static_0300
     * @tc.desc   Execute non-existing shell command (AsyncCallback).,Failed to execute shell command on authentication interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Callback_Static_0300', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Callback_Static_0300 --- start")
      let cmd = 'ppwd -L'
      abilityDelegator.executeShellCommand(cmd, 1,(err: BusinessError | null, data: AbilityDelegatorRegistry.ShellCmdResult | undefined) => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0300 - executeShellCommand: start ')
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0300 stdResult = ' + data?.stdResult)
        let i = data?.stdResult.length
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0300 query string i = ' + i);
        expect(string(i)).assertEqual('0');
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0300 exitCode = ' + data?.exitCode)
        expect(data?.exitCode == 0).assertEqual(false);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0300 - executeShellCommand: end')
        done();
      })
    })

    /**
     * @tc.name   ACTS_ExecuteShellCommand_Callback_Static_0400
     * @tc.number ACTS_ExecuteShellCommand_Callback_Static_0400
     * @tc.desc   Execute shell command timeout (AsyncCallback),The authentication interface executes the shell command timed out.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Callback_Static_0400', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Callback_Static_0400 --- start")
      let cmd = 'aa help'
      let escresult = 'usage: aa <command> <options>'
      abilityDelegator.executeShellCommand(cmd,0, (err: BusinessError | null, data: AbilityDelegatorRegistry.ShellCmdResult | undefined): void => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0400 - executeShellCommand: start ')
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0400 stdResult = ' + data?.stdResult)
        let i = data?.stdResult.indexOf(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0400 query string i = ' + i);
        expect(data?.stdResult).assertContain(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0100 exitCode = ' + data?.exitCode)
        expect(data?.exitCode).assertEqual(0);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0400 - executeShellCommand: end')
        done();
      })
    })

    /**
     * @tc.name   ACTS_ExecuteShellCommand_Callback_Static_0500
     * @tc.number ACTS_ExecuteShellCommand_Callback_Static_0500
     * @tc.desc   Invalid timeout parameter for executing shell command (AsyncCallback),The timeout parameter for executing shell commands on the authentication interface is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Callback_Static_0500', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Callback_Static_0500 --- start")
      let cmd = 'aa help'
      let escresult = 'usage: aa <command> <options>'
      abilityDelegator.executeShellCommand(cmd,-1, (err: BusinessError | null, data: AbilityDelegatorRegistry.ShellCmdResult | undefined): void => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0500 - executeShellCommand: start ')
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0500 stdResult = ' + data?.stdResult)
        let i = data?.stdResult.indexOf(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0500 query string i = ' + i);
        expect(data?.stdResult).assertContain(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0500 exitCode = ' + data?.exitCode)
        expect(data?.exitCode).assertEqual(0);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Callback_Static_0500 - executeShellCommand: end')
        done();
      })
    })

    /**
     * @tc.name   ACTS_ExecuteShellCommand_Promise_Static_0100
     * @tc.number ACTS_ExecuteShellCommand_Promise_Static_0100
     * @tc.desc   Execute a shell command without arguments (Promise).,Verify that the interface executes the Shell command successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Promise_Static_0100', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Promise_Static_0100 --- start")
      let cmd = 'aa help'
      let escresult = 'usage: aa <command> <options>'
      abilityDelegator.executeShellCommand(cmd, 1).then<void>((data:AbilityDelegatorRegistry.ShellCmdResult): void => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0100 - executeShellCommand: start ')
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0100 stdResult = ' + data.stdResult)
        let i:number = data.stdResult.indexOf(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0100 query string i = ' + i);
        expect(data.stdResult).assertContain(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0100 exitCode = ' + data.exitCode)
        expect(data.exitCode).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   ACTS_ExecuteShellCommand_Promise_Static_0300
     * @tc.number ACTS_ExecuteShellCommand_Promise_Static_0300
     * @tc.desc   Execute non-existing shell command (Promise).,Failed to execute shell command on authentication interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Promise_Static_0300', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Promise_Static_0300 --- start")
      let cmd = 'ppwd -L'
      abilityDelegator.executeShellCommand(cmd, 1).then<void>((data:AbilityDelegatorRegistry.ShellCmdResult): void => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0300 - executeShellCommand: start ')
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0300 stdResult = ' + data.stdResult)
        let i:number = data.stdResult.length
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0300 query string i = ' + i);
        expect(string(i)).assertEqual('0');
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0300 exitCode = ' + data.exitCode)
        expect(data.exitCode == 0).assertEqual(false);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0300 - executeShellCommand: end')
        done();
      })
    })

    /**
     * @tc.name   ACTS_ExecuteShellCommand_Promise_Static_0400
     * @tc.number ACTS_ExecuteShellCommand_Promise_Static_0400
     * @tc.desc   Execute shell command timeout (Promise),The authentication interface executes the shell command timed out.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Promise_Static_0400', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Promise_Static_0400 --- start")
      let cmd = 'aa help'
      let escresult = 'usage: aa <command> <options>'
      abilityDelegator.executeShellCommand(cmd, 0).then<void>((data:AbilityDelegatorRegistry.ShellCmdResult): void => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0400 - executeShellCommand: start ')
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0400 stdResult = ' + data.stdResult)
        let i:number = data.stdResult.indexOf(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0400 query string i = ' + i);
        expect(data.exitCode).assertEqual(0);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0400 - executeShellCommand: end')
        done();
      })
    })

    /**
     * @tc.name   ACTS_ExecuteShellCommand_Promise_Static_0500
     * @tc.number ACTS_ExecuteShellCommand_Promise_Static_0500
     * @tc.desc   Invalid timeout parameter for executing shell command (Promise),The timeout parameter for executing shell commands on the authentication interface is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_ExecuteShellCommand_Promise_Static_0500', Level.LEVEL0, async (done: ()=> void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "ACTS_ExecuteShellCommand_Promise_Static_0500 --- start")
      let cmd = 'aa help'
      let escresult = 'usage: aa <command> <options>'
      abilityDelegator.executeShellCommand(cmd, -1).then<void>((data:AbilityDelegatorRegistry.ShellCmdResult): void => {
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0500 - executeShellCommand: start ')
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0500 stdResult = ' + data.stdResult)
        let i:number = data.stdResult.indexOf(escresult);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0500 query string i = ' + i);
        expect(data.exitCode).assertEqual(0);
        hilog.info(domain, tag, '%{public}s', 'ACTS_ExecuteShellCommand_Promise_Static_0500 - executeShellCommand: end')
        done();
      })
    })
  })
}
