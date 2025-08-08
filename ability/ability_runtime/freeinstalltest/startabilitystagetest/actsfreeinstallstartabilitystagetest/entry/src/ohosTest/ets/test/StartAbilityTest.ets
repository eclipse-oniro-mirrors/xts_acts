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

import { describe, beforeAll, afterEach, it, expect } from "@ohos/hypium";
import wantConstant from '@ohos.ability.wantConstant';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import base from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { UIAbility } from '@kit.AbilityKit';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
const SYSTEM_INNER_ERROR = 16000050
const ERR_COMPONENT_NOF_FOUND = 16000001
const ERR_NOT_TOP = 16000053
let ability:UIAbility | null = null;

export default function startAbilityTest() {

  describe('startAbilityTest', ()=> {
    console.info("-------------Stage model--> startAbilityXTS Test start----------------")
    let TAG = "";
    beforeAll(async (done:Function) => {
      console.info("StartAbilityTest before all called");
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.getCurrentTopAbility((err, data) => {
        console.info("beforeAll getCurrentTopAbility err: " + JSON.stringify(err) + ", data: " + JSON.stringify(data));
        console.info("beforeAll getCurrentTopAbility " + JSON.stringify(data?.context?.abilityInfo?.name));
        ability = data as UIAbility;
      });
      let cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : "+cmd)
      abilityDelegator.executeShellCommand(cmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      let cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(cmd1, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      let cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd2, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));})
      await sleep(500);
      let cmd3 ="cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd3, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err)," data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async (done:Function) => {
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
        let cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
        abilityDelegator.executeShellCommand(cmd4, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(500);
      }

      if ("FreeInstall_Stage_Local_StartAbility_2000" === TAG) {
        let cmd5 = "bm uninstall -n com.ohos.hag.famanager";
        abilityDelegator.executeShellCommand(cmd5, (err: base.BusinessError, d: ESObject) => {
          console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await sleep(2000);
      done();
    });



    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_0100
     * @tc.name    The deviceid passed in is null, so the installation free process is implemented
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_0100", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0100-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0100";
      let flag = 0;
      let str:Want = {
        "deviceId":"",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_0200", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0200";
      let flag = 0;
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "deviceId":"",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_0300", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0300-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0300";
      let cmd300 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd300, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand300 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "deviceId": "",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_0400", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0400-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0400";
      let flag = 0;
      let cmd400 = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
      "entry/files";
      abilityDelegator.executeShellCommand(cmd400, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_0500", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0500-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0500";
      let flag = 0;
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_0600", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0600-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0600";
      let flag = 0;
      let deviceId = "";
      abilityForeground(TAG);
      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err, data) => {
        console.log(TAG + 'getCurrentTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
      })
      await sleep(2000);
      let str:Want = {
        "deviceId": deviceId,
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_0700", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0700-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0700";
      let flag = 0;
      let deviceId = "";
      abilityForeground(TAG);
      await sleep(1000);
      abilityDelegator.getCurrentTopAbility((err, data) => {
        console.log(TAG + 'getCurrentTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
      })
      await sleep(2000);
      let str:Want = {
        "deviceId": deviceId,
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_0800", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_0800-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_0800";
      let flag = 0;
      let cmd800 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd800, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand800 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd801 = "cp data/test/AtomizationStageHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd801, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand801 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.hm2.MainAbility",
        "moduleName": "hnm2",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_1200", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1200";
      let flag = 0;
      let cmd1200 = "bm install -p data/test/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd1200, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1200 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": 1717,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
        console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      console.info("------------end FreeInstall_Stage_Local_StartAbility_1200-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_Stage_Local_StartAbility_1700
     * @tc.name    No flag is transmitted, and there are HAP packages that need to be installed under the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_Local_StartAbility_1700", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1700-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1700";
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_1800", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1800-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1800";
      let flag = 0;
      let cmd1800 = "bm install -p data/test/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd1800, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand1800 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_2100", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2100-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2100";
      let flag = 0;
      abilityForeground(TAG);
      await sleep(1000);

      let str:Want = {
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
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_2200", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2200";
      let flag = 0;
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
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
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_2300", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2300-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2300";
      abilityDelegator.getCurrentTopAbility((err : base.BusinessError, data : ESObject) => {
        console.info("FreeInstall_Stage_Local_StartAbility_2300 getCurrentTopAbility err: " + JSON.stringify(err) + ", data: " + JSON.stringify(data));
        globalThis.ability = data;
      });
      await sleep(1000);
      abilityForeground(TAG);
      await sleep(1000);
      abilityBackground(TAG);
      await sleep(2000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_2400", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2400-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2400";
      let cmd2400 = "bm install -p data/test/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd2400, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      abilityBackground(TAG);
      await sleep(2000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_2500", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2500-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2500";
      let installFACmd = "bm install -p data/test/MockServiceTimeout.hap";
      abilityDelegator.executeShellCommand(installFACmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2500 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let mkdirEntryCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(mkdirEntryCmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2501 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let mkdirFilesCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(mkdirFilesCmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2502 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let moveQianyiCmd = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      abilityDelegator.executeShellCommand(moveQianyiCmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2503 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_3000", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3000-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3000";
      let flag = 0;
      let installFACmd = "bm install -p data/test/MockService.hap";
      abilityDelegator.executeShellCommand(installFACmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3003 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let mkdirEntryCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(mkdirEntryCmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3004 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let mkdirFilesCmd = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(mkdirFilesCmd, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3005 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd3000 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd3000, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3000 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd3001 = "cp data/test/AtomizationStageHm4.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd3001, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3001 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.hm2.MainAbility",
        "moduleName": "hm4",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_3100", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3100-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3100";
      let cmd3100 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageHm4.hap";
      abilityDelegator.executeShellCommand(cmd3100, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3100 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd3101 = "cp data/test/AtomizationStageHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
      "entry/files";
      abilityDelegator.executeShellCommand(cmd3101, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3101 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.hm2.MainAbility",
        "moduleName": "hm4",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_3200", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3200-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3200";
      let cmd3200 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageHm2.hap";
      abilityDelegator.executeShellCommand(cmd3200, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3200 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd3201 = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
      "entry/files";
      abilityDelegator.executeShellCommand(cmd3201, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3201 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "hnm",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_3300", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3300-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3300";
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_3400", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_3400-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_3400";
      let flag = 0;
      let cmd3400 = "bm install -p data/test/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd3400, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand3400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "deviceId": "",
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        flag = 1;
        expect(flag == 1).assertTrue();
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_1900", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_1900-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_1900";
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.open.harmony.packagemag",
        "abilityName": "MainAbility1",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": Mainability2 startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
        console.log(TAG + ": Mainability2 startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      abilityBackground(TAG);
      await sleep(1000);
      let str2:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str2).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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
    it("FreeInstall_Stage_Local_StartAbility_2000", 0, async (done:Function) => {
      console.info("------------start FreeInstall_Stage_Local_StartAbility_2000-------------");
      TAG = "FreeInstall_Stage_Local_StartAbility_2000";
      let cmd2000 = "bm install -p data/test/AtomizationStageEntry.hap";
      abilityDelegator.executeShellCommand(cmd2000, (err: base.BusinessError, d: ESObject) => {
        console.info("executeShellCommand2000 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      abilityForeground(TAG);
      await sleep(1000);
      let str:Want = {
        "bundleName": "com.open.harmony.packagemag",
        "abilityName": "MainAbility1",
        "moduleName": "entry",
      }
      globalThis.abilityContext.startAbility(str).then((data:number) => {
        console.log(TAG + ": Mainability2 startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
        console.log(TAG + ": Mainability2 startAbility fail. err: " + JSON.stringify(error));
      });
      await sleep(2000);
      abilityBackground(TAG);
      await sleep(1000);
      let str2:Want = {
        "bundleName": "com.example.qianyiyingyong.hmservice",
        "abilityName": "com.example.qianyiyingyong.MainAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      globalThis.abilityContext.startAbility(str2).then((data:number) => {
        console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
      }).catch((error:base.BusinessError) => {
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

function sleep(time:number):Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

async function abilityForeground(tag:string) {
  console.info(tag + "doAbilityForeground err: " + JSON.stringify(ability?.context?.abilityInfo));
  abilityDelegator.doAbilityForeground(ability, (err: base.BusinessError) => {
    console.info(tag + "doAbilityForeground err: " + JSON.stringify(err));
  });
}

async function abilityBackground(tag:string) {
  console.info(tag + "abilityBackground err: " + JSON.stringify(ability?.context?.abilityInfo));
  abilityDelegator.doAbilityBackground(ability, (err: base.BusinessError) => {
    console.info(tag + "abilityBackground err: " + JSON.stringify(err));
  });
}