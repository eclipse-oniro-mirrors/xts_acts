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

import { describe, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1100
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa in developer mode supports temporarily setting DEBUG application waiting debugging mode and
     * can obtain setting information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1100', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b com.acts.bundleNameA';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1101] data.stdResult1: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1101] data.exitCode1: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1101] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1102] data.stdResult: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_1102] data.exitCode: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_1102] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_1102] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameA');
        expect(result[2].trim()).assertEqual('false');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1102] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1200
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode and
     * can obtain setting information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1200', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = ' aa appdebug -b com.acts.bundleNameA -p';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1201] data.stdResult: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1201] data.exitCode: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1201] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1202] data.stdResult: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_1202] data.exitCode: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_1202] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_1202] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameA');
        expect(result[2].trim()).assertEqual('true');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1202] err2: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1300
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the newly set data will overwrite the previous data (persistent setting data will overwrite the temporarily
     * set data).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1300', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA';
      let cmdB = 'aa appdebug -b com.acts.bundleNameB -p';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1301] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1301] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1301] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1302] data.stdResultB: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1302] data.exitCodeB: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1302] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1303] data.stdResultGet: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_1303] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_1303] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_1303] data.exitCode: ' + result1[0]);
        expect(result1[0].trim()).assertEqual('com.acts.bundleNameB');
        expect(result[2].trim()).assertEqual('true');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1303] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1400
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the newly set data will overwrite the previous data (persistent setting data will overwrite the temporarily
     * set data).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1400', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA -p';
      let cmdB = 'aa appdebug -b com.acts.bundleNameB';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1401] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1401] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1401] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1402] data.stdResultB: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1402] data.exitCodeB: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1402] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1403] data.stdResultGet: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_1403] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_1403] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_1403] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameB');
        expect(result[2].trim()).assertEqual('false');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1403] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1500
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the acquisition list is empty after cancellation (temporary setting).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1500', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA';
      let cmdC = 'aa appdebug -c';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1501] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1501] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdC).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1501] data.stdResultC: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1501] data.exitCodeC: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errC: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1502] data.stdResultGet: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1502] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_3202] data.exitCodeGet: ' + result[1]);
        expect(result[1]).assertEqual(undefined);
        done();
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1502] errGet: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1600
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the acquisition list is empty after cancellation (persistent setting).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1600', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA -p';
      let cmdC = 'aa appdebug -c';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1601] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1601] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdC).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1602] data.stdResultC: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1602] data.exitCodeC: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errC: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1603] data.stdResultGet: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_1603] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_1603] data.exitCodeGet: ' + result[1]);

        expect(result[1]).assertEqual(undefined);
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_1603] errGet: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1700
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Execute aa appdebug -h command in developer mode to get help information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1700', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -h';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
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
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1800', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -help';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
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
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1900
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Execute aa appdebug command in developer mode to get help information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_1900', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_1900] data.stdResultA: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_1900] data.exitCodeA: ' + d.exitCode);
        expect(JSON.stringify(d.stdResult)).assertContain('error: you must specify an option at least.\\n');
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
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2000', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -p';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
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
    * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2100
    * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
    * @tc.desc: Execute aa appdebug -b command in developer mode to get help information.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2100', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2100] data.stdResultA: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_2100] data.exitCodeA: ' + d.exitCode);
        expect(JSON.stringify(d.stdResult)).assertContain('option requires a valid value.\\n');
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
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2200', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug --h';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
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
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2300', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug --help';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
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
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2400
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode and
     * can obtain setting information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2400', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = ' aa appdebug -b com.acts.bundleNameA -p abc';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2401] data.stdResult: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2401] data.exitCode: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2401] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2402] data.stdResult: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_2402] data.exitCode: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_2402] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_2402] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameA');
        expect(result[2].trim()).assertEqual('true');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2402] err2: ' + JSON.stringify(err));
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
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2500', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b com.acts.bundleNameA -i';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
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
    * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2600
    * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
    * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
    * and the newly set data will overwrite the previous data (persistent setting data will overwrite the temporarily
    * set data).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2600', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA';
      let cmdB = 'aa appdebug -b com.acts.bundleNameB';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2601] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2601] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_0300] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2602] data.stdResultB: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2602] data.exitCodeB: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2602] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2603] data.stdResultGet: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_2603] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_2603] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_2603] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameB');
        expect(result[2].trim()).assertEqual('false');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2603] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2700
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the newly set data will overwrite the previous data (persistent setting data will overwrite the temporarily
     * set data).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2700', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -b com.acts.bundleNameA -p';
      let cmdB = 'aa appdebug -b com.acts.bundleNameB -p';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2701] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2701] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2701] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2702] data.stdResultB: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2702] data.exitCodeB: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2702] err: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2703] data.stdResultGet: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_2703] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_2703] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_2703] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameB');
        expect(result[2].trim()).assertEqual('true');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2703] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2800
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the acquisition list is empty after cancellation (persistent setting).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2800', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug --bundlename com.acts.bundleNameA --persist';
      let cmdB = 'aa appdebug --get';
      let cmdC = 'aa appdebug --cancel';
      let cmdD = 'aa appdebug --get';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2801] data.stdResultA: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2801] data.exitCodeA: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2802] data.stdResult2: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_2802] data.exitCode3: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_2802] data.exitCode4: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_2802] data.exitCode5: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('com.acts.bundleNameA');
        expect(result[2].trim()).assertEqual('true');
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2802] err2: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })

      await abilityDelegator.executeShellCommand(cmdC).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2803] data.stdResultC: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2803] data.exitCodeC: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errC: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })

      await abilityDelegator.executeShellCommand(cmdD).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2804] data.stdResultGet: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2804] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_2804] data.exitCodeGet: ' + result[1]);

        expect(result[1]).assertEqual(undefined);
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2804] errGet: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2900
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa in developer mode supports temporarily setting DEBUG application waiting debugging mode and
     * can obtain setting information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_2900', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b 123';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2901] data.stdResult1: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_2901] data.exitCode1: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2901] err1: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_2902] data.stdResult: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_2902] data.exitCode: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_2902] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_2902] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('123');
        expect(result[2].trim()).assertEqual('false');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_2902] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3000
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa in developer mode supports temporarily setting DEBUG application waiting debugging mode and
     * can obtain setting information.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3000', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -b abc';
      let cmd2 = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_3001] data.stdResult1: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_3001] data.exitCode1: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_3001] err1: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmd2).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_3002] data.stdResult: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_3002] data.exitCode: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_3002] data.exitCode: ' + result[1]);
        let result1 = result[1].split(',');
        console.info('====> [ACTS_aaAppDebug_3002] data.exitCode: ' + result1[0]);

        expect(result1[0].trim()).assertEqual('abc');
        expect(result[2].trim()).assertEqual('false');
        done();

      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_3002] err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3100
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the acquisition list is empty after cancellation (persistent setting).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3100', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd = 'aa appdebug -c';
      await abilityDelegator.executeShellCommand(cmd).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_3100] data.stdResultA: ' + JSON.stringify(d.stdResult));
        console.info('====> [ACTS_aaAppDebug_3100] data.exitCodeA: ' + d.exitCode);
        expect(JSON.stringify(d.stdResult).split('"')[1]).assertEqual('app debug successfully.\\n');
        done();
      }).catch((err: BusinessError) => {
        console.info('====> errA: ' + JSON.stringify(err));
        expect().assertFail();
      })
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3200
     * @tc.name: Aa supports setting DEBUG application waiting debugging mode.
     * @tc.desc: Aa supports persistent setting in developer mode. DEBUG application waits for debugging mode
     * and the acquisition list is empty after cancellation (persistent setting).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Ability_AbilityRuntime_aaSupportDebugWithWaiting_3200', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmdA = 'aa appdebug -c';
      let cmdB = 'aa appdebug -g';
      await abilityDelegator.executeShellCommand(cmdA).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_3201] data.stdResultC: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_3201] data.exitCodeC: ' + d.exitCode);
      }).catch((err: BusinessError) => {
        console.info('====> errC: ' + JSON.stringify(err));
      })

      await abilityDelegator.executeShellCommand(cmdB).then((d: abilityDelegatorRegistry.ShellCmdResult) => {
        console.info('====> [ACTS_aaAppDebug_3202] data.stdResultGet: ' + d.stdResult);
        console.info('====> [ACTS_aaAppDebug_3202] data.exitCodeGet: ' + d.exitCode);
        let result = d.stdResult.split(':');
        console.info('====> [ACTS_aaAppDebug_3202] data.exitCodeGet: ' + result[1]);
        expect(result[1]).assertEqual(undefined);
        done();
      }).catch((err: BusinessError) => {
        console.info('====> [ACTS_aaAppDebug_3202] errGet: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
  })
}
