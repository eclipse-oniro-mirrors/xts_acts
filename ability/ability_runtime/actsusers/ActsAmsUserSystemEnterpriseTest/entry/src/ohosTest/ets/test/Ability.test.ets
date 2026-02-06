/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import appManager from '@ohos.application.appManager'
import backgroundTaskManager from '@ohos.backgroundTaskManager';

console.debug("====>in Ability.test====>");

export default function abilityTest() {
  console.debug("====>in function abilityTest====>");
  describe('ActsInterfaceMultiUsersTest', () => {

    let id: number = 0;
    beforeAll(async (done: Function) => {
      console.log("ACTS_InterfaceMultiUsers beforeAll called");
      let myReason = 'test FaShowOnLockTest';
      let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
        console.log("ACTS_InterfaceMultiUsers Request suspension delay will time out.");
      })
      id = delayInfo.requestId;
      console.log("ACTS_InterfaceMultiUsers requestId is : " + id);
      setTimeout(() => {
        console.log("ACTS_InterfaceMultiUsers beforeAll end");
        done();
      }, 1000);
    })

    afterAll(async (done: Function) => {
      console.log("ACTS_InterfaceMultiUsers afterAll called");
      backgroundTaskManager.cancelSuspendDelay(id);
      setTimeout(() => {
        console.log("ACTS_InterfaceMultiUsers afterAll end");
        done();
      }, 1000);
    })

    afterEach(async (done: Function) => {
      console.error("ACTS_InterfaceMultiUsers afterEach called");
      setTimeout(() => {
        done();
      }, 500);
    })

    console.debug("====>in ACTS_InterfaceMultiUsers====>");

     /*
     * @tc.number  : ACTS_ThirdPartyKillProcess_0100
     * @tc.name    : ACTS_ThirdPartyKillProcess_0100
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(promise)
     */
     it('ACTS_ThirdPartyKillProcess_0100', Level.LEVEL0, async (done: Function) => {
      let TAG = 'ACTS_ThirdPartyKillProcess_0100'
      console.debug(TAG + "====>start startAbility====>");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.killprocessthirdhap',
          abilityName: 'com.acts.killprocessthirdhap.MainAbility'
        }).then(() => {
        console.debug(TAG + "====>startAbility end====>");
      })
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info(TAG + '====>ACTS_KillProcess_0100 getProcessRunningInfos=====>' + JSON.stringify(data))
          let i: number = 0
          for (i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap') {
              console.info(TAG + '====>has com.acts.killprocessthirdhap=====>')
              break
            }
          }
          console.log(TAG + '====>i is:====>' + JSON.stringify(i))
          if (i == data.length && data[i].processName != 'com.acts.killprocessthirdhap') {
            expect().assertFail()
          }
        })
      }, 1000)
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info(TAG + '====>ACTS_KillProcess_0100 getProcessRunningInfos2=====>' + JSON.stringify(data))
          let i: number = 0
          for (i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap') {
              break
            }
          }
          console.log(TAG + '====>i2 is:====>' + JSON.stringify(i))
          if (i == data.length && data[i].processName != 'com.acts.killprocessthirdhap') {
            expect().assertFail()
          }
          done()
        })
      }, 15000)
    })

    /*
     * @tc.number  : ACTS_ThirdPartyKillProcess_0200
     * @tc.name    : ACTS_ThirdPartyKillProcess_0200
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(callback)
     */
    it('ACTS_ThirdPartyKillProcess_0200', Level.LEVEL0, async (done: Function) => {
      let TAG = 'ACTS_ThirdPartyKillProcess_0200'
      console.debug(TAG + "====>start startAbility====>");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.killprocessthirdhap2',
          abilityName: 'com.acts.killprocessthirdhap2.MainAbility'
        }).then(() => {
        console.debug(TAG + "====>startAbility end====>");
      })
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info(TAG + '====>ACTS_KillProcess_0200 getProcessRunningInfos=====>' + JSON.stringify(data))
          let i: number = 0
          for (i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap2') {
              console.info('====>has com.acts.killprocessthirdhap2=====>')
              break
            }
          }
          console.log(TAG + '====>i is:====>' + JSON.stringify(i))
          if (i == data.length && data[i].processName != 'com.acts.killprocessthirdhap2') {
            expect().assertFail()
          }
        })
      }, 1000)
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info(TAG + '====>ACTS_KillProcess_0200 getProcessRunningInfos2=====>' + JSON.stringify(data))
          let i: number = 0
          for (i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap2') {
              break
            }
          }
          console.log(TAG + '====>i2 is:====>' + JSON.stringify(i))
          if (i == data.length && data[i].processName != 'com.acts.killprocessthirdhap') {
            expect().assertFail()
          }
          done()
        })
      }, 15000)
    })
  })
}