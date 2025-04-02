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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import factory from '@ohos.data.distributedKVStore';

export default function singleKvStoreEnumStageTest(){
  describe('singleKvStoreEnumStageTest', function () {

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0300
     * @tc.name [JS-API8]Constants.MAX_KEY_LENGTH
     * @tc.desc Test Js Enum Value Constants.MAX_KEY_LENGTH
     */
    it('testEtsConstantsMaxKeyLength_001', 0, function () {
      var maxKeyLength = factory.Constants.MAX_KEY_LENGTH;
      console.info('maxKeyLength = ' + maxKeyLength);
      expect(maxKeyLength == 1024).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0600
     * @tc.name [JS-API8]Constants.MAX_VALUE_LENGTH
     * @tc.desc Test Js Enum Value Constants.MAX_VALUE_LENGTH
     */
    it('testEtsConstantsMaxValueLength_001', 0, function () {
      var maxValueLength = factory.Constants.MAX_VALUE_LENGTH;
      console.info('maxValueLength = ' + maxValueLength);
      expect(maxValueLength == 4194303).assertTrue();
      expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0700
     * @tc.name [JS-API8]Constants.MAX_VALUE_LENGTH
     * @tc.desc Test Js Enum Value Constants.MAX_VALUE_LENGTH
     */
    it('testEtsConstantsMaxValueLength_002', 0, function () {
      try {
        factory.Constants.MAX_VALUE_LENGTH = 123;
      } catch (e) {
        console.info('can NOT set value to MAX_VALUE_LENGTH : ' + e);
        expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0200
     * @tc.name [JS-API8]Constants.MAX_KEY_LENGTH_DEVICE
     * @tc.desc Test Js Enum Value Constants.MAX_KEY_LENGTH_DEVICE
     */
    it('testEtsConstantsMaxKeyLengthDevice_001', 0, function () {
      var maxKeyLengthDevice = factory.Constants.MAX_KEY_LENGTH_DEVICE;
      console.info('maxKeyLengthDevice = ' + maxKeyLengthDevice);
      expect(maxKeyLengthDevice == 896).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0500
     * @tc.name [JS-API8]Constants.MAX_STORE_ID_LENGTH
     * @tc.desc Test Js Enum Value Constants.MAX_STORE_ID_LENGTH
     */
    it('testEtsConstantsMaxStoreIdLength_001', 0, function () {
      var maxStoreIdLength = factory.Constants.MAX_STORE_ID_LENGTH;
      console.info('maxStoreIdLength = ' + maxStoreIdLength);
      expect(maxStoreIdLength == 128).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0400
     * @tc.name [JS-API8]Constants.MAX_QUERY_LENGTH
     * @tc.desc Test Js Enum Value Constants.MAX_QUERY_LENGTH
     */
    it('testEtsConstantsMaxQueryLength_001', 0, function () {
      var maxQueryLength = factory.Constants.MAX_QUERY_LENGTH;
      console.info('maxQueryLength = ' + maxQueryLength);
      expect(maxQueryLength == 512000).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0100
     * @tc.name [JS-API8]Constants.MAX_BATCH_SIZE
     * @tc.desc Test Js Enum Value Constants.MAX_BATCH_SIZE
     */
    it('testEtsConstantsMaxBatchSize_001', 0, function () {
      var maxBatchSize = factory.Constants.MAX_BATCH_SIZE;
      console.info('maxBatchSize = ' + maxBatchSize);
      expect(maxBatchSize == 128).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2900
     * @tc.name [JS-API8]Valuetype.STRING
     * @tc.desc Test Js Enum Value Valuetype.STRING
     */
    it('testEtsValuetypeString_001', 0, function () {
      var string = factory.ValueType.STRING;
      console.info('string = ' + string);
      expect(string == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2800
     * @tc.name [JS-API8]Valuetype.INTEGER
     * @tc.desc Test Js Enum Value Valuetype.INTEGER
     */
    it('testEtsValuetypeInteger_001', 0, function () {
      var integer = factory.ValueType.INTEGER;
      console.info('integer = ' + integer);
      expect(integer == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2700
     * @tc.name [JS-API8]Valuetype.FLOAT
     * @tc.desc Test Js Enum Value Valuetype.FLOAT
     */
    it('testEtsValuetypeFloat_001', 0, function () {
      var float = factory.ValueType.FLOAT;
      console.info('float = ' + float);
      expect(float == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2500
     * @tc.name [JS-API8]Valuetype.BYTEARRAY
     * @tc.desc Test Js Enum Value Valuetype.BYTEARRAY
     */
    it('testEtsValuetypeByteArray_001', 0, function () {
      var byteArray = factory.ValueType.BYTE_ARRAY;
      console.info('byteArray = ' + byteArray);
      expect(byteArray == 3).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2400
     * @tc.name [JS-API8]Valuetype.BOOLEAN
     * @tc.desc Test Js Enum Value Valuetype.BOOLEAN
     */
    it('testEtsValuetypeBoolean_001', 0, function () {
      var boolean = factory.ValueType.BOOLEAN;
      console.info('boolean = ' + boolean);
      expect(boolean == 4).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2600
     * @tc.name [JS-API8]Valuetype.DOUBLE
     * @tc.desc Test Js Enum Value Valuetype.DOUBLE
     */
    it('testEtsValuetypeDouble_001', 0, function () {
      var double = factory.ValueType.DOUBLE;
      console.info('double = ' + double);
      expect(double == 5).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2000
     * @tc.name [JS-API8]Syncmode.PULL_ONLY
     * @tc.desc Test Js Enum Value Syncmode.PULL_ONLY
     */
    it('testEtsSyncmodePullOnly_001', 0, function () {
      var pullonly = factory.SyncMode.PULL_ONLY;
      console.info('pullonly = ' + pullonly);
      expect(pullonly == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2100
     * @tc.name [JS-API8]Syncmode.PUSH_ONLY
     * @tc.desc Test Js Enum Value Syncmode.PUSH_ONLY
     */
    it('testEtsSyncmodePushOnly_001', 0, function () {
      var pushonly = factory.SyncMode.PUSH_ONLY;
      console.info('pushonly = ' + pushonly);
      expect(pushonly == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_2200
     * @tc.name [JS-API8]Syncmode.PUSH_PULL
     * @tc.desc Test Js Enum Value Syncmode.PUSH_PULL
     */
    it('testEtsSyncmodePushPull_001', 0, function () {
      var pushpull = factory.SyncMode.PUSH_PULL;
      console.info('pushpull = ' + pushpull);
      expect(pushpull == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1800
     * @tc.name [JS-API8]Subscribetype.SUBSCRIBE_TYPE_LOCAL
     * @tc.desc Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_LOCAL
     */
    it('testEtsSubscribetypeSubscribeTypeLocal_001', 0, function () {
      var local = factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL;
      console.info('local = ' + local);
      expect(local == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1900
     * @tc.name [JS-API8]Subscribetype.SUBSCRIBE_TYPE_REMOTE
     * @tc.desc Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_REMOTE
     */
    it('testEtsSubscribetypeSubscribeTypeRemote_001', 0, function () {
      var remote = factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE;
      console.info('remote = ' + remote);
      expect(remote == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1700
     * @tc.name [JS-API8]Subscribetype.SUBSCRIBE_TYPE_ALL
     * @tc.desc Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_ALL
     */
    it('testEtsSubscribetypeSubscribeTypeAll_001', 0, function () {
      var all = factory.SubscribeType.SUBSCRIBE_TYPE_ALL;
      console.info('all = ' + all);
      expect(all == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_0800
     * @tc.name [JS-API8]Kvstoretype.DEVICE_COLLABORATION
     * @tc.desc Test Js Enum Value Kvstoretype.DEVICE_COLLABORATION
     */
    it('testEtsKvstoretypeDeviceCollaboration_001', 0, function () {
      var collaboration = factory.KVStoreType.DEVICE_COLLABORATION;
      console.info('collaboration = ' + collaboration);
      expect(collaboration == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1000
     * @tc.name [JS-API8]Kvstoretype.SINGLE_VERSION
     * @tc.desc Test Js Enum Value Kvstoretype.SINGLE_VERSION
     */
    it('testEtsKvstoretypeSingleVersion_001', 0, function () {
      var single = factory.KVStoreType.SINGLE_VERSION;
      console.info('single = ' + single);
      expect(single == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1300
     * @tc.name [JS-API8]Securitylevel.S1
     * @tc.desc Test Js Enum Value Securitylevel.S1
     */
    it('testEtsSecuritylevelS1_001', 0, function () {
      var s1 = factory.SecurityLevel.S1;
      console.info('s1 = ' + s1);
      expect(s1 == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1400
     * @tc.name [JS-API8]Securitylevel.S2
     * @tc.desc Test Js Enum Value Securitylevel.S2
     */
    it('testEtsSecuritylevelS2_001', 0, function () {
      var s2 = factory.SecurityLevel.S2;
      console.info('s2 = ' + s2);
      expect(s2 == 3).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1500
     * @tc.name [JS-API8]Securitylevel.S3
     * @tc.desc Test Js Enum Value Securitylevel.S3
     */
    it('testEtsSecuritylevelS3_001', 0, function () {
      var s3 = factory.SecurityLevel.S3;
      console.info('s3 = ' + s3);
      expect(s3 == 5).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumEtsApiTest_1600
     * @tc.name [JS-API8]Securitylevel.S4
     * @tc.desc Test Js Enum Value Securitylevel.S4
     */
    it('testEtsSecuritylevelS4_001', 0, function () {
      var s4 = factory.SecurityLevel.S4;
      console.info('s4 = ' + s4);
      expect(s4 == 6).assertTrue()
    })
  })
}