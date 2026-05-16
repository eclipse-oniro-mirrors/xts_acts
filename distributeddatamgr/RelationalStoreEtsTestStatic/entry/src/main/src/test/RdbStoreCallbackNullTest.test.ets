/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import relationalStore from '@ohos.data.relationalStore'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

const TAG = 'relationalStore_callback_GetRdbStore_Test>>>>>>> ';
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let context:common.UIAbilityContext | undefined;
let domain: int = 0x0000;
let tag: string = 'testTag';
let store: relationalStore.RdbStore | undefined = undefined;
const ENCRYPT_KEY_256 = new Uint8Array(32).fill(1);
const EMPTY_KEY = new Uint8Array();

export default function RdbStoreCallbackNullTest(){
  describe('RdbStoreCallbackNullTest', (): void => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[RELATIONAL_STORE_JSKITS_TEST] beforeAll');
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
    });
	
	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0100
     * @tc.desc       name IS ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0001';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: '',
			securityLevel: relationalStore.SecurityLevel.S3
		  };
		  relationalStore.getRdbStore(context!, storeConfig, (err, rdbStore) => {
			if (err) {
			  console.info(TAG + `${caseName} fail as expected, code=${err.code}, msg=${err.message}`);
			  expect(err.code).assertEqual(14800030);
			  done();
			} else {
			  console.error(TAG + `${caseName} success, but empty name should fail`);
			  expect(null).assertFail();
			  done();
			}
		  });
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });
	  
	 /**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0200
     * @tc.desc       S1 test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0002';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'RequiredTest_S1.db',
			securityLevel: relationalStore.SecurityLevel.S1
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    expect(rdbStore!.version).assertEqual(0);
		    expect(rdbStore!.rebuilt).assertEqual(0);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });
	  
	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0300
     * @tc.desc       S2 test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0003';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'RequiredTest_S2.db',
			securityLevel: relationalStore.SecurityLevel.S2
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });
	
		/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0400
     * @tc.desc       S3 test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0004';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'RequiredTest_S3.db',
			securityLevel: relationalStore.SecurityLevel.S3
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0500
     * @tc.desc       S4 test
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_CALLBACK_0005';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'RequiredTest_S4.db',
			securityLevel: relationalStore.SecurityLevel.S4
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });
	  
	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0600
     * @tc.desc       boolean all true
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0001';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'BaseOptional_BooleanAllTrue.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			encrypt: true,
			isReadOnly: true,
			vector: true,
			persist: true,
			autoCleanDirtyData: true,
			allowRebuild: true,
			enableSemanticIndex: true,
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
		    expect(801).assertEqual(err.code);
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  })
	  
	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0700
     * @tc.desc       boolean all false
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0002';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'BaseOptional_BooleanAllFalse.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			encrypt: false,
			isReadOnly: false,
			vector: false,
			persist: false,
			autoCleanDirtyData: false,
			allowRebuild: false,
			enableSemanticIndex: false
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0800
     * @tc.desc       String is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0003';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'BaseOptional_PathAllEmpty.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			rootDir: '',
			customDir: '',
			dataGroupId: '',
			pluginLibs: []
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_0900
     * @tc.desc       pluginLibs单实例数组
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0004';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'BaseOptional_PluginSingle.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			pluginLibs: ['librdb_custom.so']
		  };
		  relationalStore.getRdbStore(context!, storeConfig, (err, rdbStore) => {
			if (err) {
			  console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
			  expect(14800010).assertEqual(err.code);
			  done();
			} else {
			  console.info(TAG + `${caseName} success`);
			  expect(null).assertFail();
			  done();
			}
		  });
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1000
     * @tc.desc       pluginLibs多实例数组
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_BASEOPTIONAL_0005';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'BaseOptional_PluginMulti.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			rootDir: 'rdb/root/plugin',
			customDir: 'rdb/test/plugin',
			dataGroupId: 'rdb_group_plugin',
			pluginLibs: ['librdb_custom.so', 'libfts_tokenizer.so', 'libcrypto_helper.so']
		  };
		  relationalStore.getRdbStore(context!, storeConfig, (err, rdbStore) => {
			if (err) {
			  console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
			  expect(14801002).assertEqual(err.code);
			  done();
			} else {
			  console.info(TAG + `${caseName} success`);
			  expect(null).assertFail();
			  done();
			}
		  });
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });
	  
	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1100
     * @tc.desc       AES_256_GCM + HmacAlgo.SHA1 + KdfAlgo.KDF_SHA1
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_001';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Enc_AESGCM_SHA1_KDFSHA1.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			encrypt: true,
			cryptoParam: {
			  encryptionKey: ENCRYPT_KEY_256,
			  encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
			  hmacAlgo: relationalStore.HmacAlgo.SHA1,
			  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA1
			}
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1200
     * @tc.desc       AES_256_GCM + HmacAlgo.SHA256 + KdfAlgo.KDF_SHA256
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_002';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Enc_AESGCM_SHA256_KDFSHA256.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			encrypt: true,
			cryptoParam: {
			  encryptionKey: ENCRYPT_KEY_256,
			  encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
			  hmacAlgo: relationalStore.HmacAlgo.SHA256,
			  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA256
			}
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1300
     * @tc.desc       AES_256_GCM + HmacAlgo.SHA512 + KdfAlgo.KDF_SHA512
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_003';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Enc_AESGCM_SHA512_KDFSHA512.db',
			securityLevel: relationalStore.SecurityLevel.S4,
			encrypt: true,
			cryptoParam: {
			  encryptionKey: ENCRYPT_KEY_256,
			  encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_GCM,
			  hmacAlgo: relationalStore.HmacAlgo.SHA512,
			  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA512
			}
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1400
     * @tc.desc       AES_256_CBC + HmacAlgo.SHA256 + KdfAlgo.KDF_SHA256
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_004';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Enc_AESCBC_SHA256_KDFSHA256.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			encrypt: true,
			cryptoParam: {
			  encryptionKey: ENCRYPT_KEY_256,
			  encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
			  hmacAlgo: relationalStore.HmacAlgo.SHA256,
			  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA256
			}
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1500
     * @tc.desc       AES_256_CBC + HmacAlgo.SHA512 + KdfAlgo.KDF_SHA512
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_005';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Enc_AESCBC_SHA512_KDFSHA512.db',
			securityLevel: relationalStore.SecurityLevel.S4,
			encrypt: true,
			cryptoParam: {
			  encryptionKey: ENCRYPT_KEY_256,
			  encryptionAlgo: relationalStore.EncryptionAlgo.AES_256_CBC,
			  hmacAlgo: relationalStore.HmacAlgo.SHA512,
			  kdfAlgo: relationalStore.KdfAlgo.KDF_SHA512
			}
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		             await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_006
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1600
     * @tc.desc       PLAIN_TEXT 不加密
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_ENC_006';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Enc_PLAIN_TEXT.db',
			securityLevel: relationalStore.SecurityLevel.S2,
			encrypt: false,
			cryptoParam: {
			  encryptionKey: EMPTY_KEY,
			  encryptionAlgo: relationalStore.EncryptionAlgo.PLAIN_TEXT
			}
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		             await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1700
     * @tc.desc       Tokenizer.NONE_TOKENIZER
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_001';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_NONE.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			tokenizer: relationalStore.Tokenizer.NONE_TOKENIZER
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1800
     * @tc.desc       Tokenizer.ICU_TOKENIZER
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_002';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_ICU_ZH.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			tokenizer: relationalStore.Tokenizer.ICU_TOKENIZER
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_1900
     * @tc.desc       Tokenizer.CUSTOM_TOKENIZER
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_ENUM_TOKEN_003';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const isCustomSupported = relationalStore.isTokenizerSupported(relationalStore.Tokenizer.CUSTOM_TOKENIZER);
		  if (!isCustomSupported) {
			console.info(TAG + `${caseName} custom tokenizer not supported`);
			done();
		  }
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			tokenizer: relationalStore.Tokenizer.CUSTOM_TOKENIZER
		  };
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await relationalStore.deleteRdbStore(context!, storeConfig);
		    done();
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });
	  
	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_callback_ERR_001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_2000
     * @tc.desc       S3->S4
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_callback_ERR_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_callback_ERR_001';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT1.db',
			securityLevel: relationalStore.SecurityLevel.S3,
		  };
		  
		  const storeConfig1: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT1.db',
			securityLevel: relationalStore.SecurityLevel.S4,
		  };
		  
		  relationalStore.getRdbStore(context!, storeConfig, (err, rdbStore) => {
			if (err) {
			  console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
			  expect(null).assertFail();
			  done();
			} else {
			  console.info(TAG + `${caseName} success`);
			  expect(rdbStore!== undefined).assertEqual(true);
			  (rdbStore as relationalStore.RdbStore).close().awaitSync()
			  relationalStore.getRdbStore(context!, storeConfig1, (err, rdbStore1) => {
				if (err) {
				console.error(TAG + `${caseName} fail2: code=${err.code}, msg=${err.message}`);
				expect(null).assertFail();
				done();
				} else {
				console.info(TAG + `${caseName} success2`);
				expect(rdbStore1!== undefined).assertEqual(true);
			    relationalStore.deleteRdbStore(context!, storeConfig1).awaitSync()
				done();
				}
			});

			}
		  });
		  
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_callback_ERR_002
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_2100
     * @tc.desc       S3->S1
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_callback_ERR_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_callback_ERR_002';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT2.db',
			securityLevel: relationalStore.SecurityLevel.S3,
		  };
		  
		  const storeConfig1: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT2.db',
			securityLevel: relationalStore.SecurityLevel.S1,
		  };
		  
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await (rdbStore as relationalStore.RdbStore).close();
		    relationalStore.getRdbStore(context!, storeConfig1, (err, rdbStore1) => {
				if (err) {
				console.error(TAG + `${caseName} fail2: code=${err.code}, msg=${err.message}`);
				expect(err.code).assertEqual(14800017);

				done();
				} else {
				console.info(TAG + `${caseName} success2`);
				expect(null).assertFail();
				done();
				}
			});
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		  
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_callback_ERR_003
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_2200
     * @tc.desc       false-true
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_callback_ERR_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_callback_ERR_003';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT3.db',
			securityLevel: relationalStore.SecurityLevel.S1,
			encrypt: false
		  };
		  
		  const storeConfig1: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT3.db',
			securityLevel: relationalStore.SecurityLevel.S1,
			encrypt: true
		  };
		  
		  relationalStore.getRdbStore(context!, storeConfig, (err, rdbStore) => {
			if (err) {
			  console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
			  expect(null).assertFail();
			  done();
			} else {
			  console.info(TAG + `${caseName} success`);
			  expect(rdbStore!== undefined).assertEqual(true);
			  (rdbStore as relationalStore.RdbStore).close().awaitSync()
			  relationalStore.getRdbStore(context!, storeConfig1, (err, rdbStore1) => {
				if (err) {
				console.error(TAG + `${caseName} fail2: code=${err.code}, msg=${err.message}`);
				expect(null).assertFail();
				done();
				} else {
				console.info(TAG + `${caseName} success2`);
				expect(rdbStore1!== undefined).assertEqual(true);
			    relationalStore.deleteRdbStore(context!, storeConfig1).awaitSync()
				done();
				}
			});
			}
		  });
		  
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_callback_ERR_004
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_2300
     * @tc.desc       true->false
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_callback_ERR_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_callback_ERR_004';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT3.db',
			securityLevel: relationalStore.SecurityLevel.S1,
			encrypt: true
		  };
		  
		  const storeConfig1: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT3.db',
			securityLevel: relationalStore.SecurityLevel.S1,
			encrypt: false
		  };
		  
		  relationalStore.getRdbStore(context!, storeConfig, (err, rdbStore) => {
			if (err) {
			  console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
			  expect(null).assertFail();
			  done();
			} else {
			  console.info(TAG + `${caseName} success`);
			  expect(rdbStore!== undefined).assertEqual(true);
			  (rdbStore as relationalStore.RdbStore).close().awaitSync()
			  relationalStore.getRdbStore(context!, storeConfig1, (err, rdbStore1) => {
				if (err) {
				console.error(TAG + `${caseName} fail2: code=${err.code}, msg=${err.message}`);
				expect(null).assertFail();
				done();
				} else {
				console.info(TAG + `${caseName} success2`);
				expect(rdbStore1!== undefined).assertEqual(true);
			    relationalStore.deleteRdbStore(context!, storeConfig1).awaitSync()
				done();
				}
			});
			}
		  });
		  
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

	/**
     * @tc.name       SUB_DDM_RDB_GETRDBSTORE_callback_ERR_005
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_2400
     * @tc.desc       true S3->false S1
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
	it('SUB_DDM_RDB_GETRDBSTORE_callback_ERR_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
	  async (done: () => void): Promise<void> => {
		const caseName = 'SUB_DDM_RDB_GETRDBSTORE_callback_ERR_005';
		console.info(TAG + `************* ${caseName} start *************`);
		try {
		  const storeConfig: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT3.db',
			securityLevel: relationalStore.SecurityLevel.S3,
			encrypt: true
		  };
		  
		  const storeConfig1: relationalStore.StoreConfig = {
			name: 'Token_CUSTOM_DEFAULT3.db',
			securityLevel: relationalStore.SecurityLevel.S1,
			encrypt: false
		  };
		  
		  try {
		    let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
		    console.info(TAG + `${caseName} success`);
		    expect(rdbStore!== undefined).assertEqual(true);
		    await (rdbStore as relationalStore.RdbStore).close();
		    relationalStore.getRdbStore(context!, storeConfig1, (err, rdbStore1) => {
				if (err) {
				console.error(TAG + `${caseName} fail2: code=${err.code}, msg=${err.message}`);
				expect(err.code).assertEqual(14800011);
				done();
				} else {
				console.info(TAG + `${caseName} success2`);
				expect(null).assertFail();
				done();
				}
			});
		  } catch (err) {
		    console.error(TAG + `${caseName} fail: code=${err.code}, msg=${err.message}`);
		    expect(null).assertFail();
		    done();
		  }
		  
		} catch (e) {
		  const err = e as BusinessError;
		  console.error(TAG + `${caseName} catch exception: code=${err.code}, msg=${err.message}`);
		  expect(null).assertFail();
		  done();
		}
	  });

    /**
     * @tc.name       SUB_DDM_RDB_pluginLibs_null_0001
     * @tc.number     SUB_DistributedData_RelationalStore_SDK_RelationalStoreGetstoreCallbackTest_2500
     * @tc.desc       String is ""
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_DDM_RDB_pluginLibs_null_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName = 'SUB_DDM_RDB_pluginLibs_null_0001';
        console.info(TAG + `************* ${caseName} start *************`);
        try {
          const storeConfig: relationalStore.StoreConfig = {
            name: 'BaseOptional_PathAllEmpty.db',
            securityLevel: relationalStore.SecurityLevel.S3,
            rootDir: '',
            customDir: '',
            dataGroupId: '',
            pluginLibs: ['']
          };
          try {
            let rdbStore = await relationalStore.getRdbStore(context!, storeConfig);
            console.info(TAG + `${caseName} success`);
            expect(rdbStore!== undefined).assertEqual(true);
            await relationalStore.deleteRdbStore(context!, storeConfig);
            done();
          } catch (err) {
            console.error(TAG + `${caseName} fail: ${err.code}, ${err.message}`);
            expect(null).assertFail();
            done();
          }
        } catch (e) {
          const err = e as BusinessError;
          console.error(TAG + `${caseName} catch exception: ${err.code}, ${err.message}`);
          expect(null).assertFail();
          done();
        }
      });
	  
	
	})
}
 