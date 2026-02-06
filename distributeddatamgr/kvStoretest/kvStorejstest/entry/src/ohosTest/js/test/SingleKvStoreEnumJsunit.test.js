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
import factory from '@ohos.data.distributedData';

export default function singleKvStoreEnumTest(){
describe('singleKvStoreEnumTest', function () {

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2300
     * @tc.name testUsertypeSameUserId_001
     * @tc.desc Test Js Enum Value Usertype.SAME_USER_ID
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testUsertypeSameUserId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var sameUserId = factory.UserType.SAME_USER_ID;
        console.info('sameUserId = ' + sameUserId);
        expect(sameUserId == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0300
     * @tc.name testConstantsMaxKeyLength_001
     * @tc.desc Test Js Enum Value Constants.MAX_KEY_LENGTH
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testConstantsMaxKeyLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var maxKeyLength = factory.Constants.MAX_KEY_LENGTH;
        console.info('maxKeyLength = ' + maxKeyLength);
        expect(maxKeyLength == 1024).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0600
     * @tc.name testConstantsMaxValueLength_001
     * @tc.desc Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testConstantsMaxValueLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var maxValueLength = factory.Constants.MAX_VALUE_LENGTH;
        console.info('maxValueLength = ' + maxValueLength);
        expect(maxValueLength == 4194303).assertTrue();
        expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0700
     * @tc.name testConstantsMaxValueLength_002
     * @tc.desc Test Js Enum Value Constants.MAX_VALUE_LENGTH
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testConstantsMaxValueLength_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        try {
            factory.Constants.MAX_VALUE_LENGTH = 123;
        } catch (e) {
            console.info('can NOT set value to MAX_VALUE_LENGTH : ' + e);
            expect(factory.Constants.MAX_VALUE_LENGTH).assertEqual(4194303);
        }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0200
     * @tc.name testConstantsMaxKeyLengthDevice_001
     * @tc.desc Test Js Enum Value Constants.MAX_KEY_LENGTH_DEVICE
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testConstantsMaxKeyLengthDevice_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var maxKeyLengthDevice = factory.Constants.MAX_KEY_LENGTH_DEVICE;
        console.info('maxKeyLengthDevice = ' + maxKeyLengthDevice);
        expect(maxKeyLengthDevice == 896).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0500
     * @tc.name testConstantsMaxStoreIdLength_001
     * @tc.desc Test Js Enum Value Constants.MAX_STORE_ID_LENGTH
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testConstantsMaxStoreIdLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var maxStoreIdLength = factory.Constants.MAX_STORE_ID_LENGTH;
        console.info('maxStoreIdLength = ' + maxStoreIdLength);
        expect(maxStoreIdLength == 128).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0400
     * @tc.name testConstantsMaxQueryLength_001
     * @tc.desc Test Js Enum Value Constants.MAX_QUERY_LENGTH
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testConstantsMaxQueryLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var maxQueryLength = factory.Constants.MAX_QUERY_LENGTH;
        console.info('maxQueryLength = ' + maxQueryLength);
        expect(maxQueryLength == 512000).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0100
     * @tc.name testConstantsMaxBatchSize_001
     * @tc.desc Test Js Enum Value Constants.MAX_BATCH_SIZE
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testConstantsMaxBatchSize_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var maxBatchSize = factory.Constants.MAX_BATCH_SIZE;
        console.info('maxBatchSize = ' + maxBatchSize);
        expect(maxBatchSize == 128).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2900
     * @tc.name testValuetypeString_001
     * @tc.desc Test Js Enum Value Valuetype.STRING
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testValuetypeString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var string = factory.ValueType.STRING;
        console.info('string = ' + string);
        expect(string == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2800
     * @tc.name testValuetypeInteger_001
     * @tc.desc Test Js Enum Value Valuetype.INTEGER
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testValuetypeInteger_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var integer = factory.ValueType.INTEGER;
        console.info('integer = ' + integer);
        expect(integer == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2700
     * @tc.name testValuetypeFloat_001
     * @tc.desc Test Js Enum Value Valuetype.FLOAT
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testValuetypeFloat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var float = factory.ValueType.FLOAT;
        console.info('float = ' + float);
        expect(float == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2500
     * @tc.name testValuetypeByteArray_001
     * @tc.desc Test Js Enum Value Valuetype.BYTEARRAY
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testValuetypeByteArray_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var byteArray = factory.ValueType.BYTE_ARRAY;
        console.info('byteArray = ' + byteArray);
        expect(byteArray == 3).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2400
     * @tc.name testValuetypeBoolean_001
     * @tc.desc Test Js Enum Value Valuetype.BOOLEAN
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testValuetypeBoolean_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var boolean = factory.ValueType.BOOLEAN;
        console.info('boolean = ' + boolean);
        expect(boolean == 4).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2600
     * @tc.name testValuetypeDouble_001
     * @tc.desc Test Js Enum Value Valuetype.DOUBLE
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testValuetypeDouble_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var double = factory.ValueType.DOUBLE;
        console.info('double = ' + double);
        expect(double == 5).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2000
     * @tc.name testSyncmodePullOnly_001
     * @tc.desc Test Js Enum Value Syncmode.PULL_ONLY
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSyncmodePullOnly_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var pullonly = factory.SyncMode.PULL_ONLY;
        console.info('pullonly = ' + pullonly);
        expect(pullonly == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2100
     * @tc.name testSyncmodePushOnly_001
     * @tc.desc Test Js Enum Value Syncmode.PUSH_ONLY
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSyncmodePushOnly_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var pushonly = factory.SyncMode.PUSH_ONLY;
        console.info('pushonly = ' + pushonly);
        expect(pushonly == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_2200
     * @tc.name testSyncmodePushPull_001
     * @tc.desc Test Js Enum Value Syncmode.PUSH_PULL
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSyncmodePushPull_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var pushpull = factory.SyncMode.PUSH_PULL;
        console.info('pushpull = ' + pushpull);
        expect(pushpull == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1800
     * @tc.name testSubscribetypeSubscribeTypeLocal_001
     * @tc.desc Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_LOCAL
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSubscribetypeSubscribeTypeLocal_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var local = factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL;
        console.info('local = ' + local);
        expect(local == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1900
     * @tc.name testSubscribetypeSubscribeTypeRemote_001
     * @tc.desc Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_REMOTE
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSubscribetypeSubscribeTypeRemote_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var remote = factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE;
        console.info('remote = ' + remote);
        expect(remote == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1700
     * @tc.name testSubscribetypeSubscribeTypeAll_001
     * @tc.desc Test Js Enum Value Subscribetype.SUBSCRIBE_TYPE_ALL
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSubscribetypeSubscribeTypeAll_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var all = factory.SubscribeType.SUBSCRIBE_TYPE_ALL;
        console.info('all = ' + all);
        expect(all == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0800
     * @tc.name testKvstoretypeDeviceCollaboration_001
     * @tc.desc Test Js Enum Value Kvstoretype.DEVICE_COLLABORATION
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKvstoretypeDeviceCollaboration_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var collaboration = factory.KVStoreType.DEVICE_COLLABORATION;
        console.info('collaboration = ' + collaboration);
        expect(collaboration == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1000
     * @tc.name testKvstoretypeSingleVersion_001
     * @tc.desc Test Js Enum Value Kvstoretype.SINGLE_VERSION
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKvstoretypeSingleVersion_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var single = factory.KVStoreType.SINGLE_VERSION;
        console.info('single = ' + single);
        expect(single == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_0900
     * @tc.name testKvstoretypeMultiVersion_001
     * @tc.desc Test Js Enum Value Kvstoretype.MULTI_VERSION
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testKvstoretypeMultiVersion_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var multi = factory.KVStoreType.MULTI_VERSION;
        console.info('multi = ' + multi);
        expect(multi == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1100
     * @tc.name testSecuritylevelNoLevel_001
     * @tc.desc Test Js Enum Value Securitylevel.NO_LEVEL
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSecuritylevelNoLevel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var nolevel = factory.SecurityLevel.NO_LEVEL;
        console.info('nolevel = ' + nolevel);
        expect(nolevel == 0).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1200
     * @tc.name testSecuritylevelS0_001
     * @tc.desc Test Js Enum Value Securitylevel.S0
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSecuritylevelS0_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var s0 = factory.SecurityLevel.S0;
        console.info('s0 = ' + s0);
        expect(s0 == 1).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1300
     * @tc.name testSecuritylevelS1_001
     * @tc.desc Test Js Enum Value Securitylevel.S1
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSecuritylevelS1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var s1 = factory.SecurityLevel.S1;
        console.info('s1 = ' + s1);
        expect(s1 == 2).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1400
     * @tc.name testSecuritylevelS2_001
     * @tc.desc Test Js Enum Value Securitylevel.S2
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSecuritylevelS2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var s2 = factory.SecurityLevel.S2;
        console.info('s2 = ' + s2);
        expect(s2 == 3).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1500
     * @tc.name testSecuritylevelS3_001
     * @tc.desc Test Js Enum Value Securitylevel.S3
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSecuritylevelS3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var s3 = factory.SecurityLevel.S3;
        console.info('s3 = ' + s3);
        expect(s3 == 5).assertTrue()
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreEnumJsApiTest_1600
     * @tc.name testSecuritylevelS4_001
     * @tc.desc Test Js Enum Value Securitylevel.S4
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testSecuritylevelS4_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
        var s4 = factory.SecurityLevel.S4;
        console.info('s4 = ' + s4);
        expect(s4 == 6).assertTrue()
    })
})
}