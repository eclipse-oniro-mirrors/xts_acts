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

export default function StartAbilityForResult() {
    var TAG = "";

    describe('StartAbilityForResult', function () {
        var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        beforeAll(async function (done) {
            console.info("StartAbilityForResult before all called");
            var cmd = "bm install -p data/test/MockService.hap";
            console.info("cmd : " + cmd)
            delegator.executeShellCommand(cmd, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
            delegator.executeShellCommand(cmd1, (err: any, d: any) => {
                console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd2, (err: any, d: any) => {
                console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd3 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/" +
                "files";
            delegator.executeShellCommand(cmd3, (err: any, d: any) => {
                console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                done();
            })
        });

        afterEach(async function (done) {
            console.info("StartAbilityForResult after each called");
            if ("FreeInstall_FA_StartAbilityForResult_2900" === TAG) {
                var cmd4 = "bm uninstall -n com.ohos.hag.famanager";
                delegator.executeShellCommand(cmd4, (err: any, d: any) => {
                    console.info("executeShellCommand4: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await Utils.sleep(500);
                var cmd5 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
                delegator.executeShellCommand(cmd5, (err: any, d: any) => {
                    console.info("executeShellCommand5: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
            }
            await Utils.sleep(500);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2700
         * @tc.name: startAbilityForResult: NoTargetBundleList,free install successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2700", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2700-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2700";
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
            setTimeout(async () => {
                await featureAbility.startAbilityForResult(str)
                    .then((data) => {
                        details = data;
                        console.info(TAG + ' StartAbilityForResult successful. Data: ' + JSON.stringify(data))
                    }).catch((error) => {
                        console.info(TAG + ' StartAbilityForResult failed. error: ' + JSON.stringify(error));
                    })
                console.log(TAG + " resultCode: " + details.resultCode);
                expect(details.resultCode).assertEqual(1);
            },2000);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2800
         * @tc.name: startAbilityForResult: NoTargetBundleList and yuanzihua already installed,startAbility successfully
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2800", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2800-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2800";
            var cmd6 = "bm install -p data/test/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd6, (err: any, d: any) => {
                console.info("executeShellCommand6: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
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
            setTimeout(async ()=>{
                await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResult successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResult failed. error: ' + JSON.stringify(error));
                })
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            },2000);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2900
         * @tc.name: startAbilityForResult: The same application does not need to check targetbundlelist,
                     start feature hap successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2900", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2900-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2900";
            var cmd7 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd7, (err: any, d: any) => {
                console.info("executeShellCommand7: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd8 = "cp data/test/FaResultMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
                "entry/files";
            delegator.executeShellCommand(cmd8, (err: any, d: any) => {
                console.info("executeShellCommand8: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            setTimeout(async ()=>{
                let details;
                var str = {
                    'want': {
                        "bundleName": "com.open.harmony.startAbilityForResult",
                        "abilityName": "com.example.myapplication1.MainAbility1",
                        "moduleName": "myapplication1",
                        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                    }
                }
                await featureAbility.startAbilityForResult(str)
                    .then((data) => {
                        details = data;
                        console.info(TAG + ' StartAbilityForResult successful. Data: ' + JSON.stringify(data))
                    }).catch((error) => {
                        console.info(TAG + ' StartAbilityForResult failed. error: ' + JSON.stringify(error));
                    })
                console.log(TAG + " resultCode: " + details.resultCode);
                expect(details.resultCode).assertEqual(1);
            },2000);
            done();
        });
    })
}