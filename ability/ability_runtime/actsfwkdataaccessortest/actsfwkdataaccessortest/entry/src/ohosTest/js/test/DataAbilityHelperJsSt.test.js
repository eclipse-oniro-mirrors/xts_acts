/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import ohosDataAbility from '@ohos.data.dataAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

export default function ActsDataAbilityHelperTest() {
describe('ActsDataAbilityHelperTest', function () {
    let dataAbilityUri = ("dataability:///com.example.myapplication.TestDataAbility");
    let dataAbilityUri2 = ("dataability:///com.example.myapplication.TestDataAbility2");
    let dataAbilityUri3 = ("dataability:///com.example.myapplication.TestDataAbility3");
    let DAHelper;
    let gSetTimeout = 500;
    var valueBucket = {
        "name": "ActsDataAbilityHelperTest",
        "age": 24,
        "salary": 2024.20,
    }

    beforeAll(async (done) => {
        console.debug('= ACTS_beforeAll ====<begin');
        try {
            DAHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri);
            console.debug('ACTS_beforeAll DAHelper ====>: ' + DAHelper + " ,JSON. " + JSON.stringify(DAHelper));
            if(DAHelper == null){
                console.debug('ACTS_beforeAll DAHelper ====>: DAHelper == null');
                return;
            }
        } catch (err) {
            console.error('=ACTS_beforeAll acquireDataAbilityHelper catch(err)====>:' + err);
        }
        sleep(300);
        console.debug('= ACTS_beforeAll ====<end');
        done();
    })
    afterAll((done) => {
        console.debug('= ACTS_afterAll ====<begin');
        console.debug('= ACTS_afterAll ====<end');
        done();
    })

    function sleep(delay) {
        let start = new Date().getTime();
        while (true) {
            if (new Date().getTime() - start > delay) {
                break;
            }
        }
    }

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0100
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0100====<begin');
        console.debug("=ACTS_AcquireDataAbilityHelper_0100 dataAbilityUri====>" + dataAbilityUri)
        try {
            if(DAHelper == null){
                var abilityHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri)
                console.log('ACTS_AcquireDataAbilityHelper_0100 abilityHelper ====>: '
                    + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
                DAHelper = abilityHelper;
            }
            expect(typeof (DAHelper)).assertEqual("object");
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0100 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0100====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0200
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0200====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper("")
            console.log('ACTS_AcquireDataAbilityHelper_0200 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(abilityHelper).assertEqual(null);
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0200 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0200====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0300
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0300====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper("error")
            console.log('ACTS_AcquireDataAbilityHelper_0300 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(abilityHelper).assertEqual(null);
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0300 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0300====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0400
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0400====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper(undefined)
            console.log('ACTS_AcquireDataAbilityHelper_040 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(JSON.stringify(abilityHelper)).assertEqual("null");
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0400 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0400====<end')
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0500
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_AcquireDataAbilityHelper_0500====<begin');
        try {
            var abilityHelper = featureAbility.acquireDataAbilityHelper(123456)
            console.log('ACTS_AcquireDataAbilityHelper_0500 abilityHelper ====>: '
                + abilityHelper + " ,JSON. " + JSON.stringify(abilityHelper))
            expect(JSON.stringify(abilityHelper)).assertEqual("null");
        } catch (err) {
            console.error('=ACTS_GetDataAbilityHelper_0500 acquireDataAbilityHelper catch(err)====>:' + err);
            expect(false).assertTrue();
        }
        done();
        console.log('ACTS_AcquireDataAbilityHelper_0500====<end')
    })

    /*
    * @tc.number: ACTS_Insert_0100
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_0100 DAHelper ====>: ' + DAHelper)
        let valueBucketM
        try {
            DAHelper.insert(dataAbilityUri, valueBucketM)
                .then(function (data) {
                    console.debug("=ACTS_Insert_0100 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(-2);
                    console.log('ACTS_Insert_0100====<end');
                    done();
                }).catch(function (err) {
                    console.debug("=ACTS_Insert_0100 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    expect(false).assertTrue();
                    console.log('ACTS_Insert_0100====<end .catch');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_0100 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Insert_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0200
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        let valueBucketM = 'undefined';
        try {
            await DAHelper.insert(dataAbilityUri, valueBucketM,
                (err, data) => {
                    console.debug("=ACTS_Insert_0200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】data【") + data + (" 】;"));
                    expect(data).assertEqual(-2);
                    console.log('ACTS_Insert_0200====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_0200 catch(err)====>:' + err);
            console.log('ACTS_Insert_0200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0300
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_0300 DAHelper ====<: ' + JSON.stringify(DAHelper) + "," + DAHelper)
        try {
            DAHelper.insert(dataAbilityUri, valueBucket)
                .then((data) => {
                    console.debug("=ACTS_Insert_0300 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(1);
                    console.log('ACTS_Insert_0300====<end');
                    done();
                }).catch((err) => {
                    console.debug("=ACTS_Insert_0300 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    console.log('ACTS_Insert_0300====<end .catch');
                    expect(false).assertTrue();
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_0300 catch(err)====>:' + err);
            console.log('ACTS_Insert_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0400
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.insert(dataAbilityUri, valueBucket,
                (err, data) => {
                    console.debug("=ACTS_Insert_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(1);
                    console.log('ACTS_Insert_0400====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_0400 catch(err)====>:' + err);
            console.log('ACTS_Insert_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0500
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0500====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_0500 DAHelper ====<: ' + JSON.stringify(DAHelper) + "," + DAHelper)
        try {
            DAHelper.insert(undefined, valueBucket)
                .then((data) => {
                    console.debug("=ACTS_Insert_0500 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(0);
                    console.log('ACTS_Insert_0500====<end');
                    done();
                }).catch((err) => {
                    console.debug("=ACTS_Insert_0500 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    console.log('ACTS_Insert_0500====<end .catch');
                    expect(false).assertTrue();
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_0500 catch(err)====>:' + err);
            console.log('ACTS_Insert_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0600
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.insert(undefined, valueBucket,
                (err, data) => {
                    console.debug("=ACTS_Insert_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    expect(data).assertEqual(0);
                    console.log('ACTS_Insert_0600====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_0600 catch(err)====>:' + err);
            console.log('ACTS_Insert_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0700
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0700====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_0700 DAHelper ====<: ' + JSON.stringify(DAHelper) + "," + DAHelper)
        var currentAlertTimeout;
        try {
            DAHelper.insert(dataAbilityUri, valueBucket)
                .then((data) => {
                    console.debug("=ACTS_Insert_0700 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(1);

                    currentAlertTimeout = setTimeout(() => {
                        console.log('ACTS_Insert_0700====<end setTimeout');
                        done();
                    }, gSetTimeout);
                }).catch((err) => {
                    console.debug("=ACTS_Insert_0700 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    console.log('ACTS_Insert_0700====<end .catch');
                    expect(false).assertTrue();
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_0700 catch(err)====>:' + err);
            console.log('ACTS_Insert_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0800
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        var currentAlertTimeout;
        try {
            await DAHelper.insert(dataAbilityUri, valueBucket,
                (err, data) => {
                    console.debug("=ACTS_Insert_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(1);

                    currentAlertTimeout = setTimeout(() => {
                        console.log('ACTS_Insert_0800====<end setTimeout');
                        done();
                    }, gSetTimeout);
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_0800 catch(err)====>:' + err);
            console.log('ACTS_Insert_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_0900
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_0900====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_0900 DAHelper ====<: ' + JSON.stringify(DAHelper) + "," + DAHelper)
        try {
            DAHelper.insert(123456, valueBucket)
                .then((data) => {
                    console.debug("=ACTS_Insert_0900 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(0);
                    console.log('ACTS_Insert_0900====<end');
                    done();
                }).catch((err) => {
                    console.debug("=ACTS_Insert_0900 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    console.log('ACTS_Insert_0900====<end .catch');
                    expect(false).assertTrue();
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_0900 catch(err)====>:' + err);
            console.log('ACTS_Insert_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_1000
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.insert(123456, valueBucket,
                (err, data) => {
                    console.debug("=ACTS_Insert_1000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    expect(data).assertEqual(0);
                    console.log('ACTS_Insert_1000====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_1000 catch(err)====>:' + err);
            console.log('ACTS_Insert_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_1100
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_1100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_1100 DAHelper ====<: ' + JSON.stringify(DAHelper) + "," + DAHelper)
        try {
            DAHelper.insert(dataAbilityUri2, valueBucket)
                .then((data) => {
                    console.debug("=ACTS_Insert_1100 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Insert_1100====<end');
                    done();
                }).catch((err) => {
                    console.debug("=ACTS_Insert_1100 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    console.log('ACTS_Insert_1100====<end .catch');
                    expect(false).assertTrue();
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_1100 catch(err)====>:' + err);
            console.log('ACTS_Insert_1100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_1200
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_1200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.insert(dataAbilityUri2, valueBucket,
                (err, data) => {
                    console.debug("=ACTS_Insert_1200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Insert_1200====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_1200 catch(err)====>:' + err);
            console.log('ACTS_Insert_1200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_1300
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_1300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_1300 DAHelper ====<: ' + JSON.stringify(DAHelper) + "," + DAHelper)
        try {
            DAHelper.insert("errorUri", valueBucket)
                .then((data) => {
                    console.debug("=ACTS_Insert_1300 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Insert_1300====<end');
                    done();
                }).catch((err) => {
                    console.debug("=ACTS_Insert_1300 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    console.log('ACTS_Insert_1300====<end .catch');
                    expect(false).assertTrue();
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_1300 catch(err)====>:' + err);
            console.log('ACTS_Insert_1300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_1400
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_1400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.insert("errorUri", valueBucket,
                (err, data) => {
                    console.debug("=ACTS_Insert_1400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Insert_1400====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_1400 catch(err)====>:' + err);
            console.log('ACTS_Insert_1400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_1500
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_1500', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_1500====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_1500 DAHelper ====<: ' + JSON.stringify(DAHelper) + "," + DAHelper)
        var valueBucketK = {};
        try {
            DAHelper.insert(dataAbilityUri, valueBucketK)
                .then((data) => {
                    console.debug("=ACTS_Insert_1500 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(data).assertEqual(-2);
                    console.log('ACTS_Insert_1500====<end');
                    done();
                }).catch((err) => {
                    console.debug("=ACTS_Insert_1500 catch err ====>"
                        + ("json err 【") + JSON.stringify(err) + (" 】 "));
                    console.log('ACTS_Insert_1500====<end .catch');
                    expect(false).assertTrue();
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Insert_1500 catch(err)====>:' + err);
            console.log('ACTS_Insert_1500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Insert_1600
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Insert_1600', Level.LEVEL0, async function (done) {
        console.log('ACTS_Insert_1600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketK = {};
        try {
            await DAHelper.insert(dataAbilityUri, valueBucketK,
                (err, data) => {
                    console.debug("=ACTS_Insert_1600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-2);
                    console.log('ACTS_Insert_1600====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_Insert_1600 catch(err)====>:' + err);
            console.log('ACTS_Insert_1600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_0100
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_BatchInsert_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketM;
        try {
            DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketM
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】; ====>"));
                expect(data).assertEqual(0);
                console.log('ACTS_BatchInsert_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_0100====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_0100  catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_0200
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketM;
        try {
            await DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketM,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_0200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(0);
                    console.log('ACTS_BatchInsert_0200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_0200 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_0300
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_BatchInsert_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({}, {}, {})
        try {
            DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】; ====>"));
                expect(data).assertEqual(3);
                console.log('ACTS_BatchInsert_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_0300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_0300 batchInsert AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_0400
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({}, {}, {})
        try {
            await DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(3);
                    console.log('ACTS_BatchInsert_0400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_0400 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_BatchInsert_0500
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0500====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try {
            var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })

            DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0500 BatchInsert Promise then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(3);
                console.log('ACTS_BatchInsert_0500====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_0500 BatchInsert Promise catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_0500====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_0500 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_0600
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })
        try {
            await DAHelper.batchInsert(
                dataAbilityUri,
                valueBucketArray,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(3);
                    console.log('ACTS_BatchInsert_0600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_0600 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_BatchInsert_0700
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0700====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try {
            var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })

            DAHelper.batchInsert(
                dataAbilityUri2,
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0700 BatchInsert Promise then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-1);
                console.log('ACTS_BatchInsert_0700====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_0700 BatchInsert Promise catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_0700====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_0700 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_0800
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })
        try {
            await DAHelper.batchInsert(
                dataAbilityUri2,
                valueBucketArray,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_BatchInsert_0800====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_0800 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_BatchInsert_0900
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_0900====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try {
            var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })

            DAHelper.batchInsert(
                undefined,
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_0900 BatchInsert Promise then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0);
                console.log('ACTS_BatchInsert_0900====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_0900 BatchInsert Promise catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_0900====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_0900 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_1000
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })
        try {
            await DAHelper.batchInsert(
                undefined,
                valueBucketArray,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_1000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    console.log('ACTS_BatchInsert_1000====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_1000 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_BatchInsert_1100
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_1100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try {
            var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })

            DAHelper.batchInsert(
                "error",
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_1100 BatchInsert Promise then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-1);
                console.log('ACTS_BatchInsert_1100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_1100 BatchInsert Promise catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_1100====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_1100 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_1100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_1200
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_1200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })
        try {
            await DAHelper.batchInsert(
                "error",
                valueBucketArray,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_1200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_BatchInsert_1200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_1200 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_1200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_BatchInsert_1300
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_1300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try {
            var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
                { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })

            DAHelper.batchInsert(
                123456,
                valueBucketArray,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_1300 BatchInsert Promise then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0);
                console.log('ACTS_BatchInsert_1300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_1300 BatchInsert Promise catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_1300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_1300 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_1300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_1400
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_1400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        var valueBucketArray = new Array({ "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, },
            { "name": "ActsDataAbilityHelperTest", "age": 24, "salary": 2024.20, })
        try {
            await DAHelper.batchInsert(
                123456,
                valueBucketArray,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_1400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    console.log('ACTS_BatchInsert_1400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_1400 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_1400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_BatchInsert_1500
* @tc.name: Inserts multiple data records into the database
* @tc.desc: Check the return value of the interface (by Promise)
*/
    it('ACTS_BatchInsert_1500', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_1500====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.batchInsert(
                dataAbilityUri,
                valueBucket,
            ).then((data) => {
                console.debug("=ACTS_BatchInsert_1500 BatchInsert Promise then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0);
                console.log('ACTS_BatchInsert_1500====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_BatchInsert_1500 BatchInsert Promise catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_BatchInsert_1500====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_BatchInsert_1500 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_1500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_BatchInsert_1600
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_BatchInsert_1600', Level.LEVEL0, async function (done) {
        console.log('ACTS_BatchInsert_1600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility BatchInsert getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.batchInsert(
                dataAbilityUri,
                valueBucket,
                (err, data) => {
                    console.debug("=ACTS_BatchInsert_1600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(0);
                    console.log('ACTS_BatchInsert_1600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_BatchInsert_1600 catch(err)====>:' + err);
            console.log('ACTS_BatchInsert_1600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0100
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            let queryPromise = DAHelper.query(
                dataAbilityUri,
                columnsArray,
                predicates
            );
            console.debug("=ACTS_Query_0100 queryPromise ====>"
                + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
            expect(typeof (queryPromise)).assertEqual("object");
            console.log('ACTS_Query_0100====<end');
            done();
        } catch (err) {
            console.error('=ACTS_Query_0100 query catch(err)====>:' + err);
            console.log('ACTS_Query_0100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0200
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Query_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            await DAHelper.query(
                dataAbilityUri,
                columnsArray,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Query_0200 query err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(data) + (" 】;") + " , " + data);
                    expect(typeof (data)).assertEqual("object");
                    console.log('ACTS_Query_0200====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Query_0200 catch(err)====>:' + err);
            console.log('ACTS_Query_0200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0300
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            let queryPromise = DAHelper.query(
                dataAbilityUri,
                columnsArray,
                predicates
            );
            console.debug("=ACTS_Query_0300 queryPromise ====>"
                + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
            expect(typeof (queryPromise)).assertEqual("object");
            console.log('ACTS_Query_0300====<end');
            done();
        } catch (err) {
            console.error('=ACTS_Query_0300 query catch(err)====>:' + err);
            console.log('ACTS_Query_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0400
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Query_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            await DAHelper.query(
                dataAbilityUri,
                columnsArray,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Query_0400 query err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(data) + (" 】;") + " , " + data);
                    expect(typeof (data)).assertEqual("object");
                    console.log('ACTS_Query_0400====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Query_0400 catch(err)====>:' + err);
            console.log('ACTS_Query_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0500
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0500====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            let queryPromise = DAHelper.query(
                undefined,
                columnsArray,
                predicates
            );
            console.debug("=ACTS_Query_0500 queryPromise ====>"
                + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
            expect(typeof (queryPromise)).assertEqual("object");
            console.log('ACTS_Query_0500====<end');
            done();
        } catch (err) {
            console.error('=ACTS_Query_0500 query catch(err)====>:' + err);
            console.log('ACTS_Query_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0600
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Query_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            await DAHelper.query(
                undefined,
                columnsArray,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Query_0600 query err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(data) + (" 】;") + " , " + data);
                    expect(typeof (data)).assertEqual("object");
                    console.log('ACTS_Query_0600====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Query_0600 catch(err)====>:' + err);
            console.log('ACTS_Query_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0700
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0700====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            let queryPromise = DAHelper.query(
                "error_uri",
                columnsArray,
                predicates
            );
            console.debug("=ACTS_Query_0700 queryPromise ====>"
                + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
            expect(typeof (queryPromise)).assertEqual("object");
            console.log('ACTS_Query_0700====<end');
            done();
        } catch (err) {
            console.error('=ACTS_Query_0700 query catch(err)====>:' + err);
            console.log('ACTS_Query_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0800
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Query_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            await DAHelper.query(
                "error_uri",
                columnsArray,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Query_0800 query err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(data) + (" 】;") + " , " + data);
                    expect(typeof (data)).assertEqual("object");
                    console.log('ACTS_Query_0800====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Query_0800 catch(err)====>:' + err);
            console.log('ACTS_Query_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_0900
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_0900====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            let queryPromise = DAHelper.query(
                123456,
                columnsArray,
                predicates
            );
            console.debug("=ACTS_Query_0900 queryPromise ====>"
                + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
            expect(typeof (queryPromise)).assertEqual("object");
            console.log('ACTS_Query_0900====<end');
            done();
        } catch (err) {
            console.error('=ACTS_Query_0900 query catch(err)====>:' + err);
            console.log('ACTS_Query_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_1000
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Query_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            await DAHelper.query(
                123456,
                columnsArray,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Query_1000 query err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(data) + (" 】;") + " , " + data);
                    expect(typeof (data)).assertEqual("object");
                    console.log('ACTS_Query_1000====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Query_1000 catch(err)====>:' + err);
            console.log('ACTS_Query_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_1100
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_1100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            let queryPromise = DAHelper.query(
                dataAbilityUri2,
                columnsArray,
                predicates
            );
            console.debug("=ACTS_Query_1100 queryPromise ====>"
                + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
            expect(typeof (queryPromise)).assertEqual("object");
            console.log('ACTS_Query_1100====<end');
            done();
        } catch (err) {
            console.error('=ACTS_Query_1100 query catch(err)====>:' + err);
            console.log('ACTS_Query_1100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_1200
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Query_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_1200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("value1", "value2", "value3", "value4")
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            await DAHelper.query(
                dataAbilityUri2,
                columnsArray,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Query_1200 query err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(data) + (" 】;") + " , " + data);
                    expect(typeof (data)).assertEqual("object");
                    console.log('ACTS_Query_1200====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Query_1200 catch(err)====>:' + err);
            console.log('ACTS_Query_1200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_1300
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_1300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = "value1";
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            let queryPromise = DAHelper.query(
                dataAbilityUri,
                columnsArray,
                predicates
            );
            console.debug("=ACTS_Query_1300 queryPromise ====>"
                + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
            expect(typeof (queryPromise)).assertEqual("object");
            console.log('ACTS_Query_1300====<end');
            done();
        } catch (err) {
            console.error('=ACTS_Query_1300 query catch(err)====>:' + err);
            console.log('ACTS_Query_1300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_1400
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Query_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Query_1400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = "value1";
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            await DAHelper.query(
                dataAbilityUri,
                columnsArray,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Query_1400 query err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(data) + (" 】;") + " , " + data);
                    expect(typeof (data)).assertEqual("object");
                    console.log('ACTS_Query_1400====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Query_1400 catch(err)====>:' + err);
            console.log('ACTS_Query_1400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Query_1500
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_1500', Level.LEVEL0, async function (done) {
      console.log('ACTS_Query_1500====<begin');
      expect(typeof (DAHelper)).assertEqual("object");
      try {
          let queryPromise = DAHelper.query(
              dataAbilityUri
          );
          console.debug("=ACTS_Query_1500 queryPromise ====>"
              + ("json queryPromise 【") + JSON.stringify(queryPromise) + (" 】 ") + " , " + queryPromise);
          expect(typeof (queryPromise)).assertEqual("object");
          console.log('ACTS_Query_1500====<end');
          done();
      } catch (err) {
          console.error('=ACTS_Query_1500 query catch(err)====>:' + err);
          console.log('ACTS_Query_1500====<end catch');
          expect(false).assertTrue();
          done();
      }
  })
  
    /*
    * @tc.number: ACTS_Update_0100
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Update_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let valueBucketNull = {};
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            console.debug("=ACTS_Update_0100 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.update(
                dataAbilityUri,
                valueBucketNull,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Update_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-2);
                console.log('ACTS_Update_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Update_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.log('ACTS_Update_0100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_Update_0100 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Update_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0200
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Update_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        try {
            let valueBucketNull = {};
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            console.debug("=ACTS_Update_0200 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.update(
                dataAbilityUri,
                valueBucketNull,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Update_0200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-2);
                    console.log('ACTS_Update_0200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_Update_0200 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Update_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0300
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Update_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_0300 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.update(
                dataAbilityUri,
                valueBucket,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Update_0300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(1);
                console.log('ACTS_Update_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Update_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Update_0300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Update_0300 update catch(err)====>:' + err);
            console.log('ACTS_Update_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0400
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Update_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_0400 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.update(
                dataAbilityUri,
                valueBucket,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Update_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(1);
                    console.log('ACTS_Update_0400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_Update_0400 catch(err)====>:' + err);
            console.log('ACTS_Update_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0500
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Update_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0500====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_0500 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.update(
                undefined,
                valueBucket,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Update_0500 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0);
                console.log('ACTS_Update_0500====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Update_0500 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Update_0500====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Update_0500 update catch(err)====>:' + err);
            console.log('ACTS_Update_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0600
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Update_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_0600 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.update(
                undefined,
                valueBucket,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Update_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    expect(data).assertEqual(0);
                    console.log('ACTS_Update_0600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_Update_0600 catch(err)====>:' + err);
            console.log('ACTS_Update_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0700
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Update_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0700====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        var currentAlertTimeout;
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_0700 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.update(
                dataAbilityUri,
                valueBucket,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Update_0700 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(1);
                currentAlertTimeout = setTimeout(() => {
                    console.log('ACTS_Update_0700====<end update');
                    done();
                }, gSetTimeout);
            }).catch((err) => {
                console.debug("=ACTS_Update_0700 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 ") + err);
                console.log('ACTS_Update_0700====<end .catch');
                expect(".catch").assertEqual(err);
                done();
            });
        } catch (err) {
            console.error('=ACTS_Update_0700 update catch(err)====>:' + err);
            console.log('ACTS_Update_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0800
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Update_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        var currentAlertTimeout;
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_0800 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.update(
                dataAbilityUri,
                valueBucket,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Update_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(1);
                    currentAlertTimeout = setTimeout(() => {
                        console.log('ACTS_Update_0800====<end update');
                        done();
                    }, gSetTimeout);
                },
            );
        } catch (err) {
            console.error('=ACTS_Update_0800 catch(err)====>:' + err);
            console.log('ACTS_Update_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0900
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Update_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_0900====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_0900 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.update(
                123456,
                valueBucket,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Update_0900 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0);
                console.log('ACTS_Update_0900====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Update_0900 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Update_0900====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Update_0900 update catch(err)====>:' + err);
            console.log('ACTS_Update_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_1000
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Update_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_1000 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.update(
                123456,
                valueBucket,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Update_1000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    expect(data).assertEqual(0);
                    console.log('ACTS_Update_1000====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_Update_1000 catch(err)====>:' + err);
            console.log('ACTS_Update_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_Update_1100
     * @tc.name: Updates one or more data records in the database.
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_Update_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_1100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_1100 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.update(
                dataAbilityUri2,
                valueBucket,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Update_1100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-1);
                console.log('ACTS_Update_1100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Update_1100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Update_1100====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Update_1100 update catch(err)====>:' + err);
            console.log('ACTS_Update_1100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_1200
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Update_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_1200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_1200 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.update(
                dataAbilityUri2,
                valueBucket,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Update_1200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Update_1200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_Update_1200 catch(err)====>:' + err);
            console.log('ACTS_Update_1200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_Update_1300
     * @tc.name: Updates one or more data records in the database.
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_Update_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_1300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_1300 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.update(
                "error_uri",
                valueBucket,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Update_1300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-1);
                console.log('ACTS_Update_1300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Update_1300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Update_1300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Update_1300 update catch(err)====>:' + err);
            console.log('ACTS_Update_1300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_1400
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Update_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Update_1400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Update_1400 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.update(
                "error_uri",
                valueBucket,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Update_1400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Update_1400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_Update_1400 catch(err)====>:' + err);
            console.log('ACTS_Update_1400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

     /*
    * @tc.number: ACTS_Update_1500
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
     it('ACTS_Update_1500', Level.LEVEL0, async function (done) {
      console.log('ACTS_Update_1500====<begin');
      expect(typeof (DAHelper)).assertEqual("object");
      console.log('featureAbility Update getDataAbilityHelper ====>: ' + DAHelper)
      try {
          let valueBucketNull = {};
          console.debug("=ACTS_Update_1500 predicates====>"
              + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
          DAHelper.update(
              dataAbilityUri,
              valueBucketNull
          ).then((data) => {
              console.debug("=ACTS_Update_1500 then data====>"
                  + ("json data 【") + JSON.stringify(data) + (" 】"));
              expect(data).assertEqual(-2);
              console.log('ACTS_Update_1500====<end');
              done();
          }).catch((err) => {
              console.debug("=ACTS_Update_1500 catch err ====>"
                  + ("json err 【") + JSON.stringify(err) + (" 】 "));
              expect(false).assertFalse();;
              console.log('ACTS_Update_1500====<end .catch');
              done();
          });
      } catch (err) {
          console.error('=ACTS_Update_1500 catch(err)====>:' + err);
          expect(false).assertFalse();;
          console.log('ACTS_Update_1500====<end catch');
          done();
      }
  })

    /*
    * @tc.number: ACTS_Delete_0100
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Delete_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            console.debug("=ACTS_Delete_0100 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.delete(
                dataAbilityUri,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Delete_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(1);
                console.log('ACTS_Delete_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Delete_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.log('ACTS_Delete_0100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_Delete_0100 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_0200
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Delete_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            console.debug("=ACTS_Delete_0200 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.delete(
                dataAbilityUri,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Delete_0200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(1);
                    console.log('ACTS_Delete_0200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_Delete_0200 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_0300
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Delete_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0300====<begin');
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_0300 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.delete(
                dataAbilityUri,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Delete_0300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(1);
                console.log('ACTS_Delete_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Delete_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Delete_0300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Delete_0300 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_0300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_0400
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Delete_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_0400 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.delete(
                dataAbilityUri,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Delete_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(1);
                    console.log('ACTS_Delete_0400====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Delete_0400 catch(err)====>:' + err);
            console.log('ACTS_Delete_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_Delete_0500
     * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_Delete_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0500====<begin');
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_0500 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.delete(
                undefined,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Delete_0500 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0);
                console.log('ACTS_Delete_0500====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Delete_0500 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Delete_0500====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Delete_0500 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_0500====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_0600
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Delete_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_0600 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.delete(
                undefined,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Delete_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    expect(data).assertEqual(0);
                    console.log('ACTS_Delete_0600====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Delete_0600 catch(err)====>:' + err);
            console.log('ACTS_Delete_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_0700
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Delete_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0700====<begin');
        var currentAlertTimeout;
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_0700 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.delete(
                dataAbilityUri,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Delete_0700 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(1);
                currentAlertTimeout = setTimeout(() => {
                    console.log('ACTS_Delete_0700====<end delete');
                    done();
                }, gSetTimeout);
            }).catch((err) => {
                console.debug("=ACTS_Delete_0700 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Delete_0700====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Delete_0700 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_0700====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_0800
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Delete_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        var currentAlertTimeout;
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_0800 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.delete(
                dataAbilityUri,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Delete_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(1);
                    currentAlertTimeout = setTimeout(() => {
                        console.log('ACTS_Delete_0800====<end delete');
                        done();
                    }, gSetTimeout);
                });
        } catch (err) {
            console.error('=ACTS_Delete_0800 catch(err)====>:' + err);
            console.log('ACTS_Delete_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_Delete_0900
     * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_Delete_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_0900====<begin');
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_0900 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.delete(
                dataAbilityUri2,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Delete_0900 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-1);
                console.log('ACTS_Delete_0900====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Delete_0900 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Delete_0900====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Delete_0900 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_0900====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_1000
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Delete_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_1000 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.delete(
                dataAbilityUri2,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Delete_1000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Delete_1000====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Delete_1000 catch(err)====>:' + err);
            console.log('ACTS_Delete_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_Delete_1100
     * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_Delete_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_1100====<begin');
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_1100 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.delete(
                "error",
                predicates
            ).then((data) => {
                console.debug("=ACTS_Delete_1100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-1);
                console.log('ACTS_Delete_1100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Delete_1100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Delete_1100====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Delete_1100 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_1100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_1200
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Delete_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_1200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_1200 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.delete(
                "error",
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Delete_1200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_Delete_1200====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Delete_1200 catch(err)====>:' + err);
            console.log('ACTS_Delete_1200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_Delete_1300
     * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
     * @tc.desc: Check the return value of the interface (by Promise)
     */
    it('ACTS_Delete_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_1300====<begin');
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_1300 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            DAHelper.delete(
                123456,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Delete_1300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0);
                console.log('ACTS_Delete_1300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_Delete_1300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Delete_1300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Delete_1300 catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_Delete_1300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_Delete_1400
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_Delete_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_Delete_1400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);
            console.debug("=ACTS_Delete_1400 predicates====>"
                + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
            await DAHelper.delete(
                123456,
                predicates,
                (err, data) => {
                    console.debug("=ACTS_Delete_1400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    console.log('ACTS_Delete_1400====<end');
                    done();
                });
        } catch (err) {
            console.error('=ACTS_Delete_1400 catch(err)====>:' + err);
            console.log('ACTS_Delete_1400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

         /*
    * @tc.number: ACTS_Delete_1500
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
         it('ACTS_Delete_1500', Level.LEVEL0, async function (done) {
          console.log('ACTS_Delete_1500====<begin');
          expect(typeof (DAHelper)).assertEqual("object");
          console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper)
          try {
              console.debug("=ACTS_Delete_1500 predicates====>"
                  + ("json predicates 【") + JSON.stringify(predicates) + (" 】") + " , " + predicates);
              DAHelper.delete(
                  dataAbilityUri
              ).then((data) => {
                  console.debug("=ACTS_Delete_1500 then data====>"
                      + ("json data 【") + JSON.stringify(data) + (" 】"));
                  expect(data).assertEqual(1);
                  console.log('ACTS_Delete_1500====<end');
                  done();
              }).catch((err) => {
                  console.debug("=ACTS_Delete_1500 catch err ====>"
                      + ("json err 【") + JSON.stringify(err) + (" 】 "));
                  expect(false).assertFalse();
                  console.log('ACTS_Delete_1500====<end .catch');
                  done();
              });
          } catch (err) {
              console.error('=ACTS_Delete_1500 catch(err)====>:' + err);
              expect(false).assertFalse();
              console.log('ACTS_Delete_1500====<end catch');
              done();
          }
      })
    /*
    * @tc.number: ACTS_GetFileTypes_0100
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0100====<begin');
        let mimeTypeFilter = '*/*'
        try {
            var promise = DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_0100 getFileTypes then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(3);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i])).assertEqual("string");
                    console.log('=ACTS_GetFileTypes_0100 for data[' + i + '] ====>: ' + data[i])
                    if (i == 0) {
                        expect(data[i]).assertEqual("hap");
                    } else if (i == 1) {
                        expect(data[i]).assertEqual("jpg");
                    } else if (i == 2) {
                        expect(data[i]).assertEqual("image/png");
                    }
                }
                console.log('ACTS_GetFileTypes_0100====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_0100 getFileTypes catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetFileTypes_0100====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0100 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0200
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = '*/*'
        try {
            await DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_0200 getFileTypes err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_0200 data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(3);
                    for (var i = 0; i < data.length; i++) {
                        expect(typeof (data[i])).assertEqual("string");
                        console.log('=ACTS_GetFileTypes_0200 for data ====>: ' + err.code +
                            " data[" + i + "]: " + data[i]);
                        if (i == 0) {
                            expect(data[i]).assertEqual("hap");
                        } else if (i == 1) {
                            expect(data[i]).assertEqual("jpg");
                        } else if (i == 2) {
                            expect(data[i]).assertEqual("image/png");
                        }
                    }
                    console.log('ACTS_GetFileTypes_0200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0200 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0300
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0300====<begin');
        let mimeTypeFilter = 'image/*'
        try {
            var promise = DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_0300  then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(1);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i])).assertEqual("string");
                    console.log('= =ACTS_GetFileTypes_0300 for data[' + i + '] ====>: ' + data[i])
                    if (i == 0) {
                        expect(data[i]).assertEqual("image/png");
                    }
                }
                console.log('ACTS_GetFileTypes_0300====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('DataAbilityHelper getFileTypes error ====>: ' + err)
                console.log('ACTS_GetFileTypes_0300====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0300 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0400
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = 'image/*'
        try {
            await DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('DataAbilityHelper  getFileTypes data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(1);
                    for (var i = 0; i < data.length; i++) {
                        expect(typeof (data[i])).assertEqual("string");
                        console.log('=ACTS_GetFileTypes_0400 for ====>: '
                            + err.code + " data[" + i + "]: " + data[i]);
                        if (i == 0) {
                            expect(data[i]).assertEqual("image/png");
                        }
                    }
                    console.log('ACTS_GetFileTypes_0400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0400 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0500
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0500====<begin');
        let mimeTypeFilter = '*/jpg'
        try {
            var promise = DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_0500 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(1);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i])).assertEqual("string");
                    console.log('=ACTS_GetFileTypes_0500 for data [' + i + '] ====>: ' + data[i])
                    if (i == 0) {
                        expect(data[i]).assertEqual("jpg");
                    }
                }
                console.log('ACTS_GetFileTypes_0500====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_0500  catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('DataAbilityHelper getFileTypes error ====>: ' + err)
                console.log('ACTS_GetFileTypes_0500====<end .catch');
                done();
            });
            console.log('=ACTS_GetFileTypes_0500 promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0500 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0600
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0600====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = '*/jpg'
        try {
            await DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_0600 data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(1);
                    for (var i = 0; i < data.length; i++) {
                        console.log('=ACTS_GetFileTypes_0600 for errCode ====>: ' + err.code +
                            " data[" + i + "]: " + data[i]);
                        if (i == 0)
                            expect(data[i]).assertEqual("jpg");
                    }
                    console.log('ACTS_GetFileTypes_0600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0600 catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0700
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0700====<begin');
        let mimeTypeFilter = '*/*'
        try {
            var promise = DAHelper.getFileTypes(
                undefined,
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_0700 getFileTypes then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(0);
                console.log('ACTS_GetFileTypes_0700====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_0700 getFileTypes catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetFileTypes_0700====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0700 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0800
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = '*/*'
        try {
            await DAHelper.getFileTypes(
                undefined,
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_0800 getFileTypes err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_0800 data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(0);
                    console.log('ACTS_GetFileTypes_0800====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0800 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_0900
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_0900====<begin');
        try {
            var promise = DAHelper.getFileTypes(
                dataAbilityUri,
                undefined,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_0900 getFileTypes then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                for (var i = 0; i < data.length; i++) {
                    expect(typeof (data[i])).assertEqual("string");
                    console.log('=ACTS_GetFileTypes_0900 for data[' + i + '] ====>: ' + data[i])
                    if (i == 0) {
                        expect(data[i]).assertEqual("");
                    }
                }
                console.log('ACTS_GetFileTypes_0900====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_0900 getFileTypes catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetFileTypes_0900====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_0900 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1000
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.getFileTypes(
                dataAbilityUri,
                undefined,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_1000 getFileTypes err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_1000 data.length ====>: ' + data.length);
                    for (var i = 0; i < data.length; i++) {
                        expect(typeof (data[i])).assertEqual("string");
                        console.log('=ACTS_GetFileTypes_1000 for data ====>: ' + err.code +
                            " data[" + i + "]: " + data[i]);
                        if (i == 0) {
                            expect(data[i]).assertEqual("");
                        }
                    }
                    console.log('ACTS_GetFileTypes_1000====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1000 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1100
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1100====<begin');
        let mimeTypeFilter = '*/*'
        try {
            var promise = DAHelper.getFileTypes(
                "error_uri",
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_1100 getFileTypes then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(0);
                console.log('ACTS_GetFileTypes_1100====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_1100 getFileTypes catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetFileTypes_1100====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1100 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1200
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = '*/*'
        try {
            await DAHelper.getFileTypes(
                "error_uri",
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_1200 getFileTypes err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_1200 data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(0);
                    console.log('ACTS_GetFileTypes_1200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1200 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1300
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1300====<begin');
        let mimeTypeFilter = '*/*'
        try {
            var promise = DAHelper.getFileTypes(
                123456,
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_1300 getFileTypes then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(0);
                console.log('ACTS_GetFileTypes_1300====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_1300 getFileTypes catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetFileTypes_1300====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1300 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1400
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = '*/*'
        try {
            await DAHelper.getFileTypes(
                123456,
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_1400 getFileTypes err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_1400 data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(0);
                    console.log('ACTS_GetFileTypes_1400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1400 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1500
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_1500', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1500====<begin');
        let mimeTypeFilter = 'asdfasdEDF)(#@*7fasdf546546a1ds3v16a4sd6v54@*(e7';
        try {
            var promise = DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_1500 getFileTypes then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(0);
                console.log('ACTS_GetFileTypes_1500====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_1500 getFileTypes catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetFileTypes_1500====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1500 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1600
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_1600', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = 'asdfasdEDF)(#@*7fasdf546546a1ds3v16a4sd6v54@*(e7';
        try {
            await DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_1600 getFileTypes err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_1600 data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(0);
                    console.log('ACTS_GetFileTypes_1600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1600 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1700
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetFileTypes_1700', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1700====<begin');
        let mimeTypeFilter = 'returnUndefined';
        try {
            var promise = DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
            ).then((data) => {
                console.debug("=ACTS_GetFileTypes_1700 getFileTypes then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                console.log('DataAbilityHelper getFileTypes data.length ====>: ' + data.length);
                expect(data.length).assertEqual(0);
                console.log('ACTS_GetFileTypes_1700====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetFileTypes_1700 getFileTypes catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetFileTypes_1700====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getFileTypes promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1700 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetFileTypes_1800
    * @tc.name: Obtains the MIME type of files.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetFileTypes_1800', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetFileTypes_1800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getFileTypes getDataAbilityHelper ====>: ' + DAHelper)
        let mimeTypeFilter = 'returnUndefined';
        try {
            await DAHelper.getFileTypes(
                dataAbilityUri,
                mimeTypeFilter,
                (err, data) => {
                    console.debug("=ACTS_GetFileTypes_1800 getFileTypes err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    console.log('=ACTS_GetFileTypes_1800 data.length ====>: ' + data.length);
                    expect(data.length).assertEqual(0);
                    console.log('ACTS_GetFileTypes_1800====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetFileTypes_1800 getFileTypes AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetFileTypes_1800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_0100
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetType_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0100====<begin');
        try {
            var promise = DAHelper.getType(
                dataAbilityUri,
            ).then(data => {
                console.debug("=ACTS_GetType_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(dataAbilityUri);
                console.log('ACTS_GetType_0100====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetType_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetType_0100====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getType promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetType_0100 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_0200
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetType_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0200====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility GetType getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.getType(
                dataAbilityUri,
                (err, data) => {
                    console.debug("=ACTS_GetType_0200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(dataAbilityUri);
                    console.log('ACTS_GetType_0200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetType_0200 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_GetType_0300
* @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
* @tc.desc: Check the return value of the interface (by promise)
*/
    it('ACTS_GetType_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0300====<begin');
        try {
            var promise = DAHelper.getType(
                undefined,
            ).then(data => {
                console.debug("=ACTS_GetType_0300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_GetType_0300====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetType_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetType_0300====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getType promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetType_0300 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_0400
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetType_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility GetType getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.getType(
                undefined,
                (err, data) => {
                    console.debug("=ACTS_GetType_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_GetType_0400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetType_0400 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
* @tc.number: ACTS_GetType_0500
* @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
* @tc.desc: Check the return value of the interface (by promise)
*/
    it('ACTS_GetType_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0500====<begin');
        try {
            var promise = DAHelper.getType(
                123456,
            ).then(data => {
                console.debug("=ACTS_GetType_0500 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_GetType_0500====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetType_0500 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetType_0500====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getType promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetType_0500 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_0600
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetType_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility GetType getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.getType(
                123456,
                (err, data) => {
                    console.debug("=ACTS_GetType_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_GetType_0600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetType_0600 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_0700
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetType_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0700====<begin');
        try {
            var promise = DAHelper.getType(
                "error_uri",
            ).then(data => {
                console.debug("=ACTS_GetType_0700 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_GetType_0700====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetType_0700 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetType_0700====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getType promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetType_0700 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_0800
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetType_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility GetType getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.getType(
                "error_uri",
                (err, data) => {
                    console.debug("=ACTS_GetType_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_GetType_0800====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetType_0800 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_0900
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_GetType_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_0900====<begin');
        try {
            var promise = DAHelper.getType(
                dataAbilityUri3,
            ).then(data => {
                console.debug("=ACTS_GetType_0900 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_GetType_0900====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_GetType_0900 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_GetType_0900====<end .catch');
                expect(false).assertTrue();
                done();
            });
            console.log('featureAbility getType promise ====>: ' + promise)
        } catch (err) {
            console.error('=ACTS_GetType_0900 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_GetType_1000
    * @tc.name: Obtains the MIME type matching the data specified by the URI of the Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_GetType_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_GetType_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility GetType getDataAbilityHelper ====>: ' + DAHelper)
        try {
            await DAHelper.getType(
                dataAbilityUri3,
                (err, data) => {
                    console.debug("=ACTS_GetType_1000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_GetType_1000====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_GetType_1000 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_GetType_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_OpenFile_0100
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0100====<begin');
        let ret = false;
        var mode = "r";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(typeof (data)).assertEqual("number")
                ret = true
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_0100 getType catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0100====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0200
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0200====<begin');
        let ret = false;
        var mode = "w";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_0200 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(typeof (data)).assertEqual("number")
                console.log('DataAbilityHelper ACTS_OpenFile_0200 OpenFile promise ====>: ' + data)
                ret = true
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_0200 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_0200 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0200====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0300
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0300====<begin');
        let ret = false;
        var mode = "wt";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_0300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(typeof (data)).assertEqual("number")
                console.log('DataAbilityHelper ACTS_OpenFile_0300 OpenFile promise ====>: ' + data)
                ret = true
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_0300 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0300====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0400
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0400====<begin');
        let ret = false;
        var mode = "wa";
        try {
            var promise = DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_0400 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(typeof (data)).assertEqual("number")
                console.log('DataAbilityHelper ACTS_OpenFile_0400 OpenFile promise ====>: ' + data)
                ret = true
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_0400 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_0400 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0400====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0500
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0500====<begin');
        let ret = false;
        var mode = "rw";
        try {
            var promise = DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_0500 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(typeof (data)).assertEqual("number")
                console.log('DataAbilityHelper ACTS_OpenFile_0500 OpenFile promise ====>: ' + data)
                ret = true
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_0500 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_0500 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0500====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0600
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0600====<begin');
        let ret = false;
        var mode = "rwt";
        try {
            var promise = DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_0600 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(typeof (data)).assertEqual("number")
                console.log('DataAbilityHelper ACTS_OpenFile_0600 OpenFile promise ====>: ' + data)
                ret = true
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_0600 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_0600 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0600====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0700
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0700====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_0700 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "r";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_0700 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(typeof (data)).assertEqual("number");
                    console.log('DataAbilityHelper ACTS_OpenFile_0700 OpenFile asyncCallback errCode ====>: '
                        + err.code + " data: " + data);
                    ret = true
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_0700 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0700====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0800
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0800====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_0800 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "w";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(typeof (data)).assertEqual("number");
                    console.log('DataAbilityHelper ACTS_OpenFile_0800 OpenFile asyncCallback errCode ====>: '
                        + err.code + " data: " + data);
                    ret = true
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_0800 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0800====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_0900
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_0900====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_0900 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "wt";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_0900 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(typeof (data)).assertEqual("number");
                    console.log('DataAbilityHelper ACTS_OpenFile_0900 OpenFile asyncCallback errCode ====>: '
                        + err.code + " data: " + data);
                    ret = true
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_0900 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_0900====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_1000
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1000====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_1000 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "wa";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_1000 err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(typeof (data)).assertEqual("number");
                    console.log('DataAbilityHelper ACTS_OpenFile_1000 OpenFile asyncCallback errCode ====>: '
                        + err.code + " data: " + data);
                    ret = true
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_1000 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_1000====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_1100
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1100====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_1100 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "rw";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_1100 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(typeof (data)).assertEqual("number");
                    ret = true
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_1100 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_1100====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_1200
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1200====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_1200 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "rwt";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_1200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(typeof (data)).assertEqual("number");
                    ret = true
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_1200 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_1200====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_1300
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1300====<begin');
        let ret = false;
        var mode = "rwt";
        try {
            DAHelper.openFile(
                undefined,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_1300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(0)
                ret = true
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_1300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                ret = false
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_1300 getType catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_1300====<end');
    })

    /*
* @tc.number: ACTS_OpenFile_1400
* @tc.name: Opens a file. This method should be implemented by a Data ability.
* @tc.desc: Check the return value of the interface (by AsyncCallback)
*/
    it('ACTS_OpenFile_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1400====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_1400 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "rwt";
        try {
            DAHelper.openFile(
                undefined,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_1400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    ret = true
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_1400 getType AsyncCallback catch(err)====>:' + err);
            ret = false
            expect(false).assertTrue();
            done();
        }
        setTimeout(function () {
            console.log('setTimeout function====<');
        }, gSetTimeout);
        console.log('ACTS_OpenFile_1400====<end');
    })

    /*
    * @tc.number: ACTS_OpenFile_1500
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_1500', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1500====<begin');
        try {
            DAHelper.openFile(
                dataAbilityUri,
                undefined,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_1500 then data val is====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-3)
                console.log('ACTS_OpenFile_1500====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_1500 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_OpenFile_1500====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_1500 getType catch(err)====>:' + err);
            console.log('ACTS_OpenFile_1500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_OpenFile_1600
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_1600', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_1600 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.openFile(
                dataAbilityUri,
                undefined,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_1600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-3);
                    console.log('ACTS_OpenFile_1600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_1600 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_OpenFile_1600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_OpenFile_1700
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_1700', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1700====<begin');
        var mode = "A1@k#4%$,.<>)(oioiu*((*&(&*giIGT^%&^Ug;sdfk;losd*7873iug8%&^$&%]ERFUy&^%&&R7";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_1700 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-2)
                console.log('ACTS_OpenFile_1700====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_1700 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_OpenFile_1700====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_1700 getType catch(err)====>:' + err);
            console.log('ACTS_OpenFile_1700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_OpenFile_1800
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_1800', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_1800 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "A1@k#4%$,.<>)(oioiu*((*&(&*giIGT^%&^Ug;sdfk;losd*7873iug8%&^$&%]ERFUy&^%&&R7";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_1800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-2);
                    console.log('ACTS_OpenFile_1800====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_1800 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_OpenFile_1800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_OpenFile_1900
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_1900', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_1900====<begin');
        var mode = "rwt";
        try {
            DAHelper.openFile(
                dataAbilityUri2,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_1900 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(-1)
                console.log('ACTS_OpenFile_1900====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_1900 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_OpenFile_1900====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_1900 getType catch(err)====>:' + err);
            console.log('ACTS_OpenFile_1900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_OpenFile_2000
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OpenFile_2000', Level.LEVEL0, async function (done) {
        console.log('ACTS_OpenFile_2000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility ACTS_OpenFile_2000 OpenFile getDataAbilityHelper ====>: ' + DAHelper)
        var mode = "rwt";
        try {
            DAHelper.openFile(
                dataAbilityUri2,
                mode,
                (err, data) => {
                    console.debug("=ACTS_OpenFile_2000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(-1);
                    console.log('ACTS_OpenFile_2000====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_OpenFile_2000 getType AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_OpenFile_2000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_NormalizeUri_0100
    * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_NormalizeUri_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0100====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                dataAbilityUri,
            ).then((data) => {
                console.debug("=ACTS_NormalizeUri_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(dataAbilityUri);
                console.log('ACTS_NormalizeUri_0100====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_NormalizeUri_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_NormalizeUri_0100====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0100 normalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })


    /*
   * @tc.number: ACTS_NormalizeUri_0200
   * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
   * @tc.desc: Check the return value of the interface (by AsyncCallback)
   */
    it('ACTS_NormalizeUri_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0200====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                dataAbilityUri,
                (err, data) => {
                    console.debug("=ACTS_NormalizeUri_0200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(typeof (data)).assertEqual("string");
                    expect(data).assertEqual(dataAbilityUri);
                    console.log('ACTS_NormalizeUri_0200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0200 normalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_NormalizeUri_0300
    * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_NormalizeUri_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0300====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                undefined,
            ).then((data) => {
                console.debug("=ACTS_NormalizeUri_0300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_NormalizeUri_0300====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_NormalizeUri_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_NormalizeUri_0300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0300 normalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })


    /*
   * @tc.number: ACTS_NormalizeUri_0400
   * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
   * @tc.desc: Check the return value of the interface (by AsyncCallback)
   */
    it('ACTS_NormalizeUri_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                undefined,
                (err, data) => {
                    console.debug("=ACTS_NormalizeUri_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    console.log('ACTS_NormalizeUri_0400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0400 normalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_NormalizeUri_0500
    * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_NormalizeUri_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0500====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                123456,
            ).then((data) => {
                console.debug("=ACTS_NormalizeUri_0500 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_NormalizeUri_0500====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_NormalizeUri_0500 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_NormalizeUri_0500====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0500 normalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })


    /*
   * @tc.number: ACTS_NormalizeUri_0600
   * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
   * @tc.desc: Check the return value of the interface (by AsyncCallback)
   */
    it('ACTS_NormalizeUri_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                123456,
                (err, data) => {
                    console.debug("=ACTS_NormalizeUri_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(err.code).assertEqual(-1);
                    console.log('ACTS_NormalizeUri_0600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0600 normalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_NormalizeUri_0700
    * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_NormalizeUri_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0700====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                "errorUri",
            ).then((data) => {
                console.debug("=ACTS_NormalizeUri_0700 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_NormalizeUri_0700====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_NormalizeUri_0700 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_NormalizeUri_0700====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0700 normalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
   * @tc.number: ACTS_NormalizeUri_0800
   * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
   * @tc.desc: Check the return value of the interface (by AsyncCallback)
   */
    it('ACTS_NormalizeUri_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                "errorUri",
                (err, data) => {
                    console.debug("=ACTS_NormalizeUri_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_NormalizeUri_0800====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0800 normalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_NormalizeUri_0900
    * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_NormalizeUri_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_0900====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                dataAbilityUri3,
            ).then((data) => {
                console.debug("=ACTS_NormalizeUri_0900 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_NormalizeUri_0900====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_NormalizeUri_0900 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_NormalizeUri_0900====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_NormalizeUri_0900 normalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
   * @tc.number: ACTS_NormalizeUri_1000
   * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
   * @tc.desc: Check the return value of the interface (by AsyncCallback)
   */
    it('ACTS_NormalizeUri_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_NormalizeUri_1000====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.normalizeUri(
                dataAbilityUri3,
                (err, data) => {
                    console.debug("=ACTS_NormalizeUri_1000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_NormalizeUri_1000====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_NormalizeUri_1000 normalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_NormalizeUri_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DenormalizeUri_0100
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_DenormalizeUri_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0100====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                dataAbilityUri,
            ).then((data) => {
                console.debug("=ACTS_DenormalizeUri_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(dataAbilityUri);
                console.log('ACTS_DenormalizeUri_0100====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_DenormalizeUri_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_DenormalizeUri_0100====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0100 denormalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DenormalizeUri_0200
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DenormalizeUri_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0200====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                dataAbilityUri,
                (err, data) => {
                    console.debug("=ACTS_DenormalizeUri_0200 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual(dataAbilityUri);
                    console.log('ACTS_DenormalizeUri_0200====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0200 denormalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0200====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_DenormalizeUri_0300
     * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_DenormalizeUri_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0300====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                undefined,
            ).then((data) => {
                console.debug("=ACTS_DenormalizeUri_0300 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_DenormalizeUri_0300====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_DenormalizeUri_0300 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_DenormalizeUri_0300====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0300 denormalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0300====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DenormalizeUri_0400
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DenormalizeUri_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0400====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                undefined,
                (err, data) => {
                    console.debug("=ACTS_DenormalizeUri_0400 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_DenormalizeUri_0400====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0400 denormalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0400====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_DenormalizeUri_0500
     * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_DenormalizeUri_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0500====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                "error",
            ).then((data) => {
                console.debug("=ACTS_DenormalizeUri_0500 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_DenormalizeUri_0500====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_DenormalizeUri_0500 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_DenormalizeUri_0500====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0500 denormalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0500====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DenormalizeUri_0600
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DenormalizeUri_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0600====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                "error",
                (err, data) => {
                    console.debug("=ACTS_DenormalizeUri_0600 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_DenormalizeUri_0600====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0600 denormalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0600====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number: ACTS_DenormalizeUri_0700
     * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
     * @tc.desc: Check the return value of the interface (by promise)
     */
    it('ACTS_DenormalizeUri_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0700====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                123456,
            ).then((data) => {
                console.debug("=ACTS_DenormalizeUri_0700 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_DenormalizeUri_0700====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_DenormalizeUri_0700 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_DenormalizeUri_0700====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0700 denormalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0700====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DenormalizeUri_0800
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DenormalizeUri_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0800====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                123456,
                (err, data) => {
                    console.debug("=ACTS_DenormalizeUri_0800 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_DenormalizeUri_0800====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0800 denormalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0800====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DenormalizeUri_0900
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_DenormalizeUri_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_0900====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                dataAbilityUri3,
            ).then((data) => {
                console.debug("=ACTS_DenormalizeUri_0900 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual("");
                console.log('ACTS_DenormalizeUri_0900====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_DenormalizeUri_0900 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_DenormalizeUri_0900====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_0900 denormalizeUri promise catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_0900====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_DenormalizeUri_1000
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_DenormalizeUri_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_DenormalizeUri_1000====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper)
        try {
            DAHelper.denormalizeUri(
                dataAbilityUri3,
                (err, data) => {
                    console.debug("=ACTS_DenormalizeUri_1000 err,data=======>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data) + (" 】;"));
                    expect(data).assertEqual("");
                    console.log('ACTS_DenormalizeUri_1000====<end');
                    done();
                },
            );
        } catch (err) {
            console.error('=ACTS_DenormalizeUri_1000 denormalizeUri AsyncCallback catch(err)====>:' + err);
            console.log('ACTS_DenormalizeUri_1000====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_0100
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_OnOff_0100', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0100====<begin');
        gSetTimeout = 2000;
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback0100(err) {
                expect(err.code).assertEqual(0);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0100);
                console.log('ACTS_OnOff_0100====<end');
                gSetTimeout = 500;
                done();
            }
            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0100);
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0100);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                console.debug('ACTS_OnOff_0100====< mySetTimeout');
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        console.debug("=ACTS_OnOff_0100 err=======>"
                            + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                        expect(err.code).assertEqual(0);
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0100  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0100====<end catch');
            gSetTimeout = 500;
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_0200
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_0200', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0200====<begin');
        gSetTimeout = 2000;
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback0200(err) {
                console.debug("=ACTS_OnOff_0200 onAsyncCallback0200=======>");
                expect(false).assertTrue();
                clearTimeout(currentAlertTimeout);
                console.log('ACTS_OnOff_0200====<end callback_0200');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0200);

            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0200);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_0200 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            console.log('ACTS_OnOff_0200====<end err.code');
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                expect(err.code).assertEqual(0);
                                console.log('ACTS_OnOff_0200====<end');
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0200  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_0300
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_0300', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0300====<begin');
        var currentAlertTimeout;
        var flagCallback01 = 0
        var flagCallback02 = 0
        var flagCallback03 = 0
        function onAsyncCallback0301(err) {
            expect(err.code).assertEqual(0);
            flagCallback01++;
            waitDone("onAsyncCallback0301");
        }
        function onAsyncCallback0302(err) {
            expect(err.code).assertEqual(0);
            flagCallback02++;
            waitDone("onAsyncCallback0302");
        }
        function onAsyncCallback0303(err) {
            expect(err.code).assertEqual(0);
            flagCallback03++;
            waitDone("onAsyncCallback0303");
        }
        function waitDone(caller) {
            console.debug("=ACTS_OnOff_0300 caller ====>" + caller);
            if (flagCallback01 == 1 && flagCallback02 == 1 && flagCallback03 == 1) {
                clearTimeout(currentAlertTimeout);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0301);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0302);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0303);
                console.log('ACTS_OnOff_0300====<end');
                done();
            } else if (caller == "notifyChange") {
                currentAlertTimeout = setTimeout(() => {
                    console.debug('ACTS_OnOff_0300====<setTimeout false done()');
                    expect(false).assertTrue();
                    console.log('ACTS_OnOff_0300====<end setTimeout');
                    done();
                }, gSetTimeout);
            } else {
                console.debug("=ACTS_OnOff_0300 flagCallback010203 ====>"
                    + flagCallback01 + flagCallback02 + flagCallback03);
            }
        }
        try {
            expect(typeof (DAHelper)).assertEqual("object");

            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0301);
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0302);
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0303);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        expect(err.code).assertEqual(0);
                        waitDone("notifyChange");
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0300  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0300====<end catch notify');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_0400
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_0400', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0400====<begin');
        var currentAlertTimeout;
        var flagCallback01 = 0
        var flagCallback02 = 0
        var flagCallback03 = 0
        function onAsyncCallback0401(err) {
            expect(err.code).assertEqual(0);
            flagCallback01++;
            expect(false).assertTrue();
            done()
        }
        function onAsyncCallback0402(err) {
            flagCallback02++;
            console.debug("=ACTS_OnOff_0400 flagCallback02 ====>"
                + ("json flagCallback02【") + JSON.stringify(flagCallback02) + (" 】") + " , " + flagCallback02);
            expect(false).assertTrue();
            clearTimeout(currentAlertTimeout);
            console.log('ACTS_OnOff_0400====<end callback0402');
            done();
        }
        function onAsyncCallback0403(err) {
            expect(err.code).assertEqual(0);
            flagCallback03++;
            expect(false).assertTrue();
            done()
        }
        function waitDone(caller) {
            console.debug("=ACTS_OnOff_0400 caller ====>" + caller);
            if (flagCallback01 == 0 && flagCallback02 == 0 && flagCallback03 == 0) {
                expect("notifyChange").assertEqual(caller);
                done()
            }
        }
        try {
            expect(typeof (DAHelper)).assertEqual("object");

            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0401);
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0402);
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0403);

            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0402);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        expect(err.code).assertEqual(0);
                        waitDone("notifyChange");
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0400  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0400====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_0500
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_0500', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0500====<begin');
        var currentAlertTimeout;
        function onAsyncCallback0501(err) {
            console.debug("=ACTS_OnOff_0500 err ====>"
                + ("json err【") + JSON.stringify(err) + (" 】") + " , " + err);
            expect(false).assertTrue();
            clearTimeout(currentAlertTimeout);
            console.log('ACTS_OnOff_0500====<end Callback0501');
            done();
        }
        function onAsyncCallback0502(err) {
            console.debug("=ACTS_OnOff_0500 err ====>"
                + ("json err【") + JSON.stringify(err) + (" 】") + " , " + err);
            expect(false).assertTrue();
            clearTimeout(currentAlertTimeout);
            console.log('ACTS_OnOff_0500====<end Callback0502');
            done();
        }
        function onAsyncCallback0503(err) {
            console.debug("=ACTS_OnOff_0500 err ====>"
                + ("json err") + JSON.stringify(err) + (" 】") + " , " + err);
            expect(false).assertTrue();
            clearTimeout(currentAlertTimeout);
            console.log('ACTS_OnOff_0500====<end Callback0503');
            done();
        }
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            console.log('ACTS_OnOff_0500==== on dataChange 0501');
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0501);
            console.log('ACTS_OnOff_0500==== on dataChange 0502');
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0502);
            console.log('ACTS_OnOff_0500==== on dataChange 0503');
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0503);
            console.log('ACTS_OnOff_0500==== on dataChange 0503 end');
            var mSetTimeout = 1000;
            setTimeout(mySetTimeout, mSetTimeout);
            function mySetTimeout() {
                console.log('ACTS_OnOff_0500==== off dataChange 123 begin');
                DAHelper.off("dataChange", dataAbilityUri);
                console.log('ACTS_OnOff_0500==== off dataChange 123 end');

                setTimeout(mySetTimeoutNoftify, mSetTimeout);
                function mySetTimeoutNoftify() {
                    console.log('ACTS_OnOff_0500==== notifyChange begin');
                    DAHelper.notifyChange(
                        dataAbilityUri,
                        (err) => {
                            if (err.code != 0) {
                                console.debug("=ACTS_OnOff_0500 err=======>"
                                    + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                                expect(false).assertTrue();
                                clearTimeout(currentAlertTimeout);
                                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0501);
                                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0502);
                                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0503);
                                console.log('ACTS_OnOff_0500====<end .err.code !=0');
                                done();
                            } else {
                                currentAlertTimeout = setTimeout(() => {
                                    console.debug('ACTS_OnOff_0500====<setTimeout done()');
                                    console.log('ACTS_OnOff_0500====<end');
                                    done();
                                }, gSetTimeout);
                            }
                        }
                    );
                }
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0500  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0500====<end catch');
            done();
        }
    })

    /*
     * @tc.number: ACTS_OnOff_0600
     * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
     * @tc.desc: Check the return value of the interface ()
     */
    it('ACTS_OnOff_0600', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0600====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            var flagCallback01 = 0;
            function onAsyncCallback0600(err) {
                expect(err.code).assertEqual(0);
                flagCallback01++;
                waitDone(flagCallback01)
            }
            var DAHelper2 = featureAbility.acquireDataAbilityHelper(dataAbilityUri2);
            expect(typeof (DAHelper2)).assertEqual("object");

            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0600);
            DAHelper2.on("dataChange", dataAbilityUri2, onAsyncCallback0600);

            function waitDone(caller) {
                console.debug("=ACTS_OnOff_0600 caller ====>" + caller);
                if (flagCallback01 == 2) {
                    DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0600);
                    DAHelper2.off("dataChange", dataAbilityUri2, onAsyncCallback0600);
                    console.log('ACTS_OnOff_0600====<end');
                    done();
                } else {
                    console.debug("=ACTS_OnOff_0600 flagCallback01 ====>" + flagCallback01);
                }
            }

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_0600 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0600);
                            DAHelper2.off("dataChange", dataAbilityUri2, onAsyncCallback0600);
                            console.log('ACTS_OnOff_0600====<end 1 err.code != 0');
                            done();
                        } else {
                            DAHelper2.notifyChange(
                                dataAbilityUri2,
                                (err) => {
                                    if (err.code != 0) {
                                        console.debug("=ACTS_OnOff_0600 err=======>"
                                            + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                                        expect(false).assertTrue();
                                        DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0600);
                                        DAHelper2.off("dataChange", dataAbilityUri2, onAsyncCallback0600);
                                        console.log('ACTS_OnOff_0600====<end 2 err.code != 0');
                                        done();
                                    } else {
                                        waitDone("notifyChange");
                                    }
                                }
                            );
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0600  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0600====<end catch');
            done();
        }
    })

    /*
     * @tc.number: ACTS_OnOff_0700
     * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
     * @tc.desc: Check the return value of the interface ()
     */
    it('ACTS_OnOff_0700', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0700====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback0700(err) {
                expect(err.code).assertEqual(0);
                console.log('ACTS_OnOff_0700====<end callback_0700');
                done();
            }
            var DAHelper2 = featureAbility.acquireDataAbilityHelper(dataAbilityUri2);
            expect(typeof (DAHelper2)).assertEqual("object");

            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0700);
            DAHelper2.on("dataChange", dataAbilityUri2, onAsyncCallback0700);

            DAHelper.off("dataChange", dataAbilityUri);
            DAHelper2.off("dataChange", dataAbilityUri2);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_0700 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0700);
                            DAHelper2.off("dataChange", dataAbilityUri2, onAsyncCallback0700);
                            console.log('ACTS_OnOff_0700====<end err.code != 0');
                            done();
                        } else {
                            DAHelper2.notifyChange(
                                dataAbilityUri2,
                                (err) => {
                                    console.debug("=ACTS_OnOff_0700 err=======>"
                                        + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                                    expect(err.code).assertEqual(0);
                                    done();
                                }
                            );
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0700  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0700====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_0800
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_OnOff_0800', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0800====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback0800(err) {
                expect(false).assertTrue();
                console.log('ACTS_OnOff_0800====<end callback_0800');
            }
            DAHelper.on("error_dataChange", dataAbilityUri, onAsyncCallback0800);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        expect(err.code).assertEqual(0);
                        currentAlertTimeout = setTimeout(() => {
                            console.log('ACTS_OnOff_0800====<end');
                            done();
                        }, gSetTimeout);
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0800  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0800====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_0900
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_OnOff_0900', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_0900====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback0900(err) {
                expect(err.code).assertEqual(0);
                clearTimeout(currentAlertTimeout);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback0900);
                console.log('ACTS_OnOff_0900====<end');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback0900);

            DAHelper.off("error_dataChange", dataAbilityUri, onAsyncCallback0900);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_0900 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            console.log('ACTS_OnOff_0900====<end err.code != 0');
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                console.debug('ACTS_OnOff_0900====< else true');
                                expect(false).assertTrue();
                                console.log('ACTS_OnOff_0900====<end steTimeout');
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_0900  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_0900====<end catch');
            done();
        }
    })

    /*
     * @tc.number: ACTS_OnOff_1000
     * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
     * @tc.desc: Check the return value of the interface ()
     */
    it('ACTS_OnOff_1000', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1000====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1000(err) {
                expect(err.code).assertEqual(0);
                clearTimeout(currentAlertTimeout);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1000);
                console.log('ACTS_OnOff_1000====<end Callback');
                done();
            }
            DAHelper.on("dataChange", undefined, onAsyncCallback1000);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        currentAlertTimeout = setTimeout(() => {
                            expect(err.code).assertEqual(0);
                            console.log('ACTS_OnOff_1000====<end');
                            done();
                        }, gSetTimeout);
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1000  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1000====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_1100
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_1100', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1100====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1100(err) {
                console.debug("=ACTS_OnOff_1100 onAsyncCallback1100=======>");
                expect(err.code).assertEqual(0);
                clearTimeout(currentAlertTimeout);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1100);
                console.log('ACTS_OnOff_1100====<end');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback1100);

            DAHelper.off("dataChange", undefined, onAsyncCallback1100);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_1100 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            console.log('ACTS_OnOff_1100====<end err.code');
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                console.debug('ACTS_OnOff_1100====<setTimeout done()');
                                expect(false).assertTrue();
                                console.log('ACTS_OnOff_1100====<end setTimeout');
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1100  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_1200
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_1200', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1200====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1200(err) {
                console.debug("=ACTS_OnOff_1200 onAsyncCallback1200=======>");
                expect(false).assertTrue();
                clearTimeout(currentAlertTimeout);
                console.log('ACTS_OnOff_1200====<end');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback1200);


            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    undefined,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_1200 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1200);
                            console.log('ACTS_OnOff_1200====<end err.code');
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                console.debug('ACTS_OnOff_1200====<setTimeout done()');
                                expect(false).assertTrue();
                                console.log('ACTS_OnOff_1200====<end setTimeout');
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1200  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1200====<end catch');
            done();
        }
    })

    /*
     * @tc.number: ACTS_OnOff_1300
     * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_OnOff_1300', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1300====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            DAHelper.on("dataChange", dataAbilityUri, undefined);
            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        expect(err.code).assertEqual(0);
                        setTimeout(() => {
                            console.log('ACTS_OnOff_1300====<end');
                            done();
                        }, gSetTimeout);
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1300  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_1400
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_1400', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1400====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1400(err) {
                console.debug("=ACTS_OnOff_1400 onAsyncCallback1400=======>");
                expect(err.code).assertEqual(0);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1400);
                console.log('ACTS_OnOff_1400====<end');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback1400);

            DAHelper.off("dataChange", dataAbilityUri, undefined);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        console.debug("=ACTS_OnOff_1400 err=======>"
                            + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1400  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1400====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_1500
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_1500', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1500====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1500(err) {
                console.debug("=ACTS_OnOff_1500 onAsyncCallback1500=======>");
                expect(false).assertTrue();
            }
            DAHelper.on(undefined, dataAbilityUri, onAsyncCallback1500);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        expect(err.code).assertEqual(0);
                        currentAlertTimeout = setTimeout(() => {
                            console.debug('ACTS_OnOff_1500====<setTimeout done()');
                            console.log('ACTS_OnOff_1500====<end');
                            done();
                        }, gSetTimeout);
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1500  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1500====<end catch');
            done();
        }
    })

    /*
     * @tc.number: ACTS_OnOff_1600
     * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     */
    it('ACTS_OnOff_1600', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1600====<begin');
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1600(err) {
                console.debug("=ACTS_OnOff_1600 onAsyncCallback1600=======>");
                expect(err.code).assertEqual(0);
                clearTimeout(currentAlertTimeout);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1600);
                console.log('ACTS_OnOff_1600====<end');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback1600);

            DAHelper.off(undefined, dataAbilityUri, onAsyncCallback1600);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_1600 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            console.log('ACTS_OnOff_1600====<end err.code');
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                console.debug('ACTS_OnOff_1600====<setTimeout done()');
                                expect(false).assertTrue();
                                console.log('ACTS_OnOff_1600====<end setTimeout');
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1600  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1600====<end catch');
            done();
        }
    })

    /*
     * @tc.number: ACTS_OnOff_1700
     * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
     * @tc.desc: Check the return value of the interface ()
     */
    it('ACTS_OnOff_1700', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1700====<begin');
        gSetTimeout = 2000;
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1700(err) {
                expect(err.code).assertEqual(0);
                clearTimeout(currentAlertTimeout);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1700);
                console.log('ACTS_OnOff_1700====<end onAsyncCallback1700 ');
                gSetTimeout = 500;
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri2, onAsyncCallback1700);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                console.debug('ACTS_OnOff_1700====< mySetTimeout');
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_1700 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1700);
                            gSetTimeout = 500;
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                expect(err.code).assertEqual(0);
                                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1700);
                                console.log('ACTS_OnOff_1700====<end');
                                gSetTimeout = 500;
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1700  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1700====<end catch');
            gSetTimeout = 500;
            done();
        }
    })

    /*
    * @tc.number: ACTS_OnOff_1800
    * @tc.name: On/Off : Registers an observer to observe data specified by the given Uri
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_OnOff_1800', Level.LEVEL0, async function (done) {
        console.log('ACTS_OnOff_1800====<begin');
        gSetTimeout = 2000;
        try {
            var currentAlertTimeout;
            expect(typeof (DAHelper)).assertEqual("object");
            function onAsyncCallback1800(err) {
                console.debug("=ACTS_OnOff_1800 onAsyncCallback1800=======>");
                expect(err.code).assertEqual(0);
                clearTimeout(currentAlertTimeout);
                DAHelper.off("dataChange", dataAbilityUri, onAsyncCallback1800);
                console.log('ACTS_OnOff_1800====<end');
                done();
            }
            DAHelper.on("dataChange", dataAbilityUri, onAsyncCallback1800);

            DAHelper.off("dataChange", dataAbilityUri2, onAsyncCallback1800);

            setTimeout(mySetTimeout, gSetTimeout);
            function mySetTimeout() {
                DAHelper.notifyChange(
                    dataAbilityUri,
                    (err) => {
                        if (err.code != 0) {
                            console.debug("=ACTS_OnOff_1800 err=======>"
                                + ("err【") + JSON.stringify(err) + (" 】") + " , " + err);
                            expect(false).assertTrue();
                            console.log('ACTS_OnOff_1800====<end err.code');
                            done();
                        } else {
                            currentAlertTimeout = setTimeout(() => {
                                console.debug('ACTS_OnOff_1800====<setTimeout done()');
                                console.log('ACTS_OnOff_1800====<end (err)');
                                done();
                            }, gSetTimeout);
                        }
                    }
                );
            }
        } catch (err) {
            console.error('=ACTS_OnOff_1800  catch(err)====>:' + err);
            expect(false).assertTrue();
            console.log('ACTS_OnOff_1800====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Insert_0100
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Insert_0100', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Insert_0100====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_Insert_0100 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + " , " + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_Insert_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Insert_0100 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 ") + " , " + err);
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Insert_0100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Insert_0100 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Insert_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Insert_0200
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Insert_0200', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Insert_0200====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_Insert_0200 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + " , " + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_Insert_0200====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Insert_0200 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 ") + " , " + err);
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Insert_0200====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Insert_0200 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Insert_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Insert_0300
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Insert_0300', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Insert_0300====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_Insert_0300 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + " , " + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_Insert_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Insert_0300 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 ") + " , " + err);
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Insert_0300====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Insert_0300 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Insert_0300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Insert_0400
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Insert_0400', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Insert_0400====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                        valueBackReferences: valueBucket,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_Insert_0400 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(err.code).assertEqual(0);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_Insert_0400====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Insert_0400 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Insert_0400====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Insert_0500
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Insert_0500', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Insert_0500====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_Insert_0500 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(err.code).assertEqual(0);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_Insert_0500====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Insert_0500 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Insert_0500====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Insert_0600
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Insert_0600', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Insert_0600====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_Insert_0600 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_Insert_0600====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Insert_0600 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Insert_0600====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Update_0100
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Update_0100', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Update_0100====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_Update_0100 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult)
                    + (" 】") + DataAbilityResult.length);
                expect(DataAbilityResult.length).assertEqual(1);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_Update_0100 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                    console.debug('=ACTS_ExecuteBatch_Update_0100 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(1);
                }
                console.debug('ACTS_ExecuteBatch_Update_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Update_0100 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Update_0100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Update_0100 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Update_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Update_0200
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Update_0200', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Update_0200====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('name', "ACTS_ExecuteBatch_Update_0200_rose");
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_Update_0200 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】") + DataAbilityResult.length);
                expect(DataAbilityResult.length).assertEqual(2);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_Update_0200 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                    console.debug('=ACTS_ExecuteBatch_Update_0200 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(1);
                }
                console.debug('ACTS_ExecuteBatch_Update_0200====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Update_0200 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Update_0200====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Update_0200 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Update_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Update_0300
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Update_0300', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Update_0300====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_Update_0300 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】")
                    + DataAbilityResult.length);
                expect(DataAbilityResult.length).assertEqual(1);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_Update_0300 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                    console.debug('=ACTS_ExecuteBatch_Update_0300 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(1);
                }
                console.debug('ACTS_ExecuteBatch_Update_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Update_0300 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Update_0300====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Update_0300 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Update_0300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Update_0400
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Update_0400', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Update_0400====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                        valueBackReferences: valueBucket,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_Update_0400 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【")
                        + JSON.stringify(DataAbilityResult) + (" 】;") + DataAbilityResult.length);
                    expect(DataAbilityResult.length).assertEqual(1);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_Update_0400 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        console.debug('=ACTS_ExecuteBatch_Update_0400 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                    console.debug('ACTS_ExecuteBatch_Update_0400====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Update_0400 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Update_0400====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Update_0500
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Update_0500', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Update_0500====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_Update_0500 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(DataAbilityResult)
                        + (" 】;") + DataAbilityResult.length);
                    expect(DataAbilityResult.length).assertEqual(2);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_Update_0500 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        console.debug('=ACTS_ExecuteBatch_Update_0500 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                    console.debug('ACTS_ExecuteBatch_Update_0500====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Update_0500 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Update_0500====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Update_0600
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Update_0600', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Update_0600====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_Update_0600 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(DataAbilityResult)
                        + (" 】;") + DataAbilityResult.length);
                    expect(DataAbilityResult.length).assertEqual(1);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_Update_0600 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        console.debug('=ACTS_ExecuteBatch_Update_0600 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                    console.debug('ACTS_ExecuteBatch_Update_0600====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Update_0600 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Update_0600====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Assert_0100
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Assert_0100', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Assert_0100====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_Assert_0100 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_Assert_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Assert_0100 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Assert_0100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Assert_0100 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Assert_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Assert_0200
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Assert_0200', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Assert_0200====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_Assert_0200 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_Assert_0200====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Assert_0200 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Assert_0200====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Assert_0200 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Assert_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Assert_0300
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Assert_0300', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Assert_0300====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_Assert_0300 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】")
                    + DataAbilityResult.length);
                expect(DataAbilityResult.length).assertEqual(1);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_Assert_0300 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual("");
                    console.debug('=ACTS_ExecuteBatch_Assert_0300 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(0);
                }
                console.debug('ACTS_ExecuteBatch_Assert_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Assert_0300 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Assert_0300====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Assert_0300 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Assert_0300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Assert_0400
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Assert_0400', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Assert_0400====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                        valueBackReferences: valueBucket,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_Assert_0400 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_Assert_0400====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Assert_0400 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Assert_0400====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Assert_0500
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Assert_0500', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Assert_0500====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_Assert_0500 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_Assert_0500====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Assert_0500 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Assert_0500====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Assert_0600
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Assert_0600', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Assert_0600====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_Assert_0600 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(1);
                    for (var i = 0; i < data.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_Assert_0600 for data[' + i + '].uri ====>: '
                            + data[i].uri)
                        expect(data[i].uri).assertEqual("");
                        console.debug('=ACTS_ExecuteBatch_Assert_0600 for data[' + i + '].count ====>: '
                            + data[i].count)
                        expect(data[i].count).assertEqual(0);
                    }
                    console.debug('ACTS_ExecuteBatch_Assert_0600====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Assert_0600 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Assert_0600====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Delete_0100
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Delete_0100', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Delete_0100====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_Delete_0100 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】") + DataAbilityResult.length);
                expect(DataAbilityResult.length).assertEqual(1);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_Delete_0100 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                    console.debug('=ACTS_ExecuteBatch_Delete_0100 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(1);
                }
                console.debug('ACTS_ExecuteBatch_Delete_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Delete_0100 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Delete_0100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Delete_0100 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Delete_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Delete_0200
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Delete_0200', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Delete_0200====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_Delete_0200 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】") + DataAbilityResult.length);
                expect(DataAbilityResult.length).assertEqual(2);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_Delete_0200 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                    console.debug('=ACTS_ExecuteBatch_Delete_0200 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(1);
                }
                console.debug('ACTS_ExecuteBatch_Delete_0200====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Delete_0200 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Delete_0200====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Delete_0200 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Delete_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Delete_0300
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_Delete_0300', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Delete_0300====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_Delete_0300 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】") + DataAbilityResult.length);
                expect(DataAbilityResult.length).assertEqual(1);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_Delete_0300 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                    console.debug('=ACTS_ExecuteBatch_Delete_0300 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(1);
                }
                console.debug('ACTS_ExecuteBatch_Delete_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_Delete_0300 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_Delete_0300====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Delete_0300 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Delete_0300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Delete_0400
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Delete_0400', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Delete_0400====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                        valueBackReferences: valueBucket,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_Delete_0400 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(DataAbilityResult)
                        + (" 】;") + DataAbilityResult.length);
                    expect(DataAbilityResult.length).assertEqual(1);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_Delete_0400 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        console.debug('=ACTS_ExecuteBatch_Delete_0400 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                    console.debug('ACTS_ExecuteBatch_Delete_0400====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Delete_0400 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Delete_0400====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Delete_0500
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Delete_0500', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Delete_0500====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_Delete_0500 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(DataAbilityResult)
                        + (" 】;") + DataAbilityResult.length);
                    expect(DataAbilityResult.length).assertEqual(2);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_Delete_0500 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        console.debug('=ACTS_ExecuteBatch_Delete_0500 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                    console.debug('ACTS_ExecuteBatch_Delete_0500====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Delete_0500 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Delete_0500====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_Delete_0600
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_Delete_0600', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_Delete_0600====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_Delete_0600 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(DataAbilityResult)
                        + (" 】;") + DataAbilityResult.length);
                    expect(DataAbilityResult.length).assertEqual(1);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_Delete_0600 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        console.debug('=ACTS_ExecuteBatch_Delete_0600 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                    console.debug('ACTS_ExecuteBatch_Delete_0600====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_Delete_0600 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_Delete_0600====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0100
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_0100', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0100====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_0100 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】") + DataAbilityResult.length);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_0100 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                    console.debug('=ACTS_ExecuteBatch_0100 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    expect(DataAbilityResult[i].count).assertEqual(1);
                }
                console.debug('ACTS_ExecuteBatch_0100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_0100 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_0100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0100 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0200
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_0200', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0200====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_0200 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(DataAbilityResult)
                        + (" 】;") + DataAbilityResult.length);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_0200 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        console.debug('=ACTS_ExecuteBatch_0200 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                    console.debug('ACTS_ExecuteBatch_0200====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0200 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0200====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0300
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_0300', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0300====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((DataAbilityResult) => {
                console.debug("=ACTS_ExecuteBatch_0300 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(DataAbilityResult) + (" 】") + DataAbilityResult.length);
                for (var i = 0; i < DataAbilityResult.length; i++) {
                    console.debug('=ACTS_ExecuteBatch_0300 for data[' + i + '].uri ====>: '
                        + DataAbilityResult[i].uri)
                    console.debug('=ACTS_ExecuteBatch_0300 for data[' + i + '].count ====>: '
                        + DataAbilityResult[i].count)
                    if (i == 2) {
                        expect(DataAbilityResult[i].uri).assertEqual("");
                        expect(DataAbilityResult[i].count).assertEqual(0);
                    } else {
                        expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                        expect(DataAbilityResult[i].count).assertEqual(1);
                    }
                }
                console.debug('ACTS_ExecuteBatch_0300====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_0300 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_0300====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0300 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0300====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0400
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_0400', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0400====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri2,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, DataAbilityResult) => {
                    console.debug("=ACTS_ExecuteBatch_0400 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(DataAbilityResult)
                        + (" 】;") + DataAbilityResult.length);
                    for (var i = 0; i < DataAbilityResult.length; i++) {
                        console.debug('=ACTS_ExecuteBatch_0400 for data[' + i + '].uri ====>: '
                            + DataAbilityResult[i].uri)
                        console.debug('=ACTS_ExecuteBatch_0400 for data[' + i + '].count ====>: '
                            + DataAbilityResult[i].count)
                        if (i == 2) {
                            expect(DataAbilityResult[i].uri).assertEqual("");
                            expect(DataAbilityResult[i].count).assertEqual(0);
                        } else {
                            expect(DataAbilityResult[i].uri).assertEqual(dataAbilityUri);
                            expect(DataAbilityResult[i].count).assertEqual(1);
                        }
                    }
                    console.debug('ACTS_ExecuteBatch_0400====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0400 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0400====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0500
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_0500', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0500====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(undefined,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_0500 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_0500====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_0500 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_0500====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0500 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0500====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0600
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_0600', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0600====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(undefined,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_0600 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_0600====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0600 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0600====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0700
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_0700', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0700====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_0700 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_0700====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_0700 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_0700====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0700 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0700====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0800
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_0800', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0800====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(dataAbilityUri,
                [
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: undefined,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_0800 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_0800====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0800 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0800====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_0900
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_0900', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_0900====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(123456,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_0900 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_0900====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_0900 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_0900====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_0900 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_0900====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_1000
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_1000', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_1000====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch(123456,
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_1000 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_1000====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_1000 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_1000====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_1100
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_ExecuteBatch_1100', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_1100====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch("errorUri",
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
            ).then((data) => {
                console.debug("=ACTS_ExecuteBatch_1100 executeBatch then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】") + data.length);
                expect(data.length).assertEqual(0);
                console.debug('ACTS_ExecuteBatch_1100====<end');
                done();
            }).catch((err) => {
                console.debug("=ACTS_ExecuteBatch_1100 executeBatch catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                console.debug('ACTS_ExecuteBatch_1100====<end .catch');
                done();
            });
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_1100 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_1100====<end catch');
            done();
        }
    })

    /*
    * @tc.number: ACTS_ExecuteBatch_1200
    * @tc.name: ExecuteBatch : Preforms batch operations on the database
    * @tc.desc: Check the return value of the interface (by AsyncCallback)
    */
    it('ACTS_ExecuteBatch_1200', Level.LEVEL0, async function (done) {
        console.debug('ACTS_ExecuteBatch_1200====<begin');
        try {
            expect(typeof (DAHelper)).assertEqual("object");
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            predicates.equalTo('contact_id', 1);
            predicates.limitAs(10);
            predicates.orderByAsc("order_by_class");
            predicates.offsetAs(1);

            DAHelper.executeBatch("errorUri",
                [
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_INSERT,
                        valuesBucket: valueBucket,
                        predicates: null,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_UPDATE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_ASSERT,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    },
                    {
                        uri: dataAbilityUri,
                        type: featureAbility.DataAbilityOperationType.TYPE_DELETE,
                        valuesBucket: valueBucket,
                        predicates: predicates,
                        expectedCount: 1,
                        PredicatesBackReferences: {},
                        interrupted: true,
                    }
                ],
                (err, data) => {
                    console.debug("=ACTS_ExecuteBatch_1200 executeBatch err,data====>"
                        + ("json err【") + JSON.stringify(err) + (" 】json data【") + JSON.stringify(data)
                        + (" 】;") + data.length);
                    expect(data.length).assertEqual(0);
                    console.debug('ACTS_ExecuteBatch_1200====<end');
                    done();
                }
            );
        } catch (err) {
            console.error('=ACTS_ExecuteBatch_1200 catch(err)====>:'
                + ("json err 【") + JSON.stringify(err) + (" 】 ,") + err);
            expect(false).assertTrue();
            console.debug('ACTS_ExecuteBatch_1200====<end catch');
            done();
        }
    })
})}
