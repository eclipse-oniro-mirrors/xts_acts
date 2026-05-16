/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import distributedKVStore from '@ohos.data.distributedKVStore';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function KvStoreEtsTestStatic() {
  let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
  let tag: string = 'testTag >>>>>> '; //日志标识字符串,作为tag标识当前runner类下的测试行为

  hilog.info(domain, tag, '%{public}s', '================ export kvstoretest start ....');
  const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
  const TEST_SINGLE_STORE_ID = 'single_testId';
  const TEST_SINGLE_STORE_ID4 = 'single_testId4';
  const TEST_DEVICE_STORE_ID = 'device_testId';
  const KEY_TEST_STRING_ELEMENT = 'key_test_string';
  hilog.info(domain, tag, '%{public}s', '================ export kvstoretest 111');
  let kvManager : distributedKVStore.KVManager;
  let context: common.UIAbilityContext;
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let deviceId : string = "000000000000000000";

  describe("KvStoreEtsTestStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', '================ describe kvstoretest start ==========');
    let singleOptions : distributedKVStore.Options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : distributedKVStore.KVStoreType.SINGLE_VERSION,
      schema : undefined,
      securityLevel : distributedKVStore.SecurityLevel.S1,
    }
    hilog.info(domain, tag, '%{public}s', '================ describe kvstoretest singleOptions');

    let singleOptions4 : distributedKVStore.Options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : distributedKVStore.KVStoreType.SINGLE_VERSION,
      schema : undefined,
      securityLevel : distributedKVStore.SecurityLevel.S4,
    }
    hilog.info(domain, tag, '%{public}s', '================ describe kvstoretest singleOptions4');

    let options1: distributedKVStore.Options = {
      createIfMissing: false,
      encrypt: true,
      backup: true,
      autoSync: false,
      kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
      securityLevel: distributedKVStore.SecurityLevel.S2,
    };
    hilog.info(domain, tag, '%{public}s', '================ describe kvstoretest options1');

    let deviceOptions : distributedKVStore.Options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : distributedKVStore.KVStoreType.DEVICE_COLLABORATION,
      schema : undefined,
      securityLevel : distributedKVStore.SecurityLevel.S3,
    }

    hilog.info(domain, tag, '%{public}s', '================ describe kvstoretest deviceOptions');
    
    beforeAll(async (): Promise<void> => {
      try {
        hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll end==========');
      }
      
      
    })

    beforeEach(() => {
      hilog.info(domain, tag, '%{public}s', '================ beforeEach start==========');
      const config : distributedKVStore.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context
      }
      hilog.info(domain, tag, '%{public}s', '================ createKVManager start ');
      kvManager = distributedKVStore.createKVManager(config);
      hilog.info(domain, tag, '%{public}s', '================ createKVManager end, kvManager=' + kvManager);
      hilog.info(domain, tag, '%{public}s', '================ beforeEach end==========');
    })

    /**
     * @tc.name   KvStoreTest001
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0010
     * @tc.desc   //getKVStore<distributedKVStore.SingleKVStore>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('KvStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest001 start ");
      try {
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest001 start getKvstore");
        let store = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(TEST_SINGLE_STORE_ID, singleOptions);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest001 getKvstore end");
        expect(store !== null).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done  ");
    })

    /**
     * @tc.name   KvStoreTest0011
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0011
     * @tc.desc   //getKVStore<distributedKVStore.SingleKVStore>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('KvStoreTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest0011 start ");
      try {
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest0011 start getKvstore");
        let store = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(TEST_SINGLE_STORE_ID4, singleOptions4);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest0011 getKvstore end");
        expect(store !== null).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done  ");
    })

    /**
     * @tc.name   KvStoreTest002
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0020
     * @tc.desc   //getKVStore<distributedKVStore.DeviceKVStore>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest002 start ");
      try {
        let store = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest002 success ");
        expect(store !== null).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest003
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0030
     * @tc.desc   //SingleKVStore put get string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest003 start ");
      const KEY_TEST_STRING_ELEMENT = 'key_test_string';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-001';
      try {
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest003 start getKvstore");
        let store : distributedKVStore.SingleKVStore = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(TEST_SINGLE_STORE_ID, singleOptions);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest003 start put");
        await store.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest003 put end");
        let value = await store.get(KEY_TEST_STRING_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest003 get end");
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest003 key is" + KEY_TEST_STRING_ELEMENT +
          ", value is " + value);
        expect(VALUE_TEST_STRING_ELEMENT === (value as string)).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");;
    })


    /**
     * @tc.name   KvStoreTest005
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0050
     * @tc.desc   //SingleKVStore put get Boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest005 start ");
      const KEY_TEST_BOOL_ELEMENT = 'key_test_boolean';
      const VALUE_TEST_BOOL_ELEMENT : Boolean = false;
      try {
        let store : distributedKVStore.SingleKVStore = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(TEST_SINGLE_STORE_ID, singleOptions);
        await store.put(KEY_TEST_BOOL_ELEMENT, VALUE_TEST_BOOL_ELEMENT);
        let value = await store.get(KEY_TEST_BOOL_ELEMENT);
        hilog.info(domain, tag, '%{public}s',
          "============KvStoreTest005 VALUE_TEST_BOOL_ELEMENT is " + VALUE_TEST_BOOL_ELEMENT + " value is " + value);
        expect(VALUE_TEST_BOOL_ELEMENT === (value as boolean)).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest006
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0060
     * @tc.desc   //SingleKVStore put get Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest006 start ");
      const KEY_TEST_UINT8ARRAY_ELEMENT = 'key_test_number_array';
      const buffer = new ArrayBuffer(8);
      const VALUE_TEST_UINT8ARRAY_ELEMENT : Uint8Array = new Uint8Array(buffer);
      try {
        let store : distributedKVStore.SingleKVStore = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(TEST_SINGLE_STORE_ID, singleOptions);
        await store.put(KEY_TEST_UINT8ARRAY_ELEMENT, VALUE_TEST_UINT8ARRAY_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest006 put success ");
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest006 fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest007
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0070
     * @tc.desc   //SingleKVStore backup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest007 start ");
      try {
        let store : distributedKVStore.SingleKVStore = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(TEST_SINGLE_STORE_ID, singleOptions);
        let fileName : string = "test";
        await store.backup(fileName);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest007 success");
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest007 fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest008
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0080
     * @tc.desc   //DeviceKVStore backup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest008 start ");
      try {
        let store : distributedKVStore.DeviceKVStore = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        let fileName : string = "test";
        await store.backup(fileName);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest008 success");
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest009
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0090
     * @tc.desc   //SingleKVStore backup  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest009 start ");
      try {
        kvManager.getKVStore(TEST_SINGLE_STORE_ID, singleOptions, (err: BusinessError|null, store: distributedKVStore.SingleKVStore|undefined) => {
          let fileName : string = "test";
          store?.backup(fileName, (err: BusinessError|null) => {
            hilog.info(domain, tag, '%{public}s', "============KvStoreTest009 done ");
            done();
          });
        });
      }catch (e) {
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest009 fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   KvStoreTest010
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0100
     * @tc.desc   //DeviceKVStore put get Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest010 start ");
      const KEY_TEST_UINT8ARRAY_ELEMENT = 'key_test_number_array';
      const buffer = new ArrayBuffer(8);
      const VALUE_TEST_UINT8ARRAY_ELEMENT : Uint8Array = new Uint8Array(buffer);
      try {
        let store : distributedKVStore.DeviceKVStore = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        await store.put(KEY_TEST_UINT8ARRAY_ELEMENT, VALUE_TEST_UINT8ARRAY_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest010 put success");
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest011
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0110
     * @tc.desc   //DeviceKVStore put get string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest011 start ");
      const KEY_TEST_STRING_ELEMENT = 'key_test_string';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-001';
      try {
        let store : distributedKVStore.DeviceKVStore = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        await store.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest011 put ");
        let value = await store.get(KEY_TEST_STRING_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest011 KEY_TEST_STRING_ELEMENT is" + KEY_TEST_STRING_ELEMENT + " value is " + value);
        expect(VALUE_TEST_STRING_ELEMENT == (value as string)).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest012
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0120
     * @tc.desc   //DeviceKVStore put get double
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest012 start ");
      const KEY_TEST_DOUBLE_ELEMENT = 'key_test_double';
      let VALUE_TEST_DOUBLE_ELEMENT : double = 11;
      try {
        let store : distributedKVStore.DeviceKVStore = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        await store.put(KEY_TEST_DOUBLE_ELEMENT, VALUE_TEST_DOUBLE_ELEMENT);
        let value = await store.get(KEY_TEST_DOUBLE_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest012 VALUE_TEST_DOUBLE_ELEMENT is" + VALUE_TEST_DOUBLE_ELEMENT + " value is " + value);
        expect(VALUE_TEST_DOUBLE_ELEMENT == (value as double)).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest013
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0130
     * @tc.desc   //DeviceKVStore put get Boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest013 start ");
      const KEY_TEST_BOOL_ELEMENT = 'key_test_boolean';
      const VALUE_TEST_BOOL_ELEMENT : Boolean = false;
      try {
        let store : distributedKVStore.DeviceKVStore = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        await store.put(KEY_TEST_BOOL_ELEMENT, VALUE_TEST_BOOL_ELEMENT);
        let value = await store.get(KEY_TEST_BOOL_ELEMENT);
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest013 VALUE_TEST_BOOL_ELEMENT is" + VALUE_TEST_BOOL_ELEMENT + " value is " + value);
        expect(VALUE_TEST_BOOL_ELEMENT == (value as boolean)).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', "============done ");
    })

    /**
     * @tc.name   KvStoreTest014
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0140
     * @tc.desc   //DeviceKVStore put get callback Boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest014 start ");
      const KEY_TEST_BOOL_ELEMENT = 'key_test_boolean';
      const VALUE_TEST_BOOL_ELEMENT : Boolean = false;

      try {
        kvManager.getKVStore(TEST_DEVICE_STORE_ID, deviceOptions, (err: BusinessError|null, store: distributedKVStore.DeviceKVStore|undefined) => {
          store?.put(KEY_TEST_BOOL_ELEMENT, VALUE_TEST_BOOL_ELEMENT, (err: BusinessError|null) => {
            hilog.info(domain, tag, '%{public}s', "============KvStoreTest014 put ");
            store?.get(KEY_TEST_BOOL_ELEMENT, (err: BusinessError<void>|null, value:undefined|Boolean|String|Long|Double|Uint8Array) => {
              hilog.info(domain, tag, '%{public}s', "============KvStoreTest014 get ");
              expect(VALUE_TEST_BOOL_ELEMENT == (value as boolean)).assertTrue();
              done();
              hilog.info(domain, tag, '%{public}s', "============done ");
            });
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   KvStoreTest015
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0150
     * @tc.desc   //DeviceKVStore put get callback double
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest015 start ");
      const KEY_TEST_DOUBLE_ELEMENT = 'key_test_double';
      let VALUE_TEST_DOUBLE_ELEMENT : double = 11;

      try {
        kvManager.getKVStore(TEST_DEVICE_STORE_ID, deviceOptions, (err: BusinessError|null, store: distributedKVStore.DeviceKVStore|undefined) => {
          store?.put(KEY_TEST_DOUBLE_ELEMENT, VALUE_TEST_DOUBLE_ELEMENT, (err: BusinessError|null) => {
            hilog.info(domain, tag, '%{public}s', "============KvStoreTest015 put ");
            store?.get(KEY_TEST_DOUBLE_ELEMENT, (err: BusinessError<void>|null, value:undefined|Boolean|String|Long|Double|Uint8Array) => {
              hilog.info(domain, tag, '%{public}s', "============KvStoreTest015 get ");
              expect(VALUE_TEST_DOUBLE_ELEMENT == (value as double)).assertTrue();
              done();
              hilog.info(domain, tag, '%{public}s', "============done ");
            });

          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   KvStoreTest016
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0160
     * @tc.desc   //DeviceKVStore put get callback string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest016 start ");
      const KEY_TEST_STRING_ELEMENT = 'key_test_string';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-001';

      try {
        kvManager.getKVStore(TEST_DEVICE_STORE_ID, deviceOptions, (err: BusinessError|null, store: distributedKVStore.DeviceKVStore|undefined) => {
          store?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err: BusinessError|null) => {
            store?.get(KEY_TEST_STRING_ELEMENT, (err: BusinessError<void>|null, value:undefined|Boolean|String|Long|Double|Uint8Array) => {
              hilog.info(domain, tag, '%{public}s', "============KvStoreTest016 put ");
              expect(VALUE_TEST_STRING_ELEMENT == (value as string)).assertTrue();
              hilog.info(domain, tag, '%{public}s', "============done ");
              done();
            });
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   KvStoreTest017
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0170
     * @tc.desc   //DeviceKVStore put get  callback string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest017 start ");
      const KEY_TEST_STRING_ELEMENT = 'key_test_string';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-001';

      try {
        kvManager.getKVStore(TEST_DEVICE_STORE_ID, deviceOptions, (err: BusinessError|null, store: distributedKVStore.DeviceKVStore|undefined) => {
          store?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err: BusinessError|null) => {
            store?.get(KEY_TEST_STRING_ELEMENT, (err: BusinessError<void>|null, value:undefined|Boolean|String|Long|Double|Uint8Array) => {
              expect(VALUE_TEST_STRING_ELEMENT == (value as string)).assertTrue();
              hilog.info(domain, tag, '%{public}s', "============done ");
              done();
            });
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "fail on exception: " + e);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   KvStoreTest018
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0180
     * @tc.desc   //SingleKVStore put get  callback string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest018 start ");
      const KEY_TEST_STRING_ELEMENT = 'key_test_string';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-001';

      try {
        kvManager.getKVStore(TEST_SINGLE_STORE_ID, singleOptions, (err: BusinessError|null, store: distributedKVStore.SingleKVStore|undefined) => {
          store?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err: BusinessError|null) => {
            store?.get(KEY_TEST_STRING_ELEMENT, (err: BusinessError<void>|null, value:undefined|Boolean|String|Long|Double|Uint8Array) => {
              expect(VALUE_TEST_STRING_ELEMENT == (value as string)).assertTrue();
              hilog.info(domain, tag, '%{public}s', "============done ");
              done();
            });
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "fail on exception: " + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   KvStoreTest019
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0190
     * @tc.desc   //DeviceKVStore get(did, key)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "=======KvStoreTest019 start ");
      try {
        let store : distributedKVStore.DeviceKVStore = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest019 getKVStore ");
        let deviceId : string = "000000000000000000";
        store.get(deviceId, 'keyno').then((data: boolean | string | Long | number | Uint8Array) => {
          hilog.info(domain, tag, '%{public}s', "=======KvStoreTest019 get success");
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `=======KvStoreTest019 fail error=${error.code},ms=${error.message}`);
          expect(error.code).assertEqual(15100004);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest019 catch e=" + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   KvStoreTest0191
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0191
     * @tc.desc   //DeviceKVStore get(key)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "=======KvStoreTest0191 start ");
      try {
        let store : distributedKVStore.DeviceKVStore = await kvManager.getKVStore<distributedKVStore.DeviceKVStore>(TEST_DEVICE_STORE_ID, deviceOptions);
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest0191 getKVStore ");
        store.get('keyno').then((data: boolean | string | Long | number | Uint8Array) => {
          hilog.info(domain, tag, '%{public}s', "=======KvStoreTest0191 get success");
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `=======KvStoreTest0191 fail error=${error.code},ms=${error.message}`);
          expect(error.code).assertEqual(15100004);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest0191 catch e=" + e);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   KvStoreTest020
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0200
     * @tc.desc   //DeviceKVStore get(did,key)  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "=======KvStoreTest020 start ");
      let deviceId : string = "000000000000000000";
      try {
        kvManager.getKVStore(TEST_DEVICE_STORE_ID, deviceOptions, (err: BusinessError|null, store: distributedKVStore.DeviceKVStore|undefined) => {
          store?.get(deviceId, 'keyno', (err: BusinessError<void>|null, value: undefined|Boolean|String|Long|Double|Uint8Array) => {
            if (err != undefined) {
              hilog.info(domain, tag, '%{public}s', `=======KvStoreTest020 fail err=${err.code},ms=${err.message}`);
              expect(err.code).assertEqual(15100004);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', "=======KvStoreTest020 get success");
              expect(null).assertFail();
              done();
            }

          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest020 catch e=" + e);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   KvStoreTest0201
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0201
     * @tc.desc   //DeviceKVStore get(key)  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "=======KvStoreTest0201 start ");
      try {
        kvManager.getKVStore(TEST_DEVICE_STORE_ID, deviceOptions, (err: BusinessError|null, store: distributedKVStore.DeviceKVStore|undefined) => {
          store?.get('keyno', (err: BusinessError<void>|null, value: undefined|Boolean|String|Long|Double|Uint8Array) => {
            if (err != undefined) {
              hilog.info(domain, tag, '%{public}s', `=======KvStoreTest0201 fail err=${err.code},ms=${err.message}`);
              expect(err.code).assertEqual(15100004);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', "=======KvStoreTest0201 get success");
              expect(null).assertFail();
              done();
            }

          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest0201 catch e=" + e);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   KvStoreTest021
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0210
     * @tc.desc   //Schema.constructor, FieldNode.constructor, Query.constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "============KvStoreTest021 start ");
      try {
        let schema: distributedKVStore.Schema | null = new distributedKVStore.Schema();
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest021 Schema done ");
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============KvStoreTest021 fail. e: " + e);
        expect(null).assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   KvStoreTest022
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0220
     * @tc.desc   //SingleKVStore get(key)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "=======KvStoreTest022 start ");
      try {
        let store : distributedKVStore.SingleKVStore = await kvManager.getKVStore<distributedKVStore.SingleKVStore>(TEST_SINGLE_STORE_ID, singleOptions);
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest022 getKVStore ");
        store.get('keyno').then((data: boolean | string | Long | number | Uint8Array) => {
          hilog.info(domain, tag, '%{public}s', "=======KvStoreTest022 get success");
          expect(null).assertFail();
          done();
        }).catch((err:Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `=======KvStoreTest022 fail err=${error.code},ms=${error.message}`);
          expect(error.code).assertEqual(15100004);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest022 catch e=" + e);
        expect(null).assertFail();
        done();
      }
    })
    
    /**
     * @tc.name   KvStoreTest023
     * @tc.number SUB_DistributedData_KvStore_SDK_APITest_STATIC_0230
     * @tc.desc   //SingleKVStore get(key)  callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KvStoreTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "=======KvStoreTest023 start ");
      try {
        kvManager.getKVStore(TEST_SINGLE_STORE_ID, singleOptions, (err: BusinessError|null, store: distributedKVStore.SingleKVStore|undefined) => {
          store?.get('keyno', (err: BusinessError<void>|null, value: undefined|Boolean|String|Long|Double|Uint8Array) => {
            if (err != undefined) {
              hilog.info(domain, tag, '%{public}s', `=======KvStoreTest023 fail err=${err.code},ms=${err.message}`);
              expect(err.code).assertEqual(15100004);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', "=======KvStoreTest023 get success");
              expect(null).assertFail();
              done();
            }

          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "=======KvStoreTest023 catch e=" + e);
        expect(null).assertFail();
        done();
      }
    })


  })
}