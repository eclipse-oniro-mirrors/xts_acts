/*
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

import { describe, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, Callback } from '@ohos.base';

const ERR_NOT_DEBUG_APP: string = 'Cannot debug applications using a release certificate.';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1700
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Execute aa appdebug -h command in developer mode to get help information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1700', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -h';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1700] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1700] data.exitCodeA: ' + d.exitCode);
        let result = JSON.stringify(d.stdResult).split('\\n');
        expect(result[0].split('"')[1]).assertEqual('usage: aa appdebug <options>');
        expect(result[1]).assertEqual('options list:');
        expect(result[2]).assertEqual('  -h, --help                                  list available commands');
        expect(result[3])
          .assertEqual('  -b, --bundlename <bundle-name>              let application set wait debug mode by bundle name with options');
        expect(result[4]).assertEqual('                  [-p, --persist]             option: persist flag');
        expect(result[5]).assertEqual('  -c, --cancel                                let application cancel wait ' +
          'debug');
        expect(result[6]).assertEqual('  -g, --get                                   get wait debug mode ' +
          'application bundle name and persist flag');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
         * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1800
         * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
         * @tc.desc: Execute aa appdebug -help command in developer mode to get help information.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1800', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -help';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1800] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1800] data.exitCodeA: ' + d.exitCode);
        let result = JSON.stringify(d.stdResult).split('\\n');
        expect(result[0].split('"')[1]).assertEqual('usage: aa appdebug <options>');
        expect(result[1]).assertEqual('options list:');
        expect(result[2]).assertEqual('  -h, --help                                  list available commands');
        expect(result[3])
          .assertEqual('  -b, --bundlename <bundle-name>              let application set wait debug mode by bundle name with options');
        expect(result[4]).assertEqual('                  [-p, --persist]             option: persist flag');
        expect(result[5]).assertEqual('  -c, --cancel                                let application cancel ' +
          'wait debug');
        expect(result[6]).assertEqual('  -g, --get                                   get wait debug mode ' +
          'application bundle name and persist flag');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2000
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Execute aa appdebug -p command in developer mode to get help information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2000', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -p';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2000] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2000] data.exitCodeA: ' + d.exitCode);
        let result = JSON.stringify(d.stdResult).split('\\n');
        expect(result[0].split('"')[1]).assertEqual('usage: aa appdebug <options>');
        expect(result[1]).assertEqual('options list:');
        expect(result[2]).assertEqual('  -h, --help                                  list available commands');
        expect(result[3])
          .assertEqual('  -b, --bundlename <bundle-name>              let application set wait debug mode by bundle name with options');
        expect(result[4]).assertEqual('                  [-p, --persist]             option: persist flag');
        expect(result[5]).assertEqual('  -c, --cancel                                let application cancel ' +
          'wait debug');
        expect(result[6]).assertEqual('  -g, --get                                   get wait debug mode ' +
          'application bundle name and persist flag');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2200
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Execute aa appdebug --h command in developer mode to get help information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2200', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug --h';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2200] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2200] data.exitCodeA: ' + d.exitCode);
        let result = JSON.stringify(d.stdResult).split('\\n');
        expect(result[0].split('"')[1]).assertEqual('usage: aa appdebug <options>');
        expect(result[1]).assertEqual('options list:');
        expect(result[2]).assertEqual('  -h, --help                                  list available commands');
        expect(result[3])
          .assertEqual('  -b, --bundlename <bundle-name>              let application set wait debug mode by bundle name with options');
        expect(result[4]).assertEqual('                  [-p, --persist]             option: persist flag');
        expect(result[5]).assertEqual('  -c, --cancel                                let application cancel ' +
          'wait debug');
        expect(result[6]).assertEqual('  -g, --get                                   get wait debug mode ' +
          'application bundle name and persist flag');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2300
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Execute aa appdebug --help command in developer mode to get help information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2300', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug --help';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2300] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2300] data.exitCodeA: ' + d.exitCode);
        let result = JSON.stringify(d.stdResult).split('\\n');
        expect(result[0].split('"')[1]).assertEqual('usage: aa appdebug <options>');
        expect(result[1]).assertEqual('options list:');
        expect(result[2]).assertEqual('  -h, --help                                  list available commands');
        expect(result[3])
          .assertEqual('  -b, --bundlename <bundle-name>              let application set wait debug mode by bundle name with options');
        expect(result[4]).assertEqual('                  [-p, --persist]             option: persist flag');
        expect(result[5]).assertEqual('  -c, --cancel                                let application cancel ' +
          'wait debug');
        expect(result[6]).assertEqual('  -g, --get                                   get wait debug mode ' +
          'application bundle name and persist flag');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2500
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode and
     * can't obtain setting information with error param.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2500', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b com.acts.bundleNameA -i';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2500] data.stdResultA: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_2500] data.exitCodeA: ' + d.exitCode);
        expect(JSON.stringify(d.stdResult)).assertContain('fail: unknown option.\\n');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2900
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Input incorrect bundle name, aa command cannot retrieve app
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2900', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b 123';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2901] data.stdResult1: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2901] data.exitCode1: ' + d.exitCode);
        expect(d.stdResult).assertContain(ERR_NOT_DEBUG_APP);
        done();
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2901] err1: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3000
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Input incorrect bundle name, aa command cannot retrieve app
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3000', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b abc';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_3001] data.stdResult1: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_3001] data.exitCode1: ' + d.exitCode);
        expect(d.stdResult).assertContain(ERR_NOT_DEBUG_APP);
        done();
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_3001] err1: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3600
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Input release bundle name, aa command cannot retrieve app
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3600', Level.LEVEL0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b com.example.aaappdebug';
      await abilityDelegator.executeShellCommand(cmd).then((d: AbilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_3601] data.stdResult1: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_3601] data.exitCode1: ' + d.exitCode);
        expect(d.stdResult).assertContain(ERR_NOT_DEBUG_APP);
        done();
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_3601] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
  })
}
