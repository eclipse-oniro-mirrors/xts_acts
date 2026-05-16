/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from "@ohos/hypium";
import factory from '@ohos.data.distributedData';

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'DistributedDataKVManagerCoverageAdd';
let kvManager = null;
let kvStore = null;

const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]"

const config  = {
  bundleName : TEST_BUNDLE_NAME,
  userInfo : {
    userId : '0',
    userType : factory.UserType.SAME_USER_ID
  }
}

const options = {
  createIfMissing: true,
  encrypt: false,
  backup: false,
  autoSync: true,
  kvStoreType: factory.KVStoreType.SINGLE_VERSION,
  securityLevel: factory.SecurityLevel.S2,
};

export default function DistributedDataKVManagerCoverageAdd(){
  describe('DistributedDataKVManagerCoverageAdd', () => {
    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_callback_0100
     * @tc.name createKVManager_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param bundleName is ""
     */
    it('createKVManager_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_callback_001 begin---------  ');
        const kvManagerConfig = {
          bundleName : '',
          userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
          }
        }
        factory.createKVManager(kvManagerConfig, function (err, manager) {
          if (err) {
            console.log(TAG + "Failed to create KVManager: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid bundleName");
            done();
          }else{
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_callback_0200
     * @tc.name createKVManager_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('createKVManager_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_callback_002 begin---------  ');
        factory.createKVManager(null, function (err, manager) {
          if (err) {
            console.log(TAG + "Failed to create KVManager: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid bundleName");
            done();
          }else{
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_callback_0300
     * @tc.name createKVManager_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('createKVManager_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_callback_003 begin---------  ');
        factory.createKVManager(undefined, function (err, manager) {
          if (err) {
            console.log(TAG + "Failed to create KVManager: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid bundleName");
            done();
          }else{
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_callback_0400
     * @tc.name createKVManager_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('createKVManager_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_callback_004 begin---------  ');
        const kvManagerConfig = {
          bundleName : TEST_BUNDLE_NAME,
          userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
          }
        }
        factory.createKVManager(kvManagerConfig, function (err, manager) {
          if (err) {
            console.log(TAG + "Failed to create KVManager: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }
          console.log(TAG +"Succeeded in creating KVManager");
          kvManager = manager;
          expect(kvManager!==undefined).assertTrue();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_promise_0100
     * @tc.name createKVManager_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param bundleName is ""
     */
    it('createKVManager_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_promise_001 begin---------  ');
        const kvManagerConfig = {
          bundleName : '',
          userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
          }
        }
        factory.createKVManager(kvManagerConfig).then((manager) => {
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +"Failed to create KVManager: " + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid bundleName");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_promise_0200
     * @tc.name createKVManager_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('createKVManager_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_promise_002 begin---------  ');
        factory.createKVManager(null).then((manager) => {
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +"Failed to create KVManager: " + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid bundleName");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_promise_0300
     * @tc.name createKVManager_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param bundleName is undefined
     */
    it('createKVManager_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_promise_003 begin---------  ');
        factory.createKVManager(undefined).then((manager) => {
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +"Failed to create KVManager: " + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid bundleName");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_promise_0400
     * @tc.name createKVManager_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('createKVManager_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- createKVManager_promise_004 begin---------  ');
        const kvManagerConfig = {
          bundleName : TEST_BUNDLE_NAME,
          userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
          }
        }
        factory.createKVManager(kvManagerConfig).then((manager) => {
          console.log(TAG +"Succeeded in creating KVManager");
          kvManager = manager;
          expect(kvManager!==undefined).assertTrue();
          done();
        }).catch((err) => {
          console.error(TAG +"Failed to create KVManager: " + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0100
     * @tc.name getKVStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param kvStoreType is MULTI_VERSION,SecurityLevel is NO_LEVEL
     */
    it('getKVStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      const kvManagerConfig = {
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
        securityLevel : factory.SecurityLevel.NO_LEVEL,
        kvStoreType : factory.KVStoreType.MULTI_VERSION,
      };
      try {
        console.info(TAG + ' --------- getKVStore_callback_001 begin---------  ');
        kvManager = await factory.createKVManager(kvManagerConfig);
        console.log(TAG +"Succeeded in creating KVManager");
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid options.KvStoreType");
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0200
     * @tc.name getKVStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S0
     */
    it('getKVStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_002 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S0,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }else{
            console.log(TAG +"getKVStore success");
            kvStore = store;
            expect(kvStore!== undefined).assertTrue();
            kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
              console.info(TAG+'afterEach closeKVStore success. err=' + err);
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                console.info(TAG+'afterEach deleteKVStore success. err=' + err);
                kvStore = null;
                done();
              });
            });
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0300
     * @tc.name getKVStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S1
     */
    it('getKVStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_003 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S1,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }else{
            console.log(TAG +"getKVStore success");
            kvStore = store;
            expect(kvStore!== undefined).assertTrue();
            kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
              console.info(TAG+'afterEach closeKVStore success. err=' + err);
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                console.info(TAG+'afterEach deleteKVStore success. err=' + err);
                kvStore = null;
                done();
              });
            });
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0400
     * @tc.name getKVStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S3
     */
    it('getKVStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_004 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S3,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }else{
            console.log(TAG +"getKVStore success");
            kvStore = store;
            expect(kvStore!== undefined).assertTrue();
            kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
              console.info(TAG+'afterEach closeKVStore success. err=' + err);
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                console.info(TAG+'afterEach deleteKVStore success. err=' + err);
                kvStore = null;
                done();
              });
            });
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0500
     * @tc.name getKVStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S4
     */
    it('getKVStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_005 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }else{
            console.log(TAG +"getKVStore success");
            kvStore = store;
            expect(kvStore!== undefined).assertTrue();
            kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
              console.info(TAG+'afterEach closeKVStore success. err=' + err);
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                console.info(TAG+'afterEach deleteKVStore success. err=' + err);
                kvStore = null;
                done();
              });
            });
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0600
     * @tc.name getKVStore_callback_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param schema.root.default is "",nullable is false,indexes is []
     */
    it('getKVStore_callback_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_006 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
          schema : {},
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.INTEGER;
        name.nullable = false;
        name.default = "";
        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        options.schema = schema;
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("GetSingleKvStore() failed");
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0700
     * @tc.name getKVStore_callback_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param schema.root.default is "",nullable is true,indexes is not null
     */
    it('getKVStore_callback_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_007 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
          schema : {},
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.INTEGER;
        name.nullable = true;
        name.default = "";
        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = ['name'];
        options.schema = schema;
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("GetSingleKvStore() failed");
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0800
     * @tc.name getKVStore_callback_008
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param schema.root.default is not null,nullable is true,indexes is ""
     */
    it('getKVStore_callback_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_008 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
          schema : {},
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.INTEGER;
        name.nullable = true;
        name.default = '0';
        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = "";
        options.schema = schema;
        kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.message).assertContain("failed: invalid arguments");
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0900
     * @tc.name getKVStore_callback_009
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('getKVStore_callback_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_009 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore("", options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid storeId");
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_1000
     * @tc.name getKVStore_callback_010
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('getKVStore_callback_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_010 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };
        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(null, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid storeId");
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_1100
     * @tc.name getKVStore_callback_011
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('getKVStore_callback_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_011 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(undefined, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid storeId");
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_1200
     * @tc.name getKVStore_callback_012
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('getKVStore_callback_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_012 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, null, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid options");
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_1300
     * @tc.name getKVStore_callback_013
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('getKVStore_callback_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_013 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, undefined, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid options");
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_1400
     * @tc.name getKVStore_callback_014
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is MAX_STORE_ID_LENGTH
     */
    it('getKVStore_callback_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_014 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let MAX_STORE_ID_LENGTH = 'a'.repeat(128)
        kvManager.getKVStore(MAX_STORE_ID_LENGTH, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          }else{
            console.log(TAG +"getKVStore success");
            kvStore = store;
            kvManager.closeKVStore(TEST_BUNDLE_NAME, MAX_STORE_ID_LENGTH, kvStore, async function (err, data) {
              console.info(TAG+'afterEach closeKVStore success. err=' + err);
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, MAX_STORE_ID_LENGTH, function (err, data) {
                console.info(TAG+'afterEach deleteKVStore success. err=' + err);
                kvStore = null;
                done();
              });
            });
          }
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_1500
     * @tc.name getKVStore_callback_015
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is MAX_STORE_ID_LENGTH+1
     */
    it('getKVStore_callback_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_callback_015 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let MAX_STORE_ID_LENGTH = 'a'.repeat(129)
        kvManager.getKVStore(MAX_STORE_ID_LENGTH, options, function (err, store) {
          if (err) {
            console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("GetSingleKvStore() failed");
            done();
          }else{
            console.log(TAG +"getKVStore success");
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0100
     * @tc.name getKVStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param kvStoreType is MULTI_VERSION,SecurityLevel is NO_LEVEL
     */
    it('getKVStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      const kvManagerConfig = {
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
        securityLevel : factory.SecurityLevel.NO_LEVEL,
        kvStoreType : factory.KVStoreType.MULTI_VERSION,
      };
      try {
        console.info(TAG + ' --------- getKVStore_promise_001 begin---------  ');
        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid options.KvStoreType");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0200
     * @tc.name getKVStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S0
     */
    it('getKVStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_002 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S0,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          kvStore = store;
          expect(kvStore!=undefined).assertTrue();
          kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
            console.info(TAG+'afterEach closeKVStore success. err=' + err);
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
              console.info(TAG+'afterEach deleteKVStore success. err=' + err);
              kvStore = null;
              done();
            });
          });
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0300
     * @tc.name getKVStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S1
     */
    it('getKVStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_003 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S1,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          kvStore = store;
          expect(kvStore!=undefined).assertTrue();
          kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
            console.info(TAG+'afterEach closeKVStore success. err=' + err);
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
              console.info(TAG+'afterEach deleteKVStore success. err=' + err);
              kvStore = null;
              done();
            });
          });
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0400
     * @tc.name getKVStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S3
     */
    it('getKVStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_004 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S3,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          kvStore = store;
          expect(kvStore!=undefined).assertTrue();
          kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
            console.info(TAG+'afterEach closeKVStore success. err=' + err);
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
              console.info(TAG+'afterEach deleteKVStore success. err=' + err);
              kvStore = null;
              done();
            });
          });
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0500
     * @tc.name getKVStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param SecurityLevel is S4
     */
    it('getKVStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_005 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          kvStore = store;
          expect(kvStore!=undefined).assertTrue();
          kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
            console.info(TAG+'afterEach closeKVStore success. err=' + err);
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
              console.info(TAG+'afterEach deleteKVStore success. err=' + err);
              kvStore = null;
              done();
            });
          });
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0600
     * @tc.name getKVStore_promise_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param schema.root.default is "",nullable is false,indexes is []
     */
    it('getKVStore_promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_006 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
          schema : {},
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.INTEGER;
        name.nullable = false;
        name.default = "";
        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        options.schema = schema;
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("GetSingleKvStore() failed");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0700
     * @tc.name getKVStore_promise_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param schema.root.default is "",nullable is true,indexes is not null
     */
    it('getKVStore_promise_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_007 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
          schema : {},
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.INTEGER;
        name.nullable = true;
        name.default = "";
        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [name];
        options.schema = schema;
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.message).assertContain("invalid arguments");
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0800
     * @tc.name getKVStore_promise_008
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param schema.root.default is not null,nullable is true,indexes is ""
     */
    it('getKVStore_promise_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_008 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
          schema : {},
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.INTEGER;
        name.nullable = true;
        name.default = '0';
        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = "";
        options.schema = schema;
        kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.message).assertContain("invalid");
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0900
     * @tc.name getKVStore_promise_009
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('getKVStore_promise_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_009 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore("", options).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_1000
     * @tc.name getKVStore_promise_010
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('getKVStore_promise_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_010 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        kvManager.getKVStore(null, options).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_1100
     * @tc.name getKVStore_promise_011
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('getKVStore_promise_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_011 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        console.log(TAG +"createKVManager success");
        kvManager.getKVStore(undefined, options).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_1200
     * @tc.name getKVStore_promise_012
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('getKVStore_promise_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_012 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };
        kvManager = await factory.createKVManager(kvManagerConfig);
        console.log(TAG +"createKVManager success");
        kvManager.getKVStore(TEST_STORE_ID, null).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_1300
     * @tc.name getKVStore_promise_013
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('getKVStore_promise_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_013 begin---------  ');
        const kvManagerConfig = {
          bundleName : TEST_BUNDLE_NAME,
          userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
          }
        }
        kvManager = await factory.createKVManager(kvManagerConfig);
        console.log(TAG +"createKVManager success");
        kvManager.getKVStore(TEST_STORE_ID, undefined).then((store) => {
          console.log(TAG +"getKVStore success");
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_1400
     * @tc.name getKVStore_promise_014
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is MAX_STORE_ID_LENGTH
     */
    it('getKVStore_promise_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_014 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };

        kvManager = await factory.createKVManager(kvManagerConfig);
        console.log(TAG +"createKVManager success");
        let MAX_STORE_ID_LENGTH = 'a'.repeat(128)
        kvManager.getKVStore(MAX_STORE_ID_LENGTH, options).then((store) => {
          console.log(TAG +"MAX_STORE_ID_LENGTH is "+ MAX_STORE_ID_LENGTH);
          console.log(TAG +"getKVStore success");
          kvStore = store;
          kvManager.closeKVStore(TEST_BUNDLE_NAME, MAX_STORE_ID_LENGTH, kvStore, async function (err, data) {
            console.info(TAG+'afterEach closeKVStore success. err=' + err);
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, MAX_STORE_ID_LENGTH, function (err, data) {
              console.info(TAG+'afterEach deleteKVStore success. err=' + err);
              kvStore = null;
              done();
            });
          });
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_1500
     * @tc.name getKVStore_promise_015
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is MAX_STORE_ID_LENGTH+1
     */
    it('getKVStore_promise_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- getKVStore_promise_015 begin---------  ');
        const kvManagerConfig = {
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
          securityLevel : factory.SecurityLevel.S4,
        };
        kvManager = await factory.createKVManager(kvManagerConfig);
        console.log(TAG +"createKVManager success");
        let MAX_STORE_ID_LENGTH = 'a'.repeat(129)
        kvManager.getKVStore(MAX_STORE_ID_LENGTH, options).then((store) => {
          console.log(TAG +"getKVStore success");
          kvStore = store;
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.log(TAG +"getKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          done();
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0100
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore("", TEST_STORE_ID, kvStore, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0200
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(null, TEST_STORE_ID, kvStore, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0300
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_003 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(undefined, TEST_STORE_ID, kvStore, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0400
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_004 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, "", kvStore, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0500
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_005 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, null, kvStore, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0600
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_006 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, undefined, kvStore, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })
    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0700
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_007 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, null, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("kvStore unmatch to storeId");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0800
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_008
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_008 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, undefined, function (err, data) {
          if (err) {
            console.log(TAG +"closeKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("kvStore unmatch to storeId");
          }else{
            console.info(TAG + 'closeKVStore success;');
            expect(null).assertFail();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0100
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore("", TEST_STORE_ID, kvStore).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0200
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(null, TEST_STORE_ID, kvStore).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0300
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_003 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(undefined, TEST_STORE_ID, kvStore).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0400
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_004 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, "", kvStore).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0500
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_005 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, null, kvStore).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0600
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_006 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, undefined, kvStore).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("invalid");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0700
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_007 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, null).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("kvStore unmatch to storeId");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0800
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_008
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc third param is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_008 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        kvStore =  await kvManager.getKVStore(TEST_STORE_ID, options);
        console.info(TAG + 'getKVStore=' + kvStore);
        kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, undefined).then(() => {
          console.log(TAG +'closeKVStore success');
          expect(null).assertFail();
        }).catch((err) => {
          console.log(TAG +'closeKVStore err ' + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
          expect(err.message).assertContain("kvStore unmatch to storeId");
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
      }finally{
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
          console.info(TAG +'afterEach closeKVStore success. err=' + err);
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
            console.info(TAG +'afterEach deleteKVStore success. err=' + err);
            kvStore = null;
            done();
          });
        });
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0100
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore("", TEST_STORE_ID, function (err, data) {
          if (err) {
            console.log(TAG +"deleteKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid appId");
            done();
          }else{
            console.log(TAG +'deleteKVStore success');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0200
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(null, TEST_STORE_ID, function (err, data) {
          if (err) {
            console.log(TAG +"deleteKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid appId");
            done();
          }else{
            console.log(TAG +'deleteKVStore success');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0300
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_003 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(undefined, TEST_STORE_ID, function (err, data) {
          if (err) {
            console.log(TAG +"deleteKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid appId");
            done();
          }else{
            console.log(TAG +'deleteKVStore success');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0400
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_004 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, "", function (err, data) {
          if (err) {
            console.log(TAG +"deleteKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid storeId");
            done();
          }else{
            console.log(TAG +'deleteKVStore success');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0500
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_005 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, null, function (err, data) {
          if (err) {
            console.log(TAG +"deleteKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid storeId");
            done();
          }else{
            console.log(TAG +'deleteKVStore success');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0600
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_006 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, undefined, function (err, data) {
          if (err) {
            console.log(TAG +"deleteKVStore err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid storeId");
            done();
          }else{
            console.log(TAG +'deleteKVStore success');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0100
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore("", TEST_STORE_ID).then(() => {
          console.log(TAG +'deleteKVStore success');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid appId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0200
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(null, TEST_STORE_ID).then(() => {
          console.log(TAG +'deleteKVStore success');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid appId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0300
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_003 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(undefined, TEST_STORE_ID).then(() => {
          console.log(TAG +'deleteKVStore success');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid appId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0400
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_004 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, "").then(() => {
          console.log(TAG +'deleteKVStore success');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid storeId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0500
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_005 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, null).then(() => {
          console.log(TAG +'deleteKVStore success');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid storeId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0600
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_006 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, undefined).then(() => {
          console.log(TAG +'deleteKVStore success');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid storeId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_callback_0100
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_callback_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId("", function (err, data) {
          if (err) {
            console.log(TAG +"getAllKVStoreId err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid appId");
            done();
          }else{
            console.log(TAG + 'GetAllKVStoreId size = ');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_callback_0200
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_callback_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(null, function (err, data) {
          if (err) {
            console.log(TAG +"getAllKVStoreId err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid appId");
            done();
          }else{
            console.log(TAG + 'GetAllKVStoreId size = ');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_callback_0300
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_callback_003 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(undefined, function (err, data) {
          if (err) {
            console.log(TAG +"getAllKVStoreId err: "  + JSON.stringify(err)+ `, error code is ${err.code}, message is ${err.message}`);
            expect(err.message).assertContain("invalid appId");
            done();
          }else{
            console.log(TAG + 'GetAllKVStoreId size = ');
            expect(null).assertFail();
            done();
          }
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_promise_0100
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_promise_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId("").then((data) => {
          console.log(TAG + 'GetAllKVStoreId size = ');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid appId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_promise_0200
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_promise_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(null).then((data) => {
          console.log(TAG + 'GetAllKVStoreId size = ');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid appId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_promise_0300
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_promise_003 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(undefined).then((data) => {
          console.log(TAG + 'GetAllKVStoreId size = ');
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG +`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(err.message).assertContain("invalid appId");
          done();
        });
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_on_0100
     * @tc.name KVManagerCoverageAdd_on_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_on_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_on_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = function () {
          console.log(TAG +'death callback call');
        }
        kvManager.on(null, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(e.message).assertContain("failed: invalid arguments");
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_on_0200
     * @tc.name KVManagerCoverageAdd_on_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_on_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_on_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = function () {
          console.log(TAG +'death callback call');
        }
        kvManager.on(undefined, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(e.message).assertContain("failed: invalid arguments");
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_off_0100
     * @tc.name KVManagerCoverageAdd_off_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_off_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_off_001 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = function () {
          console.log(TAG +'death callback call');
        }
        kvManager.off(null, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(e.message).assertContain("failed: invalid arguments");
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_off_0200
     * @tc.name KVManagerCoverageAdd_off_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_off_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
      console.info(TAG + ' --------- KVManagerCoverageAdd_off_002 begin---------  ');
      try {
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = function () {
          console.log(TAG +'death callback call');
        }
        kvManager.off(undefined, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + `Failed to get.code is ${e.code},message is ${e.message}`);
        expect(e.message).assertContain("failed: invalid arguments");
        done();
      }
    })

    console.info(TAG + '-------------------describe DistributedDataKVManagerCoverageAdd  end-------------------');
  })
}