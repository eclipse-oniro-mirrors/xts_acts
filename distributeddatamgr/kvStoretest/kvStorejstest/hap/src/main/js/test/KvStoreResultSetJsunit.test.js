/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import factory from '@ohos.data.distributedData';

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
var kvManager = null;
var kvStore = null;
var resultSet = null;

export default function kvStoreResultSetTest(){
describe('kvStoreResultSetTest', function() {
    const config = {
        bundleName : TEST_BUNDLE_NAME,
        userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
        }
    }

    const options = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
        console.info('beforeAll');
        console.info('beforeAll config:' + JSON.stringify(config));
        await factory.createKVManager(config).then((manager) => {
            kvManager = manager;
            console.info('beforeAll createKVManager success');
        }).catch((err) => {
            console.info('beforeAll createKVManager err ' + err);
        });
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then(async (data) => {
            console.info('beforeAll getAllKVStoreId size = ' + data.length);
            for (var i = 0; i < data.length; i++) {
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, data[i]).then(() => {
                    console.info('beforeAll deleteKVStore success ' + data[i]);
                }).catch((err) => {
                    console.info('beforeAll deleteKVStore store: ' + data[i]);
                    console.info('beforeAll deleteKVStore error ' + err);
                });
            }
        }).catch((err) => {
            console.info('beforeAll getAllKVStoreId err ' + err);
        });

        console.info('beforeAll end');
        done();
    })

    afterAll(async function (done) {
        console.info('afterAll');
        kvManager = null;
        kvStore = null;
        done();
    })

    beforeEach(async function (done) {
        console.info('beforeEach');
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.info('beforeEach getKVStore success');
        }).catch((err) => {
            console.info('beforeEach getKVStore err ' + err);
        });
        let entries = [];
        for (var i = 0; i < 10; i++) {
            var key = 'batch_test_string_key';
            var entry = {
                key : key + i,
                value : {
                    type : factory.ValueType.STRING,
                    value : 'batch_test_string_value'
                }
            }
            entries.push(entry);
        }
        await kvStore.putBatch(entries).then(async (err) => {
            console.info('beforeEach putBatch success');
        }).catch((err) => {
            console.info('beforeEach putBatch fail ' + err);
        });
        await kvStore.getResultSet('batch_test_string_key').then((result) => {
            console.info('beforeEach getResultSet success');
            resultSet = result;
        }).catch((err) => {
            console.info('beforeEach getResultSet fail ' + err);
        });
        console.info('beforeEach end');
        done();
    })

    afterEach(async function (done) {
        console.info('afterEach');
        await kvStore.closeResultSet(resultSet).then((err) => {
            console.info('afterEach closeResultSet success');
        }).catch((err) => {
            console.info('afterEach closeResultSet fail ' + err);
        });
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
            console.info('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.info('afterEach deleteKVStore success');
            }).catch((err) => {
                console.info('afterEach deleteKVStore err ' + err);
            });
        }).catch((err) => {
            console.info('afterEach closeKVStore err ' + err);
        });
        kvStore = null;
        resultSet = null;
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETCOUNT_0100
     * @tc.name [JS-API8]KvStoreResultSet.GetCount()
     * @tc.desc Test Js Api KvStoreResultSet.GetCount()testcase 001
     */
    it('testKvStoreResultSetGetCount001', 0, async function(done) {
        try {
            var count = resultSet.getCount();
            console.info("testKvStoreResultSetGetCount001 getCount " + count);
            expect(count == 10).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetGetCount001 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETCOUNT_0200
     * @tc.name [JS-API8]KvStoreResultSet.GetCount()
     * @tc.desc Test Js Api KvStoreResultSet.GetCount()testcase 002
     */
    it('testKvStoreResultSetGetCount002', 0, async function(done) {
        try {
            var rs;
            await kvStore.getResultSet('test').then((result) => {
                console.info('testKvStoreResultSetGetCount002 getResultSet success');
                rs = result;
                expect(rs.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.info('testKvStoreResultSetGetCount002 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(rs).then((err) => {
                console.info('testKvStoreResultSetGetCount002 closeResultSet success');
            }).catch((err) => {
                console.info('testKvStoreResultSetGetCount002 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.info('testKvStoreResultSetGetCount002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETCOUNT_0300
     * @tc.name [JS-API8]KvStoreResultSet.GetCount()
     * @tc.desc Test Js Api KvStoreResultSet.GetCount()testcase 003
     */
    it('testKvStoreResultSetGetCount003', 0, async function(done) {
        try {
            var count = resultSet.getCount(123);
            console.info("testKvStoreResultSetGetCount003 getCount " + count);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetGetCount003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETCOUNT_0400
     * @tc.name [JS-API8]KvStoreResultSet.GetCount()
     * @tc.desc Test Js Api KvStoreResultSet.GetCount()testcase 004
     */
    it('testKvStoreResultSetGetCount004', 0, async function(done) {
        try {
            var count = resultSet.getCount(123, 'test_string');
            console.info("testKvStoreResultSetGetCount004 getCount " + count);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetGetCount004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETPOSITION_0100
     * @tc.name [JS-API8]KvStoreResultSet.GetPosition()
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition()testcase 001
     */
    it('testKvStoreResultSetGetPosition001', 0, async function(done) {
        try {
            var position = resultSet.getPosition();
            console.info("testKvStoreResultSetGetPosition001 getPosition " + position);
            expect(position == -1).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetGetPosition001 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETPOSITION_0200
     * @tc.name [JS-API8]KvStoreResultSet.GetPosition()
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition()testcase 002
     */
    it('testKvStoreResultSetGetPosition002', 0, async function(done) {
        try {
            var position = resultSet.getPosition();
            console.info("testKvStoreResultSetGetPosition002 getPosition " + position);
            expect(position).assertEqual(-1);
            var flag = resultSet.moveToLast();
            expect(flag).assertTrue();
            position = resultSet.getPosition();
            expect(position).assertEqual(9);
        } catch (e) {
            console.info("testKvStoreResultSetGetPosition002 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETPOSITION_0300
     * @tc.name [JS-API8]KvStoreResultSet.GetPosition()
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition()testcase 003
     */
    it('testKvStoreResultSetGetPosition003', 0, async function(done) {
        try {
            var position = resultSet.getPosition(123);
            console.info("testKvStoreResultSetGetPosition003 getPosition " + position);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetGetPosition003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETPOSITION_0400
     * @tc.name [JS-API8]KvStoreResultSet.GetPosition()
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition()testcase 004
     */
    it('testKvStoreResultSetGetPosition004', 0, async function(done) {
        try {
            var position = resultSet.getPosition(123, 'test_string');
            console.info("testKvStoreResultSetGetPosition004 getPosition " + position);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetGetPosition004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOFIRST_0100
     * @tc.name [JS-API8]KvStoreResultSet.MoveToFirst()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst()testcase 001
     */
    it('testKvStoreResultSetMoveToFirst001', 0, async function(done) {
        try {
            var moved = resultSet.moveToFirst();
            console.info("testKvStoreResultSetMoveToFirst001 moveToFirst " + moved);
            expect(moved).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetMoveToFirst001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOFIRST_0200
     * @tc.name [JS-API8]KvStoreResultSet.MoveToFirst()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst()testcase 002
     */
    it('testKvStoreResultSetMoveToFirst002', 0, async function(done) {
        try {
            var moved = resultSet.moveToFirst();
            console.info("testKvStoreResultSetMoveToFirst002 moveToFirst " + moved);
            expect(moved).assertTrue();
            var pos = resultSet.getPosition();
            console.info("testKvStoreResultSetMoveToFirst002 getPosition " + pos);
            expect(pos == 0).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetMoveToFirst002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOFIRST_0300
     * @tc.name [JS-API8]KvStoreResultSet.MoveToFirst()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst()testcase 003
     */
    it('testKvStoreResultSetMoveToFirst003', 0, async function(done) {
        try {
            var moved = resultSet.moveToFirst(123);
            console.info("testKvStoreResultSetMoveToFirst003 moveToFirst " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToFirst003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOFIRST_0400
     * @tc.name [JS-API8]KvStoreResultSet.MoveToFirst()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst()testcase 004
     */
    it('testKvStoreResultSetMoveToFirst004', 0, async function(done) {
        try {
            var moved = resultSet.moveToFirst(123, 'test_string');
            console.info("testKvStoreResultSetMoveToFirst004 moveToFirst " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToFirst004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOFIRST_0500
     * @tc.name [JS-API8]KvStoreResultSet.MoveToFirst()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst()testcase 005
     */
    it('testKvStoreResultSetMoveToFirst005', 0, async function(done) {
        try {
            var moved = resultSet.moveToLast();
            console.info("testKvStoreResultSetMoveToFirst004 moveToFirst " + moved);
            expect(moved && (resultSet.getPosition() == 9)).assertTrue();
            moved = resultSet.moveToFirst();
            expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToFirst004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOLAST_0100
     * @tc.name [JS-API8]KvStoreResultSet.MoveToLast()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast()testcase 001
     */
    it('testKvStoreResultSetMoveToLast001', 0, async function(done) {
        try {
            var moved = resultSet.moveToLast();
            console.info("testKvStoreResultSetMoveToLast001 moveToLast " + moved);
            expect(moved).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetMoveToLast001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOLAST_0200
     * @tc.name [JS-API8]KvStoreResultSet.MoveToLast()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast()testcase 002
     */
    it('testKvStoreResultSetMoveToLast002', 0, async function(done) {
        try {
            var moved = resultSet.moveToLast();
            console.info("testKvStoreResultSetMoveToLast002 moveToLast " + moved);
            expect(moved && (resultSet.getPosition() == 9)).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetMoveToLast002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOLAST_0300
     * @tc.name [JS-API8]KvStoreResultSet.MoveToLast()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast()testcase 003
     */
    it('testKvStoreResultSetMoveToLast003', 0, async function(done) {
        try {
            var moved = resultSet.moveToLast(123);
            console.info("testKvStoreResultSetMoveToLast003 moveToLast " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToLast003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOLAST_0400
     * @tc.name [JS-API8]KvStoreResultSet.MoveToLast()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast()testcase 004
     */
    it('testKvStoreResultSetMoveToLast004', 0, async function(done) {
        try {
            var moved = resultSet.moveToLast(123, 'test_string');
            console.info("testKvStoreResultSetMoveToLast004 moveToLast " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToLast004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETONEXT_0100
     * @tc.name [JS-API8]KvStoreResultSet.MoveToNext()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext()testcase 001
     */
    it('testKvStoreResultSetMoveToNext001', 0, async function(done) {
        try {
            var moved = resultSet.moveToNext();
            console.info("testKvStoreResultSetMoveToNext001 moveToNext " + moved);
            expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetMoveToNext001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETONEXT_0200
     * @tc.name [JS-API8]KvStoreResultSet.MoveToNext()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext()testcase 002
     */
    it('testKvStoreResultSetMoveToNext002', 0, async function(done) {
        try {
            var moved = resultSet.moveToNext();
            console.info("testKvStoreResultSetMoveToNext002 moveToNext " + moved);
            expect(moved && (resultSet.getPosition() == 0)).assertTrue();
            moved = resultSet.moveToNext();
            expect(moved && (resultSet.getPosition() == 1)).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetMoveToNext002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETONEXT_0300
     * @tc.name [JS-API8]KvStoreResultSet.MoveToNext()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext()testcase 003
     */
    it('testKvStoreResultSetMoveToNext003', 0, async function(done) {
        try {
            var moved = resultSet.moveToNext(123);
            console.info("testKvStoreResultSetMoveToNext003 moveToNext " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToNext003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETONEXT_0400
     * @tc.name [JS-API8]KvStoreResultSet.MoveToNext()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext()testcase 004
     */
    it('testKvStoreResultSetMoveToNext004', 0, async function(done) {
        try {
            var moved = resultSet.moveToNext(123, 'test_string');
            console.info("testKvStoreResultSetMoveToNext004 moveToNext " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToNext004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPREVIOUS_0100
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPrevious()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious()testcase 001
     */
    it('testKvStoreResultSetMoveToPrevious001', 0, async function(done) {
        try {
            var moved = resultSet.moveToPrevious();
            console.info("testKvStoreResultSetMoveToPrevious001 moveToPrevious " + moved);
            expect(!moved).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetMoveToPrevious001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPREVIOUS_0200
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPrevious()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious()testcase 002
     */
    it('testKvStoreResultSetMoveToPrevious002', 0, async function(done) {
        try {
            var moved = resultSet.moveToFirst();
            expect(moved && (resultSet.getPosition() == 0)).assertTrue();
            moved = resultSet.moveToNext();
            console.info("testKvStoreResultSetMoveToPrevious002 moveToNext " + moved);
            expect(moved && (resultSet.getPosition() == 1)).assertTrue();
            moved = resultSet.moveToPrevious();
            console.info("testKvStoreResultSetMoveToPrevious002 moveToPrevious " + moved);
            expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPrevious002 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPREVIOUS_0300
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPrevious()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious()testcase 003
     */
    it('testKvStoreResultSetMoveToPrevious003', 0, async function(done) {
        try {
            var moved = resultSet.moveToPrevious(123);
            console.info("testKvStoreResultSetMoveToPrevious003 moveToPrevious " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPrevious003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPREVIOUS_0400
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPrevious()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious()testcase 004
     */
    it('testKvStoreResultSetMoveToPrevious004', 0, async function(done) {
        try {
            var moved = resultSet.moveToPrevious(123, 'test_string');
            console.info("testKvStoreResultSetMoveToPrevious004 moveToPrevious " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPrevious004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPREVIOUS_0500
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPrevious()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious()testcase 005
     */
    it('testKvStoreResultSetMoveToPrevious005', 0, async function(done) {
        try {
            var moved = resultSet.moveToFirst();
            expect(moved && (resultSet.getPosition() == 0)).assertTrue();
            moved = resultSet.moveToPrevious();
            console.info("testKvStoreResultSetMoveToPrevious005 from 0 to -1 return" + moved);
            expect(moved == false).assertTrue();
            console.info("testKvStoreResultSetMoveToPrevious005 from 0 to " + resultSet.getPosition());
            expect(-1).assertEqual(resultSet.getPosition());
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPrevious005 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVE_0100
     * @tc.name [JS-API8]KvStoreResultSet.Move()
     * @tc.desc Test Js Api KvStoreResultSet.Move()testcase 001
     */
    it('testKvStoreResultSetMove001', 0, async function(done) {
        try {
            var moved = resultSet.move();
            console.info("testKvStoreResultSetMove001 move " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMove001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVE_0200
     * @tc.name [JS-API8]KvStoreResultSet.Move()
     * @tc.desc Test Js Api KvStoreResultSet.Move()testcase 002
     */
    it('testKvStoreResultSetMove002', 0, async function(done) {
        try {
            resultSet.moveToFirst();
            expect(resultSet.getPosition() == 0).assertTrue();
            var moved = resultSet.move(3);
            console.info("testKvStoreResultSetMove002 move " + moved);
            expect(moved).assertTrue();
            expect(3).assertEqual(resultSet.getPosition());
        } catch (e) {
            console.info("testKvStoreResultSetMove002 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVE_0300
     * @tc.name [JS-API8]KvStoreResultSet.Move()
     * @tc.desc Test Js Api KvStoreResultSet.Move()testcase 003
     */
    it('testKvStoreResultSetMove003', 0, async function(done) {
        try {
            expect(resultSet.getPosition() == -1).assertTrue();
            var moved = resultSet.move(3);
            console.info("testKvStoreResultSetMove003 move " + moved);
            expect(moved && (resultSet.getPosition() == 2)).assertTrue();
            moved = resultSet.move(2);
            console.info("testKvStoreResultSetMove003 move " + moved);
            expect(moved && (resultSet.getPosition() == 4)).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetMove003 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVE_0400
     * @tc.name [JS-API8]KvStoreResultSet.Move()
     * @tc.desc Test Js Api KvStoreResultSet.Move()testcase 004
     */
    it('testKvStoreResultSetMove004', 0, async function(done) {
        try {
            var moved = resultSet.move(3, 'test_string');
            console.info("testKvStoreResultSetMove004 move " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMove004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPOSITION_0100
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPosition()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPosition()testcase 001
     */
    it('testKvStoreResultSetMoveToPosition001', 0, async function(done) {
        try {
            var moved = resultSet.moveToPosition();
            console.info("testKvStoreResultSetMoveToPosition001 moveToPosition " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPosition001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPOSITION_0200
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPosition()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPosition()testcase 002
     */
    it('testKvStoreResultSetMoveToPosition002', 0, async function(done) {
        try {
            var moved = resultSet.moveToPosition(1, 'test_string');
            console.info("testKvStoreResultSetMoveToPosition002 moveToPosition " + moved);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPosition002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPOSITION_0300
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPosition()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPosition()testcase 003
     */
    it('testKvStoreResultSetMoveToPosition003', 0, async function(done) {
        try {
            var moved = resultSet.moveToPosition(5);
            console.info("testKvStoreResultSetMoveToPosition003 moveToPosition " + moved);
            expect(moved && (resultSet.getPosition() == 5)).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPosition003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_MOVETOPOSITION_0400
     * @tc.name [JS-API8]KvStoreResultSet.MoveToPosition()
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPosition()testcase 004
     */
    it('testKvStoreResultSetMoveToPosition004', 0, async function(done) {
        try {
            var moved = resultSet.move(3);
            console.info("testKvStoreResultSetMoveToPosition004 moveToPosition " + moved);
            expect(moved && (resultSet.getPosition() == 2)).assertTrue();
            moved = resultSet.moveToPosition(5);
            console.info("testKvStoreResultSetMoveToPosition004 moveToPosition " + moved);
            expect(moved && (resultSet.getPosition() == 5)).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetMoveToPosition004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISFIRST_0100
     * @tc.name [JS-API8]KvStoreResultSet.IsFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst()testcase 001
     */
    it('testKvStoreResultSetIsFirst001', 0, async function(done) {
        try {
            var flag = resultSet.isFirst();
            console.info("testKvStoreResultSetIsFirst001 isFirst " + flag);
            expect(!flag).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetIsFirst001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISFIRST_0200
     * @tc.name [JS-API8]KvStoreResultSet.IsFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst()testcase 002
     */
    it('testKvStoreResultSetIsFirst002', 0, async function(done) {
        try {
            var flag = resultSet.isFirst();
            console.info("testKvStoreResultSetIsFirst002 isFirst " + flag);
            expect(!flag).assertTrue();
            resultSet.move(3);
            flag = resultSet.isFirst();
            console.info("testKvStoreResultSetIsFirst002 isFirst " + flag);
            expect(!flag).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetIsFirst002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISFIRST_0300
     * @tc.name [JS-API8]KvStoreResultSet.IsFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst()testcase 003
     */
    it('testKvStoreResultSetIsFirst003', 0, async function(done) {
        try {
            var flag = resultSet.isFirst(1);
            console.info("testKvStoreResultSetIsFirst003 isFirst " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsFirst003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISFIRST_0400
     * @tc.name [JS-API8]KvStoreResultSet.IsFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst()testcase 004
     */
    it('testKvStoreResultSetIsFirst004', 0, async function(done) {
        try {
            var flag = resultSet.isFirst(1, 'test_string');
            console.info("testKvStoreResultSetIsFirst004 isFirst " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsFirst004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISLAST_0100
     * @tc.name [JS-API8]KvStoreResultSet.IsLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsLast()testcase 001
     */
    it('testKvStoreResultSetIsLast001', 0, async function(done) {
        try {
            var flag = resultSet.isLast();
            console.info("testKvStoreResultSetIsLast001 isLast " + flag);
            expect(!flag).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetIsFirst004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISLAST_0200
     * @tc.name [JS-API8]KvStoreResultSet.IsLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsLast()testcase 002
     */
    it('testKvStoreResultSetIsLast002', 0, async function(done) {
        try {
            resultSet.moveToLast();
            var flag = resultSet.isLast();
            console.info("testKvStoreResultSetIsLast002 isLast " + flag);
            expect(flag).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetIsLast002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISLAST_0300
     * @tc.name [JS-API8]KvStoreResultSet.IsLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsLast()testcase 003
     */
    it('testKvStoreResultSetIsLast003', 0, async function(done) {
        try {
            var flag = resultSet.isLast(1);
            console.info("testKvStoreResultSetIsLast003 isLast " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsLast003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISLAST_0400
     * @tc.name [JS-API8]KvStoreResultSet.IsLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsLast()testcase 004
     */
    it('testKvStoreResultSetIsLast004', 0, async function(done) {
        try {
            var flag = resultSet.isLast(1, 'test_string');
            console.info("testKvStoreResultSetIsLast004 isLast " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsLast004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISBEFOREFIRST_0100
     * @tc.name [JS-API8]KvStoreResultSet.IsBeforeFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 001
     */
    it('testKvStoreResultSetIsBeforeFirst001', 0, async function(done) {
        try {
            var flag = resultSet.isBeforeFirst();
            console.info("testKvStoreResultSetIsBeforeFirst001 isBeforeFirst " + flag);
            expect(flag).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetIsBeforeFirst001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISBEFOREFIRST_0200
     * @tc.name [JS-API8]KvStoreResultSet.IsBeforeFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 002
     */
    it('testKvStoreResultSetIsBeforeFirst002', 0, async function(done) {
        try {
            var moved = resultSet.moveToPrevious();
            expect(!moved).assertTrue();
            var flag = resultSet.isBeforeFirst();
            console.info("testKvStoreResultSetIsBeforeFirst002 isBeforeFirst " + flag);
            expect(flag).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetIsBeforeFirst002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISBEFOREFIRST_0300
     * @tc.name [JS-API8]KvStoreResultSet.IsBeforeFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 003
     */
    it('testKvStoreResultSetIsBeforeFirst003', 0, async function(done) {
        try {
            var flag = resultSet.isBeforeFirst(1);
            console.info("testKvStoreResultSetIsBeforeFirst003 isBeforeFirst " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsBeforeFirst003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISBEFOREFIRST_0400
     * @tc.name [JS-API8]KvStoreResultSet.IsBeforeFirst()
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 004
     */
    it('testKvStoreResultSetIsBeforeFirst004', 0, async function(done) {
        try {
            var flag = resultSet.isBeforeFirst(1, 'test_string');
            console.info("testKvStoreResultSetIsBeforeFirst004 isBeforeFirst " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsBeforeFirst004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISAFTERLAST_0100
     * @tc.name [JS-API8]KvStoreResultSet.IsAfterLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast()testcase 001
     */
    it('testKvStoreResultSetIsAfterLast001', 0, async function(done) {
        try {
            var flag = resultSet.isAfterLast();
            console.info("testKvStoreResultSetIsAfterLast001 isAfterLast " + flag);
            expect(!flag).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetIsAfterLast001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISAFTERLAST_0200
     * @tc.name [JS-API8]KvStoreResultSet.IsAfterLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast()testcase 002
     */
    it('testKvStoreResultSetIsAfterLast002', 0, async function(done) {
        try {
            var moved = resultSet.moveToLast();
            console.info("testKvStoreResultSetIsAfterLast002  moveToLast  moved=" + moved);
            expect(moved).assertTrue();
            moved = resultSet.moveToNext();
            console.info("testKvStoreResultSetIsAfterLast002  moveToNext  moved=" + moved);
            expect(moved == false).assertTrue();
            var flag = resultSet.isAfterLast();
            console.info("testKvStoreResultSetIsAfterLast002  isAfterLast true=" + flag);
            expect(flag).assertTrue();
        } catch (e) {
            console.info("testKvStoreResultSetIsAfterLast002 fail " + e);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISAFTERLAST_0300
     * @tc.name [JS-API8]KvStoreResultSet.IsAfterLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast()testcase 003
     */
    it('testKvStoreResultSetIsAfterLast003', 0, async function(done) {
        try {
            var flag = resultSet.isAfterLast(1);
            console.info("testKvStoreResultSetIsAfterLast003 isAfterLast " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsAfterLast003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_ISAFTERLAST_0400
     * @tc.name [JS-API8]KvStoreResultSet.IsAfterLast()
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast()testcase 004
     */
    it('testKvStoreResultSetIsAfterLast004', 0, async function(done) {
        try {
            var flag = resultSet.isAfterLast(1, 'test_string');
            console.info("testKvStoreResultSetIsAfterLast004 isAfterLast " + flag);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetIsAfterLast004 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETENTRY_0100
     * @tc.name [JS-API8]KvStoreResultSet.GetEntry()
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry()testcase 001
     */
    it('testKvStoreResultSetGetEntry001', 0, async function(done) {
        try {
            var moved = resultSet.moveToNext();
            var entry = resultSet.getEntry();
            console.info("testKvStoreResultSetGetEntry001 getEntry " + entry);
            expect(moved && (entry.key == 'batch_test_string_key0')).assertTrue();
            expect(moved && (entry.value.value == 'batch_test_string_value')).assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetGetEntry001 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETENTRY_0200
     * @tc.name [JS-API8]KvStoreResultSet.GetEntry()
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry()testcase 002
     */
    it('testKvStoreResultSetGetEntry002', 0, async function(done) {
        try {
            var moved = resultSet.moveToNext();
            var entry = resultSet.getEntry();
            console.info("testKvStoreResultSetGetEntry002 getEntry " + entry);
            expect(entry.key == 'batch_test_string_key0').assertTrue();
            expect(entry.value.value == 'batch_test_string_value').assertTrue();
            moved = resultSet.moveToNext();
            expect(moved).assertTrue();
            entry = resultSet.getEntry();
            console.info("testKvStoreResultSetGetEntry002 getEntry " + entry);
            expect(entry.key == 'batch_test_string_key1').assertTrue();
            expect(entry.value.value == 'batch_test_string_value').assertTrue();
        } catch (e) {
            expect(null).assertFail();
            console.info("testKvStoreResultSetGetEntry002 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETENTRY_0300
     * @tc.name [JS-API8]KvStoreResultSet.GetEntry()
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry()testcase 003
     */
    it('testKvStoreResultSetGetEntry003', 0, async function(done) {
        try {
            var entry = resultSet.getEntry(1);
            console.info("testKvStoreResultSetGetEntry003 getEntry " + entry);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetGetEntry003 fail " + e);
        }
        done();
    })

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_KVSTORERESULTSET_GETENTRY_0400
     * @tc.name [JS-API8]KvStoreResultSet.GetEntry()
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry()testcase 004
     */
    it('testKvStoreResultSetGetEntry004', 0, async function(done) {
        try {
            var entry = resultSet.getEntry(1, 'test_string');
            console.info("testKvStoreResultSetGetEntry004 getEntry " + entry);
            expect(null).assertFail();
        } catch (e) {
            console.info("testKvStoreResultSetGetEntry004 fail " + e);
        }
        done();
    })
})
}