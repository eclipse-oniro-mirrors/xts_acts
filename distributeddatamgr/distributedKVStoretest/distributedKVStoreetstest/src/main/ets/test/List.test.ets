/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import deviceKvStoreCallbackTest from './DeviceKvStoreCallbackEtsTest';
import deviceKvStorePromiseTest from './DeviceKvStoreKVPromiseEtsTest';
import KvStoreResultSetTest from './KvStoreResultSetKVEtsTest';
import kvStoreBackupPromiseJsunittest from './KvStoreBackupPromiseEtsTest';
import kvStoreBackupCallbackJsunittest from './KvStoreBackupCallbackEtsTest';
import SingleKvStoreCallbackTest from './SingleKvStoreKVCallbackEtsTest';
import SingleKvStorePromiseTest from './SingleKvStoreKVPromiseEtsTest';
import singleKvStoreEnumTest from './SingleKvStoreEnumEtsTest';
import queryTest from './QueryKvEtsTest';
import schemaTest from './SchemaEts.test';

export default function testsuite() {
  deviceKvStoreCallbackTest();
  deviceKvStorePromiseTest();
  KvStoreResultSetTest();
  kvStoreBackupPromiseJsunittest();
  kvStoreBackupCallbackJsunittest();
  SingleKvStoreCallbackTest();
  SingleKvStorePromiseTest();
  singleKvStoreEnumTest();
  queryTest();
  schemaTest();
}