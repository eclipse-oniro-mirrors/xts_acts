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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import wantConstant from '@ohos.ability.wantConstant'
import ability from '@ohos.ability.ability';
import base from '@ohos.base';
import Want from '@ohos.app.ability.Want';

function sleep(time:number):Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

export default function StartAbilityForResult() {
  let TAG = "";

  describe('StartAbilityForResult', ()=> {
    beforeAll(async (done:Function) => {
      console.info("StartAbilityForResult before all called");
      let cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : "+cmd)
      globalThis.delegator.executeShellCommand(cmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      let cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      globalThis.delegator.executeShellCommand(cmd1, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      let cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd2, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      let cmd3 ="cp data/test/AtomizationResultStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd3, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async (done:Function) => {
      console.info("StartAbilityForResult after each called");
      if ("FreeInstall_Stage_StartAbilityForResult_2500") {
        let cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
        globalThis.delegator.executeShellCommand(cmd4, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(500);
      }
      let cmd5 = "bm uninstall -n com.ohos.hag.famanager";
      globalThis.delegator.executeShellCommand(cmd5, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_2500
     * @tc.name: startAbilityForResult: don't add targetBundleList, app already installed, start hap successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_2500", Level.LEVEL0, async (done:Function) => {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_2500-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_2500";
      let cmd6 = "bm install -p data/test/AtomizationResultStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd6, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand6: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let details:ability.AbilityResult;
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      await globalThis.abilityContext.startAbilityForResult(str)
        .then((data:ability.AbilityResult) => {
          details = data;
          console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
        }).catch((error:base.BusinessError) => {
          console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
        })
      await sleep(2000);
      console.log(TAG + " resultCode: " + details!.resultCode);
      expect(details!.resultCode).assertEqual(1);
      done();
    });
  })
}