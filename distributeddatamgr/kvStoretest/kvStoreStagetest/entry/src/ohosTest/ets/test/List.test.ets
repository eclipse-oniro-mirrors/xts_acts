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

import deviceKvStoreCallbackStageTest from './DeviceKvStoreCallbackStage.test';
import deviceKvStorePromiseStageTest from './DeviceKvStorePromiseStage.test';
import kvManagerPromiseStageTest from './KvManagerPromiseStage.test';
import singleKvStorePromiseStageTest from './SingleKvStorePromiseStage.test';
import singleKvStoreCallbackStageTest from './SingleKvStoreCallbackStage.test';
import kvStoreResultSetStageTest from './KvStoreResultSetStage.test';
import queryStageTest from './QueryStage.test';
import fieldNodeStageTest from './FieldNodeStage.test';
import schemaStageTest from './SchemaStage.test';
import singleKvStoreEnumStageTest from './SingleKvStoreEnumStage.test';
import kvManagerCallbackStageTest from './KvManagerCallbackStage.test'

export default function testsuite() {
  deviceKvStoreCallbackStageTest();
  deviceKvStorePromiseStageTest();
  kvManagerPromiseStageTest();
  singleKvStorePromiseStageTest();
  singleKvStoreCallbackStageTest();
  kvStoreResultSetStageTest();
  queryStageTest();
  fieldNodeStageTest();
  schemaStageTest();
  singleKvStoreEnumStageTest();
  kvManagerCallbackStageTest();
}