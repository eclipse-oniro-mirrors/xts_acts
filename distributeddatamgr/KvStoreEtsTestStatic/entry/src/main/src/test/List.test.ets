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

import KvStoreEtsTestStatic from "./KvStoreEtsTestStatic.test";
import DeviceKvStoreCallbackErrcodeStatic from "./DeviceKvStoreCallbackErrcode.test";
import DeviceKvStoreCallbackEtsTestStatic from "./DeviceKvStoreCallbackEtsTest.test";
import DeviceKvStoreKVPromiseEtsTestStatic from "./DeviceKvStoreKVPromiseEtsTest.test";
import DeviceKvStorePromiseErrcodeStatic from "./DeviceKvStorePromiseErrcode.test";
import DeviceKvStoreReturnValueStatic from "./DeviceKvStoreReturnValue.test";
import KvStoreBackupCallbackEtsTestStatic from "./KvStoreBackupCallbackEtsTest.test";
import KvStoreBackupPromiseEtsTestStatic from "./KvStoreBackupPromiseEtsTest.test";
import KvStoreResultSetKVEtsTestStatic from "./KvStoreResultSetKVEtsTest.test";
import KVStoreResultSetReturnValueStatic from "./KVStoreResultSetReturnValue.test";
import QueryKvEtsTestStatic from "./QueryKvEtsTest.test";
import SchemaEtsStatic from "./SchemaEts.test";
import SchemaFieldNodeStatic from "./SchemaFieldNode.test";
import SingleKvStoreDataChangeStatic from "./SingleKvStoreDataChange.test";
import SingleKvStoreEnumEtsTestStatic from "./SingleKvStoreEnumEtsTest.test";
import SingleKvStoreErrCodeEtsTestStatic from "./SingleKvStoreErrCodeEtsTest.test";
import SingleKvStoreKVCallbackEtsTestStatic from "./SingleKvStoreKVCallbackEtsTest.test";
import SingleKvStoreKVPromiseEtsTestStatic from "./SingleKvStoreKVPromiseEtsTest.test";
import SingleKvStoreReturnValueStatic from "./SingleKvStoreReturnValue.test";
import KVManagerPromiseTest from "./KVManagerPromiseTest.test.ets";

export default function testsuite() {
  DeviceKvStoreReturnValueStatic();
  SingleKvStoreDataChangeStatic();
  DeviceKvStoreCallbackErrcodeStatic();
  DeviceKvStoreCallbackEtsTestStatic();
  DeviceKvStoreKVPromiseEtsTestStatic();
  DeviceKvStorePromiseErrcodeStatic();
  KvStoreBackupCallbackEtsTestStatic();
  KvStoreBackupPromiseEtsTestStatic();
  KvStoreResultSetKVEtsTestStatic();
  KVStoreResultSetReturnValueStatic();
  QueryKvEtsTestStatic();
  SchemaEtsStatic();
  SchemaFieldNodeStatic();
  SingleKvStoreEnumEtsTestStatic();
  SingleKvStoreKVCallbackEtsTestStatic();
  SingleKvStoreKVPromiseEtsTestStatic();
  SingleKvStoreReturnValueStatic();
  SingleKvStoreErrCodeEtsTestStatic();
  KvStoreEtsTestStatic();
  KVManagerPromiseTest();
}