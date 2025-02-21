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

async function cancelSuspendDelay() {
  hilog.info(0x0000, 'debuggabletest', '%{public}s', 'cancelSuspendDelay delayId ' + globalThis.delayId);
  backgroundTaskManager.cancelSuspendDelay(globalThis.delayId);
}

function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(null);
    }, time)
  });
}

export default function actsDebuggableAaStartTest() {
  describe('ActsDebuggableAaStartTest', function () {
    beforeAll(async function () {
    })

    beforeEach(async function () {
      await abilityDelegator.executeShellCommand('aa force-stop com.example.timeout').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest force-stop data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest force-stop err is: ' + JSON.stringify(err));
      });
      await sleep(1000);
      await abilityDelegator.executeShellCommand('hilog -r').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest hilog -r data is: ' + JSON.stringify(data));
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'beforeEach ActsDebuggableAaStartTest hilog -r err is: ' + JSON.stringify(err));
      });
      await sleep(2000);
    })
    afterEach(function () {
    })
    afterAll(async function () {
      await cancelSuspendDelay();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0300
     * @tc.name    aa start -b com.example.timeout -a EntryAbility
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0300',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility').then(data => {
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_0300 err is: ' + JSON.stringify(err));
      })
      expect(res).assertContain('start ability successfully.');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_0400
     * @tc.name    aa start -b com.example.timeout -a EntryAbility -S -p
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_0400',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -b com.example.timeout -a EntryAbility -S -p')
        .then(data => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0400 data is: ' + JSON.stringify(data));
          res = data.stdResult;
        }).catch(err => {
          hilog.info(0x0000, 'debuggabletest', '%{public}s',
            'SUB_AA_AMS_Debuggable_0400 err is: ' + JSON.stringify(err));
        });
      expect(res).assertContain('error: option requires a value.');
      expect(res).assertContain('usage: aa start <options>');
      done();
    })

    /*
     * @tc.number  SUB_AA_AMS_Debuggable_2600
     * @tc.name    aa start -h
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_AMS_Debuggable_2600',1, async function (done) {
      let res = undefined;
      await abilityDelegator.executeShellCommand('aa start -h').then(data => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2600 aa process data is: ' + data.stdResult);
        res = data.stdResult;
      }).catch(err => {
        hilog.info(0x0000, 'debuggabletest', '%{public}s',
          'SUB_AA_AMS_Debuggable_2600 aa process err is: ' + JSON.stringify(err));
      });
      expect(res).assertContain('usage: aa start <options>');
      expect(res).assertContain('[-p <perf-cmd>]');
      expect(res).assertContain('[-S]');
      done();
    })
  })
}