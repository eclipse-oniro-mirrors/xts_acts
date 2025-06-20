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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import ability from '@ohos.ability.ability';
import common from '@ohos.app.ability.common';
export default function StartAbilityForResult() {
    let TAG = "";
    let id:number = 0;

    describe('StartAbilityForResult', () => {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        beforeAll(async (done:Function) => {
            console.info("StartAbilityForResult before all called");
            let cmd = "bm install -p data/test/MockService.hap";
            console.info("cmd : " + cmd)
            delegator.executeShellCommand(cmd, (err:BusinessError, d) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
            delegator.executeShellCommand(cmd1, (err:BusinessError, d) => {
                console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd2, (err:BusinessError, d) => {
                console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let cmd3 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/" +
                "files";
            delegator.executeShellCommand(cmd3, (err:BusinessError, d) => {
                console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                done();
            })
        });

        afterEach(async (done:Function) => {
            console.info("StartAbilityForResult after each called");
            clearTimeout(id);
            if ("FreeInstall_FA_StartAbilityForResult_2900" === TAG) {
                let cmd4 = "bm uninstall -n com.ohos.hag.famanager";
                delegator.executeShellCommand(cmd4, (err:BusinessError, d) => {
                    console.info("executeShellCommand4: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await Utils.sleep(500);
                let cmd5 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
                delegator.executeShellCommand(cmd5, (err:BusinessError, d) => {
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
        it("FreeInstall_FA_StartAbilityForResult_2700", 0, async (done:Function) => {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2700-------------");
            let TAG = "FreeInstall_FA_StartAbilityForResult_2700";
            let details :ability.AbilityResult = {} as ability.AbilityResult;
            let str:ability.StartAbilityParameter = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            id = setTimeout(async () => {
                await featureAbility.startAbilityForResult(str)
                    .then((data) => {
                        details = data;
                        console.info(TAG + ' StartAbilityForResult successful. Data: ' + JSON.stringify(data))
                    }).catch((error:BusinessError) => {
                        console.info(TAG + ' StartAbilityForResult failed. error: ' + JSON.stringify(error));
                    })
                console.log(TAG + " resultCode: " + details.resultCode);
                expect(details.resultCode).assertEqual(1);
            },4000);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2800
         * @tc.name: startAbilityForResult: NoTargetBundleList and yuanzihua already installed,startAbility successfully
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2800", 0, async (done:Function) => {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2800-------------");
            let TAG = "FreeInstall_FA_StartAbilityForResult_2800";
            let cmd6 = "bm install -p data/test/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd6, (err:BusinessError, d) => {
                console.info("executeShellCommand6: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            let details:ability.AbilityResult = {} as ability.AbilityResult;
            let str:ability.StartAbilityParameter = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            id = setTimeout(async ()=>{
                await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResult successful. Data: ' + JSON.stringify(data))
                }).catch((error:BusinessError) => {
                    console.info(TAG + ' StartAbilityForResult failed. error: ' + JSON.stringify(error));
                })
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            },4000);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2900
         * @tc.name: startAbilityForResult: The same application does not need to check targetbundlelist,
                     start feature hap successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2900", 0, async (done:Function) => {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2900-------------");
            let TAG = "FreeInstall_FA_StartAbilityForResult_2900";
            let cmd7 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd7, (err:BusinessError, d) => {
                console.info("executeShellCommand7: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let cmd8 = "cp data/test/FaResultMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
                "entry/files";
            delegator.executeShellCommand(cmd8, (err:BusinessError, d) => {
                console.info("executeShellCommand8: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            id = setTimeout(async ()=>{
                let details:ability.AbilityResult = {} as ability.AbilityResult;
                let str:ability.StartAbilityParameter = {
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
                    }).catch((error:BusinessError) => {
                        console.info(TAG + ' StartAbilityForResult failed. error: ' + JSON.stringify(error));
                    })
                console.log(TAG + " resultCode: " + details.resultCode);
                expect(details.resultCode).assertEqual(1);
            },4000);
            done();
        });
    })
}