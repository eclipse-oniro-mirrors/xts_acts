/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import data_relationalStore from '@ohos.data.relationalStore';

let domain: int = 0x0000;
let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const TAG = "[RDB_REKEY_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

export default function RdbstoreRekeysEtsTest() {
  describe('rdbstoreRekeyEtsTest', () => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      await Utils.msSleep(2000);
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore");
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
      hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
    });
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    });

    console.log(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.number testRekey0001
     * @tc.name testRekey0001
     * @tc.desc invalid parameters test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0001 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testCrypt0001.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: undefined,
      };

      try {
        await rdbStore.rekey(cryptoParam);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        console.log(TAG + "************* testRekey0001 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0002
     * @tc.name testRekey0002
     * @tc.desc invalid parameters test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0002 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0002.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        encryptionAlgo: undefined,
      };

      try {
        await rdbStore.rekey(cryptoParam);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        console.log(TAG + "************* testRekey0002 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0003
     * @tc.name testRekey0003
     * @tc.desc invalid parameters test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0003 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0003.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        hmacAlgo: undefined,
      };

      try {
        await rdbStore.rekey(cryptoParam);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        console.log(TAG + "************* testRekey0003 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0004
     * @tc.name testRekey0004
     * @tc.desc invalid parameters test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0004 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0004.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        kdfAlgo: undefined,
      };

      try {
        await rdbStore.rekey(cryptoParam);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        console.log(TAG + "************* testRekey0004 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0005
     * @tc.name testRekey0005
     * @tc.desc invalid parameters test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0005 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0005.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        cryptoPageSize: undefined,
      };

      try {
        await rdbStore.rekey(cryptoParam);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect().assertFail();
        console.log(TAG + "************* testRekey0005 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0006
     * @tc.name testRekey0006
     * @tc.desc non-encrypted database rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0006 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0006.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0006 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0007
     * @tc.name testRekey0007
     * @tc.desc exception iterationCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0007 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0007.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        iterationCount: 500,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0007 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0008
     * @tc.name testRekey0008
     * @tc.desc exception encryptionAlgo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0008 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0008.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0008 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0009
     * @tc.name testRekey0009
     * @tc.desc exception hmacAlgo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0009 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0009.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0009 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0010
     * @tc.name testRekey0010
     * @tc.desc exception kdfAlgo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0010 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0010.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0010 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0011
     * @tc.name testRekey0011
     * @tc.desc exception cryptoPageSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0011 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0011.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
        cryptoPageSize: 2048,
      };

      try {
        await rdbStore.rekey(cryptoParam);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0011 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0012
     * @tc.name testRekey0012
     * @tc.desc custom encrypt rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0012 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0012.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19 as long,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore.update(valueBucket1, predicates)
        await rdbStore.delete(predicates);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(false).assertTrue();
        console.log(TAG + "************* testRekey0012 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0013
     * @tc.name testRekey0013
     * @tc.desc custom encrypt rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0013 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0013.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0013 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0014
     * @tc.name testRekey0014
     * @tc.desc rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0014 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0014.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19 as long,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        await rdbStore.update(valueBucket1, predicates)
        await rdbStore.delete(predicates);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(false).assertTrue();
        console.log(TAG + "************* testRekey0014 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0015
     * @tc.name testRekey0015
     * @tc.desc rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0015 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0015.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        await rdbStore.rekey(cryptoParam1);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0015 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0016
     * @tc.name testRekey0016
     * @tc.desc transaction rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0016 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0016.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let SQL_CREATE_TABLE =
        'CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER)';
      await rdbStore.executeSql(SQL_CREATE_TABLE);
      let option: data_relationalStore.TransactionOptions =
        { transactionType: data_relationalStore.TransactionType.DEFERRED };
      let transaction: data_relationalStore.Transaction =
        await rdbStore.createTransaction(option);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "id": 1 as long,
          "name": "lisi",
          "age": 18 as long,
        }
        await transaction!.insert("employee", valueBucket)
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(14800015));
        console.log(TAG + "************* testRekey0016 end *************");
      }
      done();
    });

    /**
     * @tc.number testRekey0017
     * @tc.name testRekey0017
     * @tc.desc transaction rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0017 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0017.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let SQL_CREATE_TABLE =
        'CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER)';
      await rdbStore.executeSql(SQL_CREATE_TABLE);
      let option: data_relationalStore.TransactionOptions =
        { transactionType: data_relationalStore.TransactionType.EXCLUSIVE };
      let transaction: data_relationalStore.Transaction =
        await rdbStore.createTransaction(option);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        const valueBucket: data_relationalStore.ValuesBucket = {
          "id": 1 as long,
          "name": "lisi",
          "age": 18 as long,
        }
        await transaction!.insert("employee", valueBucket)
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(14800015));
        console.log(TAG + "************* testRekey0017 end *************");
      }
      done();
    });

    /**
     * @tc.number testRekey0018
     * @tc.name testRekey0018
     * @tc.desc other parameters rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0018 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0018.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      try {
        await rdbStore.rekey(undefined);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(false).assertTrue();
        console.log(TAG + "************* testRekey0018 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0019
     * @tc.name testRekey0019
     * @tc.desc other parameters rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0019 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0019.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      try {
        await rdbStore.rekey(undefined);
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(false).assertTrue();
        console.log(TAG + "************* testRekey0019 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0020
     * @tc.name testRekey0020
     * @tc.desc other parameters rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0020 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0020.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      try {
        await rdbStore.rekey();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(false).assertTrue();
        console.log(TAG + "************* testRekey0020 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0021
     * @tc.name testRekey0021
     * @tc.desc other parameters rekey test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0021 start *************");
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0021.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array(),
      };

      try {
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("name", "zhangsan");
        const resultSet = await rdbStore.query(predicates);
        resultSet.goToNextRow();
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(14800015));
        console.log(TAG + "************* testRekey0021 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0022
     * @tc.name testRekey0022
     * @tc.desc exception iterationCount test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0022 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0022.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        iterationCount: 500,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0022 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0023
     * @tc.name testRekey0023
     * @tc.desc exception encryptionAlgo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0023 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0023.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0023 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0024
     * @tc.name testRekey0024
     * @tc.desc exception hmacAlgo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0024 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0024.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0024 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0025
     * @tc.name testRekey0025
     * @tc.desc exception kdfAlgo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0025 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
      };

      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0025.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

      let cryptoParam1: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
      };

      try {
        await rdbStore.rekey(cryptoParam1);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.log("catch err: failed, err: code=" + e.code + " message=" + e.message);
        expect(String(e.code)).assertEqual(String(801));
        console.log(TAG + "************* testRekey0025 end *************");
      }
      done();
      console.info(TAG + " ************* End*************");
    });

    /**
     * @tc.number testRekey0026
     * @tc.name testRekey0026
     * @tc.desc rekey HmacAlgo is SHA512 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0026 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6]),
        iterationCount: 1000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
        cryptoPageSize: 2048
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0026.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([6, 5, 4, 3, 2, 1]),
          iterationCount: 1000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_CBC,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA512,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA512,
          cryptoPageSize: 2048
        };
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekey(cryptoParam1);
        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19 as long,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "update success,num:" + num);
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "delete success,num:" + num1);
        expect(num1).assertEqual(1);
      } catch (err) {
        err = err as BusinessError;
        console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        console.log(TAG + "************* testRekey0026 end *************");
      }
      done();
    });

    /**
     * @tc.number testRekey0027
     * @tc.name testRekey0027
     * @tc.desc rekey HmacAlgo is SHA1 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRekey0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.log(TAG + "************* testRekey0027 start *************");
      let cryptoParam: data_relationalStore.CryptoParam = {
        encryptionKey: new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8]),
        iterationCount: 6000,
        encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
        hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
        kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
        cryptoPageSize: 4096
      };
      let storeConfig: data_relationalStore.StoreConfig = {
        name: "testRekey0027.db",
        securityLevel: data_relationalStore.SecurityLevel.S2,
        encrypt: true,
        cryptoParam: cryptoParam
      }
      let rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);
      await rdbStore.executeSql(CREATE_TABLE_TEST);
      try {
        let cryptoParam1: data_relationalStore.CryptoParam = {
          encryptionKey: new Uint8Array([8, 7, 6, 5, 4, 3, 2, 1]),
          iterationCount: 6000,
          encryptionAlgo: data_relationalStore.EncryptionAlgo.AES_256_GCM,
          hmacAlgo: data_relationalStore.HmacAlgo.SHA1,
          kdfAlgo: data_relationalStore.KdfAlgo.KDF_SHA1,
          cryptoPageSize: 4096
        };
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 18 as long,
          "salary": 100.5,
          "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket);
        await rdbStore.rekey(cryptoParam1);
        await rdbStore.close();
        storeConfig.cryptoParam = cryptoParam1;
        rdbStore = await data_relationalStore.getRdbStore(context!, storeConfig);

        const valueBucket1: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 19 as long,
          "salary": 200.5,
          "blobType": u8,
        }
        let predicates = new data_relationalStore.RdbPredicates("test");
        predicates.equalTo("NAME", "zhangsan");
        let num = await rdbStore.update(valueBucket1, predicates)
        console.log(TAG + "update success,num:" + num);
        expect(num).assertEqual(1);
        let num1 = await rdbStore.delete(predicates);
        console.log(TAG + "delete success,num:" + num1);
        expect(num1).assertEqual(1);
      } catch (err) {
        err = err as BusinessError;
        console.log("catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
        console.log(TAG + "************* testRekey0027 end *************");
      }
      done();
    });
    console.log(TAG + "*************Unit Test End*************");
  })
}