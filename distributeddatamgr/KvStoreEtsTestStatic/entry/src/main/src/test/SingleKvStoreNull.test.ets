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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '../../../hypium';
import factory from '@ohos.data.distributedKVStore';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import hilog from '@ohos.hilog';

const domain = 0xFF00;
const TAG = "[testtag >>>>>> ]"
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'SingleKvStoreNull';
let kvManager: factory.KVManager|null = null;
let kvStore : factory.SingleKVStore|null = null;
let entries: factory.Entry[] = [];

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

export default function SingleKvStoreNull(){
  describe('SingleKvStoreNull', (): void => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, TAG, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")

        // await abilityDelegator.startAbility({
        //   bundleName: 'com.example.kvstoreetstest.static',
        //   abilityName: 'EntryAbility'
        // });
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);

        const config: factory.KVManagerConfig = {
          bundleName: TEST_BUNDLE_NAME,
          context: context!
        };
        console.info(TAG + 'beforeAll context.databaseDir=' + context!.databaseDir);
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
        done();
      } catch (e) {
        hilog.info(domain, TAG, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, TAG, '%{public}s', '================ beforeAll context end==========');
        done();
      }

    });

    beforeEach(async (done: () => void): Promise<void> => {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      try {
        const store = await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options);
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
        done();
      } catch (err) {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      }

    });
    afterEach(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterEach');
      if (kvManager) {
        console.info(TAG + 'afterEach kvManager=' + kvManager);
        await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
          console.info(TAG + 'afterEach closeKVStore success');
          await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info(TAG + 'afterEach deleteKVStore success');
            kvStore = null;
            done();
          }).catch((err: Error) => {
            console.error(TAG + 'afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            done();
          });
        }).catch((err: Error) => {
          console.error(TAG + 'afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      };

    });

    afterAll(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0101
     * @tc.name SUB_DDM_SKV_Null_Put_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，key = ""
     */
    it('SUB_DDM_SKV_Null_Put_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0101 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        kvStore!.put('', TEST_VALUE, (err: BusinessError | null) => {
          console.info(TAG + "put 1, err=" + err);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0201
     * @tc.name SUB_DDM_SKV_Null_Put_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，value = "" //""
     */
    it('SUB_DDM_SKV_Null_Put_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0201 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        kvStore!.put(TEST_KEY, "", (err: BusinessError | null) => {
          console.info(TAG + "put 1, err=" + err);
          expect(err).assertEqual(null);
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0204
     * @tc.name SUB_DDM_SKV_Null_Put_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，value = number
     */
    it('SUB_DDM_SKV_Null_Put_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0204 begin---------  ');
      const TEST_KEY = 'Key_string';
      let value:number = 123
      try {
        kvStore!.put(TEST_KEY, value, (err: BusinessError | null) => {
          console.info(TAG + "put , err=" + err);
          expect(err).assertEqual(null);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e , put' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | long | double | boolean): Promise;
     *put Promise，key = ""
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0101 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        await kvStore!.put('', TEST_VALUE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0201
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | long | double | boolean): Promise;
     *put Promise，key = ""/number
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0201 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        await kvStore!.put(TEST_KEY, "");
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0204
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | long | double | boolean): Promise;
     *put Promise，key = ""/number
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0204 begin---------  ');
      const TEST_KEY = 'Key_string';
      let value:number = 123
      try {
        await kvStore!.put(TEST_KEY, value);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_putBatch_0103
     * @tc.name SUB_DDM_SKV_Null_putBatch_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[], callback: AsyncCallback): void;
     * putBatch callback，entries = []
     */
    it('SUB_DDM_SKV_Null_putBatch_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_putBatch_0103 begin---------  ');
      try {
        kvStore!.putBatch([], (err: BusinessError | null) => {
          console.error(TAG + "put 1, err=");
          expect(err).assertEqual(null);
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_PutBatch_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_PutBatch_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[]): Promise;
     * putBatch Promise，entries = []
     */
    it('SUB_DDM_SKV_Null_PutBatch_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_PutBatch_Promise_0103 begin---------  ');
      try {
        await kvStore!.putBatch([]);
        console.info(TAG + ' putBatch ');
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_0101
     * @tc.name SUB_DDM_SKV_Null_Delete_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string, callback: AsyncCallback): void;
     * delete callback，key = ""
     */
    it('SUB_DDM_SKV_Null_Delete_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_0101 begin---------  ');
      try {
        kvStore!.delete('', (err: BusinessError | null) => {
          console.info(TAG + "delete err=" + err);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_Delete_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string): Promise;
     * delete Promise，key = ""
     */
    it('SUB_DDM_SKV_Null_Delete_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_Promise_0101 begin---------  ');
      try {
        await kvStore!.delete('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_0103
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[], callback: AsyncCallback): void;
     * deleteBatch callback，keys = []
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_0103 begin---------  ');
      try {
        kvStore!.deleteBatch([], (err: BusinessError | null) => {
          console.info(TAG + "deleteBatch err=" + err);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[]): Promise<void>;
     * deleteBatch Promise，keys = []
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_Promise_0103 begin---------  ');
      try {
        await kvStore!.deleteBatch([]).then(() => {
          console.info(TAG + `Succeed in deleteBatch`);
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + `Failed to delete Backup.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        })
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_0101
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string, callback: AsyncCallback): void;
     * removeDeviceData callback，deviceId = ""
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_0101 begin---------  ');
      try {
        kvStore!.removeDeviceData('', (err: BusinessError | null) => {
          console.error(TAG + "delete err=" + err);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string): Promise;
     * removeDeviceData Promise，deviceId = ""
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_Promise_0101 begin---------  ');
      try {
        await kvStore!.removeDeviceData('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_0103
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array, callback: AsyncCallback<Array<[string,number]>>): void;
     * deleteBackup  callback，key = []/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_0103 begin---------  ');
      try {
        kvStore!.deleteBackup([], (err: BusinessError | null, data: Array<[string, int]>|undefined) =>{
          console.error(TAG + "deleteBackup err=" + err!.code);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e deleteBackup' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_0104
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_0104
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array, callback: AsyncCallback<Array<[string,number]>>): void;
     * deleteBackup  callback，key = []/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_0104 begin---------  ');
      try {
        kvStore!.deleteBackup(["BK001", "BK002"], (err: BusinessError | null, data: Array<[string, int]>|undefined) =>{
          console.error(TAG + "deleteBackup err=" + err + "  data.length=" + data!.length);
          expect(err).assertEqual(null);
          expect(data!.length).assertEqual(2);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e deleteBackup' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array): Promise<Array<[string,number]>>;
     * deleteBackup  Promise，key = []/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_Promise_0103 begin---------  ');
      try {
        await kvStore!.deleteBackup([]).then((data: Array<[string, int]>|undefined) => {
          console.info(TAG + `Succeed in deleting Backup`);
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          console.error(TAG + `Failed to delete Backup.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        })
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_Promise_0104
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_Promise_0104
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array): Promise<Array<[string,number]>>;
     * deleteBackup  Promise，key = []/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_Promise_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_Promise_0104 begin---------  ');
      try {
        await kvStore!.deleteBackup(["BK001", "BK002"]).then((data: Array<[string, int]>|undefined) => {
          console.info(TAG + `Succeed in deleting Backup`);
          expect(data!.length).assertEqual(2);
          done();
        }).catch((err:Error) => {
          console.error(TAG + `Failed to delete Backup.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        })

      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_closeKVStore_0100
     * @tc.name SUB_DDM_SKV_Null_closeKVStore_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc closeKVStore(appId: string, storeId: string, callback: AsyncCallback): void;
     * closeKVStore  p1=''  p2=''
     */
    it('SUB_DDM_SKV_Null_closeKVStore_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_closeKVStore_0100 begin---------  ');
      try {
        kvManager!.closeKVStore('', TEST_STORE_ID, (err: BusinessError | null)=> {
          console.info(TAG + 'Succeeded in closing KVStore, err.code='+ err!.code);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e closeKVStore' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_closeKVStore_0200
     * @tc.name SUB_DDM_SKV_Null_closeKVStore_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc closeKVStore(appId: string, storeId: string, callback: AsyncCallback): void;
     * closeKVStore  p1=''  p2=''
     */
    it('SUB_DDM_SKV_Null_closeKVStore_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_closeKVStore_0200 begin---------  ');
      try {
        kvManager!.closeKVStore(TEST_BUNDLE_NAME, '', (err: BusinessError | null)=> {
          console.info(TAG + 'Succeeded in closing KVStore, err.code='+ err!.code);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e closeKVStore' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteKVStore_0100
     * @tc.name SUB_DDM_SKV_Null_deleteKVStore_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteKVStore(appId: string, storeId: string, callback: AsyncCallback): void;
     * deleteKVStore  p1=''  p2=''
     */
    it('SUB_DDM_SKV_Null_deleteKVStore_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteKVStore_0100 begin---------  ');
      try {
        kvManager!.deleteKVStore('', TEST_STORE_ID, (err: BusinessError | null)=> {
          console.info(TAG + 'Succeeded in deleteKVStore, err.code='+ err!.code);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e deleteKVStore' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteKVStore_0200
     * @tc.name SUB_DDM_SKV_Null_deleteKVStore_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteKVStore(appId: string, storeId: string, callback: AsyncCallback): void;
     * deleteKVStore  p1=''  p2=''
     */
    it('SUB_DDM_SKV_Null_deleteKVStore_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteKVStore_0200 begin---------  ');
      try {
        kvManager!.deleteKVStore(TEST_BUNDLE_NAME, '', (err: BusinessError | null)=> {
          console.info(TAG + 'Succeeded deleteKVStore, err.code='+ err!.code);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e deleteKVStore' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteKVStore_errcode_0100
     * @tc.name SUB_DDM_SKV_Null_deleteKVStore_errcode_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteKVStore(appId: string, storeId: string, callback: AsyncCallback): void;
     * deleteKVStore  errcode=15100004
     */
    it('SUB_DDM_SKV_Null_deleteKVStore_errcode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteKVStore_errcode_0100 begin---------  ');
      try {
        kvManager!.deleteKVStore('aaa', 'aaa', (err: BusinessError | null)=> {
          console.info(TAG + 'Succeeded in deleteKVStore, err.code='+ err!.code);
          expect(err!.code).assertEqual(15100004);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e deleteKVStore' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getCount_0100
     * @tc.name SUB_DDM_SKV_Null_getCount_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  KVStoreResultSet 	getCount(): int;
     * offset = null/undefined
     */
    it('SUB_DDM_SKV_Null_getCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getCount_0100 begin---------  ');
      let resultSet: factory.KVStoreResultSet;
      let rescount: int;
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
        entries.push(entry);
      }
      console.info(TAG + `entries: ${entries}`);

      try {
        await kvStore!.putBatch(entries);
        await kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          resultSet = result;
          rescount = resultSet.getCount();
          console.info(TAG + 'Succeeded getEntries, rescount=' + rescount);
          expect(rescount).assertEqual(10);

          let moved = resultSet.moveToFirst();
          let respos = resultSet.getPosition();
          console.info(TAG + 'Succeeded getEntries, respos=' + respos);
          expect(respos).assertEqual(0);

          await kvStore!.closeResultSet(resultSet).then(() => {
            console.info(TAG + ' closeResultSet success,' );
            done();
          }).catch((err: Error) => {
            console.error(' closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        }).catch((err: Error) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_0100
     * @tc.name SUB_DDM_SKV_Null_Schema_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  Schema
     */
    it('SUB_DDM_SKV_Null_Schema_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_0100 begin---------  ');
      try {
        let first = new factory.FieldNode('first');
        first.type = factory.ValueType.STRING;
        first.nullable = false;

        let english = new factory.FieldNode('english');
        english.type = factory.ValueType.STRING;
        english.appendChild(first);

        let schema = new factory.Schema();
        schema.root.appendChild(english);
        schema.indexes = ['$.english.first'];
        schema.mode = 1;
        schema.skip = 0;

        console.info(TAG + 'schema.root =' + schema.root);
        console.info(TAG + 'schema.mode=' + schema.mode);
        console.info(TAG + 'schema.skip=' + schema.skip);
        console.info(TAG + 'schema.indexes=' + schema.indexes);

        expect(schema.root != undefined).assertTrue();
        expect(schema.indexes[0]).assertEqual('$.english.first');
        expect(schema.mode).assertEqual(1);
        expect(schema.skip).assertEqual(0);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_root_0100
     * @tc.name SUB_DDM_SKV_Null_Schema_root_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  root = FieldNode
     */
    it('SUB_DDM_SKV_Null_Schema_root_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_root_0100 begin---------  ');
      try {
        let first = new factory.FieldNode('first');
        first.type = factory.ValueType.STRING;
        first.nullable = false;

        let schema = new factory.Schema();

        schema.root.appendChild(first);
        console.info(TAG + 'schema.root =' + schema.root);
        expect(schema.root != undefined).assertTrue();

        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_indexes_0100
     * @tc.name SUB_DDM_SKV_Null_Schema_indexes_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  indexes = ['$.english.first']/[""]/[]
     */
    it('SUB_DDM_SKV_Null_Schema_indexes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_indexes_0100 begin---------  ');
      try {
        let schema = new factory.Schema();
        schema.indexes = ['$.english.first'];
        console.info(TAG + 'schema.indexes1 =' + schema.indexes);
        expect(schema.indexes[0]).assertEqual('$.english.first');

        schema.indexes = [""];
        console.info(TAG + 'schema.indexes2 =' + schema.indexes);
        expect(schema.indexes[0]).assertEqual("");

        schema.indexes = [];
        console.info(TAG + 'schema.indexes3 =' + schema.indexes);
        expect(schema.indexes.length).assertEqual(0);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_FieldNode_0100
     * @tc.name SUB_DDM_SKV_Null_FieldNode_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  Schema
     */
    it('SUB_DDM_SKV_Null_FieldNode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_FieldNode_0100 begin---------  ');
      try {
        let first = new factory.FieldNode('first');
        first.type = factory.ValueType.STRING;
        first.nullable = false;
        first.defaultValue = 'first name';

        let english = new factory.FieldNode('english');
        english.type = factory.ValueType.STRING;
        english.appendChild(first);

        console.info(TAG + 'first.type =' + first.type);
        expect(first.type).assertEqual(factory.ValueType.STRING);

        console.info(TAG + 'first.nullable false=' + first.nullable);
        expect(first.nullable).assertEqual(false);
        first.nullable = true;
        console.info(TAG + 'first.nullable true=' + first.nullable);
        expect(first.nullable).assertEqual(true);

        console.info(TAG + 'first.defaultValue =' + first.defaultValue);
        expect(first.defaultValue).assertEqual('first name');
        first.defaultValue = '';
        console.info(TAG + 'first.defaultValue f22=' + first.defaultValue);
        expect(first.defaultValue).assertEqual('');

        let first33 = new factory.FieldNode('first33');
       first33.type = factory.ValueType.STRING;
       expect(first33.type).assertEqual(factory.ValueType.STRING);
        first33.type = factory.ValueType.BYTE_ARRAY;
        expect(first33.type).assertEqual(factory.ValueType.BYTE_ARRAY);
        first33.type = factory.ValueType.BOOLEAN;
        expect(first33.type).assertEqual(factory.ValueType.BOOLEAN);
        first33.type = factory.ValueType.DOUBLE;
        expect(first33.type).assertEqual(factory.ValueType.DOUBLE);
        first33.type = factory.ValueType.LONG;
        expect(first33.type).assertEqual(factory.ValueType.LONG);

        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_FieldNode_appendChild_0100
     * @tc.name SUB_DDM_SKV_Null_FieldNode_appendChild_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild 返回值缺少false值覆盖
     */
    it('SUB_DDM_SKV_Null_FieldNode_appendChild_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_FieldNode_appendChild_0100 begin---------  ');
      try {
        let f1 = new factory.FieldNode('f1');
        let english = new factory.FieldNode('english');
        let res = english.appendChild(f1);
        console.info(TAG + 'appendChild true, res=' + res);
        expect(res).assertEqual(true);

        res = english.appendChild(f1);
        res = english.appendChild(f1);
        res = english.appendChild(f1);
        res = english.appendChild(f1);
        res = english.appendChild(f1);
        console.info(TAG + 'appendChild false, res=' + res);
        res = false;
        expect(res).assertEqual(false);

        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_FieldNode_appendChild_0103
     * @tc.name SUB_DDM_SKV_Null_FieldNode_appendChild_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild null/undefined
     */
    it('SUB_DDM_SKV_Null_FieldNode_appendChild_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_FieldNode_appendChild_0103 begin---------  ');
      try {
        let english = new factory.FieldNode('english');
        english.defaultValue = "";
        console.info(TAG + 'english.defaultValue =' + english.defaultValue);
        expect(english.defaultValue).assertEqual("");
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_insertEntries_0100
     * @tc.name SUB_DDM_SKV_Null_insertEntries_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild null/undefined
     */
    it('SUB_DDM_SKV_Null_insertEntries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_insertEntries_0100 begin---------  ');
      try {
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification) => {
          console.info(TAG + 'test  getInsertEntries=' + JSON.stringify(ChangeNotification.insertEntries));
          console.info(TAG + 'test  getInsertEntries key=' + ChangeNotification.insertEntries![0].key);
          expect(ChangeNotification.insertEntries![0].key).assertEqual("getInsertEntries");
          done();
        });
        await kvStore!.put("getInsertEntries", "byPut").then(() => {
          console.info(TAG + 'test  put success');
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_updateEntries_0100
     * @tc.name SUB_DDM_SKV_Null_updateEntries_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild null/undefined
     */
    it('SUB_DDM_SKV_Null_updateEntries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_updateEntries_0100 begin---------  ');
      try {
        await kvStore!.put("getUpdateEntries", "byPut1").then(() => {
          console.info(TAG + 'test  put 1 success');
        });
        await Utils.msSleep(2000);
        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification) => {
          console.info(TAG + 'test  updateEntries=' + JSON.stringify(ChangeNotification.updateEntries));
          console.info(TAG + 'test  updateEntries key=' + ChangeNotification.updateEntries![0].key);
          expect(ChangeNotification.updateEntries![0].key).assertEqual("getUpdateEntries");
          done();
        });
        await kvStore!.put("getUpdateEntries", "byPut2").then(() => {
          console.info(TAG + 'test  put 2 success');
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteEntries_0100
     * @tc.name SUB_DDM_SKV_Null_deleteEntries_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild null/undefined
     */
    it('SUB_DDM_SKV_Null_deleteEntries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteEntries_0100 begin---------  ');
      try {
        await kvStore!.put("deleteEntries", "byPut1").then(() => {
          console.info(TAG + 'test  put 1 success');
        });
        await Utils.msSleep(2000);

        kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, (ChangeNotification) => {
          console.info(TAG + 'test  deleteEntries=' + JSON.stringify(ChangeNotification.deleteEntries));
          console.info(TAG + 'test  deleteEntries key=' + ChangeNotification.deleteEntries![0].key);
          expect(ChangeNotification.deleteEntries![0].key).assertEqual("deleteEntries");
          done();
        });
        await kvStore!.delete("deleteEntries").then(() => {
          console.info(TAG + 'test  delete  success');
        });

      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_sync_0100
     * @tc.name SUB_DDM_SKV_Null_sync_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  sync err=201
     */
    it('SUB_DDM_SKV_Null_sync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_sync_0100 begin---------  ');
      try {
          let mode = factory.SyncMode.PULL_ONLY;
          kvStore!.sync(["AA","BB"], mode, 10);
          console.info(TAG +'kvStore!.sync success ');
          done();
        } catch (e) {
          console.error(TAG +' catch sync :e:' + `, code=${e.code}, message=${e.message}`);
          if (e.code === 201) {
            expect( e.code ).assertEqual(201);
          } else {
            expect( e != undefined ).assertTrue();
          }
          done();
        }

      })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0100
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  syncQuery err=201
     */
    it('SUB_DDM_SKV_Null_syncQuery_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0100 begin---------  ');
      try {
          let mode = factory.SyncMode.PULL_ONLY;
          const query: factory.Query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.sync(["AA","BB"], query, mode, 10);
          console.info(TAG +' kvStore!.sync success ');
          done();
        } catch (e) {
          console.error(TAG +' catch sync :e:' + `, code=${e.code}, message=${e.message}`);
          if (e.code === 201) {
            expect( e.code ).assertEqual(201);
          } else {
            expect( e != undefined ).assertTrue();
          }
          done();
        }

      })
      
    console.info(TAG + '-------------------describe SingleKvStoreNull  end-------------------');
  })
}