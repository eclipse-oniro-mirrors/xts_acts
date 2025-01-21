/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

async function requestSuspendDelay() {
  hilog.info(0x0000, 'debuggabletest', '%{public}s', 'requestSuspendDelay start ');
  let myReason = 'test ActsDebuggableAaProcessTest';
  let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
    hilog.info(0x0000, 'debuggabletest', '%{public}s', 'requestSuspendDelay delay will timeout. ');
  });
  globalThis.delayId = delayInfo.requestId;
  hilog.info(0x0000, 'debuggabletest', '%{public}s', 'requestSuspendDelay delayId is ' + globalThis.delayId);
  hilog.info(0x0000, 'debuggabletest', '%{public}s',
    'requestSuspendDelay actualDelayTime is ' + delayInfo.actualDelayTime);
}

function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(null);
    }, time)
  });
}

export default function actsDebuggableAaProcessTest() {

  describe('ActsDebuggableAaProcessTest', function () {
    beforeAll(async function () {
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'beforeAll aa start  data is: ' + data.stdResult);
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s', 'beforeAll err is: ' + JSON.stringify(err));
      });
      await sleep(2000);
      await requestSuspendDelay();
    })

    beforeEach(async function () {
      await abilityDelegator.executeShellCommand('hilog -r').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaProcessTest hilog -r data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaProcessTest hilog -r err is: ' + JSON.stringify(err));
      });
      await sleep(2000);
    })

    afterEach(function () {
    })

    afterAll(async function () {
      await abilityDelegator.executeShellCommand('aa force-stop com.example.timeout').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'afterAll force-stop data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'afterAll force-stop err is: ' + JSON.stringify(err));
      });
      await sleep(1000);
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_1700
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -S -p
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_1700', 1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa process -b com.example.timeout -a EntryAbility -m entry -S -p')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_1700 aa process data is: ' + data.stdResult);
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_1700 aa process err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa process <options>');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2400
     * @tc.name    aa process -b com.example.timeout -a EntryAbility -m entry -S -D
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2400',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa process -b com.example.timeout -a EntryAbility -m entry -S -D')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2400 aa process data is: ' + data.stdResult);
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_2400 aa process err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa process <options>');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2500
     * @tc.name    aa process -h
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2500',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa process -h').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2500 aa process data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2500 aa process err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('usage: aa process <options>');
      expect(res).assertContain('-h, --help');
      expect(res).assertContain('list available commands');
      expect(res).assertContain('-a <ability-name> -b <bundle-name> [-m <module-name>]');
      expect(res).assertContain('-p <perf-cmd>');
      expect(res).assertContain('performance optimization command. Either -p or -D must be selected, -p takes precedence.');
      expect(res).assertContain('debug command. Either -p or -D must be selected, -p takes precedence.');
      expect(res).assertContain('-D <debug-cmd>');
      expect(res).assertContain('[-S]');
      expect(res).assertContain('debug ability with an element name');
      done();
    })
  })
}