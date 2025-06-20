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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import distributedKVStore from '@ohos.data.distributedKVStore'
import common from "@ohos.app.ability.common";
import { BusinessError } from '@kit.BasicServicesKit';
import fs from '@ohos.file.fs';

let context: common.UIAbilityContext;
const TAG = "[ttt]"
const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore'
const TEST_STORE_ID = 'storeId';
const TEST_STORE_ID1 = 'storeId1';
let kvManager: distributedKVStore.KVManager | undefined = undefined;
let kvStore: distributedKVStore.SingleKVStore | undefined = undefined;
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS =  [];  /* add you test device-ids here */
let syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);
const options: distributedKVStore.Options = {
  createIfMissing: true,
  encrypt: false,
  backup: false,
  autoSync: true,
  kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
  securityLevel: distributedKVStore.SecurityLevel.S2,
};
const options1: distributedKVStore.Options = {
  createIfMissing: false,
  encrypt: true,
  backup: true,
  autoSync: false,
  kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
  securityLevel: distributedKVStore.SecurityLevel.S2,
};

export default function SingleKvStoreErrCodeTest(){
  describe('SingleKvStoreErrCodeTest', () => {
    beforeAll(async (done: Function) => {
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config: distributedKVStore.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context
      };
      console.info(TAG + 'beforeAll config:' + JSON.stringify(config));
      kvManager = distributedKVStore.createKVManager(config);
      console.info(TAG+ 'beforeAll end');
      done();
    });
    beforeEach(async (done: Function) => {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager?.getKVStore(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      console.info(TAG + 'beforeEach end');
      done();
    });
    afterEach(async (done: Function) => {
      console.info(TAG + 'afterEach');
      await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info(TAG + 'afterEach closeKVStore success');
        await kvManager?.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info(TAG + 'afterEach deleteKVStore success');
        }).catch((err: BusinessError) => {
          console.error(TAG + 'afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail()
        });
      }).catch((err: BusinessError) => {
        console.error(TAG + 'afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect().assertFail()
      });
      kvStore = undefined;
      done();
    });
    afterAll(async (done: Function) => {
      console.info(TAG + 'afterAll');
      kvManager = undefined;
      kvStore = undefined;
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010
     * @tc.desc distributedKVStore ChangeNotification.deviceId
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010 start');
      try {
        kvStore?.on('dataChange', distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification: distributedKVStore.ChangeNotification) => {
          console.info(TAG + `dataChange callback call data: ${ChangeNotification}`);
          let deviceId = ChangeNotification.deviceId
          console.info(TAG + 'ChangeNotification.deviceId' + JSON.stringify(deviceId));
        });
        await kvStore?.put("name","zhangsan");
        console.info(TAG + `Succeeded in putting data`);
        let data = await kvStore?.get("name");
        console.info(TAG + `Succeeded in getting data.data=${data}`);
        expect(data).assertEqual("zhangsan");
      }catch (err) {
        console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0020
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0020
     * @tc.desc distributedKVStore move errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0020 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        resultSet = await kvStore?.getResultSet('name');
        console.info(TAG + 'Succeeded in getting resultSet');
        let moved = resultSet?.move(null);
        console.info(TAG + `Succeeded in moving.moved = ${moved}`);
        expect().assertFail();
      }catch (err) {
        console.error(TAG + `Failed to move.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(401);
        await kvStore?.closeResultSet(resultSet);
        console.info(TAG + 'Succeeded in close resultSet');
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0030
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0030
     * @tc.desc distributedKVStore moveToPosition errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0030 start');
      let resultSet: distributedKVStore.KVStoreResultSet;
      try {
        let moved: boolean;
        await kvStore?.getResultSet('name').then((result: distributedKVStore.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded in getting resultSet');
          resultSet = result;
          moved = resultSet.moveToPosition(null);
          console.info(TAG + `Succeeded in moving to position.moved=${moved}`);
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(TAG + `Failed to move to position.err.code is ${err.code},err.message is ${err.message}`);
          expect(err.code).assertEqual(401);
          await kvStore?.closeResultSet(resultSet);
          console.info(TAG + 'Succeeded in close resultSet');
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to move to position.error.code is ${error.code},error.message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0040
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0040
     * @tc.desc distributedKVStore equalTo errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0040 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.equalTo(null, "value");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `duplicated calls should be ok.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0050
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0050
     * @tc.desc distributedKVStore notEqualTo errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0050 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.notEqualTo(null, "value");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `duplicated calls should be ok.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0060
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0060
     * @tc.desc distributedKVStore greaterThan errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0060 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.greaterThan(null, "value");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `duplicated calls should be ok.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0070
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0070
     * @tc.desc distributedKVStore lessThan errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0070 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.lessThan(null, "value");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0080
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0080
     * @tc.desc distributedKVStore greaterThanOrEqualTo errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0080 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.greaterThanOrEqualTo(null, "value");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0090
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0090
     * @tc.desc distributedKVStore lessThanOrEqualTo errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0090 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.lessThanOrEqualTo(null, "value");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0100
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0100
     * @tc.desc distributedKVStore put errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0100 start');
      try {
        kvStore?.put(null, "zhangsan", (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to put.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in putting");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0110
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0110
     * @tc.desc distributedKVStore putBatch errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0110 start');
      try {
        kvStore?.putBatch(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in putBatch");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0120
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0120
     * @tc.desc distributedKVStore putBatch errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0120 start');
      try {
        await kvStore?.putBatch(null);
        console.info(TAG + "Succeeded in putBatch");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0130
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0130
     * @tc.desc distributedKVStore delete errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0130 start');
      try {
        await kvStore?.delete(null);
        console.info(TAG + "Succeeded in delete");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0140
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0140
     * @tc.desc distributedKVStore deleteBatch errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0140 start');
      try {
        kvStore?.deleteBatch(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to deleteBatch.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in deleteBatch");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0150
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0150
     * @tc.desc distributedKVStore deleteBatch errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0150 start');
      try {
        await kvStore?.deleteBatch(null);
        console.info(TAG + "Succeeded in deleteBatch");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0160
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0160
     * @tc.desc distributedKVStore removeDeviceData errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0160 start');
      try {
        kvStore?.removeDeviceData(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to removeDeviceData.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in removeDeviceData");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0170
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0170
     * @tc.desc distributedKVStore removeDeviceData errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0170 start');
      try {
        await kvStore?.removeDeviceData(null);
        console.info(TAG + "Succeeded in removeDeviceData");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0180
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0180
     * @tc.desc distributedKVStore get errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0180 start');
      try {
        kvStore?.get(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in get");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0190
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0190
     * @tc.desc distributedKVStore get errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0190 start');
      try {
        await kvStore?.get(null);
        console.info(TAG + "Succeeded in get");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0200
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0200
     * @tc.desc distributedKVStore getEntries errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0200 start');
      try {
        kvStore?.getEntries(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in getEntries");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0210
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0210
     * @tc.desc distributedKVStore getEntries errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0210 start');
      try {
        await kvStore?.getEntries(null);
        console.info(TAG + "Succeeded in getEntries");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0220
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0220
     * @tc.desc distributedKVStore getEntries query errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0220 start');
      try {
        let  query: distributedKVStore.Query | null = new distributedKVStore.Query();
        query = null;
        kvStore?.getEntries(query, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in getEntries");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0230
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0230
     * @tc.desc distributedKVStore getEntries query errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0230 start');
      try {
        let  query: distributedKVStore.Query | null = new distributedKVStore.Query();
        query = null;
        await kvStore?.getEntries(query);
        console.info(TAG + "Succeeded in getEntries");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0240
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0240
     * @tc.desc distributedKVStore getResultSize errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0240 start');
      try {
        let  query: distributedKVStore.Query | null = new distributedKVStore.Query();
        query = null;
        kvStore?.getResultSize(query, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in getResultSize");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0250
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0250
     * @tc.desc distributedKVStore getResultSize errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0250 start');
      try {
        let  query: distributedKVStore.Query | null = new distributedKVStore.Query();
        query = null;
        await kvStore?.getResultSize(query);
        console.info(TAG + "Succeeded in getResultSize");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0260
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0260
     * @tc.desc distributedKVStore deleteBackup errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0260 start');
      try {

        kvStore?.deleteBackup(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in deleteBackup");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0270
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0270
     * @tc.desc distributedKVStore deleteBackup errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0270 start');
      try {
        await kvStore?.deleteBackup(null);
        console.info(TAG + "Succeeded in deleteBackup");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0280
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0280
     * @tc.desc distributedKVStore enableSync errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0280 start');
      try {

        kvStore?.enableSync(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in enableSync");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0290
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0290
     * @tc.desc distributedKVStore enableSync errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0290 start');
      try {
        await kvStore?.enableSync(null);
        console.info(TAG + "Succeeded in enableSync");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0300
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0300
     * @tc.desc distributedKVStore setSyncRange errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0300 start');
      try {

        kvStore?.setSyncRange(null, null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in setSyncRange");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0310
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0310
     * @tc.desc distributedKVStore setSyncRange errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0310 start');
      try {
        await kvStore?.setSyncRange(null, null);
        console.info(TAG + "Succeeded in setSyncRange");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0320
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0320
     * @tc.desc distributedKVStore setSyncParam errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0320 start');
      try {

        kvStore?.setSyncParam(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in setSyncParam");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0330
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0330
     * @tc.desc distributedKVStore setSyncParam errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0330 start');
      try {
        await kvStore?.setSyncParam(null);
        console.info(TAG + "Succeeded in setSyncParam");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0340
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0340
     * @tc.desc distributedKVStore sync errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0340 start');
      try {
        kvStore?.sync(null, distributedKVStore.SyncMode.PULL_ONLY);
        console.info(TAG + "Succeeded in sync");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0350
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0350
     * @tc.desc distributedKVStore query sync errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0350 start');
      try {
        const query = new distributedKVStore.Query();
        query.prefixKey("batch_test");
        kvStore?.sync(null, query, distributedKVStore.SyncMode.PULL_ONLY, 10);
        console.info(TAG + "Succeeded in sync");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0360
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0360
     * @tc.desc distributedKVStore on dataChange errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0360 start');
      try {
        kvStore?.on("dataChange", null, () => {});
        console.info(TAG + "Succeeded in on");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0370
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0370
     * @tc.desc distributedKVStore off dataChange errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0370 start');
      try {
        kvStore?.off("dataChange", null);
        console.info(TAG + "Succeeded in off");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0380
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0380
     * @tc.desc distributedKVStore on syncComplete errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0380 start');
      try {
        kvStore?.on("syncComplete", null);
        console.info(TAG + "Succeeded in on");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0390
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0390
     * @tc.desc distributedKVStore off syncComplete errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0390 start');
      try {
        kvStore?.off("syncComplete", null);
        console.info(TAG + "Succeeded in off");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0400
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0400
     * @tc.desc distributedKVStore appendChild errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0400 start');
      try {
        let node: distributedKVStore.FieldNode | null = new distributedKVStore.FieldNode("root");
        node.appendChild(null);
        console.info(TAG + "appendChild Succeeded");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `appendChild error.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0410
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0410
     * @tc.desc distributedKVStore isNull errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0410 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.isNull(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0420
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0420
     * @tc.desc distributedKVStore inNumber errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0420 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.inNumber(null, []);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0430
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0430
     * @tc.desc distributedKVStore inString errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0430 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.inString(null, []);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0440
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0440
     * @tc.desc distributedKVStore notInNumber errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0440 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.notInNumber(null, []);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0450
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0450
     * @tc.desc distributedKVStore notInString errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0450 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.notInString(null, []);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0460
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0460
     * @tc.desc distributedKVStore like errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0460 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.like(null, "");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0470
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0470
     * @tc.desc distributedKVStore unlike errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0450 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.unlike(null, "");
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0480
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0480
     * @tc.desc distributedKVStore orderByAsc errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0480 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.orderByAsc(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0490
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0490
     * @tc.desc distributedKVStore orderByAsc errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0490 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.orderByAsc(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0500
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0500
     * @tc.desc distributedKVStore orderByDesc errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0500 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.orderByDesc(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0510
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0510
     * @tc.desc distributedKVStore limit errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0510 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.limit(null, 0);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0520
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0520
     * @tc.desc distributedKVStore isNotNull errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0520 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.isNotNull(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0530
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0530
     * @tc.desc distributedKVStore prefixKey errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0530 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.prefixKey(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0540
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0540
     * @tc.desc distributedKVStore setSuggestIndex errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0540 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.setSuggestIndex(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1190
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1190
     * @tc.desc distributedKVStore deviceId errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1190 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.deviceId(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0550
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0550
     * @tc.desc distributedKVStore deviceId errcode 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0550 start');
      let query: distributedKVStore.Query | null = new distributedKVStore.Query();
      try {
        query.deviceId(null);
        console.info(TAG + `query is ${query.getSqlLike()}`);
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `duplicated calls should be ok.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
        query = null;
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0560
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0560
     * @tc.desc distributedKVStore put errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0560 start');
      try {
        await kvStore?.put(null, "zhangsan");
        console.info(TAG + "Succeeded in put");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0570
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0570
     * @tc.desc distributedKVStore delete errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0570 start');
      try {
        kvStore?.delete(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to delete.code is ${err.code},message is ${err.message}`);
            done();
          }else {
            console.info(TAG + "Succeeded in putBatch");
            expect().assertFail();
          }
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        done();
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0580
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0580
     * @tc.desc distributedKVStore getResultSet query errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0580 start');
      try {
        let  query: distributedKVStore.Query | null = new distributedKVStore.Query();
        query = null;
        kvStore?.getResultSet(query, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in getResultSet");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0590
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0590
     * @tc.desc distributedKVStore getResultSet query errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0590 start');
      try {
        let  query: distributedKVStore.Query | null = new distributedKVStore.Query();
        query = null;
        await kvStore?.getResultSet(query);
        console.info(TAG + "Succeeded in getResultSet");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0600
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0600
     * @tc.desc distributedKVStore getResultSet errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0600 start');
      try {
        kvStore?.getResultSet(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in getResultSet");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0610
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0610
     * @tc.desc distributedKVStore getResultSet errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0610 start');
      try {
        await kvStore?.getResultSet(null);
        console.info(TAG + "Succeeded in getResultSet");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0620
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0620
     * @tc.desc distributedKVStore closeResultSet errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0620 start');
      try {
        kvStore?.closeResultSet(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to closeResultSet.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in closeResultSet");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0630
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0630
     * @tc.desc distributedKVStore closeResultSet errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0630 start');
      try {
        await kvStore?.closeResultSet(null);
        console.info(TAG + "Succeeded in closeResultSet");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0640
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0640
     * @tc.desc distributedKVStore backup errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0640 start');
      try {
        kvStore?.backup(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to backup.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in backup");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0650
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0650
     * @tc.desc distributedKVStore backup errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0650 start');
      try {
        await kvStore?.backup(null);
        console.info(TAG + "Succeeded in backup");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0660
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0660
     * @tc.desc distributedKVStore restore errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0660 start');
      try {
        kvStore?.restore(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in restore");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0670
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0670
     * @tc.desc distributedKVStore restore errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0670 start');
      try {
        await kvStore?.restore(null);
        console.info(TAG + "Succeeded in restore");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0680
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0680
     * @tc.desc distributedKVStore getAllKVStoreId errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0680 start');
      try {
        kvManager?.getAllKVStoreId(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to getAllKVStoreId.code is ${err.code},message is ${err.message}`);
            done();
          }
          console.info(TAG + "Succeeded in getAllKVStoreId");
          expect().assertFail();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0690
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0690
     * @tc.desc distributedKVStore restore errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0690 start');
      try {
        await kvManager?.getAllKVStoreId(null);
        console.info(TAG + "Succeeded in getAllKVStoreId");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0700
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0700
     * @tc.desc distributedKVStore on errcode 401 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0700 start');
      try {
        kvManager?.on("distributedDataServiceDie", null);
        console.info(TAG + "Succeeded in on");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0710
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0710
     * @tc.desc distributedKVStore on errcode 401 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0710 start');
      try {
        kvManager?.off(null);
        console.info(TAG + "Succeeded in off");
        expect().assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `An unexpected error occurred.code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720
     * @tc.desc distributedKVStore getResultSet errcode 15100001 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      console.info(TAG + 'Succeeded in getting result set');
      let resultSet8: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore?.put("name", "zhangsan");
        console.info(TAG + 'Succeeded in put');
        kvStore?.getResultSet("name", async (err, result) => {
          if(err) {
            console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100001);
            await kvStore?.closeResultSet(resultSet0);
            await kvStore?.closeResultSet(resultSet1);
            await kvStore?.closeResultSet(resultSet2);
            await kvStore?.closeResultSet(resultSet3);
            await kvStore?.closeResultSet(resultSet4);
            await kvStore?.closeResultSet(resultSet5);
            await kvStore?.closeResultSet(resultSet6);
            await kvStore?.closeResultSet(resultSet7);
            console.info(TAG + 'Succeeded in close result set');
            done();
          }else {
            resultSet8 = result;
            console.info(TAG + 'Succeeded in getting result set');
            expect().assertFail()
          }
        });
      } catch (err) {
        console.error(TAG + `An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730
     * @tc.desc distributedKVStore getResultSet errcode 15100001 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      console.info(TAG + 'Succeeded in getting result set');
      try {
        await kvStore?.put("name", "zhangsan");
        console.info(TAG + 'Succeeded in put');
        let resultSet8: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
        console.info(TAG + 'Succeeded in getting result set');
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100001);
        await kvStore?.closeResultSet(resultSet0);
        await kvStore?.closeResultSet(resultSet1);
        await kvStore?.closeResultSet(resultSet2);
        await kvStore?.closeResultSet(resultSet3);
        await kvStore?.closeResultSet(resultSet4);
        await kvStore?.closeResultSet(resultSet5);
        await kvStore?.closeResultSet(resultSet6);
        await kvStore?.closeResultSet(resultSet7);
        console.info(TAG + 'Succeeded in close result set');
        done();
      }

    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740
     * @tc.desc distributedKVStore query getResultSet errcode 15100001 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      console.info(TAG + 'Succeeded in getting result set');
      try {
        let resultSet: distributedKVStore.KVStoreResultSet;
        const query = new distributedKVStore.Query();
        query.prefixKey("name")
        kvStore?.put("name", "zhangsan", async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to put.code is ${err.code},message is ${err.message}`);
            return;
          }
          console.info(TAG + 'Succeeded in put');
          kvStore?.getResultSet(query, async (err, result) => {
            if(err) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(15100001);
              await kvStore?.closeResultSet(resultSet0);
              await kvStore?.closeResultSet(resultSet1);
              await kvStore?.closeResultSet(resultSet2);
              await kvStore?.closeResultSet(resultSet3);
              await kvStore?.closeResultSet(resultSet4);
              await kvStore?.closeResultSet(resultSet5);
              await kvStore?.closeResultSet(resultSet6);
              await kvStore?.closeResultSet(resultSet7);
              console.info(TAG + 'Succeeded in close result set');
              done();
            }else {
              resultSet = result;
              console.info(TAG + 'Succeeded in getting result set');
              expect().assertFail()
            }
          });
        });
      } catch (err) {
        console.error(TAG + `An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750
     * @tc.desc distributedKVStore query getResultSet errcode 15100001 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet("name");
      console.info(TAG + 'Succeeded in getting result set');
      try {
        const query = new distributedKVStore.Query();
        query.prefixKey("name")
        await kvStore?.put("name", "zhangsan");
        console.info(TAG + 'Succeeded in put');
        let resultSet: distributedKVStore.KVStoreResultSet | undefined = await kvStore?.getResultSet(query)
        console.info(TAG + 'Succeeded in getting result set');
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100001);
        await kvStore?.closeResultSet(resultSet0);
        await kvStore?.closeResultSet(resultSet1);
        await kvStore?.closeResultSet(resultSet2);
        await kvStore?.closeResultSet(resultSet3);
        await kvStore?.closeResultSet(resultSet4);
        await kvStore?.closeResultSet(resultSet5);
        await kvStore?.closeResultSet(resultSet6);
        await kvStore?.closeResultSet(resultSet7);
        console.info(TAG + 'Succeeded in close result set');
        done();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760
     * @tc.desc distributedKVStore on dataChange errcode 15100001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760 start');
      try {
        for (let i = 0; i < 9; i++) {
          kvStore?.on('dataChange', distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data: distributedKVStore.ChangeNotification) => {
            console.info(TAG + `dataChange callback call data: ${data}`);
          });
          console.info(TAG + 'Succeeded in on');
        }
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        done();
        expect(err.code).assertEqual(15100001);
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770
     * @tc.desc distributedKVStore getKVStore errcode 15100002 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvManager?.getKVStore(TEST_STORE_ID, options1);
        console.info(TAG + 'Succeeded in getKVStore1');
        console.info(TAG + 'options1:' + JSON.stringify(options1));
        expect().assertFail()
      } catch (err) {
        console.error(TAG + `Failed to getKVStore.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100002);
      }
      kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
      console.info(TAG + 'Succeeded in getKVStore');
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780
     * @tc.desc distributedKVStore getKVStore errcode 15100002 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvManager?.getKVStore(TEST_STORE_ID, options1, async (err: BusinessError) => {
          if (err) {
            console.error(TAG + `Failed to get KVStore.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100002);
            kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
            console.info(TAG + 'Succeeded in getKVStore');
            done();
          }else{
            console.info(TAG + "Succeeded in getting KVStore1");
            done();
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to getKVStore.code is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790
     * @tc.desc distributedKVStore get errcode 15100004 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790 start');
      try {
        let data = await kvStore?.get("name");
        console.info(TAG + `Succeeded in getting data.data=${data}`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100004);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800
     * @tc.desc distributedKVStore get errcode 15100004 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800 start');
      try {
        kvStore?.get("name", (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          if (err != undefined) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100004);
            done();
          }else{
            console.info(TAG + `Succeeded in getting data.data=${data}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810
     * @tc.desc distributedKVStore put errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.put("name", "zhangsan", async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to put.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
            console.info(TAG + 'Succeeded in getKVStore');
            done();
          }else{
            console.info(TAG + `Succeeded in put data.`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820
     * @tc.desc distributedKVStore put errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.put("name", "zhangsan");
        console.info(TAG + `Succeeded in getting data.`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
      console.info(TAG + 'Succeeded in getKVStore');
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830
     * @tc.desc distributedKVStore putBatch errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let entries: distributedKVStore.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: distributedKVStore.Entry = {
            key: key + i,
            value: {
              type: distributedKVStore.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);
        kvStore?.putBatch(entries, async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
            console.info(TAG + 'Succeeded in getKVStore');
            done();
          }else{
            console.info(TAG + `Succeeded in putBatch data.`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840
     * @tc.desc distributedKVStore putBatch errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let entries: distributedKVStore.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: distributedKVStore.Entry = {
            key: key + i,
            value: {
              type: distributedKVStore.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);
        await kvStore?.putBatch(entries);
        console.info(TAG + `Succeeded in getting data.`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
      console.info(TAG + 'Succeeded in getKVStore');
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850
     * @tc.desc distributedKVStore delete errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.delete("name", async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to delete.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
            console.info(TAG + 'Succeeded in getKVStore');
            done();
          }else{
            console.info(TAG + `Succeeded in delete data.`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860
     * @tc.desc distributedKVStore delete errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.delete("name");
        console.info(TAG + `Succeeded in delete data.`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to delete.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
      console.info(TAG + 'Succeeded in getKVStore');
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870
     * @tc.desc distributedKVStore deleteBatch errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let keys = ["name", "name2"];
        kvStore?.deleteBatch(keys, async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to deleteBatch.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
            console.info(TAG + 'Succeeded in getKVStore');
            done();
          }else{
            console.info(TAG + `Succeeded in deleteBatch data.`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880
     * @tc.desc distributedKVStore deleteBatch errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let keys = ["name", "name2"];
        await kvStore?.deleteBatch(keys);
        console.info(TAG + `Succeeded in deleteBatch data.`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to deleteBatch.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
      console.info(TAG + 'Succeeded in getKVStore');
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890
     * @tc.desc distributedKVStore removeDeviceData errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.removeDeviceData(USED_DEVICE_IDS[0], async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to removeDeviceData.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
            console.info(TAG + 'Succeeded in getKVStore');
            done();
          }else{
            console.info(TAG + `Succeeded in removeDeviceData data.`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900
     * @tc.desc distributedKVStore removeDeviceData errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.removeDeviceData(USED_DEVICE_IDS[0]);
        console.info(TAG + `Succeeded in removeDeviceData data.`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to removeDeviceData.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      kvStore = await kvManager?.getKVStore(TEST_STORE_ID, options);
      console.info(TAG + 'Succeeded in getKVStore');
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910
     * @tc.desc distributedKVStore get errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.get("name", (err: BusinessError, data: boolean | string | number | Uint8Array) => {
          if (err != undefined) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getting data.data=${data}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920
     * @tc.desc distributedKVStore get errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let data = await kvStore?.get("name");
        console.info(TAG + `Succeeded in getting data.data=${data}`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930
     * @tc.desc distributedKVStore getEntries errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.getEntries("name", (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getEntries`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940
     * @tc.desc distributedKVStore getEntries errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.getEntries("name");
        console.info(TAG + `Succeeded in getEntries `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950
     * @tc.desc distributedKVStore getEntries errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        kvStore?.getEntries(query, (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getEntries`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960
     * @tc.desc distributedKVStore getEntries errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        await kvStore?.getEntries(query);
        console.info(TAG + `Succeeded in getEntries `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970
     * @tc.desc distributedKVStore getResultSet errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.getResultSet("name", (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getResultSet`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980
     * @tc.desc distributedKVStore getResultSet errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.getResultSet("name");
        console.info(TAG + `Succeeded in getResultSet `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990
     * @tc.desc distributedKVStore getResultSet errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        kvStore?.getResultSet(query, (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getResultSet`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000
     * @tc.desc distributedKVStore getResultSet errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        await kvStore?.getResultSet(query);
        console.info(TAG + `Succeeded in getResultSet `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010
     * @tc.desc distributedKVStore getResultSize errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        kvStore?.getResultSize(query, (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getResultSize.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getResultSize`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020
     * @tc.desc distributedKVStore getResultSize errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        await kvStore?.getResultSize(query);
        console.info(TAG + `Succeeded in getResultSize `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getResultSize.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030
     * @tc.desc distributedKVStore backup errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.backup("backup", (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to backup.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in backup`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040
     * @tc.desc distributedKVStore backup errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.backup("backup");
        console.info(TAG + `Succeeded in backup `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to backup.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050
     * @tc.desc distributedKVStore restore errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.restore("backup", (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in restore`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060
     * @tc.desc distributedKVStore restore errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.restore("backup");
        console.info(TAG + `Succeeded in restore `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070
     * @tc.desc distributedKVStore startTransaction errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.startTransaction((err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to startTransaction.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in startTransaction`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080
     * @tc.desc distributedKVStore startTransaction errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.startTransaction();
        console.info(TAG + `Succeeded in startTransaction `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to startTransaction.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SSUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090
     * @tc.desc distributedKVStore commit errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.commit((err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to commit.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in commit`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100
     * @tc.desc distributedKVStore commit errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.commit();
        console.info(TAG + `Succeeded in commit `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to commit.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110
     * @tc.desc distributedKVStore rollback errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.rollback((err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to rollback.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in rollback`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120
     * @tc.desc distributedKVStore rollback errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.rollback();
        console.info(TAG + `Succeeded in rollback `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to rollback.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130
     * @tc.desc distributedKVStore on errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.on('dataChange', distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data: distributedKVStore.ChangeNotification) => {
          console.info(TAG + `dataChange callback call data: ${data}`);
        });
        console.info(TAG + `Succeeded in on `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to on.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150
     * @tc.desc distributedKVStore getSecurityLevel errcode 15100005 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.getSecurityLevel((err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getSecurityLevel.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            done();
          }else{
            console.info(TAG + `Succeeded in getSecurityLevel`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        done();
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160
     * @tc.desc distributedKVStore getSecurityLevel errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160 start');
      try {
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        await kvStore?.getSecurityLevel();
        console.info(TAG + `Succeeded in getSecurityLevel `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getSecurityLevel.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170
     * @tc.desc distributedKVStore put errcode 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore?.put("key", "zhangsan");
        resultSet = await kvStore?.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore?.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        kvStore?.put("key", "zhangsan", async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to put.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore?.closeResultSet(resultSet);
            console.info(TAG + `Succeeded in closeResultSet`);
            done();
          }else {
            console.info(TAG + `Succeeded in put`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180
     * @tc.desc distributedKVStore putbatch errcode 14800047 callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore?.put("key", "zhangsan");
        resultSet = await kvStore?.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore?.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        let entries: distributedKVStore.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: distributedKVStore.Entry = {
            key: key + i,
            value: {
              type: distributedKVStore.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);
        kvStore?.putBatch(entries, async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to put.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore?.closeResultSet(resultSet);
            console.info(TAG + `Succeeded in closeResultSet`);
            done();
          }else {
            console.info(TAG + `Succeeded in putBatch`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200
     * @tc.desc distributedKVStore putbatch errcode 14800047 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore?.put("key", "zhangsan");
        resultSet = await kvStore?.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore?.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        let entries: distributedKVStore.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: distributedKVStore.Entry = {
            key: key + i,
            value: {
              type: distributedKVStore.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        console.info(TAG + `entries: ${entries}`);
        await kvStore?.putBatch(entries);
        console.info(TAG + `Succeeded in putBatch`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
        await kvStore?.closeResultSet(resultSet);
        console.info(TAG + `Succeeded in closeResultSet`);
        done();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210
     * @tc.desc distributedKVStore delete errcode 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore?.put("key", "zhangsan");
        resultSet = await kvStore?.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore?.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        await kvStore?.delete("key");
        console.info(TAG + `Succeeded in delete`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        kvStore?.delete("key", async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to delete.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore?.closeResultSet(resultSet);
            console.info(TAG + `Succeeded in closeResultSet`);
            done();
          }else {
            console.info(TAG + `Succeeded in delete`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220
     * @tc.desc distributedKVStore delete errcode 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      let keys = ["key", "key1"];
      try {
        await kvStore?.put("key", "zhangsan");
        resultSet = await kvStore?.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore?.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };

      try {
        await kvStore?.deleteBatch(keys);
        console.info(TAG + `Succeeded in deleteBatch`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        kvStore?.deleteBatch(keys, async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to deleteBatch.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore?.closeResultSet(resultSet);
            console.info(TAG + `Succeeded in closeResultSet`);
            done();
          }else {
            console.info(TAG + `Succeeded in deleteBatch`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230
     * @tc.desc distributedKVStore startTransaction errcode 14800047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore?.put("key", "zhangsan");
        resultSet = await kvStore?.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore?.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };

      try {
        await kvStore?.startTransaction();
        console.info(TAG + `Succeeded in startTransaction`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        kvStore?.startTransaction(async (err: BusinessError) => {
          if (err != undefined) {
            console.error(TAG + `Failed to startTransaction.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore?.closeResultSet(resultSet);
            console.info(TAG + `Succeeded in closeResultSet`);
            done();
          }else {
            console.info(TAG + `Succeeded in startTransaction`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name test_SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240
     * @tc.desc distributedKVStore off errcode 15100005 promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240 start');
      try {
        kvStore?.on('dataChange', distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, () => {
          console.info(TAG + 'dataChange');
        })
        await kvManager?.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.off('dataChange');
        console.info(TAG + `Succeeded in off `);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to off.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      };
      done();
    });
  })
}