// @ts-nocheck
/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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
import factory from '@ohos.data.distributedKVStore';

export default function singleKvStoreEnumStageTest(){
  describe('singleKvStoreEnumStageTest', function () {

    /**
     * @tc.name   testEtsConstantsMaxKeyLength_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0300
     * @tc.desc   Test Js Enum Value Constants.MAX_KEY_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsConstantsMaxKeyLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var maxKeyLength = factory.Constants.MAX_KEY_LENGTH;
      console.info('maxKeyLength = ' + maxKeyLength);
      expect(maxKeyLength == 1024).assertTrue()
    })

    /**
     * @tc.name   testEtsConstantsMaxValueLength_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0600
     * @tc.desc   Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsConstantsMaxValueLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var maxValueLength = factory.Constants.MAX_VALUE_LENGTH;
      console.info('maxValueLength = ' + maxValueLength);
      expect(maxValueLength == 4194303).assertTrue();
      expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
    })

    /**
     * @tc.name   testEtsConstantsMaxValueLength_002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0700
     * @tc.desc   Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsConstantsMaxValueLength_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      try {
        factory.Constants.MAX_VALUE_LENGTH = 123;
      } catch (e) {
        console.info('can NOT set value to MAX_VALUE_LENGTH : ' + e);
        expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
      }
    })

    /**
     * @tc.name   testEtsConstantsMaxKeyLengthDevice_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0200
     * @tc.desc   Test Js Enum Value Constants.MAX_KEY_LENGTH_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsConstantsMaxKeyLengthDevice_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var maxKeyLengthDevice = factory.Constants.MAX_KEY_LENGTH_DEVICE;
      console.info('maxKeyLengthDevice = ' + maxKeyLengthDevice);
      expect(maxKeyLengthDevice == 896).assertTrue()
    })

    /**
     * @tc.name   testEtsConstantsMaxStoreIdLength_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0500
     * @tc.desc   Test Js Enum Value Constants.MAX_STORE_ID_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsConstantsMaxStoreIdLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var maxStoreIdLength = factory.Constants.MAX_STORE_ID_LENGTH;
      console.info('maxStoreIdLength = ' + maxStoreIdLength);
      expect(maxStoreIdLength == 128).assertTrue()
    })

    /**
     * @tc.name   testEtsConstantsMaxQueryLength_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0400
     * @tc.desc   Test Js Enum Value Constants.MAX_QUERY_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsConstantsMaxQueryLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var maxQueryLength = factory.Constants.MAX_QUERY_LENGTH;
      console.info('maxQueryLength = ' + maxQueryLength);
      expect(maxQueryLength == 512000).assertTrue()
    })

    /**
     * @tc.name   testEtsConstantsMaxBatchSize_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0100
     * @tc.desc   Test Js Enum Value Constants.MAX_BATCH_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsConstantsMaxBatchSize_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var maxBatchSize = factory.Constants.MAX_BATCH_SIZE;
      console.info('maxBatchSize = ' + maxBatchSize);
      expect(maxBatchSize == 128).assertTrue()
    })

    /**
     * @tc.name   testEtsValuetypeString_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2900
     * @tc.desc   Test Js Enum Value Valuetype.STRING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsValuetypeString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var string = factory.ValueType.STRING;
      console.info('string = ' + string);
      expect(string == 0).assertTrue()
    })

    /**
     * @tc.name   testEtsValuetypeInteger_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2800
     * @tc.desc   Test Js Enum Value Valuetype.INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsValuetypeInteger_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var integer = factory.ValueType.INTEGER;
      console.info('integer = ' + integer);
      expect(integer == 1).assertTrue()
    })

    /**
     * @tc.name   testEtsValuetypeFloat_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2700
     * @tc.desc   Test Js Enum Value Valuetype.FLOAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsValuetypeFloat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var float = factory.ValueType.FLOAT;
      console.info('float = ' + float);
      expect(float == 2).assertTrue()
    })

    /**
     * @tc.name   testEtsValuetypeByteArray_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2500
     * @tc.desc   Test Js Enum Value Valuetype.BYTEARRAY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsValuetypeByteArray_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var byteArray = factory.ValueType.BYTE_ARRAY;
      console.info('byteArray = ' + byteArray);
      expect(byteArray == 3).assertTrue()
    })

    /**
     * @tc.name   testEtsValuetypeBoolean_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2400
     * @tc.desc   Test Js Enum Value Valuetype.BOOLEAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsValuetypeBoolean_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var boolean = factory.ValueType.BOOLEAN;
      console.info('boolean = ' + boolean);
      expect(boolean == 4).assertTrue()
    })

    /**
     * @tc.name   testEtsValuetypeDouble_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2600
     * @tc.desc   Test Js Enum Value Valuetype.DOUBLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsValuetypeDouble_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var double = factory.ValueType.DOUBLE;
      console.info('double = ' + double);
      expect(double == 5).assertTrue()
    })

    /**
     * @tc.name   testEtsSyncmodePullOnly_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2000
     * @tc.desc   Test Js Enum Value Syncmode.PULL_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSyncmodePullOnly_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var pullonly = factory.SyncMode.PULL_ONLY;
      console.info('pullonly = ' + pullonly);
      expect(pullonly == 0).assertTrue()
    })

    /**
     * @tc.name   testEtsSyncmodePushOnly_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2100
     * @tc.desc   Test Js Enum Value Syncmode.PUSH_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSyncmodePushOnly_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var pushonly = factory.SyncMode.PUSH_ONLY;
      console.info('pushonly = ' + pushonly);
      expect(pushonly == 1).assertTrue()
    })

    /**
     * @tc.name   testEtsSyncmodePushPull_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2200
     * @tc.desc   Test Js Enum Value Syncmode.PUSH_PULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSyncmodePushPull_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var pushpull = factory.SyncMode.PUSH_PULL;
      console.info('pushpull = ' + pushpull);
      expect(pushpull == 2).assertTrue()
    })

    /**
     * @tc.name   testEtsSubscribetypeSubscribeTypeLocal_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1800
     * @tc.desc   Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_LOCAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSubscribetypeSubscribeTypeLocal_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var local = factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL;
      console.info('local = ' + local);
      expect(local == 0).assertTrue()
    })

    /**
     * @tc.name   testEtsSubscribetypeSubscribeTypeRemote_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1900
     * @tc.desc   Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_REMOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSubscribetypeSubscribeTypeRemote_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var remote = factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE;
      console.info('remote = ' + remote);
      expect(remote == 1).assertTrue()
    })

    /**
     * @tc.name   testEtsSubscribetypeSubscribeTypeAll_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1700
     * @tc.desc   Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSubscribetypeSubscribeTypeAll_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var all = factory.SubscribeType.SUBSCRIBE_TYPE_ALL;
      console.info('all = ' + all);
      expect(all == 2).assertTrue()
    })

    /**
     * @tc.name   testEtsKvstoretypeDeviceCollaboration_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0800
     * @tc.desc   Test Js Enum Value Kvstoretype.DEVICE_COLLABORATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvstoretypeDeviceCollaboration_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var collaboration = factory.KVStoreType.DEVICE_COLLABORATION;
      console.info('collaboration = ' + collaboration);
      expect(collaboration == 0).assertTrue()
    })

    /**
     * @tc.name   testEtsKvstoretypeSingleVersion_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1000
     * @tc.desc   Test Js Enum Value Kvstoretype.SINGLE_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvstoretypeSingleVersion_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var single = factory.KVStoreType.SINGLE_VERSION;
      console.info('single = ' + single);
      expect(single == 1).assertTrue()
    })

    /**
     * @tc.name   testEtsSecuritylevelS1_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1300
     * @tc.desc   Test Js Enum Value Securitylevel.S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSecuritylevelS1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var s1 = factory.SecurityLevel.S1;
      console.info('s1 = ' + s1);
      expect(s1 == 2).assertTrue()
    })

    /**
     * @tc.name   testEtsSecuritylevelS2_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1400
     * @tc.desc   Test Js Enum Value Securitylevel.S2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSecuritylevelS2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var s2 = factory.SecurityLevel.S2;
      console.info('s2 = ' + s2);
      expect(s2 == 3).assertTrue()
    })

    /**
     * @tc.name   testEtsSecuritylevelS3_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1500
     * @tc.desc   Test Js Enum Value Securitylevel.S3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSecuritylevelS3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var s3 = factory.SecurityLevel.S3;
      console.info('s3 = ' + s3);
      expect(s3 == 5).assertTrue()
    })

    /**
     * @tc.name   testEtsSecuritylevelS4_001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1600
     * @tc.desc   Test Js Enum Value Securitylevel.S4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsSecuritylevelS4_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      var s4 = factory.SecurityLevel.S4;
      console.info('s4 = ' + s4);
      expect(s4 == 6).assertTrue()
    })
  })
}