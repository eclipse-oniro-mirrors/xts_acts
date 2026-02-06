/*
* Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium';
import distributedKVStore from '@ohos.data.distributedKVStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';
import hilog from '@ohos.hilog';
const domain = 0xFF00;
const tag = "TestTag";
let context: common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG = "[ttt]"

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static'
const TEST_STORE_ID = 'storeId';
const TEST_STORE_ID1 = 'storeId1';
let kvManager: distributedKVStore.KVManager | null = null;
let kvStore: distributedKVStore.SingleKVStore | null  = null;
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS: string[]=  [];  /* add you test device-ids here */
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


function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
export default function SingleKvStoreErrCodeTest(){
  describe('SingleKvStoreErrCodeTest', () => {
    beforeAll(async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        await abilityDelegator.startAbility({
          bundleName: 'com.example.kvstoreetstest.static',
          abilityName: 'EntryAbility'
        });
        await Utils.msSleep(8000)

        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end databaseDir:' + context!.databaseDir);
      } catch (e) {
        hilog.error(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        expect().assertFail();
        done();
      }
      const config: distributedKVStore.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context!
      };
      console.info(TAG + 'beforeAll config:' + JSON.stringify(config));
      kvManager = distributedKVStore.createKVManager(config);
      console.info(TAG+ 'beforeAll end');
      done();
    });

    beforeEach(async (done: () => void) => {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      try{
        await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'beforeEach getKVStore success');
          done();
        }).catch ((err: Error) => {
          console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      }catch (err) {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    afterEach(async (done: () => void) => {
      console.info(TAG + 'afterEach');
      try {
        if (kvManager && kvStore) {
          await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
            console.info(TAG + 'afterEach closeKVStore success');
            await (kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
              console.info(TAG + 'afterEach deleteKVStore success');
              kvStore = null;
              done();
            }).catch((err: Error) => {
              console.error(TAG + 'afterEach deleteKVStore err ' +
                `, error code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              done();
            });
          }).catch((err: Error) => {
            console.error(TAG + 'afterEach closeKVStore err ' +
              `, error code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          });
        } else {
          expect().assertFail();
          done();
        }
      } catch (closeErr) {
        // 如果关闭失败，可能是已经关闭了，记录日志但不失败
        console.warn(TAG + 'afterEach closeKVStore warning: ' +
          `code: ${closeErr.code}, message: ${closeErr.message}`);
        done();
      }
    });

    afterAll(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010
     * @tc.desc   distributedKVStore ChangeNotification.deviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0010 start');
      try {
        kvStore?.onDataChange(distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification: distributedKVStore.ChangeNotification) => {
          console.info(TAG + `dataChange callback call data: ${ChangeNotification}`);
          let deviceId = ChangeNotification.deviceId
          console.info(TAG + 'ChangeNotification.deviceId' + JSON.stringify(deviceId));
        });
        await kvStore!.put("name","zhangsan")
        console.info(TAG + `Succeeded in putting data`);
        let data = await kvStore!.get("name");
        console.info(TAG + `Succeeded in getting data.data=${data}`);
        expect(data).assertEqual("zhangsan");
        done();
      }catch (err) {
        console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720
     * @tc.desc   distributedKVStore getResultSet errcode 15100001 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0720 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      console.info(TAG + 'Succeeded in getting result set');
      let resultSet8: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore!.put("name", "zhangsan");
        console.info(TAG + 'Succeeded in put');
        kvStore!.getResultSet("name", (err: BusinessError<void>|null, result: distributedKVStore.KVStoreResultSet|undefined) => {
          if(err) {
            console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100001);
            await kvStore!.closeResultSet(resultSet0);
            await kvStore!.closeResultSet(resultSet1);
            await kvStore!.closeResultSet(resultSet2);
            await kvStore!.closeResultSet(resultSet3);
            await kvStore!.closeResultSet(resultSet4);
            await kvStore!.closeResultSet(resultSet5);
            await kvStore!.closeResultSet(resultSet6);
            await kvStore!.closeResultSet(resultSet7);
            console.info(TAG + 'Succeeded in close result set');
            await sleep(2000);
            done();
          }else {
            resultSet8 = result;
            console.info(TAG + 'Succeeded in getting result set');
            expect().assertFail()
            done();
          }
        });
      } catch (err) {
        console.error(TAG + `An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730
     * @tc.desc   distributedKVStore getResultSet errcode 15100001 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0730 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      console.info(TAG + 'Succeeded in getting result set');
      try {
        await kvStore!.put("name", "zhangsan");
        console.info(TAG + 'Succeeded in put');
        let resultSet8: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
        console.info(TAG + 'Succeeded in getting result set');
        expect().assertFail()
        done();
      } catch (err) {
        console.error(TAG + `An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100001);
        await kvStore!.closeResultSet(resultSet0);
        await kvStore!.closeResultSet(resultSet1);
        await kvStore!.closeResultSet(resultSet2);
        await kvStore!.closeResultSet(resultSet3);
        await kvStore!.closeResultSet(resultSet4);
        await kvStore!.closeResultSet(resultSet5);
        await kvStore!.closeResultSet(resultSet6);
        await kvStore!.closeResultSet(resultSet7);
        console.info(TAG + 'Succeeded in close result set');
        await sleep(2000);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740
     * @tc.desc   distributedKVStore query getResultSet errcode 15100001 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 Succeeded in getting result set');
      try {
        let resultSet: distributedKVStore.KVStoreResultSet|undefined;
        const query = new distributedKVStore.Query();
        query.prefixKey("name")
        kvStore!.put("name", "zhangsan", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + ` SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 Failed to put.code is ${err.code},message is ${err.message}`);
            return;
          }
          console.info(TAG + 'Succeeded in put');
          kvStore!.getResultSet(query, (err: BusinessError<void>|null, result: distributedKVStore.KVStoreResultSet|undefined) => {
            if(err) {
              console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(15100001);
              await kvStore!.closeResultSet(resultSet0);
              await kvStore!.closeResultSet(resultSet1);
              await kvStore!.closeResultSet(resultSet2);
              await kvStore!.closeResultSet(resultSet3);
              await kvStore!.closeResultSet(resultSet4);
              await kvStore!.closeResultSet(resultSet5);
              await kvStore!.closeResultSet(resultSet6);
              await kvStore!.closeResultSet(resultSet7);
              console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 Succeeded in close result set');
              await sleep(2000);
              done();
            }else {
              resultSet = result;
              console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 Succeeded in getting result set');
              expect().assertFail()
              done();
            }
          });
        });
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0740 An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

     /**
      * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750
      * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750
      * @tc.desc   distributedKVStore query getResultSet errcode 15100001 promise
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750 start');
      let resultSet0: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet1: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet2: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet3: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet4: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet5: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet6: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      let resultSet7: distributedKVStore.KVStoreResultSet | undefined = await kvStore!.getResultSet("name");
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750 Succeeded in getting result set');
      try {
        const query = new distributedKVStore.Query();
        query.prefixKey("name")
        await kvStore!.put("name", "zhangsan");
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750 Succeeded in put');
        await kvStore!.getResultSet(query)
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750 Succeeded in getting result set');
        done();
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750 An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100001);
        await kvStore!.closeResultSet(resultSet0);
        await kvStore!.closeResultSet(resultSet1);
        await kvStore!.closeResultSet(resultSet2);
        await kvStore!.closeResultSet(resultSet3);
        await kvStore!.closeResultSet(resultSet4);
        await kvStore!.closeResultSet(resultSet5);
        await kvStore!.closeResultSet(resultSet6);
        await kvStore!.closeResultSet(resultSet7);
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0750 Succeeded in close result set');
        await sleep(2000);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760
     * @tc.desc   distributedKVStore on dataChange errcode 15100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760 start');
      try {
        for (let i = 0; i < 9; i++) {
          kvStore?.onDataChange(distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data: distributedKVStore.ChangeNotification) => {
            console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760 dataChange callback call data: ${data}`);
          });
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760 Succeeded in on');
        }
        expect().assertFail()
        done();
      } catch (err) {
        expect(err.code).assertEqual(15100001);
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0760 An unexpected error occurred.code is ${err.code},message is ${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770
     * @tc.desc   distributedKVStore getKVStore errcode 15100002 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770 Succeeded in closeKVStore');
          await kvManager!.getKVStore(TEST_STORE_ID, options1);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770 Succeeded in getKVStore1');
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770 options1:' + JSON.stringify(options1));
          expect().assertFail()
        }
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770 Failed to getKVStore.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100002);
      }
      await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
      }).catch ((err: Error) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
      });
      done();
      // kvStore = await kvManager!.getKVStore(TEST_STORE_ID, options);
      // console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0770 Succeeded in getKVStore');
      // done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780
     * @tc.desc   distributedKVStore getKVStore errcode 15100002 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 Succeeded in closeKVStore');
          kvManager!.getKVStore(TEST_STORE_ID, options1, (err: BusinessError | null) => {
            if (err) {
              console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 Failed to get KVStore.code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(15100002);

              await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
                kvStore = store;
                console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 getKVStore success');
              }).catch ((err: Error) => {
                console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect().assertFail();
              });
              console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 Succeeded in getKVStore');
              done();
            }else{
              console.info(TAG + "SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 Succeeded in getting KVStore1");
              expect().assertFail();
              done();
            }
          });
        }
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0780 Failed to getKVStore.code is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790
     * @tc.desc   distributedKVStore get errcode 15100004 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790 start');
      try {
        if(kvStore){
          let data = await kvStore!.get("name");
          console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790 Succeeded in getting data.data=${data}`);
          expect().assertFail();
        }
        done();
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0790 Failed to get.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100004);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800
     * @tc.desc   distributedKVStore get errcode 15100004 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800 start');
      try {
        if(kvStore){
          kvStore!.get("name", (err: BusinessError | null, data: boolean | string | Long | Double | Uint8Array | undefined) => {
            if (err != undefined) {
              console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800 Failed to get.code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(15100004);
            }else{
              console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800 Succeeded in getting data.data=${data}`);
              expect().assertFail();
            }
            done();
          });
        } else {
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0800 Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810
     * @tc.desc   distributedKVStore put errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810 Succeeded in closeKVStore');
          kvStore!.put("name", "zhangsan", (err: BusinessError | null) => {
            if (err != undefined) {
              console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810 Failed to put.code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(15100005);

              await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
                kvStore = store;
                console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810 getKVStore success');
              }).catch ((err: Error) => {
                console.error(TAG + 'getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect().assertFail();
              });
            }else{
              console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810 Succeeded in put data.`);
              expect().assertFail();
            }
            done();
          });
        } else {
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0810 Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820
     * @tc.desc   distributedKVStore put errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
          await kvStore!.put("name", "zhangsan");
          console.info(TAG + 'Succeeded in put');
        }
        console.info(TAG + `Succeeded in getting data.`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      if(kvManager){
        await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820 getKVStore success');
        }).catch ((err: Error) => {
          console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0820 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }
      done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830
     * @tc.desc   distributedKVStore putBatch errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 Succeeded in closeKVStore');
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
        if(kvStore){
          kvStore!.putBatch(entries, (err: BusinessError | null,data) => {
            if (err != undefined) {
              console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 Failed to putBatch.code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(15100005);
              await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
                kvStore = store;
                console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 getKVStore success');
              }).catch ((err: Error) => {
                console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect().assertFail();
              });
            }else{
              console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 Succeeded in putBatch data.`);
              expect().assertFail();
            }
            done();
          });
        } else {
          done();
        }
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0830 Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840
     * @tc.desc   distributedKVStore putBatch errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0840 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
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
        if(kvStore){
          await kvStore!.putBatch(entries);
        }
        console.info(TAG + `Succeeded in getting data.`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to putBatch.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      if(kvManager){
        kvStore = await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options);
        console.info(TAG + 'Succeeded in getKVStore');
      }
      done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850
     * @tc.desc   distributedKVStore delete errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850 Succeeded in closeKVStore');
          if(kvStore){
            kvStore?.delete("name", (err: BusinessError | null) => {
              if (err != undefined) {
                console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850 Failed to delete.code is ${err.code},message is ${err.message}`);
                expect(err.code).assertEqual(15100005);
                kvStore = await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options);
              }else{
                console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850 Succeeded in delete data.`);
                expect().assertFail();
              }
              done();
            });
          }
        } else {
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0850 Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860
     * @tc.desc   distributedKVStore delete errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860 Succeeded in closeKVStore');
        }
        if(kvStore){
          await kvStore!.delete("name");
          console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860 Succeeded in delete data.`);
        }
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860 Failed to delete.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      if(kvManager){
        await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860 getKVStore success');
        }).catch ((err: Error) => {
          console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0860 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }
      done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870
     * @tc.desc   distributedKVStore deleteBatch errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        let keys = ["name", "name2"];
        kvStore?.deleteBatch(keys, (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to deleteBatch.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            if(kvManager){
              await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
                kvStore = store;
                console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870 getKVStore success');
              }).catch ((err: Error) => {
                console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0870 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect().assertFail();
              });
            }
            done();
          }else{
            console.info(TAG + `Succeeded in deleteBatch data.`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880
     * @tc.desc   distributedKVStore deleteBatch errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        let keys = ["name", "name2"];
        if(kvStore){
          await kvStore!.deleteBatch(keys);
          console.info(TAG + `Succeeded in deleteBatch data.`);
        }
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to deleteBatch.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
      }
      if(kvManager){
        await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880 getKVStore success');
        }).catch ((err: Error) => {
          console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0880 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
      }
      done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890
     * @tc.desc   distributedKVStore removeDeviceData errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        kvStore?.removeDeviceData(USED_DEVICE_IDS[0], (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to removeDeviceData.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            if(kvManager){
              await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
                kvStore = store;
                console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890 getKVStore success');
              }).catch ((err: Error) => {
                console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0890 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
                expect().assertFail();
              });
            }
          }else{
            console.info(TAG + `Succeeded in removeDeviceData data.`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900
     * @tc.desc   distributedKVStore removeDeviceData errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900 Succeeded in closeKVStore');
        }
        if(kvStore){
          await kvStore!.removeDeviceData(USED_DEVICE_IDS[0]);
          console.info(TAG + `Succeeded in removeDeviceData data.`);
        }
        expect().assertFail();
        await kvManager!.getKVStore<distributedKVStore.SingleKVStore>(TEST_STORE_ID, options).then((store: distributedKVStore.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900 getKVStore success');
        }).catch ((err: Error) => {
          console.error(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0900 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });
        done();
      } catch (err) {
        console.error(TAG + `Failed to removeDeviceData.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910
     * @tc.desc   distributedKVStore get errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0910 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        kvStore?.get("name", (err: BusinessError | null, data: boolean | string | Long | Double | Uint8Array | undefined) => {
          if (err != undefined) {
            console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in getting data.data=${data}`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920
     * @tc.desc   distributedKVStore get errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0920 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        if(kvStore){
          let data = await kvStore!.get("name");
          console.info(TAG + `Succeeded in getting data.data=${data}`);
          expect().assertFail();
        }
        done();
      } catch (err) {
        console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930
     * @tc.desc   distributedKVStore getEntries errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0930 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        kvStore?.getEntries("name", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in getEntries`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940
     * @tc.desc   distributedKVStore getEntries errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0940 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        if(kvStore){
          await kvStore!.getEntries("name");
          console.info(TAG + `Succeeded in getEntries `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950
     * @tc.desc   distributedKVStore getEntries errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0950 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }

        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        kvStore?.getEntries(query, (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in getEntries`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960
     * @tc.desc   distributedKVStore getEntries errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0960 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }

        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        if(kvStore){
          await kvStore!.getEntries(query);
          console.info(TAG + `Succeeded in getEntries `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to getEntries.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970
     * @tc.desc   distributedKVStore getResultSet errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0970 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }

        kvStore?.getResultSet("name", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in getResultSet`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980
     * @tc.desc   distributedKVStore getResultSet errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0980 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        if(kvStore){
          await kvStore!.getResultSet("name");
          console.info(TAG + `Succeeded in getResultSet `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990
     * @tc.desc   distributedKVStore getResultSet errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_0990 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }

        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        kvStore?.getResultSet(query, (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in getResultSet`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000
     * @tc.desc   distributedKVStore getResultSet errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1000 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        if(kvStore){
          await kvStore!.getResultSet(query);
          console.info(TAG + `Succeeded in getResultSet `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to getResultSet.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010
     * @tc.desc   distributedKVStore getResultSize errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1010 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        kvStore?.getResultSize(query, (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to getResultSize.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in getResultSize`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020
     * @tc.desc   distributedKVStore getResultSize errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1020 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        let query: distributedKVStore.Query | null = new distributedKVStore.Query();
        if(kvStore){
          await kvStore!.getResultSize(query);
          console.info(TAG + `Succeeded in getResultSize `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to getResultSize.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030
     * @tc.desc   distributedKVStore backup errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1030 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.backup("backup", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to backup.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in backup`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040
     * @tc.desc   distributedKVStore backup errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1040 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        if(kvStore){
          await kvStore!.backup("backup");
          console.info(TAG + `Succeeded in backup `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to backup.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050
     * @tc.desc   distributedKVStore restore errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1050 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'Succeeded in closeKVStore');
        }

        kvStore?.restore("backup", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in restore`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060
     * @tc.desc   distributedKVStore restore errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1060 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        if(kvStore){
          await kvStore!.restore("backup");
          console.info(TAG + `Succeeded in restore `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to restore.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070
     * @tc.desc   distributedKVStore startTransaction errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1070 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.startTransaction((err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to startTransaction.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in startTransaction`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080
     * @tc.desc   distributedKVStore startTransaction errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1080 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        if(kvStore){
          await kvStore!.startTransaction();
          console.info(TAG + `Succeeded in startTransaction `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to startTransaction.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090
     * @tc.desc   distributedKVStore commit errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1090 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        kvStore?.commit((err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to commit.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
          }else{
            console.info(TAG + `Succeeded in commit`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100
     * @tc.desc   distributedKVStore commit errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1100 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'Succeeded in closeKVStore');
        if(kvStore){
          await kvStore!.commit();
          console.info(TAG + `Succeeded in commit `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to commit.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110
     * @tc.desc   distributedKVStore rollback errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110 Succeeded in closeKVStore');
        }
        kvStore?.rollback((err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110 Failed to rollback.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110 15100005`);
          }else{
            console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1110 Succeeded in rollback`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120
     * @tc.desc   distributedKVStore rollback errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120 Succeeded in closeKVStore');
        if(kvStore){
          await kvStore!.rollback();
          console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120 Succeeded in rollback `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1120 Failed to rollback.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130
     * @tc.desc   distributedKVStore on errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130 Succeeded in closeKVStore');
        kvStore?.onDataChange(distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (data: distributedKVStore.ChangeNotification) => {
          console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130 dataChange callback call data: ${data}`);
        });
        console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130 Succeeded in on `);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130 Failed to on.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1130 15100005 `);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150
     * @tc.desc   distributedKVStore getSecurityLevel errcode 15100005 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150 Succeeded in closeKVStore');
        kvStore?.getSecurityLevel((err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150 Failed to getSecurityLevel.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100005);
            console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150 15100005`);
          }else{
            console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150 Succeeded in getSecurityLevel`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1150 Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160
     * @tc.desc   distributedKVStore getSecurityLevel errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160 start');
      try {
        if(kvManager){
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        }
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160 Succeeded in closeKVStore');
        if(kvStore){
          await kvStore!.getSecurityLevel();
          console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160 Succeeded in getSecurityLevel `);
        }
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160 Failed to getSecurityLevel.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1160 15100005`);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170
     * @tc.desc   distributedKVStore put errcode 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1170 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore!.put("key", "zhangsan");
        resultSet = await kvStore!.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore!.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        kvStore?.put("key", "zhangsan", (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to put.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore!.closeResultSet(resultSet!);
            console.info(TAG + `Succeeded in closeResultSet`);
          } else {
            console.info(TAG + `Succeeded in put`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180
     * @tc.desc   distributedKVStore putbatch errcode 14800047 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1180 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore!.put("key", "zhangsan");
        resultSet = await kvStore!.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore!.put(key, VALUE_TEST_STRING_1M);
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
        kvStore?.putBatch(entries, (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to put.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore!.closeResultSet(resultSet!);
            console.info(TAG + `Succeeded in closeResultSet`);
          }else {
            console.info(TAG + `Succeeded in putBatch`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200
     * @tc.desc   distributedKVStore putbatch errcode 14800047 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1200 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore!.put("key", "zhangsan");
        resultSet = await kvStore!.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore!.put(key, VALUE_TEST_STRING_1M);
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
        await kvStore!.putBatch(entries);
        console.info(TAG + `Succeeded in putBatch`);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
        await kvStore!.closeResultSet(resultSet!);
        console.info(TAG + `Succeeded in closeResultSet`);
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210
     * @tc.desc   distributedKVStore delete errcode 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1210 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try{
        try {
          await kvStore!.put("key", "zhangsan");
          resultSet = await kvStore!.getResultSet('key');
          const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
          for (let i = 0; i < 200; i++) {
            let key = 'key' + i;
            await kvStore!.put(key, VALUE_TEST_STRING_1M);
          }
          console.info(TAG + `Succeeded in put`);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800047);
        };
        try {
          await kvStore!.delete("key");
          console.info(TAG + `Succeeded in delete`);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800047);
        };
        try {
          kvStore?.delete("key", (err: BusinessError | null) => {
            if (err != undefined) {
              console.error(TAG + `Failed to delete.code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800047);
              await kvStore!.closeResultSet(resultSet!);
              console.info(TAG + `Succeeded in closeResultSet`);
            }else {
              console.info(TAG + `Succeeded in delete`);
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220
     * @tc.desc   distributedKVStore delete errcode 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1220 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      let keys = ["key", "key1"];
      try {
        await kvStore!.put("key", "zhangsan");
        resultSet = await kvStore!.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore!.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };

      try {
        await kvStore!.deleteBatch(keys);
        console.info(TAG + `Succeeded in deleteBatch`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        kvStore?.deleteBatch(keys, (err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to deleteBatch.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore!.closeResultSet(resultSet!);
            console.info(TAG + `Succeeded in closeResultSet`);
          }else {
            console.info(TAG + `Succeeded in deleteBatch`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230
     * @tc.desc   distributedKVStore startTransaction errcode 14800047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230 start');
      let resultSet: distributedKVStore.KVStoreResultSet | undefined;
      try {
        await kvStore!.put("key", "zhangsan");
        resultSet = await kvStore!.getResultSet('key');
        const VALUE_TEST_STRING_1M = 'a'.repeat(1024*1024);
        for (let i = 0; i < 200; i++) {
          let key = 'key' + i;
          await kvStore!.put(key, VALUE_TEST_STRING_1M);
        }
        console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1230 Succeeded in put`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };

      try {
        await kvStore!.startTransaction();
        console.info(TAG + `Succeeded in startTransaction`);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800047);
      };
      try {
        kvStore?.startTransaction((err: BusinessError | null) => {
          if (err != undefined) {
            console.error(TAG + `Failed to startTransaction.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800047);
            await kvStore!.closeResultSet(resultSet!);
            console.info(TAG + `Succeeded in closeResultSet`);
          }else {
            console.info(TAG + `Succeeded in startTransaction`);
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(TAG + `Failed to catch is ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240
     * @tc.number SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240
     * @tc.desc   distributedKVStore off errcode 15100005 promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240 start');
      try {
        kvStore?.onDataChange(distributedKVStore.SubscribeType.SUBSCRIBE_TYPE_LOCAL, () => {
          console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240 dataChange');
        })
        await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        console.info(TAG + 'SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240 Succeeded in closeKVStore');
        kvStore?.offDataChange();
        console.info(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240 Succeeded in off `);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG + `SUB_DDM_DKV_SINGLEKVSTORE_ERRCODE_1240 Failed to off.code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(15100005);
        done();
      }
    });
  })
}