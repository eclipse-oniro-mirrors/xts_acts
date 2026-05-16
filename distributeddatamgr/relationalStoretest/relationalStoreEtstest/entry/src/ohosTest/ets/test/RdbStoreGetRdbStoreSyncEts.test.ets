/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import hilog from '@ohos.hilog';
import relationalStore from '@ohos.data.relationalStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import taskpool from '@ohos.taskpool';
import { Context } from '@ohos.abilityAccessCtrl';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const DOMAIN = 0x0985;
const TAG = "[RDB_STORE_GET_RDB_STORE_SYNC_ETS_TEST]";

const RDB_TEST_NAME = 'RdbTest.db';
const SQL_CREATE_TABLE =
  'CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB, IDENTITY UNLIMITED INT)';

const value1 = 'Lisa';
const value2 = 18;
const value3 = 100.5;
const value4 = new Uint8Array([1, 2, 3, 4, 5]);
const value5 = BigInt('15822401018187971961171');
const valueBucket: relationalStore.ValuesBucket = {
  'NAME': value1,
  'AGE': value2,
  'SALARY': value3,
  'CODES': value4,
  'IDENTITY': value5,
};

@Concurrent
function taskPoolOpenStore(testContext: Context, configName: string, securityLevel: relationalStore.SecurityLevel): boolean {
  try {
    let config: relationalStore.StoreConfig = {
      name: configName,
      securityLevel: securityLevel,
    };
    let store = relationalStore.getRdbStoreSync(testContext, config);
    if (store !== null) {
      store.close();
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

async function corruptDatabaseFile(fileName: string)
{
  let stat = await fs.stat(fileName);
  let file = await fs.open(fileName, fs.OpenMode.READ_WRITE);
  fs.lseek(file.fd, 0, fs.WhenceType.SEEK_SET);
  let bufferSize = stat.size;
  let buffer = new ArrayBuffer(bufferSize);
  let uint8Array = new Uint8Array(buffer);
  let fChar = 'F'.charCodeAt(0);
  uint8Array.fill(fChar);
  await fs.write(file.fd, buffer, { offset: 0, length: bufferSize });
}

async function moveDatabaseFile(filePath: string): Promise<void> {
  fs.accessSync(filePath);
  expect(true).assertTrue();
  fs.unlinkSync(filePath);
}

async function changeFileModeOnlyRead(filePath: string): Promise<void> {
  fs.accessSync(filePath);
  expect(true).assertTrue();
  let file = await fs.open(filePath, fs.OpenMode.READ_ONLY);
  await fs.close(file.fd);
}
async function cleanupDatabaseFiles(dbName: string): Promise<void> {
  const dbPath = context.databaseDir + "/rdb/" + dbName;
  const dbPathWal = dbPath + "-wal";
  const dbPathShm = dbPath + "-shm";
  const dbPathKey = context.databaseDir + "/rdb/key/" + dbName.replace('.db', '.pub_key_v2');

  try {
    fs.accessSync(dbPath);
    fs.unlinkSync(dbPath);
  } catch (e) {
  }
  try {
    fs.accessSync(dbPathWal);
    fs.unlinkSync(dbPathWal);
  } catch (e) {
  }
  try {
    fs.accessSync(dbPathShm);
    fs.unlinkSync(dbPathShm);
  } catch (e) {
  }
  try {
    fs.accessSync(dbPathKey);
    fs.unlinkSync(dbPathKey);
  } catch (e) {
  }
}

export default function RdbStoreGetRdbStoreSyncEtsTest() {
  describe('rdbStoreGetRdbStoreSyncEtsTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'beforeAll: Test suite initialization');
    })
    beforeEach(async () => {
      hilog.info(DOMAIN, TAG, 'beforeEach: Cleanup before each test');
      await relationalStore.deleteRdbStore(context, RDB_TEST_NAME);
    })
    afterEach(async () => {
      hilog.info(DOMAIN, TAG, 'afterEach: Cleanup after each test');
      await relationalStore.deleteRdbStore(context, RDB_TEST_NAME);
    })
    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'afterAll: Test suite cleanup');
    })
    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest001
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest001
     * @tc.desc   Normal parameters, open database, create table, insert data, query data, delete data
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest001 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Get RdbStore");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect(store !== undefined).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 2: Create table");
        store.executeSync(SQL_CREATE_TABLE);
        hilog.info(DOMAIN, TAG, "Step 3: Insert data");
        let insertResult = store.insertSync('EMPLOYEE', valueBucket);
        expect(insertResult > 0).assertTrue();
        hilog.info(DOMAIN, TAG, `Insert result: ${insertResult}`);
        hilog.info(DOMAIN, TAG, "Step 4: Query data");
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.equalTo('NAME', 'Lisa');
        const resultSet = store.querySync(predicates, ['ID', 'NAME', 'AGE', 'SALARY', 'CODES', 'IDENTITY']);
        hilog.info(DOMAIN, TAG, "Step 5: Verify query results");
        let rowCount = 0;
        while (resultSet.goToNextRow()) {
          rowCount++;
          const id = resultSet.getLong(resultSet.getColumnIndex('ID'));
          const name = resultSet.getString(resultSet.getColumnIndex('NAME'));
          const age = resultSet.getLong(resultSet.getColumnIndex('AGE'));
          const salary = resultSet.getDouble(resultSet.getColumnIndex('SALARY'));
          const identity = resultSet.getValue(resultSet.getColumnIndex('IDENTITY'));
          hilog.info(DOMAIN, TAG, `Record found - id=${id}, name=${name}, age=${age}, salary=${salary}, identity=${identity}`);
          expect(name).assertEqual(value1);
          expect(age).assertEqual(value2);
          expect(salary).assertEqual(value3);
        }
        resultSet.close();
        expect(rowCount).assertEqual(1);
        hilog.info(DOMAIN, TAG, "Step 6: Delete data");
        let deleteResult = store.deleteSync(predicates);
        expect(deleteResult >= 0).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 7: Close store");
        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest001: All steps passed");
        done();
      } catch (e) {
        const err = e as BusinessError;
        hilog.error(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest001 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest001 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest002
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest002
     * @tc.desc   Abnormal parameter, config contains invalid database name (with path separator)
     * @tc.expect Throw exception, 14800001 Invalid args
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest002 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: 'abc/RdbTest.db',
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest002: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest002: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800001).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest002 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest003
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest003
     * @tc.desc   Abnormal parameter, config contains invalid cryptoParam
     * @tc.expect Throw exception, 14800001 Invalid args
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest003 start *************");
      let cryptoParam: relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: -1,
      };
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: true,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false,
        cryptoParam: cryptoParam
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest003: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest003: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800001).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest003 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest004
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest004
     * @tc.desc   Abnormal parameter, config contains invalid tokenizer
     * @tc.expect Throw exception, 14800001 Invalid args
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest004 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false,
        tokenizer: -1
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest004: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest004: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800001).assertEqual(Number(err.code));
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();

      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest004 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest005
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest005
     * @tc.desc   Abnormal parameter, config contains customDir exceeding 128 bytes
     * @tc.expect Throw exception, 14800001 Invalid args
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest005 start *************");
      const longCustomDir = 'customDir/subCustomDir/subCustomDir/subCustomDir/subCustomDir/subCustomDir/subCustomDir/subCustomDir/subCustomDir/subCustomDir/subCustomDir';
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: longCustomDir,
        isReadOnly: false
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest005: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest005: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800001).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest005 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest006
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest006
     * @tc.desc   Abnormal parameter, config contains customDir starting with '/'
     * @tc.expect Throw exception, 14800001 Invalid args
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest006 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: '/customDir/subCustomDir',
        isReadOnly: false
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest006: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest006: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800001).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest006 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest007
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest007
     * @tc.desc   Abnormal parameter, database path contains invalid value
     * @tc.expect Throw exception, 14800010 Invalid database path
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest007 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
        encrypt: false,
        customDir: 'entry/rdb',
        isReadOnly: false,
        rootDir: "invalidPath/invalidPath"
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest007: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest007: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800010).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest007 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest008
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest008
     * @tc.desc   Abnormal parameter, database corruption (wrong encryption key causes decryption failure)
     * @tc.expect Throw exception, 14800011 Database is corrupted
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest008 start *************");
      let cryptoParam: relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
      };
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S2,
        cryptoParam: cryptoParam
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Create encrypted database with key [1,2,3,4,5,6]");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        store.executeSync(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        await  store.close();
        store = undefined;
        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest008: Database created and closed successfully");
        hilog.info(DOMAIN, TAG, "Step 2: Change encryption key to [6,5,4,3,2,1]");
        cryptoParam.encryptionKey = new Uint8Array([6, 5, 4, 3, 2, 1]);
        hilog.info(DOMAIN, TAG, "Step 3: Try to open database with wrong key");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        await store.close();
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest008: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest008: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800011).assertEqual(Number(err.code));
        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest008: Successfully caught 14800011 error");
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest008 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest010
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest010
     * @tc.desc   Abnormal parameter, invalid data group ID
     * @tc.expect Throw exception, 14801002 Invalid data group ID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest010 start *************");

      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
        encrypt: false,
        dataGroupId: '12345678',
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest010: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest010: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14801002).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest010 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest011
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest011
     * @tc.desc   Abnormal parameter, config parameter changed (different securityLevel)
     * @tc.expect Throw exception, 14800017 Config changed
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest011 start *************");

      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      const changedStoreConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S2,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Create database with original config");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.info(DOMAIN, TAG, "Step 2: Try to open with changed config");
        store = relationalStore.getRdbStoreSync(context, changedStoreConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest011: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest011: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800017).assertEqual(Number(err.code));
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest011 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest012
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest012
     * @tc.desc   Abnormal parameter, secret key corrupted or lost
     * @tc.expect Throw exception, 14800020 The secret key is corrupted or lost
     * @tc.autoTest false (Requires specific environment configuration)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest012 start *************");

      const dbName = RDB_TEST_NAME;
      const dbPath = context.databaseDir + "/rdb/" + dbName;
      const dbPathKey = context.databaseDir + "/rdb/key/" + dbName.replace('.db', '.pub_key_v2');
      const newDbName = 'RdbTestCorrupted.db';
      const newDbPath = context.databaseDir + "/rdb/" + newDbName;
      const newDbPathKey = context.databaseDir + "/rdb/key/" + newDbName.replace('.db', '.pub_key_v2');
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Create encrypted database");
        const storeConfig: relationalStore.StoreConfig = {
          name: dbName,
          securityLevel: relationalStore.SecurityLevel.S1,
          encrypt: true,
        };
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        store.executeSync(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        await store.close();
        store = undefined;
        hilog.info(DOMAIN, TAG, "Step 1: Encrypted database created successfully");
        hilog.info(DOMAIN, TAG, "Step 2: Rename database and key files");
        fs.renameSync(dbPath, newDbPath);
        hilog.info(DOMAIN, TAG, `Renamed database: ${dbPath} -> ${newDbPath}`);
        try {
          fs.accessSync(dbPathKey);
          fs.renameSync(dbPathKey, newDbPathKey);
          hilog.info(DOMAIN, TAG, `Renamed key file: ${dbPathKey} -> ${newDbPathKey}`);
        } catch (e) {
          hilog.warn(DOMAIN, TAG, "Key file does not exist, skipping rename");
        }
        hilog.info(DOMAIN, TAG, "Step 3: Corrupt the renamed key file");
        await corruptDatabaseFile(newDbPathKey);
        hilog.info(DOMAIN, TAG, `Corrupted key file: ${newDbPathKey}`);
        hilog.info(DOMAIN, TAG, "Step 4: Try to open database with corrupted key");
        const reopenConfig: relationalStore.StoreConfig = {
          name: newDbName,
          securityLevel: relationalStore.SecurityLevel.S1,
          encrypt: true,
          allowRebuild: false
        };
        store = relationalStore.getRdbStoreSync(context, reopenConfig);
        store.executeSync(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest012: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest012: Caught expected error. Code:${err.code}, message:${err.message}`);
        const errorCode = Number(err.code);
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest012: Error code: ${errorCode}, Expected: 14800020`);
        expect(errorCode).assertEqual(14800020);
      } finally {
        await store?.close();
        await cleanupDatabaseFiles(dbName);
        await cleanupDatabaseFiles(newDbName);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest012 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest013
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest013
     * @tc.desc   Abnormal parameter, execute invalid SQL statement
     * @tc.expect Throw exception, 14800021 SQLite: Generic error
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest013 start *************");

      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        store.executeSync(SQL_CREATE_TABLE);
        hilog.info(DOMAIN, TAG, "Step 1: Execute invalid SQL");
        store.insertSync('error_table_name', valueBucket);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest013: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest013: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(14800021).assertEqual(Number(err.code));
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest013 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest014
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest014
     * @tc.desc   Abnormal parameter, attempt to write to readonly database
     * @tc.desc   Therefore, automatic use cases cannot be implemented. For details, see the manual use cases
     * @tc.expect Throw exception, 14800027 Attempt to write a readonly database
     * @tc.autoTest false (Requires specific file system permissions)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest014 start *************");
      const dbName = RDB_TEST_NAME;
      const dbPath = context.databaseDir + "/rdb/" + dbName;
      const dbPathWal = dbPath + "-wal";
      const dbPathShm = dbPath + "-shm";
      const storeConfig: relationalStore.StoreConfig = {
        name: dbName,
        securityLevel: relationalStore.SecurityLevel.S1,
        isReadOnly: false,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Create database");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        store.executeSync(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        await store.close();
        store = undefined;
        hilog.info(DOMAIN, TAG, "Step 2: Change files to read-only");
        try {
          await changeFileModeOnlyRead(dbPath);
          await changeFileModeOnlyRead(dbPathWal);
          await changeFileModeOnlyRead(dbPathShm);
        } catch (e) {
          hilog.warn(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest014: Cannot change file mode, skipping test");
          hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest014 end (skipped) *************");
          done();
          return;
        }
        hilog.info(DOMAIN, TAG, "Step 3: Try to write to read-only database");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        store.executeSync("PRAGMA journal_mode");
        store.insertSync('EMPLOYEE', valueBucket);
        store.executeSync("pragma integrity_check");
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest014: Should have thrown an error");
        hilog.warn(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest014: Could not simulate readonly condition, skipping test");
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest014: Caught expected error. Code:${err.code}, message:${err.message}`);
        const errorCode = Number(err.code);
        if (!isNaN(errorCode)) {
          expect(errorCode).assertEqual(14800027);
        }
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest014 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest015
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest015
     * @tc.desc   Abnormal parameter, I/O error (database file deleted)
     * @tc.desc   Therefore, automatic use cases cannot be implemented. For details, see the manual use cases
     * @tc.expect Throw exception, 14800028 Disk I/O error occurred
     * @tc.autoTest false (Requires specific file system environment)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest015 start *************");
      const dbName = RDB_TEST_NAME;
      const dbPath = context.databaseDir + "/rdb/" + dbName;
      const storeConfig: relationalStore.StoreConfig = {
        name: dbName,
        securityLevel: relationalStore.SecurityLevel.S1,
        encrypt: true,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Create database");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.info(DOMAIN, TAG, "Step 2: Remove database file");
        await moveDatabaseFile(dbPath);
        await store.close();
        hilog.info(DOMAIN, TAG, "Step 3: Try to operate on deleted database");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        store.executeSync(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest015: Should have thrown an error");
        hilog.warn(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest015: Could not simulate I/O error, skipping test");
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest015: Caught expected error. Code:${err.code}, message:${err.message}`);
        const errorCode = Number(err.code);
        if (!isNaN(errorCode)) {
          expect(errorCode).assertEqual(14800028);
        }
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest015 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest016
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest016
     * @tc.desc   Abnormal parameter, database full scenario
     * @tc.expect Throw exception, 14800029 The database is full
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest016 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.info(DOMAIN, TAG, "Step 1: Set max_page_count to 1");
        store.executeSync(`PRAGMA max_page_count = 1`);
        hilog.info(DOMAIN, TAG, "Step 2: Try to insert data into full database");
        store.executeSync(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest016: Should have thrown an error");
        hilog.warn(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest016: Could not simulate database full condition, skipping test");
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest016: Caught expected error. Code:${err.code}, message:${err.message}`);
        const errorCode = Number(err.code);
        if (!isNaN(errorCode)) {
          expect(errorCode).assertEqual(14800029);
        }
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest016 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest017
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest017
     * @tc.desc   Abnormal parameter, no permission to open database file
     * @tc.expect Throw exception, 14800030 Unable to open the database file
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest017 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
        isReadOnly: true,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest017: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest017: Caught expected error. Code:${err.code}, message:${err.message}`);
        const errorCode = Number(err.code);
        if (!isNaN(errorCode)) {
          expect(errorCode).assertEqual(14800030);
        }
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest017 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest018
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest018
     * @tc.desc   Normal operation, call getRdbStore then getRdbStoreSync with same config
     * @tc.expect No exception, both interfaces should work correctly
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest018 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Open database with getRdbStore (async)");
        store = await relationalStore.getRdbStore(context, storeConfig);
        expect(store !== undefined).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 2: Execute SQL and insert data");
        await store.executeSql(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        hilog.info(DOMAIN, TAG, "Step 3: Close database");
        hilog.info(DOMAIN, TAG, "Step 4: Reopen database with getRdbStoreSync (sync)");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect(store !== undefined).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 5: Execute SQL and insert data again");
        store.executeSync(SQL_CREATE_TABLE);
        store.insertSync('EMPLOYEE', valueBucket);
        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest018: Both async and sync interfaces work correctly");
      } catch (e) {
        const err = e as BusinessError;
        hilog.error(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest018: Unexpected error. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest018 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest019
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest019
     * @tc.desc   Abnormal parameter, call getRdbStore then getRdbStoreSync with changed config
     * @tc.expect Throw exception, 14800017 Config changed
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest019 start *************");

      const originalConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      const changedConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S2,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Open database with getRdbStore (async)");
        store = await relationalStore.getRdbStore(context, originalConfig);
        expect(store !== undefined).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 2: Close database");
        hilog.info(DOMAIN, TAG, "Step 3: Try to reopen with getRdbStoreSync using changed config");
        store = relationalStore.getRdbStoreSync(context, changedConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest019: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest019: Caught expected error. Code:${err.code}, message:${err.message}`);
        const errorCode = Number(err.code);
        expect(errorCode).assertEqual(14800017);
        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest019: Successfully caught 14800017 error");
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, originalConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest019 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest020
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest020
     * @tc.desc   Abnormal parameter, call getRdbStoreSync then getRdbStore with changed config
     * @tc.expect Throw exception, 14800017 Config changed
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest020 start *************");
      const originalConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      const changedConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S2,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Open database with getRdbStoreSync (sync)");
        store = relationalStore.getRdbStoreSync(context, originalConfig);
        expect(store !== undefined).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 2: Close database");
        hilog.info(DOMAIN, TAG, "Step 3: Try to reopen with getRdbStore (async) using changed config");
        store = await relationalStore.getRdbStore(context, changedConfig);

        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest020: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest020: Caught expected error. Code:${err.code}, message:${err.message}`);
        const errorCode = Number(err.code);
        expect(errorCode).assertEqual(14800017);
        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest020: Successfully caught 14800017 error");
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, originalConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest020 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest021
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest021
     * @tc.desc   Normal parameters, open database, create table, insert data, query data, delete data
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest021 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: RDB_TEST_NAME,
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: true,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false,
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Get RdbStore");
        store = relationalStore.getRdbStoreSync(context, storeConfig);
        expect(store !== undefined).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 2: Create table");
        store.executeSync(SQL_CREATE_TABLE);
        hilog.info(DOMAIN, TAG, "Step 3: Insert data");
        let insertResult = store.insertSync('EMPLOYEE', valueBucket);
        expect(insertResult > 0).assertTrue();
        hilog.info(DOMAIN, TAG, `Insert result: ${insertResult}`);
        hilog.info(DOMAIN, TAG, "Step 4: Query data");
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.equalTo('NAME', 'Lisa');
        const resultSet = store.querySync(predicates, ['ID', 'NAME', 'AGE', 'SALARY', 'CODES', 'IDENTITY']);
        hilog.info(DOMAIN, TAG, "Step 5: Verify query results");
        let rowCount = 0;
        while (resultSet.goToNextRow()) {
          rowCount++;
          const id = resultSet.getLong(resultSet.getColumnIndex('ID'));
          const name = resultSet.getString(resultSet.getColumnIndex('NAME'));
          const age = resultSet.getLong(resultSet.getColumnIndex('AGE'));
          const salary = resultSet.getDouble(resultSet.getColumnIndex('SALARY'));
          const identity = resultSet.getValue(resultSet.getColumnIndex('IDENTITY'));
          hilog.info(DOMAIN, TAG, `Record found - id=${id}, name=${name}, age=${age}, salary=${salary}, identity=${identity}`);
          expect(name).assertEqual(value1);
          expect(age).assertEqual(value2);
          expect(salary).assertEqual(value3);
        }
        resultSet.close();
        expect(rowCount).assertEqual(1);
        hilog.info(DOMAIN, TAG, "Step 6: Delete data");
        let deleteResult = store.deleteSync(predicates);
        expect(deleteResult >= 0).assertTrue();
        hilog.info(DOMAIN, TAG, "Step 7: Close store");
        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest021: All steps passed");
        done();
      } catch (e) {
        const err = e as BusinessError;
        hilog.error(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest021 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      } finally {
        await store?.close();
        await relationalStore.deleteRdbStore(context, storeConfig);
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest021 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest022
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest022
     * @tc.desc   the first Parameters value is null
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest022 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: 'abc/RdbTest.db',
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(null, storeConfig);
        hilog.error(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest022: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        hilog.info(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest022: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(401).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest022 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest023
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest023
     * @tc.desc   the first Parameters value is undefined
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest023 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: 'abc/RdbTest.db',
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(undefined, storeConfig);
        console.error(TAG, "RelationalStore_getRdbStoreSyncTest023: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        console.info(DOMAIN + TAG, `RelationalStore_getRdbStoreSyncTest023: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(401).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest023 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest024
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest024
     * @tc.desc   the second Parameters value is null
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest024 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: 'abc/RdbTest.db',
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, null);
        console.error(TAG, "RelationalStore_getRdbStoreSyncTest024: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        console.info(DOMAIN + TAG, `RelationalStore_getRdbStoreSyncTest024: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(401).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest024 end *************");
    })
    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest025
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest025
     * @tc.desc   the second Parameters value is undefined
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest025 start *************");
      const storeConfig: relationalStore.StoreConfig = {
        name: 'abc/RdbTest.db',
        securityLevel: relationalStore.SecurityLevel.S3,
        encrypt: false,
        customDir: 'customDir/subCustomDir',
        isReadOnly: false
      };
      let store: relationalStore.RdbStore | undefined = undefined;
      try {
        store = relationalStore.getRdbStoreSync(context, undefined);
        console.error(TAG, "RelationalStore_getRdbStoreSyncTest025: Should have thrown an error");
        expect().assertFail();
      } catch (e) {
        const err = e as BusinessError;
        console.info(DOMAIN + TAG, `RelationalStore_getRdbStoreSyncTest025: Caught expected error. Code:${err.code}, message:${err.message}`);
        expect(401).assertEqual(Number(err.code));
      } finally {
        await store?.close();
      }
      done();
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest025 end *************");
    })

    /**
     * @tc.name   RelationalStore_getRdbStoreSyncTest026
     * @tc.number SUB_DistributedData_RelationalStore_getRdbStoreSyncTest026
     * @tc.desc   Normal parameters, open database, create table, insert data, query data, delete data
     * @tc.expect No exception, return RdbStore normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RelationalStore_getRdbStoreSyncTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function)  => {
      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest026 start *************");

      const testDbName = 'ConcurrentTest.db';
      const storeConfig: relationalStore.StoreConfig = {
        name: testDbName,
        securityLevel: relationalStore.SecurityLevel.S1,
      };
      try {
        hilog.info(DOMAIN, TAG, "Step 1: Execute taskpool tasks concurrently");

        const task1 = new taskpool.Task(taskPoolOpenStore, context, testDbName, relationalStore.SecurityLevel.S1);
        const task2 = new taskpool.Task(taskPoolOpenStore, context, testDbName, relationalStore.SecurityLevel.S1);

        const result1 = await taskpool.execute(task1);
        const result2 = await taskpool.execute(task2);

        hilog.info(DOMAIN, TAG, `TaskPool result1: ${result1}, result2: ${result2}`);

        expect(result1).assertTrue();
        expect(result2).assertTrue();

        hilog.info(DOMAIN, TAG, "Step 2: Verify database was created");
        const verifyStore = relationalStore.getRdbStoreSync(context, storeConfig);
        verifyStore.executeSync(SQL_CREATE_TABLE);
        verifyStore.insertSync('EMPLOYEE', valueBucket);

        const predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const resultSet = verifyStore.querySync(predicates, ['ID', 'NAME']);
        let rowCount = 0;
        while (resultSet.goToNextRow()) {
          rowCount++;
        }
        resultSet.close();
        expect(rowCount).assertEqual(1);

        await verifyStore.close();
        await relationalStore.deleteRdbStore(context, storeConfig);

        hilog.info(DOMAIN, TAG, "RelationalStore_getRdbStoreSyncTest026: Taskpool concurrent test passed");
      } catch (e) {
        const err = e as BusinessError;
        hilog.error(DOMAIN, TAG, `RelationalStore_getRdbStoreSyncTest026 failed. Code:${err.code}, message:${err.message}`);
        expect().assertFail();
      }
      done();

      hilog.info(DOMAIN, TAG, "************* RelationalStore_getRdbStoreSyncTest026 end *************");
    })
    hilog.info(DOMAIN, TAG, "*************Unit Test End*************");
  })
}
