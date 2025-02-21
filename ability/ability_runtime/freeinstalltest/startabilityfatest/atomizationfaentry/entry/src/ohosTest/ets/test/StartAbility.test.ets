// @ts-nocheck

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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import Utils from './Utils';
import featureAbility from "@ohos.ability.featureAbility";
import wantConstant from '@ohos.ability.wantConstant';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

export default function StartAbilityTest() {
  var TAG = "";

  describe('StartAbilityTest', function () {
    var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    beforeAll(async function (done) {
      console.info("StartAbilityTest before all called");
      var cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      delegator.executeShellCommand(cmd, (err: any, d: any) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await Utils.sleep(500);
      var cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      delegator.executeShellCommand(cmd1, (err: any, d: any) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await Utils.sleep(500);
      var cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      delegator.executeShellCommand(cmd2, (err: any, d: any) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await Utils.sleep(500);
      var cmd3 = "cp data/test/AtomizationFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
        "entry/files";
      delegator.executeShellCommand(cmd3, (err: any, d: any) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async function (done) {
      console.info("StartAbilityTest after each called");
      if ("FreeInstall_FA_StartAbility_2800" === TAG || "FreeInstall_FA_StartAbility_3900") {
        var cmd5 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
        delegator.executeShellCommand(cmd5, (err: any, d: any) => {
          console.info("executeShellCommand5: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await Utils.sleep(500);
      if ("FreeInstall_FA_StartAbility_3900" === TAG) {
        var cmd4 = "bm uninstall -n com.ohos.hag.famanager";
        delegator.executeShellCommand(cmd4, (err: any, d: any) => {
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
    it("FreeInstall_FA_StartAbility_2600", 0, async function (done) {
      console.log("------------start FreeInstall_FA_StartAbility_2600-------------");
      TAG = "FreeInstall_FA_StartAbility_2600";
      setTimeout(async () => {
        let details;
        var str = {
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
        }).catch((error) => {
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
    it("FreeInstall_FA_StartAbility_2700", 0, async function (done) {
      console.log("------------start FreeInstall_FA_StartAbility_2700-------------");
      TAG = "FreeInstall_FA_StartAbility_2700";
      var cmd6 = "bm install -p data/test/AtomizationFaEntry.hap";
      delegator.executeShellCommand(cmd6, (err: any, d: any) => {
        console.info("executeShellCommand6: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        let details;
        var str = {
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
        }).catch((error) => {
          console.info(TAG + ' StartAbility2700 failed. error: ' + JSON.stringify(error));
        })
        expect(details).assertEqual(0);
      }, 2000)
      done();
    });
  })
}