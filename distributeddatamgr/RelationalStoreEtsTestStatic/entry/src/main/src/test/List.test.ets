/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import AsyncCallback from "./AsyncCallback.test";
import CallbackTest from "./CallbackTest.test";
import RdbErrorCode801 from "./RdbErrorCode801.test";
import RdbErrorCode14800010 from "./RdbErrorCode14800010.test";
import RdbErrorCode14800011 from "./RdbErrorCode14800011.test";
import RdbErrorCode14800012 from "./RdbErrorCode14800012.test";
import RdbErrorCode14800013 from "./RdbErrorCode14800013.test";
import RdbErrorCode14800014 from "./RdbErrorCode14800014.test";
import RdbErrorCode14800015 from "./RdbErrorCode14800015.test";
import RdbErrorCode14800016 from "./RdbErrorCode14800016.test";
import RDBErrorCode14800018 from "./RDBErrorCode14800018.test";
import RDBErrorCode14800021 from "./RDBErrorCode14800021.test";
import RdbErrorCode14800024 from "./RdbErrorCode14800024.test";
import RdbErrorCode14800032 from "./RdbErrorCode14800032.test";
import RdbErrorCode14800033 from "./RdbErrorCode14800033.test";
import RdbErrorCode14800050 from "./RdbErrorCode14800050.test";
import RdbErrorCode14800051 from "./RdbErrorCode14800051.test";
import RdbErrorCode14801001 from "./RdbErrorCode14801001.test";
import RdbErrorCode14801002 from "./RdbErrorCode14801002.test";
import RdbStoreAttachEtsunit from "./RdbStoreAttachEtsunit.test";
import RelationalStoreInterfaceTest from  "./RelationalStore.test";
import RelationalStoreBackupRestoreWithFAContextJsunit from "./RelationalStoreBackupRestoreWithFAContextJsunit.test";
import RelationalStoreCloudCursor from "./RelationalStoreCloudCursor.test";
import RelationalStoreCloudSync from "./RelationalStoreCloudSync.test";
import RelationalStoreCloudSyncEts from "./RelationalStoreCloudSyncEts.test";
import RelationalStoreDistributedJsunit from "./RelationalStoreDistributedJsunit.test";
import RelationalStorePredicatesJsunit from "./RelationalStorePredicatesJsunit.test";
import RdbResultSetTest from "./RelationalStoreResultEts.test";
import RelationalStoreResultSetSync from "./RelationalStoreResultSetSync.test";
import RelationalStoreSyncApiTest from "./RelationalStoreSyncApiTest.test";
import RelationStoreRdbStoreTest from "./RelationStoreApi.test";
import RelationalStoreEnumTest from "./RelationStoreEnumApi.test";
import RelationStoreError00Test from "./RelationStoreError00Api.test";
import RelationStoreError17Test from "./RelationStoreError17Api.test";
import RelationStoreError21Test from "./RelationStoreError21Api.test";
import RelationStoreError24Test from "./RelationStoreError24Api.test";
import RelationStoreError30Test from "./RelationStoreError30Api.test";
import RelationStoreError32Test from "./RelationStoreError32Api.test";
import RelationStoreSqlExecTimeTest from "./RelationStoreSqlExecTimeTest.test";
import VectorStore from "./VectorStore.test";
import RdbStoreSqliteErrorOccurredTest from  "./RdbOnErrorLog.test";
import RdbStoreDataChangeTestEts from  "./RdbStoreDataChangeEts.test";
import PerfStatEtsTest from  "./RdbStorePerfStatEts.test";
import RdbstorePredicatesEts from "./RdbStorePredicatesEts.test";
import RdbstoreRekeyEts from "./RdbStoreRekeyEts.test";
import RelationalStoreRekeyExEtsTest from "./RelationalStoreRekeyExEtsTest.test";
import RdbStoreGetSqlInfoTest from "./RdbStoreGetSqlInfoEts.test";
import RdbStoreSetLocaleTest from "./RdbStoreSetLocaleEts.test"
import CloudDataErrorCode from "./CloudDataErrorCode.test"
import RelationalStoreBatchInsert from "./RelationalStoreBatchInsert.test"
import RdbBatchInsertTransaction from "./RdbBatchInsertTransaction.test"
import RdbLockRow from "./RdbLockRow.test"

import RdbStoreDuplicateColumnsTest from "./RdbStoreDuplicateColumns.test";
import RdbStoreErrorCodeAddTest from "./RdbStoreErrorCodeAdd.test";
import RdbStoreErrorCodeAdd2Test from "./RdbStoreErrorCodeAdd2.test";

export default function testsuite() {
  RelationStoreRdbStoreTest();
  RelationalStoreEnumTest();
  RdbResultSetTest();
  RelationStoreError00Test();

  RelationStoreError21Test();
  RelationStoreError24Test();
  RelationStoreError30Test();
  RelationStoreError32Test();
  RelationStoreError17Test();

  RelationalStoreSyncApiTest();
  RelationalStoreCloudSync();
  RelationalStoreDistributedJsunit();
  RelationalStoreCloudSyncEts();

  RelationalStoreResultSetSync();

  RelationalStoreInterfaceTest();
  RelationalStoreBackupRestoreWithFAContextJsunit();
  RelationalStorePredicatesJsunit();
  VectorStore();
  RelationalStoreCloudCursor();
  RdbStoreAttachEtsunit();
  RelationStoreSqlExecTimeTest();

  RdbErrorCode14800010();
  RdbErrorCode14800013();
  RdbErrorCode14800015();
  RdbErrorCode14800024();
  RdbErrorCode14800050();
  RdbErrorCode14800051();
  RdbErrorCode14801002();
  RdbErrorCode14800016();
  RdbErrorCode14801001();
  RdbErrorCode14800012();
  RdbErrorCode14800014();
  RdbErrorCode14800011();
  RdbErrorCode14800032();
  RdbErrorCode14800033();
  RdbErrorCode801();
  RDBErrorCode14800018();
  RDBErrorCode14800021();

  CallbackTest();
  AsyncCallback();

  RdbStoreSqliteErrorOccurredTest();
  RdbStoreDataChangeTestEts();
  PerfStatEtsTest();

  RdbstorePredicatesEts();
  RdbstoreRekeyEts();
  RelationalStoreRekeyExEtsTest();

  RdbStoreGetSqlInfoTest();
  RdbStoreSetLocaleTest();

  CloudDataErrorCode();

  RelationalStoreBatchInsert();
  RdbBatchInsertTransaction();
  RdbLockRow();

  RdbStoreDuplicateColumnsTest();
  RdbStoreErrorCodeAddTest();
  RdbStoreErrorCodeAdd2Test();
}