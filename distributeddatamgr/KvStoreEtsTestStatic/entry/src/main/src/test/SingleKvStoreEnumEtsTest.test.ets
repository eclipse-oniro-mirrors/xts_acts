/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";

import factory from '@ohos.data.distributedKVStore'

export default function singleKvStoreEnumTest(){
  describe('singleKvStoreEnumTest', () => {

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0800
     * @tc.desc   Test Js Enum Value Constants.MAX_KEY_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // @ts-ignore
      let maxKeyLength:int= factory.Constants.MAX_KEY_LENGTH;
      console.info('maxKeyLength = ' + maxKeyLength);
      expect(maxKeyLength == 1024).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1200
     * @tc.desc   Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // @ts-ignore
      let maxValueLength:int = factory.Constants.MAX_VALUE_LENGTH;
      console.info('maxValueLength = ' + maxValueLength);
      expect(maxValueLength == 4194303).assertTrue();
      // @ts-ignore
      expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2500
     * @tc.desc   Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        // @ts-ignore
        let lengthType = factory.Constants.MAX_VALUE_LENGTH
      } catch (e) {
        console.info('can NOT set value to MAX_VALUE_LENGTH : ' + e);
        // @ts-ignore
        expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_DEVICE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0900
     * @tc.desc   Test Js Enum Value Constants.MAX_KEY_LENGTH_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_DEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // @ts-ignore
      let maxKeyLengthDevice = factory.Constants.MAX_KEY_LENGTH_DEVICE;
      console.info('maxKeyLengthDevice = ' + maxKeyLengthDevice);
      expect(maxKeyLengthDevice == 896).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_STORE_ID_LENGTH_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1100
     * @tc.desc   Test Js Enum Value Constants.MAX_STORE_ID_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_STORE_ID_LENGTH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // @ts-ignore
      let maxStoreIdLength = factory.Constants.MAX_STORE_ID_LENGTH;
      console.info('maxStoreIdLength = ' + maxStoreIdLength);
      expect(maxStoreIdLength == 128).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_QUERY_LENGTH_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1000
     * @tc.desc   Test Js Enum Value Constants.MAX_QUERY_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_QUERY_LENGTH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // @ts-ignore
      let maxQueryLength = factory.Constants.MAX_QUERY_LENGTH;
      console.info('maxQueryLength = ' + maxQueryLength);
      expect(maxQueryLength == 512000).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_BATCH_SIZE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0700
     * @tc.desc   Test Js Enum Value Constants.MAX_BATCH_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_BATCH_SIZE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // @ts-ignore
      let maxBatchSize = factory.Constants.MAX_BATCH_SIZE;
      console.info('maxBatchSize = ' + maxBatchSize);
      expect(maxBatchSize == 128).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_STRING_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2100
     * @tc.desc   Test Js Enum Value Valuetype.STRING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_STRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let strType = factory.ValueType.STRING;
      console.info('string = ' + strType);
      expect(strType == 0).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_LONG_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0600
     * @tc.desc   Test Js Enum Value Valuetype.LONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_LONG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longType = factory.ValueType.LONG;
      console.info('LONG = ' + longType);
      expect(longType == 4).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_DOUBLE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0500
     * @tc.desc   Test Js Enum Value Valuetype.DOUBLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_DOUBLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let douType = factory.ValueType.DOUBLE;
      console.info('double = ' + douType);
      expect(douType == 3).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_BYTEARRAY_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0200
     * @tc.desc   Test Js Enum Value Valuetype.BYTEARRAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_BYTEARRAY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let byteArray = factory.ValueType.BYTE_ARRAY;
      console.info('byteArray = ' + byteArray);
      expect(byteArray == 1).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_BOOLEAN_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0100
     * @tc.desc   Test Js Enum Value Valuetype.BOOLEAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_BOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let boType = factory.ValueType.BOOLEAN;
      console.info('boolean = ' + boType);
      expect(boType == 2).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_PULL_ONLY_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1300
     * @tc.desc   Test Js Enum Value Syncmode.PULL_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_PULL_ONLY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pullonly = factory.SyncMode.PULL_ONLY;
      console.info('pullonly = ' + pullonly);
      expect(pullonly == 0).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_ONLY_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1400
     * @tc.desc   Test Js Enum Value Syncmode.PUSH_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_ONLY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pushonly = factory.SyncMode.PUSH_ONLY;
      console.info('pushonly = ' + pushonly);
      expect(pushonly == 1).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_PULL_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1500
     * @tc.desc   Test Js Enum Value Syncmode.PUSH_PULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_PULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pushpull = factory.SyncMode.PUSH_PULL;
      console.info('pushpull = ' + pushpull);
      expect(pushpull == 2).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_LOCAL_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2300
     * @tc.desc   Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_LOCAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_LOCAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let local = factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL;
      console.info('local = ' + local);
      expect(local == 1).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_REMOTE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2400
     * @tc.desc   Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_REMOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_REMOTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let remote = factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE;
      console.info('remote = ' + remote);
      expect(remote == 2).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_ALL_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2200
     * @tc.desc   Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_ALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let all = factory.SubscribeType.SUBSCRIBE_TYPE_ALL;
      console.info('all = ' + all);
      expect(all == 3).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_DEVICE_COLLABORATION_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0300
     * @tc.desc   Test Js Enum Value Kvstoretype.DEVICE_COLLABORATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_DEVICE_COLLABORATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collaboration = factory.KVStoreType.DEVICE_COLLABORATION;
      console.info('collaboration = ' + collaboration);
      expect(collaboration == 0).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_SINGLE_VERSION_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2000
     * @tc.desc   Test Js Enum Value Kvstoretype.SINGLE_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SINGLE_VERSION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let single = factory.KVStoreType.SINGLE_VERSION;
      console.info('single = ' + single);
      expect(single == 1).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_S1_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1600
     * @tc.desc   Test Js Enum Value Securitylevel.S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S1_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s1 = factory.SecurityLevel.S1;
      console.info('s1 = ' + s1);
      expect(s1 == 0).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_S2_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1700
     * @tc.desc   Test Js Enum Value Securitylevel.S2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s2 = factory.SecurityLevel.S2;
      console.info('s2 = ' + s2);
      expect(s2 == 1).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_S3_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1800
     * @tc.desc   Test Js Enum Value Securitylevel.S3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S3_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s3 = factory.SecurityLevel.S3;
      console.info('s3 = ' + s3);
      expect(s3 == 2).assertTrue()
    })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTOREENUM_S4_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1900
     * @tc.desc   Test Js Enum Value Securitylevel.S4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S4_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s4 = factory.SecurityLevel.S4;
      console.info('s4 = ' + s4);
      expect(s4 == 3).assertTrue()
    })
  })
}
