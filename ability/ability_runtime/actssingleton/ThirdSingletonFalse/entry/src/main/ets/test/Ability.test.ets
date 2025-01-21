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
// @ts-nocheck
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
const START_ABILITY_TIMEOUT = 3000;
const ABILITY_TIMEOUT=5000;

export default function singleusermodelTest() {
    describe('ActsSingleUserTest', function () {
        var user100=100;
        /**
        *@tc.number: ACTS_SingleUserModel_1000
        *@tc.name: Support singleuser operation mode
        *@tc.desc:When singleuser is false, create an ability page with the current user under a third-party application
        */
        it('ACTS_SingleUserModel_1000', 0, async function (done) {
            console.log("ACTS_SingleUserModel_1000====>callback start====>")
            await globalThis.abilityContext.startAbilityWithAccount(
                {
                    bundleName: 'com.singleusermodel.actssingleusertest',
                    abilityName: 'SingleUserModel1000'
                },user100).then(()=>{
                console.debug("====>startAbilityWithAccount end====>");
            })

            setTimeout(async()=>{
                let abilityDelegator = undefined
                abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
                let temp
                let cmd ='aa dump -a'
                console.log("ACTS_SingleUserModel_1000====>callback start====>")
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('====>executeShellCommand : data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("SingleUserModel1000") >= 0).assertTrue()
                        console.info('====>executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
                    })
                cmd ='aa dump -a -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand 0: data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("SingleUserModel1000") == -1).assertTrue()
                        console.info('====>executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_SingleUserModel_1000====>timeout====>');
                globalThis.ability2Context.terminateSelf();
            }, START_ABILITY_TIMEOUT);
            setTimeout(()=>{
                console.debug('ACTS_SingleUserModel_1000====>done====>');
                done();
              },ABILITY_TIMEOUT)
        })
    })
}