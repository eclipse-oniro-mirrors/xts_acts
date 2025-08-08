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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

import factory from '@ohos.data.distributedKVStore'

export default function singleKvStoreEnumTest(){
  describe('singleKvStoreEnumTest', function () {

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_0100
     * @tc.desc  Test Js Enum Value Constants.MAX_KEY_LENGTH
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0800
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_0100', 0, function () {
      // @ts-ignore
      let maxKeyLength:number= factory.Constants.MAX_KEY_LENGTH;
      console.info('maxKeyLength = ' + maxKeyLength);
      expect(maxKeyLength == 1024).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0100
     * @tc.desc  Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1200
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0100', 0, function () {
      // @ts-ignore
      let maxValueLength:number = factory.Constants.MAX_VALUE_LENGTH;
      console.info('maxValueLength = ' + maxValueLength);
      expect(maxValueLength == 4194303).assertTrue();
      // @ts-ignore
      expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0200
     * @tc.desc  Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2500
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_VALUE_LENGTH_0200', 0, function () {
      try {
        // @ts-ignore
        factory.Constants.MAX_VALUE_LENGTH = 123;
      } catch (e) {
        console.info('can NOT set value to MAX_VALUE_LENGTH : ' + e);
        // @ts-ignore
        expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
      }
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_DEVICE_0100
     * @tc.desc  Test Js Enum Value Constants.MAX_KEY_LENGTH_DEVICE
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0900
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_KEY_LENGTH_DEVICE_0100', 0, function () {
      // @ts-ignore
      let maxKeyLengthDevice = factory.Constants.MAX_KEY_LENGTH_DEVICE;
      console.info('maxKeyLengthDevice = ' + maxKeyLengthDevice);
      expect(maxKeyLengthDevice == 896).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_STORE_ID_LENGTH_0100
     * @tc.desc  Test Js Enum Value Constants.MAX_STORE_ID_LENGTH
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1100
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_STORE_ID_LENGTH_0100', 0, function () {
      // @ts-ignore
      let maxStoreIdLength = factory.Constants.MAX_STORE_ID_LENGTH;
      console.info('maxStoreIdLength = ' + maxStoreIdLength);
      expect(maxStoreIdLength == 128).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_QUERY_LENGTH_0100
     * @tc.desc  Test Js Enum Value Constants.MAX_QUERY_LENGTH
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1000
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_QUERY_LENGTH_0100', 0, function () {
      // @ts-ignore
      let maxQueryLength = factory.Constants.MAX_QUERY_LENGTH;
      console.info('maxQueryLength = ' + maxQueryLength);
      expect(maxQueryLength == 512000).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_BATCH_SIZE_0100
     * @tc.desc  Test Js Enum Value Constants.MAX_BATCH_SIZE
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0700
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_MAX_BATCH_SIZE_0100', 0, function () {
      // @ts-ignore
      let maxBatchSize = factory.Constants.MAX_BATCH_SIZE;
      console.info('maxBatchSize = ' + maxBatchSize);
      expect(maxBatchSize == 128).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_STRING_0100
     * @tc.desc  Test Js Enum Value Valuetype.STRING
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2100
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_STRING_0100', 0, function () {
      let string = factory.ValueType.STRING;
      console.info('string = ' + string);
      expect(string == 0).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_INTEGER_0100
     * @tc.desc  Test Js Enum Value Valuetype.INTEGER
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0600
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_INTEGER_0100', 0, function () {
      let integer = factory.ValueType.INTEGER;
      console.info('integer = ' + integer);
      expect(integer == 1).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_FLOAT_0100
     * @tc.desc  Test Js Enum Value Valuetype.FLOAT
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0500
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_FLOAT_0100', 0, function () {
      let float = factory.ValueType.FLOAT;
      console.info('float = ' + float);
      expect(float == 2).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_BYTEARRAY_0100
     * @tc.desc  Test Js Enum Value Valuetype.BYTEARRAY
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0200
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_BYTEARRAY_0100', 0, function () {
      let byteArray = factory.ValueType.BYTE_ARRAY;
      console.info('byteArray = ' + byteArray);
      expect(byteArray == 3).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_BOOLEAN_0100
     * @tc.desc  Test Js Enum Value Valuetype.BOOLEAN
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0100
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_BOOLEAN_0100', 0, function () {
      let boolean = factory.ValueType.BOOLEAN;
      console.info('boolean = ' + boolean);
      expect(boolean == 4).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_DOUBLE_0100
     * @tc.desc  Test Js Enum Value Valuetype.DOUBLE
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0400
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_DOUBLE_0100', 0, function () {
      let double = factory.ValueType.DOUBLE;
      console.info('double = ' + double);
      expect(double == 5).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_PULL_ONLY_0100
     * @tc.desc  Test Js Enum Value Syncmode.PULL_ONLY
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1300
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_PULL_ONLY_0100', 0, function () {
      let pullonly = factory.SyncMode.PULL_ONLY;
      console.info('pullonly = ' + pullonly);
      expect(pullonly == 0).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_ONLY_0100
     * @tc.desc  Test Js Enum Value Syncmode.PUSH_ONLY
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1400
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_ONLY_0100', 0, function () {
      let pushonly = factory.SyncMode.PUSH_ONLY;
      console.info('pushonly = ' + pushonly);
      expect(pushonly == 1).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_PULL_0100
     * @tc.desc  Test Js Enum Value Syncmode.PUSH_PULL
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1500
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_PUSH_PULL_0100', 0, function () {
      let pushpull = factory.SyncMode.PUSH_PULL;
      console.info('pushpull = ' + pushpull);
      expect(pushpull == 2).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_LOCAL_0100
     * @tc.desc  Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_LOCAL
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2300
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_LOCAL_0100', 0, function () {
      let local = factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL;
      console.info('local = ' + local);
      expect(local == 0).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_REMOTE_0100
     * @tc.desc  Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_REMOTE
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2400
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_REMOTE_0100', 0, function () {
      let remote = factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE;
      console.info('remote = ' + remote);
      expect(remote == 1).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_ALL_0100
     * @tc.desc  Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_ALL
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2200
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SUBSCRIBE_TYPE_ALL_0100', 0, function () {
      let all = factory.SubscribeType.SUBSCRIBE_TYPE_ALL;
      console.info('all = ' + all);
      expect(all == 2).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_DEVICE_COLLABORATION_0100
     * @tc.desc  Test Js Enum Value Kvstoretype.DEVICE_COLLABORATION
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_0300
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_DEVICE_COLLABORATION_0100', 0, function () {
      let collaboration = factory.KVStoreType.DEVICE_COLLABORATION;
      console.info('collaboration = ' + collaboration);
      expect(collaboration == 0).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_SINGLE_VERSION_0100
     * @tc.desc  Test Js Enum Value Kvstoretype.SINGLE_VERSION
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_2000
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_SINGLE_VERSION_0100', 0, function () {
      let single = factory.KVStoreType.SINGLE_VERSION;
      console.info('single = ' + single);
      expect(single == 1).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_S1_0100
     * @tc.desc  Test Js Enum Value Securitylevel.S1
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1600
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S1_0100', 0, function () {
      let s1 = factory.SecurityLevel.S1;
      console.info('s1 = ' + s1);
      expect(s1 == 2).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_S2_0100
     * @tc.desc  Test Js Enum Value Securitylevel.S2
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1700
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S2_0100', 0, function () {
      let s2 = factory.SecurityLevel.S2;
      console.info('s2 = ' + s2);
      expect(s2 == 3).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_S3_0100
     * @tc.desc  Test Js Enum Value Securitylevel.S3
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1800
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S3_0100', 0, function () {
      let s3 = factory.SecurityLevel.S3;
      console.info('s3 = ' + s3);
      expect(s3 == 5).assertTrue()
    })

    /**
     * @tc.name SUB_DDM_DKV_SINGLEKVSTOREENUM_S4_0100
     * @tc.desc  Test Js Enum Value Securitylevel.S4
     * @tc.type: FUNC
     * @tc.number: SUB_DistributedData_KVStore_SDK_DisKVSingleKvStoreEnumEtsApiTest_1900
     */
    it('SUB_DDM_DKV_SINGLEKVSTOREENUM_S4_0100', 0, function () {
      let s4 = factory.SecurityLevel.S4;
      console.info('s4 = ' + s4);
      expect(s4 == 6).assertTrue()
    })
  })
}
