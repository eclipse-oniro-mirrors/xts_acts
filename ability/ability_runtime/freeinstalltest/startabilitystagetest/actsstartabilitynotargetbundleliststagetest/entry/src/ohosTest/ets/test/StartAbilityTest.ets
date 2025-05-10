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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ability from '@ohos.app.ability.UIAbility'
import wantConstant from '@ohos.ability.wantConstant'
import base from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { abilityDelegatorRegistry } from '@kit.TestKit';
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
export default function startAbilityTest() {

    describe('startAbilityTest', ()=> {

        console.info("-------------Stage model--> startNoTargetBundleListXTS Test start----------------")

        let TAG = "";

        abilityDelegator.getCurrentTopAbility((err: base.BusinessError, data: ESObject) => {
            console.info("getCurrentTopAbility err: " + JSON.stringify(err) + ", data: " + JSON.stringify(data));
            globalThis.ability = data;
        });

        beforeAll(async (done:Function) => {
            console.info("StartAbilityTest before all called");
            let cmd = "bm install -p data/test/MockService.hap";
            console.info("cmd : " + cmd)
            abilityDelegator.executeShellCommand(cmd, (err: base.BusinessError, d: ESObject) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
            abilityDelegator.executeShellCommand(cmd1, (err: base.BusinessError, d: ESObject) => {
                console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            abilityDelegator.executeShellCommand(cmd2, (err: base.BusinessError, d: ESObject) => {
                console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let cmd3 = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            abilityDelegator.executeShellCommand(cmd3, (err: base.BusinessError, d: ESObject) => {
                console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                done();
            })
        });

        afterEach(async (done:Function) => {
            console.info("StartAbilityTest after each called");
            if ("FreeInstall_Stage_Local_StartAbility_2700" === TAG) {
                let cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
                abilityDelegator.executeShellCommand(cmd4, (err: base.BusinessError, d: ESObject) => {
                    console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await sleep(500);
            }

            if ("FreeInstall_Stage_Local_StartAbility_2800" === TAG) {
                let cmd5 = "bm uninstall -n com.ohos.hag.famanager";
                abilityDelegator.executeShellCommand(cmd5, (err: base.BusinessError, d: ESObject) => {
                    console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
            }
            await sleep(500);
            done();
        });



        /*
         * @tc.number  FreeInstall_Stage_Local_StartAbility_2600
         * @tc.name    Atomized services are not added to the white list, and cross application installation
                       is not required
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_Stage_Local_StartAbility_2600", 0, async (done:Function) => {
            console.info("------------start FreeInstall_Stage_Local_StartAbility_2600-------------");
            TAG = "FreeInstall_Stage_Local_StartAbility_2600";
            let flag = 0;
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
            console.info("------------end FreeInstall_Stage_Local_StartAbility_2600-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_Stage_Local_StartAbility_2700
         * @tc.name    Atomized services are not added to the white list,
                        and atomized HAP packages are pulled across applications
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_Stage_Local_StartAbility_2700", 0, async (done:Function) => {
            console.info("------------start FreeInstall_Stage_Local_StartAbility_2700-------------");
            TAG = "FreeInstall_Stage_Local_StartAbility_2700";
            let flag = 0;
            let cmd2700 = "bm install -p data/test/AtomizationStageEntry.hap";
            abilityDelegator.executeShellCommand(cmd2700, (err: base.BusinessError, d: ESObject) => {
                console.info("executeShellCommand2700 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
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
            console.info("------------end FreeInstall_Stage_Local_StartAbility_2700-------------");
            done();
        });

        /*
        * @tc.number  FreeInstall_Stage_Local_StartAbility_2800
        * @tc.name    Atomized services are not added to the white list,
                       same application pull up the different ability.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it("FreeInstall_Stage_Local_StartAbility_2800", 0, async (done:Function) => {
            console.info("------------start FreeInstall_Stage_Local_StartAbility_2800-------------");
            TAG = "FreeInstall_Stage_Local_StartAbility_2800";
            let flag = 0;
            let cmd2800 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
            abilityDelegator.executeShellCommand(cmd2800, (err: base.BusinessError, d: ESObject) => {
                console.info("executeShellCommand2800 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let cmd2801 = "cp data/test/StageMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager" +
            "/haps/entry/files";
            abilityDelegator.executeShellCommand(cmd2801, (err: base.BusinessError, d: ESObject) => {
                console.info("executeShellCommand2801 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            abilityForeground(TAG);
            await sleep(1000);
            let str:Want = {
                "bundleName": "com.open.harmony.packagemag.hmservice",
                "abilityName": "MainAbility",
                "moduleName": "myapplication1",
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
            console.info("------------end FreeInstall_Stage_Local_StartAbility_2800-------------");
            done();
        });

        console.info("-------------Stage model--> startNoTargetBundleListXTS Test end----------------")
    })
}

function sleep(time:number):Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, time))
}

async function abilityForeground(tag:string) {
    abilityDelegator.doAbilityForeground(globalThis.ability, (err: base.BusinessError) => {
        console.info(tag + "doAbilityForeground err:" + JSON.stringify(err));
    });
}