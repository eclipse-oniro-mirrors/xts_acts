/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-1.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import featureAbility from '@ohos.ability.featureAbility'
import ohosDataAbility from '@ohos.data.dataAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsDataAbilityHelperPermissionTest() {
describe('ActsDataAbilityHelperPermissionTest', function () {
    let dataAbilityUri = ("dataability:///com.example.myapplication.TestDataAbility3");
    let DAHelper;

    beforeAll(async (done) => {
        console.debug('= ACTS_beforeAll ====<begin');
        try {
            DAHelper = featureAbility.acquireDataAbilityHelper(dataAbilityUri);
            console.debug('ACTS_beforeAll DAHelper ====>: ' + DAHelper + " ,JSON. " + JSON.stringify(DAHelper));
            if(DAHelper == null){
                console.debug('ACTS_beforeAll DAHelper ====>: DAHelper == null');
            }
        } catch (err) {
            console.error('=ACTS_beforeAll acquireDataAbilityHelper catch(err)====>:' + err);
        }
        console.debug('= ACTS_beforeAll ====<end');
        done();
    })

    afterAll((done) => {
        console.debug('= ACTS_afterAll ====<begin');
        console.debug('= ACTS_afterAll ====<end');
        done();
    })

    /*
    * @tc.number: ACTS_AcquireDataAbilityHelper_0100
    * @tc.name: GetDataAbilityHelper : Connects an ability to a Service ability
    * @tc.desc: Check the return value of the interface ()
    */
    it('ACTS_AcquireDataAbilityHelper_0100', 0, async function (done) {
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
        expect(true).assertTrue();
        console.log('ACTS_AcquireDataAbilityHelper_0100====<end')
        done();
    })

    /*
    * @tc.number: ACTS_Insert_0100
    * @tc.name: Insert : Indicates the path of the data to operate
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Insert_0100', 0, async function (done) {
        console.log('ACTS_Insert_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('Insert_0100 DAHelper ====>: ' + DAHelper)
        let valueBucketM;
        try {
            DAHelper.insert(dataAbilityUri, valueBucketM)
                .then(function (data) {
                    console.debug("=ACTS_Insert_0100 then data====>"
                        + ("json data 【") + JSON.stringify(data) + (" 】"));
                    expect(JSON.stringify(data)).assertEqual("-1")
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
    * @tc.number: ACTS_BatchInsert_0100
    * @tc.name: Inserts multiple data records into the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_BatchInsert_0100', 0, async function (done) {
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
                expect(JSON.stringify(data)).assertEqual("-1")
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
    * @tc.number: ACTS_Query_0100
    * @tc.name: Queries one or more data records in the database
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Query_0100', 0, async function (done) {
        console.log('ACTS_Query_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        var columnsArray = new Array("");
        try {
            let predicates = new ohosDataAbility.DataAbilityPredicates();
            DAHelper.query(
                dataAbilityUri,
                columnsArray,
                predicates
            ).then((data) => {
                console.debug("=ACTS_Query_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data).assertEqual(null);
                console.log('ACTS_Query_0100====<end');
                done();
            }).catch(err => {
                console.debug("=ACTS_Query_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                console.log('ACTS_Query_0100====<end .catch');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_Query_0100 catch(err)====>:' + err);
            console.log('ACTS_Query_0100====<end catch');
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_Update_0100
    * @tc.name: Updates one or more data records in the database.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Update_0100', 0, async function (done) {
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
                expect(JSON.stringify(data)).assertEqual("-1")
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
    * @tc.number: ACTS_Delete_0100
    * @tc.name: Deletes one or more data records. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by Promise)
    */
    it('ACTS_Delete_0100', 0, async function (done) {
        console.log('ACTS_Delete_0100====<begin');
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility getDataAbilityHelper ====>: ' + DAHelper);
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
                expect(JSON.stringify(data)).assertEqual("-1")
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
    * @tc.number: ACTS_OpenFile_0100
    * @tc.name: Opens a file. This method should be implemented by a Data ability.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_OpenFile_0100', 0, async function (done) {
        console.log('ACTS_OpenFile_0100====<begin');
        var mode = "r";
        try {
            DAHelper.openFile(
                dataAbilityUri,
                mode,
            ).then((data) => {
                console.debug("=ACTS_OpenFile_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(JSON.stringify(data)).assertEqual("-1")
                done();
            }).catch(err => {
                console.debug("=ACTS_OpenFile_0100 catch err ====>"
                    + ("json err 【") + JSON.stringify(err) + (" 】 "));
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.error('=ACTS_OpenFile_0100 getType catch(err)====>:' + err);
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number: ACTS_NormalizeUri_0100
    * @tc.name: Converts the given uri that refer to the Data ability into a normalized URI.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_NormalizeUri_0100', 0, async function (done) {
        console.log('ACTS_NormalizeUri_0100====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility normalizeUri getDataAbilityHelper ====>: ' + DAHelper);
        try {
            DAHelper.normalizeUri(
                dataAbilityUri,
            ).then((data) => {
                console.debug("=ACTS_NormalizeUri_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data.length).assertEqual(0);
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
    * @tc.number: ACTS_DenormalizeUri_0100
    * @tc.name: Converts the given normalized uri generated by normalizeUri into a denormalized one.
    * @tc.desc: Check the return value of the interface (by promise)
    */
    it('ACTS_DenormalizeUri_0100', 0, async function (done) {
        console.log('ACTS_DenormalizeUri_0100====<begin');
        let ret = false;
        expect(typeof (DAHelper)).assertEqual("object");
        console.log('featureAbility DenormalizeUri getDataAbilityHelper ====>: ' + DAHelper);
        try {
            DAHelper.denormalizeUri(
                dataAbilityUri,
            ).then((data) => {
                console.debug("=ACTS_DenormalizeUri_0100 then data====>"
                    + ("json data 【") + JSON.stringify(data) + (" 】"));
                expect(data.length).assertEqual(0);
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

})}