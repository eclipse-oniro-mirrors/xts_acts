// @ts-nocheck
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

import { describe, beforeAll, afterEach, it, expect } from "@ohos/hypium"
import wantConstant from '@ohos.ability.wantConstant'

export default function StartAbilityForResult(abilityContext) {
  var TAG = "";

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  describe('StartAbilityForResult', function () {
    beforeAll(async function (done) {
      console.info("StartAbilityForResult before all called");
      var cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      globalThis.delegator.executeShellCommand(cmd, (err: any, d: any) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      globalThis.delegator.executeShellCommand(cmd1, (err: any, d: any) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd2, (err: any, d: any) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd3 = "cp data/test/AtomizationResultStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd3, (err: any, d: any) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async function (done) {
      console.info("StartAbilityForResult after each called");
      if ("FreeInstall_Stage_StartAbilityForResult_0100" === TAG ||
        "FreeInstall_Stage_StartAbilityForResult_0500" === TAG ||
        "FreeInstall_Stage_StartAbilityForResult_2800" === TAG) {
        var cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
        globalThis.delegator.executeShellCommand(cmd4, (err: any, d: any) => {
          console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(500);
      }
      if ("FreeInstall_Stage_StartAbilityForResult_0700" === TAG) {
        var cmd5 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultStageHm2.hap";
        globalThis.delegator.executeShellCommand(cmd5, (err: any, d: any) => {
          console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(500);
        var cmd6 = "cp data/test/AtomizationResultStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
          "entry/files";
        globalThis.delegator.executeShellCommand(cmd6, (err: any, d: any) => {
          console.info("executeShellCommand6 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(500);
      }
      if ("FreeInstall_Stage_StartAbilityForResult_2600" === TAG) {
        var cmd14 = "bm uninstall -n com.ohos.hag.famanager";
        globalThis.delegator.executeShellCommand(cmd14, (err: any, d: any) => {
          console.info("executeShellCommand14 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await sleep(500);
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_0100
     * @tc.name: startAbilityForResult: Input empty deviceId,free install and start hap successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_0100", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_0100-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_0100";
      setTimeout(async () => {
        let details;
        var str = {
          "deviceId": "",
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_0400
     * @tc.name: startAbilityForResult: No deviceId,free install and start hap successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_0400", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_0400-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_0400";
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        var options = {
          "windowMode": 0, "displayId": 2
        }
        await globalThis.abilityContext.startAbilityForResult(str, options)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_0500
     * @tc.name: startAbilityForResult: app already installed, start hap successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_0500", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_0500-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_0500";
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_0700
     * @tc.name: startAbilityForResult: Free install and start feature hap successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_0700", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_0700-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_0700";
      var cmd7 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd7, (err: any, d: any) => {
        console.info("executeShellCommand7: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd8 = "cp data/test/AtomizationResultStageHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd8, (err: any, d: any) => {
        console.info("executeShellCommand8: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.hm2.MainAbility",
          "moduleName": "hnm2",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        await sleep(2000);
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_0800
     * @tc.name: startAbilityForResult: Call by AsyncCallback,free install and start hap successfully.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_0800", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_0800-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_0800";
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        var options = {
          "windowMode": 0, "displayId": 2
        }
        await globalThis.abilityContext.startAbilityForResult(str, options, (err, data) => {
          console.log(TAG + ": StartAbilityForResultCallBack success, err: " + JSON.stringify(err) +
            ",data: " + JSON.stringify(data));
          details = data;
        })
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
    * @tc.number: FreeInstall_Stage_StartAbilityForResult_1200
    * @tc.name: startAbilityForResult: Yuanzihua already installed,input wrong flags,start hap successfully.
    * @tc.desc: Function test
    * @tc.level   0
    */
    it("FreeInstall_Stage_StartAbilityForResult_1200", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_1200-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_1200";
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          'flags': '11'
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
    * @tc.number: FreeInstall_Stage_StartAbilityForResult_1400
    * @tc.name: startAbilityForResult: Yuanzihua already installed,input wrong flags,add options,start hap successfully.
    * @tc.desc: Function test
    * @tc.level   0
    */
    it("FreeInstall_Stage_StartAbilityForResult_1400", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_1400-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_1400";
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          'flags': '11'
        }
        var options = {
          "windowMode": 0, "displayId": 2
        }
        await globalThis.abilityContext.startAbilityForResult(str, options)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        await sleep(2000);
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
    * @tc.number: FreeInstall_Stage_StartAbilityForResult_1600
    * @tc.name: startAbilityForResult: Yuanzihua already installed,input empty flags,start hap successfully.
    * @tc.desc: Function test
    * @tc.level   0
    */
    it("FreeInstall_Stage_StartAbilityForResult_1600", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_1600-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_1600";
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          'flags': ''
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
    * @tc.number: FreeInstall_Stage_StartAbilityForResult_1800
    * @tc.name: startAbilityForResult: Yuanzihua already installed,input empty flags,add options,start hap successfully.
    * @tc.desc: Function test
    * @tc.level   0
    */
    it("FreeInstall_Stage_StartAbilityForResult_1800", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_1800-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_1800";
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          'flags': ''
        }
        var options = {
          "windowMode": 0, "displayId": 2
        }
        await globalThis.abilityContext.startAbilityForResult(str, options)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_2700
     * @tc.name: startAbilityForResult: Input different moduleName(feature hap),install feature hap.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_2700", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_2700-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_2700";
      var cmd9 = "bm install -p data/test/AtomizationResultStageHnm2.hap";
      globalThis.delegator.executeShellCommand(cmd9, (err: any, d: any) => {
        console.info("executeShellCommand9: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        let details;
        var str = {
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "hnm2",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        await sleep(2000);
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_2800
     * @tc.name: startAbilityForResult: Input parameters extended information.
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_2800", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_2800-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_2800";
      var cmd10 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
      globalThis.delegator.executeShellCommand(cmd10, (err: any, d: any) => {
        console.info("executeShellCommand10 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd11 = "cp data/test/AtomizationResultStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
        "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd11, (err: any, d: any) => {
        console.info("executeShellCommand11 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        let details;
        var str = {
          'deviceId': '',
          "bundleName": "com.example.qianyiyingyong.hmservice",
          "abilityName": "com.example.qianyiyingyong.MainAbility",
          "moduleName": "entry",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          'parameters': { "name": "1111", "Ext2": "ExtValue2", "site": "很开心看到你！" }
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        await sleep(2000);
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });

    /*
     * @tc.number: FreeInstall_Stage_StartAbilityForResult_2600
     * @tc.name: startAbilityForResult: Same application,start feature hap(not added in "targetBundleList")
     * @tc.desc: Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_StartAbilityForResult_2600", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_StartAbilityForResult_2600-------------");
      TAG = "FreeInstall_Stage_StartAbilityForResult_2600";
      var cmd12 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd12, (err: any, d: any) => {
        console.info("executeShellCommand12 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd13 = "cp data/test/StageResultMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
        "entry/files";
      globalThis.delegator.executeShellCommand(cmd13, (err: any, d: any) => {
        console.info("executeShellCommand13 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        let details;
        var str = {
          "deviceId": "",
          "bundleName": "com.example.startAbilityForResult.hmservice",
          "abilityName": "MainAbility1",
          "moduleName": "myapplication1",
          "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        }
        await globalThis.abilityContext.startAbilityForResult(str)
          .then((data) => {
            details = data;
            console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
          }).catch((error) => {
            console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
          })
        await sleep(2000);
        console.log(TAG + " resultCode: " + details.resultCode);
        expect(details.resultCode).assertEqual(1);
      }, 2000)
      done();
    });
  })
}