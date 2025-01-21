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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
const START_ABILITY_TIMEOUT = 2000;
const ABILITY_TIMEOUT = 5000;
var user100 = 100;
var user101 = 101;
var user102 = 102;
export default function singleusermodelTest() {
    describe('ActsSingleUserTest', function () {
        /**
         *@tc.number: ACTS_SingleUserModel_1400
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser not set, create an ability page with the current user under the influence of
         * the system
         */
        it('ACTS_SingleUserModel_1400', 0, async function (done) {
            let abilityDelegator = undefined
            abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            console.log("ACTS_SingleUserModel_1400====>callback start====>");
            console.debug("====>start startAbilityWithAccount====>");
            await globalThis.abilityContext.startAbilityWithAccount(
                {
                    bundleName: 'com.singleusermodel.actssingleusertest',
                    abilityName: 'SingleUserModel1400'
                }, user100).then(() => {
                    console.debug("====>startAbilityWithAccount 1400 end====>");
                })
            setTimeout(async () => {
                console.debug('ACTS_SingleUserModel_1400====>timeout====>');
                let temp
                let cmd = 'aa dump -a'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('====> executeShellCommand : data : ' + JSON.stringify(data));
                    console.info('====> executeShellCommand : data : ' + data.exitCode);
                    temp = data["stdResult"];
                    console.info('====> executeShellCommand : data["stdResult"]; : ' + JSON.stringify(temp));
                    expect(temp.indexOf("SingleUserModel1400") >= 0).assertTrue()
                }).catch((err) => {
                    console.info('====> executeShellCommand : err : ' + JSON.stringify(err));
                })
                cmd = 'aa dump -a -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("SingleUserModel1400") == -1).assertTrue()
                    console.info('executeShellCommand 0: data : ' + data.exitCode);
                }).catch((err) => {
                    console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
                })
            }, START_ABILITY_TIMEOUT);
            setTimeout(() => {
                globalThis.ability2Context.terminateSelf();
                console.debug('ACTS_SingleUserModel_1400====>done====>');
                done();
            }, ABILITY_TIMEOUT)
        })

        /**
         *@tc.number: ACTS_SingleUserModel_1500
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser not set, create an ability page with an existing non-current user under the
         * influence of the system
         */
        it('ACTS_SingleUserModel_1500', 0, async function (done) {
            let abilityDelegator = undefined
            abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            console.debug("====>start startAbilityWithAccount====>");
            await globalThis.abilityContext.startAbilityWithAccount(
                {
                    bundleName: 'com.singleusermodel.actssingleusertest',
                    abilityName: 'SingleUserModel1500'
                }, user101).then((data) => {
                    console.debug("====>startAbilityWithAccount 1500 end====>" + data);
                }).catch((err) => {
                    console.debug("====>startAbilityWithAccount 1500 end====>" + err);
                })

            setTimeout(async () => {
                let temp
                let cmd = 'aa dump -a -101'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand : data : ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("SingleUserModel1500") == -1).assertTrue()
                    console.info('executeShellCommand : data : ' + data.exitCode);
                }).catch((err) => {
                    console.info('executeShellCommand : err : ' + JSON.stringify(err));
                })
                cmd = 'aa dump -a'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand : data : ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("SingleUserModel1500") == -1).assertTrue()
                    console.info('executeShellCommand : data : ' + data.exitCode);
                }).catch((err) => {
                    console.info('executeShellCommand : err : ' + JSON.stringify(err));
                })
                cmd = 'aa dump -a -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("SingleUserModel1500") == -1).assertTrue()
                    console.info('executeShellCommand 0: data : ' + data.exitCode);
                }).catch((err) => {
                    console.info('executeShellCommand : err : ' + JSON.stringify(err));
                })
                console.debug('ACTS_SingleUserModel_1500====>timeout====>');
            }, START_ABILITY_TIMEOUT);
            setTimeout(() => {
                console.debug('ACTS_SingleUserModel_1500====>done====>');
                done();
            }, ABILITY_TIMEOUT)
        })

        /**
         *@tc.number: ACTS_SingleUserModel_1600
         *@tc.name: Support singleuser operation mode
         *@tc.desc:Create an ability page with an empty user under system influence when singleuser not set
         */
        it('ACTS_SingleUserModel_1600', 0, async function (done) {

            console.info("====>start startAbilityWithAccount====>");
            try {
                await globalThis.abilityContext.startAbilityWithAccount(
                    {
                        bundleName: 'com.singleusermodel.actssingleusertest',
                        abilityName: 'SingleUserModel1600'
                    }, null).then((data) => {
                        console.info("====>startAbilityWithAccount 1600 end====>" + data);
                    }).catch((err) => {
                        console.info("====>startAbilityWithAccount 1600 end====>" + err);
                    })
            } catch (err) {
                let e = err.toString()
                let errLog = "Invalid input parameter"
                console.info("ACTS_SingleUserModel_1600 ====>e====>" + e);
                expect(e.indexOf(errLog) >= 0).assertTrue()
            }
            setTimeout(async () => {
                let abilityDelegator = undefined
                abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
                let temp
                let cmd = 'aa dump -a'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand : data : ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("SingleUserModel1600") == -1).assertTrue()
                    console.info('executeShellCommand : data : ' + data.exitCode);
                }).catch((err) => {
                    console.info('executeShellCommand : err : ' + JSON.stringify(err));
                })
                cmd = 'aa dump -a -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("SingleUserModel1600") == -1).assertTrue()
                    console.info('executeShellCommand 0: data : ' + data.exitCode);
                }).catch((err) => {
                    console.info('executeShellCommand : err : ' + JSON.stringify(err));
                })
                console.debug('ACTS_SingleUserModel_1600====>timeout====>');
            }, START_ABILITY_TIMEOUT)
            setTimeout(() => {
                console.info('ACTS_SingleUserModel_1600====>done====>');
                done();
            }, ABILITY_TIMEOUT)
        })

        /**
         *@tc.number: ACTS_SingleUserModel_1700
         *@tc.name: Support singleuser operation mode
         *@tc.desc:Create an ability page with an uncreated user under system influence when singleuser not set
         */
        it('ACTS_SingleUserModel_1700', 0, async function (done) {
            let abilityDelegator = undefined
            abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            console.debug("====>start startAbilityWithAccount====>");
            try {
                await globalThis.abilityContext.startAbilityWithAccount(
                    {
                        bundleName: 'com.singleusermodel.actssingleusertest',
                        abilityName: 'SingleUserModel1700'
                    }, undefined).then((data) => {
                        console.debug("====>startAbilityWithAccount 1700 end====>" + data);
                    }).catch((err) => {
                        console.debug("====>startAbilityWithAccount 1700 end====>" + err);
                    })
            } catch (err) {
                let e = err.toString()
                let errLog = "Invalid input parameter"
                console.debug("====>e====>" + e);
                expect(e.indexOf(errLog) >= 0).assertTrue()
            }

            setTimeout(async() => {
                let temp
                let cmd = 'aa dump -a'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("SingleUserModel1700") == -1).assertTrue()
                        console.info('executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                cmd = 'aa dump -a -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("SingleUserModel1700") == -1).assertTrue()
                        console.info('executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_SingleUserModel_1700====>timeout====>');
            }, START_ABILITY_TIMEOUT);
            setTimeout(() => {
                console.debug('ACTS_SingleUserModel_1700====>done====>');
                done();
            }, ABILITY_TIMEOUT)
        })

        /**
         *@tc.number: ACTS_SingleUserModel_1800
         *@tc.name: Support singleuser operation mode
         *@tc.desc:Create an ability page with an uncreated user under system influence when singleuser not set
         */
        it('ACTS_SingleUserModel_1800', 0, async function (done) {
            let abilityDelegator = undefined
            abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()

            console.debug("====>start startAbilityWithAccount====>");
            await globalThis.abilityContext.startAbilityWithAccount(
                {
                    bundleName: 'com.singleusermodel.actssingleusertest',
                    abilityName: 'SingleUserModel1800'
                }, user102).then((data) => {
                    console.debug("====>startAbilityWithAccount 1800 end====>" + data);
                }).catch((err) => {
                    console.debug("====>startAbilityWithAccount 1800 end====>" + err);
                })

            setTimeout(async() => {
                let temp
                let cmd = 'aa dump -a'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand 0800: err : ' + JSON.stringify(err));
                        console.info('executeShellCommand 0800: data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("SingleUserModel1800") == -1).assertTrue()
                        console.info('executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                cmd = 'aa dump -a -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
                        console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("SingleUserModel1800") == -1).assertTrue()
                        console.info('executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_SingleUserModel_1800====>timeout====>');
            }, START_ABILITY_TIMEOUT);
            setTimeout(() => {
                console.debug('ACTS_SingleUserModel_1400====>done====>');
                done();
            }, ABILITY_TIMEOUT)
        })
    })
}