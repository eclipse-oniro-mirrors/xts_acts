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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import factory from '@ohos.data.distributedKVStore';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TEST_BUNDLE_NAME = 'ohos.acts.kv2';
const TEST_STORE_ID = 'SingleKvStoreReturnValueId';
let kvManager: factory.KVManager| null = null;
let kvStore : factory.SingleKVStore| null = null;
let resultSet : factory.KVStoreResultSet | null = null;

const TAG = "[Kv_KVStoreResultSet_Ets_TEST >>>>>> ]"

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};

export default function KVStoreResultSetReturnValue(){
  describe('KVStoreResultSetReturnValue', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done:Function) => {
      console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
      console.info(TAG + 'beforeAll end');
      done();

    });

    beforeEach(async (done:Function) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');

        try {
          let entries: factory.Entry[] = [];
          for (let i = 0; i < 10; i++) {
            let key = 'batch_test_string_key';
            let entry: factory.Entry = {
              key: key + i,
              value: {
                type: factory.ValueType.STRING,
                value: 'batch_test_string_value'
              }
            }
            await entries.push(entry);
          }
          console.info(TAG +`entries: ${entries}`);

          await kvStore.putBatch(entries).then(async () => {
            console.info(TAG +'Succeeded in putting Batch');
            if (kvStore != null) {
              await kvStore.getEntries('batch_test_string_key').then((entries: factory.Entry[]) => {
                console.info(TAG +'Succeeded in getting Entries');
                console.info(TAG +`PutBatch ${entries}`);
              }).catch((err: BusinessError) => {
                console.error(TAG +`Failed to get Entries.code is ${err.code},message is ${err.message}`);
              });
            }
          }).catch((err: BusinessError) => {
            console.error(TAG +`Failed to put Batch.code is ${err.code},message is ${err.message}`);
          });

          await kvStore.getResultSet('batch_test_string_key').then((result) => {
            console.info(TAG +'beforeEach getResultSet success');
            resultSet = result;
          }).catch((err: BusinessError) => {
            console.error(TAG +'beforeEach getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          });
        } catch (e) {
          let error = e as BusinessError;
          console.error(TAG +`An unexpected error occurred.code is ${error.code},message is ${error.message} `);
        }
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      done();
    });
    afterEach(async (done:Function) =>  {
      console.info(TAG + 'afterEach');
      if (kvStore !== null) {
        await kvStore.closeResultSet(resultSet).then((err) => {
          console.info(TAG +'afterEach closeResultSet success');
        }).catch((err: BusinessError) => {
          console.error(TAG +'afterEach closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }

      kvStore = null;
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded closeKVStore');
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed closeKVStore.code is ${err.code},message is ${err.message}`);
      });

      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded deleteKVStore');
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
        done();
      });
    });

    afterAll(async (done:Function) => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0100
     * @tc.desc getResultSet getCount
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0100
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let count: number = resultSet.getCount();
          console.info(TAG +"DisKVResultReturnValueTest0100 " + count);
          expect(count).assertEqual(10);
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0200
     * @tc.desc getResultSet getPosition
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0200
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let position: number;
          position = resultSet.getPosition();
          console.info(TAG +"DisKVResultReturnValueTest0200 " + position);
          expect(position).assertEqual(-1);
          let moved:boolean = resultSet.moveToNext();
          console.info(TAG +"DisKVResultReturnValueTest0200 " + moved);
          expect(moved).assertTrue();
          position = resultSet.getPosition();
          console.info(TAG +"DisKVResultReturnValueTest0200 " + position);
          expect(position).assertEqual(0);
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0300
     * @tc.desc getResultSet is not null , moveToFirst return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0300
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved: boolean = resultSet.moveToFirst();
          console.info(TAG +"DisKVResultReturnValueTest0300 " + moved);
          expect(moved).assertEqual(true);
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0400
     * @tc.desc getResultSet is null , moveToFirst return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0400
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let resultSet1 : factory.KVStoreResultSet | null = null;
      if (kvStore !== null) {
        await kvStore.getResultSet('AA').then((result) => {
          console.info(TAG +' getResultSet success');
          resultSet1 = result;
          let moved:boolean = resultSet1.moveToFirst();
          console.info(TAG +"DisKVResultReturnValueTest0400 " + moved);
          expect(moved).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(TAG +' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });

        await kvStore.closeResultSet(resultSet1).then((err) => {
          console.info(TAG +' closeResultSet success');
        }).catch((err: BusinessError) => {
          console.error(TAG +' closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0500
     * @tc.desc getResultSet is not null , moveToLast return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0500
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved: boolean = resultSet.moveToLast();
          console.info(TAG +"DisKVResultReturnValueTest0500 " + moved);
          expect(moved).assertEqual(true);
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest0500 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0600
     * @tc.desc getResultSet is null , moveToLast return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0600
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let resultSet1 : factory.KVStoreResultSet | null = null;
      if (kvStore !== null) {
        await kvStore.getResultSet('AA').then((result) => {
          console.info(TAG +' getResultSet success');
          resultSet1 = result;
          let moved:boolean = resultSet1.moveToLast();
          console.info(TAG +"DisKVResultReturnValueTest0600 " + moved);
          expect(moved).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(TAG +' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });

        await kvStore.closeResultSet(resultSet1).then((err) => {
          console.info(TAG +' closeResultSet success');
        }).catch((err: BusinessError) => {
          console.error(TAG +' closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0700
     * @tc.desc getResultSet is not null , moveToNext return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0700
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved: boolean = resultSet.moveToNext();
          console.info(TAG +"DisKVResultReturnValueTest0700 " + moved);
          expect(moved).assertEqual(true);
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest0700 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0800
     * @tc.desc getResultSet is null , moveToNext return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0800
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let resultSet1 : factory.KVStoreResultSet | null = null;
      if (kvStore !== null) {
        await kvStore.getResultSet('AA').then((result) => {
          console.info(TAG +' getResultSet success');
          resultSet1 = result;
          let moved:boolean = resultSet1.moveToNext();
          console.info(TAG +"DisKVResultReturnValueTest0800 " + moved);
          expect(moved).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(TAG +' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });

        await kvStore.closeResultSet(resultSet1).then((err) => {
          console.info(TAG +' closeResultSet success');
        }).catch((err: BusinessError) => {
          console.error(TAG +' closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_0900
     * @tc.desc getResultSet is not null , moveToPrevious return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest0900
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved: boolean;
          moved = resultSet.moveToLast();
          moved = resultSet.moveToPrevious();
          console.info(TAG +"DisKVResultReturnValueTest0900 " + moved);
          expect(moved).assertEqual(true);
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest0900 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1000
     * @tc.desc getResultSet is null , moveToPrevious return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1000
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let resultSet1 : factory.KVStoreResultSet | null = null;
      if (kvStore !== null) {
        await kvStore.getResultSet('AA').then((result) => {
          console.info(TAG +' getResultSet success');
          resultSet1 = result;
          let moved:boolean = resultSet1.moveToPrevious();
          console.info(TAG +"DisKVResultReturnValueTest1000 " + moved);
          expect(moved).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(TAG +' getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });

        await kvStore.closeResultSet(resultSet1).then((err) => {
          console.info(TAG +' closeResultSet success');
        }).catch((err: BusinessError) => {
          console.error(TAG +' closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1100
     * @tc.desc getResultSet not Exceeded the maximum , move return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1100
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved = resultSet.move(2);
          console.info(TAG +"DisKVResultReturnValueTest1100 " + moved);
          expect(moved).assertEqual(true);
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1100 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1200
     * @tc.desc getResultSet Exceeded the maximum , move return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1200
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved = resultSet.move(11);
          console.info(TAG +"DisKVResultReturnValueTest1200 " + moved);
          expect(moved).assertFalse();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1200 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1300
     * @tc.desc getResultSet Parameter error , move return 401
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1300
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          resultSet.move(null);
          expect(null).assertFail();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1300 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(401).assertEqual(e.code)
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1400
     * @tc.desc getResultSet not Exceeded the maximum , moveToPosition return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1400
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved = resultSet.moveToPosition(1);
          console.info(TAG +"DisKVResultReturnValueTest1400 " + moved);
          expect(moved).assertTrue();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1400 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1500
     * @tc.desc getResultSet Exceeded the maximum , moveToPosition return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1500
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved = resultSet.moveToPosition(11);
          console.info(TAG +"DisKVResultReturnValueTest1500 " + moved);
          expect(moved).assertFalse();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1500 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1600
     * @tc.desc getResultSet param error , moveToPosition return 401
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1600
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          resultSet.moveToPosition(null);
          expect(null).assertFail();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1600 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(401).assertEqual(e.code)
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1700
     * @tc.desc getResultSet isFirst , is First return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1700
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let flag = resultSet.moveToFirst();
          expect(flag).assertTrue();
          let moved = resultSet.isFirst();
          console.info(TAG +"DisKVResultReturnValueTest1700 " + moved);
          expect(moved).assertTrue();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1700 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1800
     * @tc.desc getResultSet isFirst , is not First return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1800
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved = resultSet.isFirst();
          console.info(TAG +"DisKVResultReturnValueTest1800 " + moved);
          expect(moved).assertFalse();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1800 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_1900
     * @tc.desc getResultSet isLast , is Last return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest1900
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let flag = resultSet.moveToLast();
          expect(flag).assertTrue();
          let moved = resultSet.isLast();
          console.info(TAG +"DisKVResultReturnValueTest1900 " + moved);
          expect(moved).assertTrue();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest1900 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_2000
     * @tc.desc getResultSet isLast , is not Last return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest2000
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved = resultSet.isLast();
          console.info(TAG +"DisKVResultReturnValueTest2000 " + moved);
          expect(moved).assertFalse();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest2000 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_2100
     * @tc.desc getResultSet isBeforeFirst , is BeforeFirst return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest2100
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let moved = resultSet.isBeforeFirst();
          console.info(TAG +"DisKVResultReturnValueTest2100 " + moved);
          expect(moved).assertTrue();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest2100 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_2200
     * @tc.desc getResultSet isBeforeFirst , is not BeforeFirst return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest2200
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let flag = resultSet.moveToFirst();
          expect(flag).assertTrue();
          let moved = resultSet.isBeforeFirst();
          console.info(TAG +"DisKVResultReturnValueTest2200 " + moved);
          expect(moved).assertFalse();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest2200 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_2300
     * @tc.desc getResultSet isAfterLast , is  AfterLast return true
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest2300
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let flag = resultSet.moveToLast();
          console.info(TAG +"DisKVResultReturnValueTest2300 " + flag);
          expect(flag).assertTrue();
          flag = resultSet.moveToNext();
          console.info(TAG +"DisKVResultReturnValueTest2300 " + flag);
          expect(flag).assertFalse();
          let moved = resultSet.isAfterLast();
          console.info(TAG +"DisKVResultReturnValueTest2300 " + moved);
          expect(moved).assertTrue();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest2300 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_2400
     * @tc.desc getResultSet isAfterLast , is not AfterLast return false
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest2400
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let flag = resultSet.moveToFirst();
          expect(flag).assertTrue();
          let moved = resultSet.isAfterLast();
          console.info(TAG +"DisKVResultReturnValueTest2400 " + moved);
          expect(moved).assertFalse();
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest2400 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultReturnValueTest_2500
     * @tc.desc getResultSet getEntry
     * @tc.type FUNC
     * @tc.name DisKVResultReturnValueTest2500
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('DisKVResultReturnValueTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if (resultSet !== null) {
        try {
          let flag = resultSet.moveToNext();
          expect(flag).assertTrue();
          let entry = resultSet.getEntry();
          console.info(TAG +"DisKVResultReturnValueTest2500 " + entry);
          expect(entry.key).assertEqual('batch_test_string_key0');
          expect(entry.value.value).assertEqual('batch_test_string_value');
        } catch (e) {
          console.error(TAG +"DisKVResultReturnValueTest2500 fail " + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
        }
      }
      done();
    })
    console.info(TAG + '-------------------describe SingleKvStoreResultSetReturnValue  end-------------------');
  })
}