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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils';
import featureAbility from "@ohos.ability.featureAbility";
import wantConstant from '@ohos.ability.wantConstant';
import ability from '@ohos.ability.ability';
import base from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

export default function StartAbilityTest() {
  let TAG = "";

  describe('StartAbilityTest', () => {
    let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    beforeAll(async (done: Function) => {
      console.info("StartAbilityTest before all called");
      let cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      delegator.executeShellCommand(cmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await Utils.sleep(500);
      let cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      delegator.executeShellCommand(cmd1, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await Utils.sleep(500);
      let cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      delegator.executeShellCommand(cmd2, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await Utils.sleep(500);
      let cmd3 = "cp data/test/AtomizationFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
        "entry/files";
      delegator.executeShellCommand(cmd3, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async (done: Function) => {
      console.info("StartAbilityTest after each called");
      if ("FreeInstall_FA_StartAbility_2800" === TAG || "FreeInstall_FA_StartAbility_3900") {
        let cmd5 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
        delegator.executeShellCommand(cmd5, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand5: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await Utils.sleep(500);
      if ("FreeInstall_FA_StartAbility_3900" === TAG) {
        let cmd4 = "bm uninstall -n com.ohos.hag.famanager";
        delegator.executeShellCommand(cmd4, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand4: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await Utils.sleep(500);
      done();
    });

    /*
     * @tc.number: FreeInstall_FA_StartAbility_2600
     * @tc.name: startAbility: NoTargetBundleList,free install successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_StartAbility_2600", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_StartAbility_2600-------------");
      TAG = "FreeInstall_FA_StartAbility_2600";
      setTimeout(async () => {
        let details: number = -1;
        let str: ability.StartAbilityParameter = {
          'want': {
            "deviceId": "",
            "bundleName": "com.example.qianyiyingyong.hmservice",
            "abilityName": "com.example.qianyiyingyong.MainAbility",
            "moduleName": "entry",
            "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          }
        }
        await featureAbility.startAbility(str).then((data) => {
          details = data;
          console.info(TAG + ' StartAbility successful. Data: ' + JSON.stringify(data))
        }).catch((error: base.BusinessError) => {
          console.info(TAG + ' StartAbility failed. error: ' + JSON.stringify(error));
        })
        expect(details).assertEqual(0);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_FA_StartAbility_2700
     * @tc.name: startAbility: NoTargetBundleList and yuanzihua already installed,startAbility successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_StartAbility_2700", Level.LEVEL0, async (done: Function) => {
      console.log("------------start FreeInstall_FA_StartAbility_2700-------------");
      TAG = "FreeInstall_FA_StartAbility_2700";
      let cmd6 = "bm install -p data/test/AtomizationFaEntry.hap";
      delegator.executeShellCommand(cmd6, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand6: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        let details = -1;
        let str: ability.StartAbilityParameter = {
          'want': {
            "deviceId": "",
            "bundleName": "com.example.qianyiyingyong.hmservice",
            "abilityName": "com.example.qianyiyingyong.MainAbility",
            "moduleName": "entry",
            "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          }
        }
        await featureAbility.startAbility(str).then((data) => {
          details = data;
          console.info(TAG + ' StartAbility2700 successful. Data: ' + JSON.stringify(data))
        }).catch((error: base.BusinessError) => {
          console.info(TAG + ' StartAbility2700 failed. error: ' + JSON.stringify(error));
        })
        expect(details).assertEqual(0);
      }, 2000)
      done();
    });
  })
}