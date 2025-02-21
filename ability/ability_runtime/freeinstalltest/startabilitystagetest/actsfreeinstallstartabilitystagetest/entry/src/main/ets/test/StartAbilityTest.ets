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

import { describe, beforeAll, afterEach, it, expect } from "@ohos/hypium"
import wantConstant from '@ohos.ability.wantConstant'
import commonEvent from '@ohos.commonEvent';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

const SYSTEM_INNER_ERROR = 16000050
const ERR_COMPONENT_NOF_FOUND = 16000001
const ERR_NOT_TOP = 16000053

export default function startAbilityTest(abilityContext) {

  describe('startAbilityTest', function () {

    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()

    console.info("-------------Stage model--> startAbilityXTS Test start----------------")

    var TAG = "";

    globalThis.delegator.getCurrentTopAbility((err : any, data : any) => {
      console.info("getCurrentTopAbility err: " + JSON.stringify(err) + ", data: " + JSON.stringify(data));
      globalThis.ability = data;
    });

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    var subscriber;
    var result;
    var subscribeInfo = {
      events: ["service_event"]
    };

    function SubscribeCallBack(err, data) {
      if (err.code) {
        console.error("Testevent subscribe failed " + JSON.stringify(err));
      } else {
        console.info("Testevent subscribe " + JSON.stringify(data));
        for (var key1 in data.parameters) {
          console.info("Testevent data.parameters[key] is :" + data.parameters[key1])
          if (data.parameters[key1] === "onSuccess") {
            result = "onSuccess"
          }
        }
      }
    }

    function CreateSubscriberCallBack(err, commonEventSubscriber) {
      if (err.code) {
        console.error("Testevent createSubscriber failed " + JSON.stringify(err));
      } else {
        console.info("Testevent createSubscriber");
        subscriber = commonEventSubscriber;
        commonEvent.subscribe(subscriber, SubscribeCallBack);
      }
    }


    beforeAll(async function (done) {
      console.info("StartAbilityTest before all called");
      var cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : "+cmd)
      globalThis.delegator.executeShellCommand(cmd, (err: any, d: any) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      var cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      globalThis.delegator.executeShellCommand(cmd1, (err: any, d: any) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      var cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd2, (err: any, d: any) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      var cmd3 ="cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd3, (err: any, d: any) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async function (done) {
      console.info("StartAbilityTest after each called");
      if ("FreeInstall_Stage_Local_StartAbility_0200" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_0500" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_0700" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_0800" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_1000" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_1200" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_1400" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_1600" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_1800" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_2200" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_2400" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_3000" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_3400" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_3500" === TAG ||
      "FreeInstall_Stage_Local_StartAbility_2000" === TAG) {
        var cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
        globalThis.delegator.executeShellCommand(cmd4, (err: any, d: any) => {
          console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(500);
      }

      if ("FreeInstall_Stage_Local_StartAbility_2000" === TAG) {
        var cmd5 = "bm uninstall -n com.ohos.hag.famanager";
        globalThis.delegator.executeShellCommand(cmd5, (err: any, d: any) => {
          console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await sleep(2000);
      done();
    });

    async function abilityForeground(tag) {
      globalThis.delegator.doAbilityForeground(globalThis.ability, (err: any) => {
        console.info(tag + "doAbilityForeground err: " + JSON.stringify(err));
      });
    }

    async function abilityBackground(tag) {
      globalThis.delegator.doAbilityBackground(globalThis.ability, (err: any) => {
        console.info(tag + "abilityBackground err: " + JSON.stringify(err));
      });
    }

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0100
     * @tc.name    The deviceid passed in is null, so the installation free process is implemented
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0100", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0100-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0100";
      var flag = 0;
      var str = {
        "deviceId":"",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0100-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0200
     * @tc.name    The passed in deviceid is empty, and the installed apps are automatically pulled up
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0200", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0200";
      var flag = 0;
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "deviceId":"",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0200-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0300
     * @tc.name    The deviceid passed in is empty. There is no need to install or installed HAP package
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0300", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0300-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0300";
      var cmd300 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd300, (err: any, d: any) => {
        console.info("executeShellCommand300 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "deviceId": "",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == SYSTEM_INNER_ERROR).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0300-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0400
     * @tc.name    Do not transfer deviceid to realize installation free process
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0400", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0400-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0400";
      var flag = 0;
      var cmd400 = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
      "entry/files";
      globalThis.delegator.executeShellCommand(cmd400, (err: any, d: any) => {
        console.info("executeShellCommand400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0400-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0500
     * @tc.name    The installed application will be automatically pulled up without transmitting the deviceid
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0500", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0500-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0500";
      var flag = 0;
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0500-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0600
     * @tc.name    Manually obtain and pass in the deviceid of the device to realize the installation free process
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0600", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0600-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0600";
      var flag = 0;
      var deviceId = "";
      abilityForeground(TAG);
      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err, data) => {
        console.log(TAG + 'getCurrentTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
      })
      await sleep(2000);
      var str = {
        "deviceId": deviceId,
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0600-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0700
     * @tc.name    Manually obtain and pass in the deviceid of the device,
                    and the installed application will be automatically pulled up
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0700", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0700-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0700";
      var flag = 0;
      var deviceId = "";
      abilityForeground(TAG);
      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err, data) => {
        console.log(TAG + 'getCurrentTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
      })
      await sleep(2000);
      var str = {
        "deviceId": deviceId,
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0700-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0800
     * @tc.name    Without passing deviceid, pull up the HAP with the same bundlename and different
                    abilityname as the entry to realize the installation free process
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0800", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0800-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0800";
      var flag = 0;
      var cmd800 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd800, (err: any, d: any) => {
        console.info("executeShellCommand800 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd801 = "cp data/test/AtomizationStageHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd801, (err: any, d: any) => {
        console.info("executeShellCommand801 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.hm2.MainAbility",
        "moduleName": "hnm2",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_0800-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1200
     * @tc.name    Bad flags=1717 passed in, atomized HAP package installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1200", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1200";
      var flag = 0;
      var cmd1200 = "bm install -p data/test/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd1200, (err: any, d: any) => {
        console.info("executeShellCommand1200 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": 1717,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1200-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1300
     * @tc.name    Flags= '94.31' of the incoming error. There is a hap package that
                    needs to be installed free under the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1300", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1300-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1300";
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": '94.31',
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == ERR_COMPONENT_NOF_FOUND).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1300-------------");
      done();
    });

    /*
 * @tc.number  FreeInstall_Stage_Local_StartAbility_1400
 * @tc.name    Flags= '94.31' of incoming error, atomized HAP package installed
 * @tc.desc    Function test
 * @tc.level   0
 */
    it("FreeInstall_Stage_Local_StartAbility_1400", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1400-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1400";
      var flag = 0;
      var cmd1400 = "bm install -p data/test/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd1400, (err: any, d: any) => {
        console.info("executeShellCommand1400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": '94.31',
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1400-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1500
     * @tc.name    Flags= '' of the incoming error. There is a hap package that needs to be
                    installed under the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1500", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1500-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1500";
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": '',
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == ERR_COMPONENT_NOF_FOUND).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1500-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1600
     * @tc.name    Bad flags= ', atomized HAP package installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1600", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1600-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1600";
      var flag = 0;
      var cmd1600 = "bm install -p data/test/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd1600, (err: any, d: any) => {
        console.info("executeShellCommand1600 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": '',
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1600-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1700
     * @tc.name    No flag is transmitted, and there are HAP packages that need to be installed under the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1700", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1700-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1700";
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == ERR_COMPONENT_NOF_FOUND).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1700-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1800
     * @tc.name    No flag is transmitted, and the atomized HAP package is installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1800", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1800-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1800";
      var flag = 0;
      var cmd1800 = "bm install -p data/test/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd1800, (err: any, d: any) => {
        console.info("executeShellCommand1800 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1800-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_2100
     * @tc.name    The parameters field is passed in the want to realize the installation free process
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_2100", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2100-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2100";
      var flag = 0;
      abilityForeground(TAG);
      await sleep(1000);

      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        "parameters": {
          "name": "1111",
          "Ext2": "ExtValue2",
          "site": "很开心看到你！"
        }
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_2100-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_2200
     * @tc.name    The parameters field is passed in the want, and the installed applications
                    are automatically pulled up
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_2200", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2200";
      var flag = 0;
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        "parameters": {
          "name": "1111",
          "Ext2": "ExtValue2",
          "site": "很开心看到你！"
        }
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_2200-------------");
      done();
    });

    /*
 * @tc.number  FreeInstall_Stage_Local_StartAbility_2300
 * @tc.name    Make the current service not in the foreground, and there are HAP
                packages that need not be installed under the specified path
 * @tc.desc    Function test
 * @tc.level   0
 */
    it("FreeInstall_Stage_Local_StartAbility_2300", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2300-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2300";
      abilityForeground(TAG);
      await sleep(1000);
      abilityBackground(TAG);
      await sleep(2000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == ERR_NOT_TOP).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_2300-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_2400
     * @tc.name    The current service is not in the foreground, and the atomized HAP package has been installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_2400", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2400-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2400";
      var cmd2400 = "bm install -p data/test/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd2400, (err: any, d: any) => {
        console.info("executeShellCommand2400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      abilityBackground(TAG);
      await sleep(2000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == ERR_NOT_TOP).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_2400-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_2500
     * @tc.name    FA Service Center installation free timeout
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_2500", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2500-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2500";
      var installFACmd = "bm install -p data/test/MockServiceTimeout.hap";
      globalThis.delegator.executeShellCommand(installFACmd, (err: any, d: any) => {
        console.info("executeShellCommand2500 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var mkdirEntryCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      globalThis.delegator.executeShellCommand(mkdirEntryCmd, (err: any, d: any) => {
        console.info("executeShellCommand2501 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var mkdirFilesCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(mkdirFilesCmd, (err: any, d: any) => {
        console.info("executeShellCommand2502 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var moveQianyiCmd = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(moveQianyiCmd, (err: any, d: any) => {
        console.info("executeShellCommand2503 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == SYSTEM_INNER_ERROR).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_2500-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_3000
     * @tc.name    There are hapa and hapb with the same bundlename and abilityname and different modulenames.
                    Under the specified path, there are hapa with correct input parameters that need not be installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_3000", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3000-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3000";
      var flag = 0;
      var installFACmd = "bm install -p data/test/MockService.hap";
      globalThis.delegator.executeShellCommand(installFACmd, (err: any, d: any) => {
        console.info("executeShellCommand3003 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var mkdirEntryCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      globalThis.delegator.executeShellCommand(mkdirEntryCmd, (err: any, d: any) => {
        console.info("executeShellCommand3004 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var mkdirFilesCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(mkdirFilesCmd, (err: any, d: any) => {
        console.info("executeShellCommand3005 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd3000 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd3000, (err: any, d: any) => {
        console.info("executeShellCommand3000 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd3001 = "cp data/test/AtomizationStageHm4.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd3001, (err: any, d: any) => {
        console.info("executeShellCommand3001 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.hm2.MainAbility",
        "moduleName": "hm4",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_3000-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_3100
     * @tc.name    There are hapa and hapb with the same bundlename and abilityname and different modulenames.
                    Hapb with input parameter error exists in the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_3100", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3100-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3100";
      var cmd3100 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageHm4.hap";
      globalThis.delegator.executeShellCommand(cmd3100, (err: any, d: any) => {
        console.info("executeShellCommand3100 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd3101 = "cp data/test/AtomizationStageHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
      "entry/files";
      globalThis.delegator.executeShellCommand(cmd3101, (err: any, d: any) => {
        console.info("executeShellCommand3101 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.hm2.MainAbility",
        "moduleName": "hm4",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == SYSTEM_INNER_ERROR).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_3100-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_3200
     * @tc.name    Wrong modulename passed in
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_3200", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3200";
      var cmd3200 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageHm2.hap";
      globalThis.delegator.executeShellCommand(cmd3200, (err: any, d: any) => {
        console.info("executeShellCommand3200 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd3201 = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
      "entry/files";
      globalThis.delegator.executeShellCommand(cmd3201, (err: any, d: any) => {
        console.info("executeShellCommand3201 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "hnm",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == SYSTEM_INNER_ERROR).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_3200-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_3300
     * @tc.name    Do not transfer modulename. There are HAP packages that need not be
                    installed under the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_3300", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3300-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3300";
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == SYSTEM_INNER_ERROR).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_3300-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_3400
     * @tc.name    Modulename is not passed. Atomized HAP package is installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_3400", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3400-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3400";
      var flag = 0;
      var cmd3400 = "bm install -p data/test/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd3400, (err: any, d: any) => {
        console.info("executeShellCommand3400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "deviceId": "",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_3400-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1900
     * @tc.name    The current service is not in the foreground. Page a jumps to page B first.
                    There are HAP packages that need not be installed under the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1900", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1900-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1900";
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.open.harmony.packagemag",
        "abilityName": "MainAbility1",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": Mainability2 startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": Mainability2 startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      abilityBackground(TAG);
      await sleep(1000);
      var str2 = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str2).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == ERR_NOT_TOP).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1900-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_2000
     * @tc.name    The current service is not in the foreground. Page a jumps to page B first.
                    The atomized HAP package has been installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_2000", 0, async function (done) {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2000-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2000";
      var cmd2000 = "bm install -p data/test/AtomizationStageEntry.hap";
      globalThis.delegator.executeShellCommand(cmd2000, (err: any, d: any) => {
        console.info("executeShellCommand2000 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      var str = {
        "bundleName": "com.open.harmony.packagemag",
        "abilityName": "MainAbility1",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data) => {
        console.log(TAG + ": Mainability2 startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": Mainability2 startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      abilityBackground(TAG);
      await sleep(1000);
      var str2 = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str2).then((data) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        expect(error.code == ERR_NOT_TOP).assertTrue();
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_2000-------------");
      done();
    });

    console.info("-------------Stage model--> startAbilityXTS Test end----------------")
  })
}