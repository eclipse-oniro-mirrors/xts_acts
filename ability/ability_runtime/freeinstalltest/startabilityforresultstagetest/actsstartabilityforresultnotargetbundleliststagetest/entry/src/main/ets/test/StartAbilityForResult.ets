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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ability from '@ohos.app.ability.UIAbility'
import rpc from '@ohos.rpc';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';


export default function StartAbilityForResult(abilityContext) {
    let TAG = "";

    describe('StartAbilityForResult', function () {

        /*
         * @tc.number: FreeInstall_Stage_StartAbilityForResult_2500
         * @tc.name: startAbilityForResult: don't add targetBundleList, app already installed, start hap successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_Stage_StartAbilityForResult_2500", 0, async function (done) {
            console.log("------------start FreeInstall_Stage_StartAbilityForResult_2500-------------");
            TAG = "FreeInstall_Stage_StartAbilityForResult_2500";
            let str = {
                "bundleName": "com.example.qianyiyingyong.hmservice",
                "abilityName": "com.example.qianyiyingyong.MainAbility",
                "moduleName": "entry",
                "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
            await globalThis.abilityContext.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                    expect(data.resultCode).assertEqual(1);
                    done();
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                    expect().assertFail();
                    done();
                })
        });
    })
}