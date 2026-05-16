/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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

//  run -l ActsKvStoreJsTest.hap -ta class:SingleKvStoreParamCheckDisData


const TAG = "[testtag >>>>>> ]"
const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'SingleKvStoreReturnValueDisDataId';
let kvManager = null;
let kvStore = null;

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
const VALUE_TEST_STRING_ELEMENT = 'value-string-002';

const config  = {
  bundleName : TEST_BUNDLE_NAME,
  userInfo : {
    userId : '0',
    userType : factory.UserType.SAME_USER_ID
  }
}

export default function SingleKvStoreParamCheckDisData(){
  describe('SingleKvStoreParamCheckDisData', () => {
    beforeAll(async (done) => {
      console.info(TAG + 'beforeAll end');
      done();
    });

    beforeEach(async (done) =>  {
      console.info(TAG + 'beforeEach end');
      done();
    });
    afterEach(async (done) =>  {
      console.info(TAG + 'afterEach');
      done();
    });

    afterAll(async (done) => {
      console.info(TAG + 'afterAll');
      done();
    });

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0100
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options, callback: AsyncCallback): void;
     * storeId.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0100 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0100 kvManager=' + kvManager);

        let storeId = '';
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0100 storeId.length=' + storeId.length);
        await kvManager.getKVStore(storeId, options, function (err, store) {
          console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0100 getKVStore success'+' err='+err + ' ,store='+store);
          expect((err != undefined) && (store == null)).assertTrue();
          done();
        });

      } catch (e) {
        console.error(TAG + ' SUB_DDM_SKV_ParamCheck_0100 catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0101
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0101
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options, callback: AsyncCallback): void;
     * storeId.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0101 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0101 kvManager=' + kvManager);

        let storeId = 's';
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0101 storeId.length=' + storeId.length);
        await kvManager.getKVStore(storeId, options, async function (err, store) {
          console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0101 getKVStore success'+' err='+err + ' ,store='+store);
          expect((err == undefined) && (store != null)).assertTrue();
          kvStore = store;

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0101 closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0101 deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + 'SUB_DDM_SKV_ParamCheck_0101 deleteKVStore err ' + err);
              done();
            });
          }).catch((err) => {
            console.error(TAG + 'SUB_DDM_SKV_ParamCheck_0101 closeKVStore err ' + err);
            done();
          });
        });

      } catch (e) {
        console.error(TAG + ' SUB_DDM_SKV_ParamCheck_0101 catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0102
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0102
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options, callback: AsyncCallback): void;
     * storeId.len = 128, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0102 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0102 kvManager=' + kvManager);

        let storeId = "s".repeat(128);
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0102 storeId.length=' + storeId.length);
        await kvManager.getKVStore(storeId, options, async function (err, store) {
          console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0102 getKVStore success'+' err='+err + ' ,store='+store);
          expect((err == undefined) && (store !== null)).assertTrue();
          kvStore = store;

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0102 closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0102 deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + 'SUB_DDM_SKV_ParamCheck_0102 deleteKVStore err ' + err);
              done();
            });
          }).catch((err) => {
            console.error(TAG + 'SUB_DDM_SKV_ParamCheck_0102 closeKVStore err ' + err);
            done();
          });


        });
      } catch (e) {
        console.error(TAG + ' SUB_DDM_SKV_ParamCheck_0102 catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0103
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0103
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options, callback: AsyncCallback): void;
     * storeId.len = 129, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0103 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0103 kvManager=' + kvManager);

        let storeId = "s".repeat(129);
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0103 storeId.length=' + storeId.length);
        await kvManager.getKVStore(storeId, options, function (err, store) {
          console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0103 getKVStore success'+' err='+err + ' ,store='+store);
          expect((err != undefined) && (store == null)).assertTrue();
          done();
        });

      } catch (e) {
        console.error(TAG + ' SUB_DDM_SKV_ParamCheck_0103 catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0200
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options): Promise;
     * storeId.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0200 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0200 kvManager=' + kvManager);

        let storeId = '';
        console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0200 storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then((store) => {
          console.info(TAG + 'SUB_DDM_SKV_ParamCheck_0200 getKVStore success'+ ' ,store='+store);
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG + 'SUB_DDM_SKV_ParamCheck_0200 getKVStore err ' + err);
          expect(err != undefined).assertTrue();
          done();
        });

      } catch (e) {
        console.error(TAG + ' SUB_DDM_SKV_ParamCheck_0200 catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0201
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0201
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options): Promise;
     * storeId.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0201 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = 's';
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });
        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0202
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0202
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options): Promise;
     * storeId.len = 128, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0202 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(128);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });
        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0203
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0203
     * @tc.desc   KVManager getKVStore(storeId: string, options: Options): Promise;
     * storeId.len = 129, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0203 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(129);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then((store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(null).assertFail();
          done();
        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(err != undefined).assertTrue();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0300
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * key.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0300 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.info(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err == undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });

          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0301
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0301
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * key.len = 1024, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0301 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = "k".repeat(1024);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.info(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err == undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          });
        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0302
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0302
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * key.len = 1025, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0302 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = "k".repeat(1025);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.error(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err != undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });

          });
        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0303
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0303
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * key.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0303 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = "";
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.error(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err != undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });

          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0400
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean): Promise;
     * key.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0400 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success'+ ' ,data='+data);
            expect(data == undefined).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' put error' + error);
            expect(null).assertFail();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0401
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0401
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean): Promise;
     * key.len = 1024, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0401 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1024);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success'+ ' ,data='+data);
            expect(data == undefined).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' put error' + error);
            expect(null).assertFail();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0402
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0402
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean): Promise;
     * key.len = 1025, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0402 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1025);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success'+ ' ,data='+data);
            expect(null).assertFail();
          }).catch((error) => {
            console.error(TAG + ' put error' + error);
            expect(error != undefined).assertTrue();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0403
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0403
     * @tc.desc   KVStore put(key: string, value: Uint8Array | string | number | boolean): Promise;
     * key.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0403 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = '';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success'+ ' ,data='+data);
            expect(null).assertFail();
          }).catch((error) => {
            console.error(TAG + ' put error' + error);
            expect(error != undefined).assertTrue();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0500
     * @tc.desc   SingleKVStore get get(key: string, callback: AsyncCallback<Uint8Array | string | boolean | number>): void;
     * key.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0500 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.info(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err == undefined).assertTrue();

            await kvStore.get(keyTest, async function (err,data) {
              console.info(TAG + ' get success' + ' err=' + err + ' ,data=' + data);
              expect(err == undefined).assertTrue();
              expect(data == valueTest).assertTrue();

              await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
                console.info(TAG + ' closeKVStore success');
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                  console.info(TAG + ' deleteKVStore success');
                  kvManager = null;
                  kvStore = null;
                  done();
                }).catch((err) => {
                  console.error(TAG + ' deleteKVStore err ' + err);
                  expect(null).assertFail();
                  done();
                });
              }).catch((err) => {
                console.error(TAG + ' closeKVStore err ' + err);
                expect(null).assertFail();
                done();
              });

            });

          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0501
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0501
     * @tc.desc   SingleKVStore get get(key: string, callback: AsyncCallback<Uint8Array | string | boolean | number>): void;
     * key.len = 1024, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0501 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1024);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.info(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err == undefined).assertTrue();

            await kvStore.get(keyTest, async function (err,data) {
              console.info(TAG + ' get success' + ' err=' + err + ' ,data=' + data);
              expect(err == undefined).assertTrue();
              expect(data == valueTest).assertTrue();

              await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
                console.info(TAG + ' closeKVStore success');
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                  console.info(TAG + ' deleteKVStore success');
                  kvManager = null;
                  kvStore = null;
                  done();
                }).catch((err) => {
                  console.error(TAG + ' deleteKVStore err ' + err);
                  expect(null).assertFail();
                  done();
                });
              }).catch((err) => {
                console.error(TAG + ' closeKVStore err ' + err);
                expect(null).assertFail();
                done();
              });

            });

          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0502
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0502
     * @tc.desc   SingleKVStore get get(key: string, callback: AsyncCallback<Uint8Array | string | boolean | number>): void;
     * key.len = 1025, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0502 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1025);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.get(keyTest, async function (err,data) {
            console.error(TAG + ' get success' + ' err=' + err + ' ,data=' + data);
            expect(err != undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0503
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0503
     * @tc.desc   SingleKVStore get get(key: string, callback: AsyncCallback<Uint8Array | string | boolean | number>): void;
     * key.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0503 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = '';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.get(keyTest, async function (err,data) {
            console.error(TAG + ' get success' + ' err=' + err + ' ,data=' + data);
            expect(err != undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });

          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0600
     * @tc.desc   SingleKVStore get(key: string): Promise<Uint8Array | string | boolean | number>;
     * key.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0600 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success'+ ' ,data='+data);
            expect(data == undefined).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' put error' + error);
            expect(null).assertFail();
          });

          await kvStore.get(keyTest).then((data) => {
            console.info(TAG + ' get success'+ ' ,data='+data);
            expect(data == valueTest).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' get error' + error);
            expect(null).assertFail();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0601
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0601
     * @tc.desc   SingleKVStore get(key: string): Promise<Uint8Array | string | boolean | number>;
     * key.len = 1024, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0601 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1024);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success '+ ' ,data='+data);
            expect(data == undefined).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' put error ' + error);
            expect(null).assertFail();
          });

          await kvStore.get(keyTest).then((data) => {
            console.info(TAG + ' get success '+ ' ,data='+data);
            expect(data == valueTest).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' get error ' + error);
            expect(null).assertFail();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0602
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0602
     * @tc.desc   SingleKVStore get(key: string): Promise<Uint8Array | string | boolean | number>;
     * key.len = 1025, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0602 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1025);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.get(keyTest).then((data) => {
            console.info(TAG + ' get success '+ ' ,data='+data);
            expect(null).assertFail();
          }).catch((error) => {
            console.error(TAG + ' get error ' + error);
            expect(error != undefined).assertTrue();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0603
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0603
     * @tc.desc   SingleKVStore get(key: string): Promise<Uint8Array | string | boolean | number>;
     * key.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0603 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = '';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.get(keyTest).then((data) => {
            console.info(TAG + ' get success '+ ' ,data='+data);
            expect(null).assertFail();
          }).catch((error) => {
            console.error(TAG + ' get error ' + error);
            expect(error != undefined).assertTrue();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0700
     * @tc.desc   KVStore delete delete(key: string, callback: AsyncCallback): void;
     * key.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0700 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.info(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err == undefined).assertTrue();

            await kvStore.delete(keyTest, async function (err,data) {
              console.info(TAG + ' delete success' + ' err=' + err + ' ,data=' + data);
              expect(err == undefined).assertTrue();

              await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
                console.info(TAG + ' closeKVStore success');
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                  console.info(TAG + ' deleteKVStore success');
                  kvManager = null;
                  kvStore = null;
                  done();
                }).catch((err) => {
                  console.error(TAG + ' deleteKVStore err ' + err);
                  expect(null).assertFail();
                  done();
                });
              }).catch((err) => {
                console.error(TAG + ' closeKVStore err ' + err);
                expect(null).assertFail();
                done();
              });

            });

          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0701
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0701
     * @tc.desc   KVStore delete delete(key: string, callback: AsyncCallback): void;
     * key.len = 1024, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0701 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1024);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest, async function (err,data) {
            console.info(TAG + ' put success'+' err='+err + ' ,data='+data);
            expect(err == undefined).assertTrue();

            await kvStore.delete(keyTest, async function (err,data) {
              console.info(TAG + ' delete success' + ' err=' + err + ' ,data=' + data);
              expect(err == undefined).assertTrue();

              await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
                console.info(TAG + ' closeKVStore success');
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                  console.info(TAG + ' deleteKVStore success');
                  kvManager = null;
                  kvStore = null;
                  done();
                }).catch((err) => {
                  console.error(TAG + ' deleteKVStore err ' + err);
                  expect(null).assertFail();
                  done();
                });
              }).catch((err) => {
                console.error(TAG + ' closeKVStore err ' + err);
                expect(null).assertFail();
                done();
              });

            });

          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0702
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0702
     * @tc.desc   KVStore delete delete(key: string, callback: AsyncCallback): void;
     * key.len = 1025, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0702 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1025);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.delete(keyTest, async function (err,data) {
            console.error(TAG + ' delete success' + ' err=' + err + ' ,data=' + data);
            expect(err != undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });

          });
        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0703
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0703
     * @tc.desc   KVStore delete delete(key: string, callback: AsyncCallback): void;
     * key.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0703 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = '';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.delete(keyTest, async function (err,data) {
            console.error(TAG + ' delete success' + ' err=' + err + ' ,data=' + data);
            expect(err != undefined).assertTrue();

            await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
              console.info(TAG + ' closeKVStore success');
              await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
                console.info(TAG + ' deleteKVStore success');
                kvManager = null;
                kvStore = null;
                done();
              }).catch((err) => {
                console.error(TAG + ' deleteKVStore err ' + err);
                expect(null).assertFail();
                done();
              });
            }).catch((err) => {
              console.error(TAG + ' closeKVStore err ' + err);
              expect(null).assertFail();
              done();
            });

          });
        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0800
     * @tc.desc   KVStore delete delete(key: string): Promise;
     * key.len = 1, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0800 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success'+ ' ,data='+data);
            expect(data == undefined).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' put error' + error);
            expect(null).assertFail();
          });

          await kvStore.delete(keyTest).then((data) => {
            console.info(TAG + ' delete success'+ ' ,data='+data);
          }).catch((error) => {
            console.error(TAG + ' delete error' + error);
            expect(null).assertFail();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0801
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0801
     * @tc.desc   KVStore delete delete(key: string): Promise;
     * key.len = 1024, suc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0801 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1024);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.put(keyTest, valueTest).then((data) => {
            console.info(TAG + ' put success'+ ' ,data='+data);
            expect(data == undefined).assertTrue();
          }).catch((error) => {
            console.error(TAG + ' put error' + error);
            expect(null).assertFail();
          });

          await kvStore.delete(keyTest).then((data) => {
            console.info(TAG + ' delete success'+ ' ,data='+data);
          }).catch((error) => {
            console.error(TAG + ' delete error' + error);
            expect(null).assertFail();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0802
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0802
     * @tc.desc   KVStore delete delete(key: string): Promise;
     * key.len = 1025, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0802 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = 'k'.repeat(1025);
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.delete(keyTest).then((data) => {
            console.info(TAG + ' delete success'+ ' ,data='+data);
            expect(null).assertFail();
          }).catch((error) => {
            console.error(TAG + ' delete error' + error);
            expect(error != undefined).assertTrue();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_SKV_ParamCheck_0803
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvParamCheckDisDataTest_0803
     * @tc.desc   KVStore delete delete(key: string): Promise;
     * key.len = 0, fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ParamCheck_0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      try {
        console.info(TAG + ' --------- SUB_DDM_SKV_ParamCheck_0803 begin---------  ');
        let kvManager = null;
        let kvStore = null;

        const options = {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: true,
          kvStoreType: factory.KVStoreType.SINGLE_VERSION,
          securityLevel: factory.SecurityLevel.S2,
        };
        kvManager = await factory.createKVManager(config);
        console.info(TAG + ' kvManager=' + kvManager);

        let storeId = "s".repeat(10);
        console.info(TAG + ' storeId.length=' + storeId.length);

        await kvManager.getKVStore(storeId, options).then(async(store) => {
          console.info(TAG + ' getKVStore success'+ ' ,store='+store);
          expect(store != null).assertTrue();
          kvStore = store;

          let keyTest = '';
          console.info(TAG + ' keyTest.length=' + keyTest.length);
          let valueTest = 'value';
          await kvStore.delete(keyTest).then((data) => {
            console.info(TAG + ' delete success'+ ' ,data='+data);
            expect(null).assertFail();
          }).catch((error) => {
            console.error(TAG + ' delete error' + error);
            expect(error != undefined).assertTrue();
          });

          await kvManager.closeKVStore(TEST_BUNDLE_NAME, storeId, kvStore).then(async () => {
            console.info(TAG + ' closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, storeId).then(() => {
              console.info(TAG + ' deleteKVStore success');
              kvManager = null;
              kvStore = null;
              done();
            }).catch((err) => {
              console.error(TAG + ' deleteKVStore err ' + err);
              expect(null).assertFail();
              done();
            });
          }).catch((err) => {
            console.error(TAG + ' closeKVStore err ' + err);
            expect(null).assertFail();
            done();
          });

        }).catch((err) => {
          console.error(TAG + ' getKVStore err ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e) {
        console.error(TAG + '  catch e ' + `,e.code=${e.code}, e.message=${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    console.info(TAG + '-------------------describe SingleKvStoreParamCheckDisData  end-------------------');
  })
}