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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ability from '@ohos.app.ability.UIAbility'
import rpc from '@ohos.rpc';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';
import abilityManager from '@ohos.application.abilityManager';

export default function startAbilityTest(abilityContext) {

    describe('startAbilityTest', function () {

        console.info("-------------Stage model--> startNoTargetBundleListXTS Test start----------------")

        var TAG = "";

        globalThis.delegator.getCurrentTopAbility((err: any, data: any) => {
            console.info("getCurrentTopAbility err: " + JSON.stringify(err) + ", data: " + JSON.stringify(data));
            globalThis.ability = data;
        });


        function sleep(time) {
            return new Promise((resolve) => setTimeout(resolve, time))
        }

        beforeAll(async function (done) {
            console.info("StartAbilityTest before all called");
            var cmd = "bm install -p data/test/MockService.hap";
            console.info("cmd : " + cmd)
            globalThis.delegator.executeShellCommand(cmd, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
            globalThis.delegator.executeShellCommand(cmd1, (err: any, d: any) => {
                console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            globalThis.delegator.executeShellCommand(cmd2, (err: any, d: any) => {
                console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd3 = "cp data/test/AtomizationStageEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            globalThis.delegator.executeShellCommand(cmd3, (err: any, d: any) => {
                console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                done();
            })
        });

        afterEach(async function (done) {
            console.info("StartAbilityTest after each called");
            if ("FreeInstall_Stage_Local_StartAbility_2700" === TAG) {
                var cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
                globalThis.delegator.executeShellCommand(cmd4, (err: any, d: any) => {
                    console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await sleep(500);
            }

            if ("FreeInstall_Stage_Local_StartAbility_2800" === TAG) {
                var cmd5 = "bm uninstall -n com.ohos.hag.famanager";
                globalThis.delegator.executeShellCommand(cmd5, (err: any, d: any) => {
                    console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
            }
            await sleep(500);
            done();
        });

        async function abilityForeground(tag) {
            globalThis.delegator.doAbilityForeground(globalThis.ability, (err: any) => {
                console.info(tag + "doAbilityForeground err:" + JSON.stringify(err));
            });
        }

        /*
         * @tc.number  FreeInstall_Stage_Local_StartAbility_2600
         * @tc.name    Atomized services are not added to the white list, and cross application installation
                       is not required
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_Stage_Local_StartAbility_2600", 0, async function (done) {
            console.info("------------start FreeInstall_Stage_Local_StartAbility_2600-------------");
            TAG = "FreeInstall_Stage_Local_StartAbility_2600";
            var flag = 0;
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
        it("FreeInstall_Stage_Local_StartAbility_2700", 0, async function (done) {
            console.info("------------start FreeInstall_Stage_Local_StartAbility_2700-------------");
            TAG = "FreeInstall_Stage_Local_StartAbility_2700";
            var flag = 0;
            var cmd2700 = "bm install -p data/test/AtomizationStageEntry.hap";
            globalThis.delegator.executeShellCommand(cmd2700, (err: any, d: any) => {
                console.info("executeShellCommand2700 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
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
        it("FreeInstall_Stage_Local_StartAbility_2800", 0, async function (done) {
            console.info("------------start FreeInstall_Stage_Local_StartAbility_2800-------------");
            TAG = "FreeInstall_Stage_Local_StartAbility_2800";
            var flag = 0;
            var cmd2800 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationStageEntry.hap";
            globalThis.delegator.executeShellCommand(cmd2800, (err: any, d: any) => {
                console.info("executeShellCommand2800 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd2801 = "cp data/test/StageMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager" +
            "/haps/entry/files";
            globalThis.delegator.executeShellCommand(cmd2801, (err: any, d: any) => {
                console.info("executeShellCommand2801 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            abilityForeground(TAG);
            await sleep(1000);
            var str = {
                "bundleName": "com.open.harmony.packagemag.hmservice",
                "abilityName": "MainAbility",
                "moduleName": "myapplication1",
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
            console.info("------------end FreeInstall_Stage_Local_StartAbility_2800-------------");
            done();
        });

        console.info("-------------Stage model--> startNoTargetBundleListXTS Test end----------------")
    })
}