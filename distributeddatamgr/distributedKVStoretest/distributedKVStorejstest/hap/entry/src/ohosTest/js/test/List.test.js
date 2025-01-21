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
import SingleKvStorePromiseTest from './SingleKvStoreKVPromiseJsTest.js'
import deviceKvStoreCallbackTest from './DeviceKvStoreKVCallbackJsTest.js'
import deviceKvStorePromiseTest from './DeviceKvStoreKVPromiseJsTest.js'
import kvManagerCallbackTest from './KvManagerKVCallbackJsTest.js'
import KVManagerPromiseTest from './KvManagerKVPromiseJsTest.js'
import KvStoreResultSetTest from './KvStoreResultSetKVJsTest.js'
import queryTest from './QueryKVJsTest.js'
import SingleKvStoreCallbackTest from './SingleKvStoreKVCallbackJsTest.js'
import FieldNodeTest from './FieldNodeJsTest.js'
import schemaTest from './SchemaJsTest.js'
import singleKvStoreEnumTest from './SingleKvStoreEnumJsTest.js'
import kvStoreBackupPromiseJsunittest from './KvStoreBackupPromiseJsTest.js'
import kvStoreBackupCallbackJsunittest from './KvStoreBackupCallbackJsTest.js'
export default function testsuite() {
    SingleKvStorePromiseTest()
    deviceKvStoreCallbackTest()
    deviceKvStorePromiseTest()
    kvManagerCallbackTest()
    KVManagerPromiseTest()
    KvStoreResultSetTest()
    queryTest()
    SingleKvStoreCallbackTest()
    FieldNodeTest()
    schemaTest()
    singleKvStoreEnumTest()
    kvStoreBackupPromiseJsunittest()
    kvStoreBackupCallbackJsunittest()
}
