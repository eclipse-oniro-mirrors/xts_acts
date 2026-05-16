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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import relationalStore from '@ohos.data.relationalStore';
import sendableRelationalStore from '@ohos.data.sendableRelationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';

let context: common.UIAbilityContext;

const TAG = "[RELATIONAL_STORE_JS_READ_ONLY_TEST]";
let rdbStore =undefined;

let STORE_CONFIG1: relationalStore.StoreConfig = {
  name: "test.db",
  securityLevel: relationalStore.SecurityLevel.S1,
  isReadOnly: true,
}

const valueBucket: relationalStore.ValuesBucket = {
  'name': 'zhangsan',
  'age': 18,
  'salary': 25000,
  'blobType': new Uint8Array([1, 2, 3]),
};

const valueBucket1: relationalStore.ValuesBucket = {
  'name': 'lisi',
  'age': 19,
  'salary': 30000,
  'blobType': new Uint8Array([1, 2, 3]),
};

export default function abilityTest() {
  describe('relationStoreReadonlyErrCodeTest', () => {
    beforeAll(async () => {
      console.log(TAG + 'beforeAll');
      try {
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext

        let rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG1);

        expect(rdbStore === null).assertFalse();

        const CREATE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "name TEXT, age INTEGER, salary REAL, blobType BLOB)";
        await rdbStore.executeSql(CREATE_TABLE_SQL);
        console.info(TAG + 'beforeAll End ');
      } catch (err) {
        console.error(TAG, `init database failed, errCode:${err.code}, message:${err.message}`);
      }
    })

    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
    })

    afterEach(async () => {
      console.info(TAG + 'afterEach')
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, STORE_CONFIG1);
    })

    console.info(TAG + "*************JS Test Begin*************");

    /**
     * @tc.name   ReadonlyErrCode001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0100
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info(TAG + "************* ReadonlyErrCode001 start *************");
      const sendableValuesBucket = sendableRelationalStore.toSendableValuesBucket(valueBucket);
      try {
        if(rdbStore != undefined) {

          (rdbStore as relationalStore.RdbStore).insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,
          (err, rowId: number) => {
              if (err) {
                console.error(TAG + `ReadonlyErrCode001 Insert1 is failed, code is ${err.code},message is ${err.message}`);
                expect(err.code  == 14800027).assertTrue();
              }else{
                console.info(`ReadonlyErrCode001 Insert1 is successful, rowId = ${rowId}`);
                expect().assertFail();
              }
            });

          await (rdbStore as relationalStore.RdbStore).insert("test", valueBucket).then((rowId: number) => {
            console.info(`ReadonlyErrCode001 Insert2 is successful, rowId = ${rowId}`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode001 Insert2 is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).insert("test", valueBucket, (err, rowId: number) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode001 Insert3 is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(`ReadonlyErrCode001 Insert3 is successful, rowId = ${rowId}`);
              expect().assertFail();
            }
          });

          try {
            await (rdbStore as relationalStore.RdbStore).insert("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(`ReadonlyErrCode001 insert is successful`);
            expect().assertFail();
          } catch (error) {
            console.error(TAG + `ReadonlyErrCode001 insert is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code  == 14800027).assertTrue();
          }

          try {
            (rdbStore as relationalStore.RdbStore).insertSync("test", valueBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + `ReadonlyErrCode001 insertSync1 is successful`);
            expect().assertFail();
          } catch (error) {
            console.error(TAG + `ReadonlyErrCode001 insertSync1 is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code  == 14800027).assertTrue();
          }

          try {
            let rowId : number = (rdbStore as relationalStore.RdbStore).insertSync("test", sendableValuesBucket, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + `ReadonlyErrCode001 insertSync2 is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (error) {
            console.error(TAG + `ReadonlyErrCode001 insertSync2 is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code  == 14800027).assertTrue();
          }

          let valueBuckets = new Array(valueBucket, valueBucket1);
          (rdbStore as relationalStore.RdbStore).batchInsert("test", valueBuckets, (err, insertNum) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode001 batchInsert1 is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode001 batchInsert1 is successful, the number of values that were inserted = ${insertNum}`);
              expect().assertFail();
            }
          });

          await (rdbStore as relationalStore.RdbStore).batchInsert("test", valueBuckets).then((insertNum: number) => {
            console.info(TAG + `ReadonlyErrCode001 batchInsert2 is successful, the number of values that were inserted = ${insertNum}`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode001 batchInsert2 is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          try {
            let rowId : number = (rdbStore as relationalStore.RdbStore).batchInsertSync("test", valueBuckets);
            console.info(TAG + `ReadonlyErrCode001 batchInsertSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (error) {
            console.error(TAG + `ReadonlyErrCode001 batchInsertSync is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code  == 14800027).assertTrue();
          }

        }
        done();
      } catch (error) {
        console.error(TAG+ `ReadonlyErrCode001 open read-only database failed, errCode:${error.code}, message:${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* ReadonlyErrCode001 end *************");
    })

    /**
     * @tc.name   ReadonlyErrCode002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0200
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info(TAG + "************* ReadonlyErrCode002 start *************");

      try {
        if(rdbStore != undefined) {
          let predicates = new relationalStore.RdbPredicates("test");
          predicates.equalTo("NAME", "Lisa");

          (rdbStore as relationalStore.RdbStore).update(valueBucket1, predicates,(err, rowId: number) => {
              if (err) {
                console.error(TAG + `ReadonlyErrCode002 update callback is failed, code is ${err.code},message is ${err.message}`);
                expect(err.code  == 14800027).assertTrue();
              }else{
                console.info(TAG + `ReadonlyErrCode002 update callback is successful, rowId = ${rowId}`);
                expect().assertFail();
              }
            });

          await (rdbStore as relationalStore.RdbStore).update(valueBucket1, predicates).then((rowId: number) => {
            console.info(TAG + `ReadonlyErrCode002 update promise is successful, rowId = ${rowId}`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode002 update promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,(err, rowId: number) => {
              if (err) {
                console.error(TAG + `ReadonlyErrCode002 update2 callback is failed, code is ${err.code},message is ${err.message}`);
                expect(err.code  == 14800027).assertTrue();
              }else{
                console.info(TAG + `ReadonlyErrCode002 update2 callback is successful, rowId = ${rowId}`);
                expect().assertFail();
              }
          });

          try {
            await (rdbStore as relationalStore.RdbStore).update(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + `ReadonlyErrCode002 updateSync is successful`);
            expect().assertFail();
          } catch (error) {
            console.error(TAG + `ReadonlyErrCode002 updateSync is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code  == 14800027).assertTrue();
          }

          try {
            let rowId : number = (rdbStore as relationalStore.RdbStore).updateSync(valueBucket1, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + `ReadonlyErrCode002 updateSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (error) {
            console.error(TAG + `ReadonlyErrCode002 updateSync is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code  == 14800027).assertTrue();
          }

          (rdbStore as relationalStore.RdbStore).delete( predicates,(err, rowId: number) => {
              if (err) {
                console.error(TAG + `ReadonlyErrCode002 delete callback is failed, code is ${err.code},message is ${err.message}`);
                expect(err.code  == 14800027).assertTrue();
              }else{
                console.info(TAG + `ReadonlyErrCode002 delete callback is successful, rowId = ${rowId}`);
                expect().assertFail();
              }
          });

          await (rdbStore as relationalStore.RdbStore).delete( predicates).then((rowId: number) => {
            console.info(TAG + `ReadonlyErrCode002 delete delete is successful, rowId = ${rowId}`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode002 delete delete is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          try {
            let rowId : number = (rdbStore as relationalStore.RdbStore).deleteSync( predicates);
            console.info(TAG + `ReadonlyErrCode002 deleteSync is successful, rowId = ${rowId}`);
            expect().assertFail();
          } catch (error) {
            console.error(TAG + `ReadonlyErrCode002 deleteSync is failed, code is ${error.code},message is ${error.message}`);
            expect(error.code  == 14800027).assertTrue();
          }
        }
        done();
      } catch (error) {
        console.error(TAG+`ReadonlyErrCode002 open read-only database failed, errCode:${error.code}, message:${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* ReadonlyErrCode002 end *************");
    })

    /**
     * @tc.name   ReadonlyErrCode003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0300
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info(TAG + "************* ReadonlyErrCode003 start *************");

      try {
        if(rdbStore != undefined) {
          let predicates = new relationalStore.RdbPredicates("test");

          let resultSet: relationalStore.ResultSet = (rdbStore as relationalStore.RdbStore).querySync(predicates);

          try{
          const id = (resultSet as relationalStore.ResultSet).getLong((resultSet as relationalStore.ResultSet).getColumnIndex("ID"));
          console.info(TAG + `ReadonlyErrCode003 getColumnIndex is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getColumnIndex is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          const name = (resultSet as relationalStore.ResultSet).getColumnName(1);
          console.info(TAG + `ReadonlyErrCode003 getColumnName is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getColumnName is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).goTo(1);
          console.info(TAG + `ReadonlyErrCode003 goTo is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 goTo is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).goToRow(5);
          console.info(TAG + `ReadonlyErrCode003 goToRow is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 goToRow is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).goToFirstRow();
          console.info(TAG + `ReadonlyErrCode003 goToFirstRow is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 goToFirstRow is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).goToLastRow();
          console.info(TAG + `ReadonlyErrCode003 goToLastRow is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 goToLastRow is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getColumnIndex("name");
          console.info(TAG + `ReadonlyErrCode003 getColumnIndex is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getColumnIndex is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).goToNextRow();
          console.info(TAG + `ReadonlyErrCode003 goToNextRow is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 goToNextRow is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).goToPreviousRow();
          console.info(TAG + `ReadonlyErrCode003 goToPreviousRow is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 goToPreviousRow is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getBlob(4);
          console.info(TAG + `ReadonlyErrCode003 getBlob is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getBlob is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getString(1);
          console.info(TAG + `ReadonlyErrCode003 getString is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getString is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getDouble(1);
          console.info(TAG + `ReadonlyErrCode003 getDouble is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getDouble is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getAsset(3);
          console.info(TAG + `ReadonlyErrCode003 getAsset is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getAsset is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getAssets(3);
          console.info(TAG + `ReadonlyErrCode003 getAssets is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getAssets is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getValue(1);
          console.info(TAG + `ReadonlyErrCode003 getValue is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getValue is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).getRow();
          console.info(TAG + `ReadonlyErrCode003 getRow is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 getRow is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

        try{
          (resultSet as relationalStore.ResultSet).isColumnNull(1);
          console.info(TAG + `ReadonlyErrCode003 isColumnNull is successful`);
          expect().assertFail();
        }catch(err){
          console.error(TAG + `ReadonlyErrCode003 isColumnNull is failed, code is ${err.code},message is ${err.message}`);
          expect(err.code  == 14800027).assertTrue();
        }

          try{
            (resultSet as relationalStore.ResultSet).getSendableRow();
            console.info(TAG + `ReadonlyErrCode003 isColumnNull is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode003 isColumnNull is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }
        }
        done();
      } catch (error) {
        console.error(TAG+`ReadonlyErrCode003 open read-only database failed, errCode:${error.code}, message:${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* ReadonlyErrCode003 end *************");
    })

    /**
     * @tc.name   ReadonlyErrCode004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0400
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info(TAG + "************* ReadonlyErrCode002 start *************");

      try {
        if(rdbStore != undefined) {
          let PRIKey = [0];

          (rdbStore as relationalStore.RdbStore).getModifyTime("test","name" ,PRIKey,(err, modifyTime: relationalStore.ModifyTime) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode004 getModifyTime callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode004 getModifyTime callback is successful`);
              expect().assertFail();
            }
          });

          await (rdbStore as relationalStore.RdbStore).getModifyTime("test","name" ,PRIKey).then((modifyTime: relationalStore.ModifyTime) => {
            console.info(TAG + `ReadonlyErrCode004 getModifyTime promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode004 getModifyTime promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).cleanDirtyData("test", 1,(err) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode004 cleanDirtyData callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode004 cleanDirtyData callback is successful`);
              expect().assertFail();
            }
          });

          (rdbStore as relationalStore.RdbStore).cleanDirtyData("test",1).then(() => {
            console.info(TAG + `ReadonlyErrCode004 cleanDirtyData promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode004 cleanDirtyData promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).cleanDirtyData("test",(err) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode004 cleanDirtyData2 callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode004 cleanDirtyData2 callback is successful`);
              expect().assertFail();
            }
          });

          const SQL_DELETE_TABLE = "DELETE FROM test";
          (rdbStore as relationalStore.RdbStore).executeSql(SQL_DELETE_TABLE,(err) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode004 executeSql callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode004 executeSql callback is successful`);
              expect().assertFail();
            }
          });

          (rdbStore as relationalStore.RdbStore).executeSql(SQL_DELETE_TABLE,[],(err) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode004 executeSql2 callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode004 executeSql2 callback is successful`);
              expect().assertFail();
            }
          });

          try{
            (rdbStore as relationalStore.RdbStore).executeSql(SQL_DELETE_TABLE,[])
            console.info(TAG + `ReadonlyErrCode004 executeSql is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode004 executeSql is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }


          try{
            let txId : number = await (rdbStore as relationalStore.RdbStore).beginTrans();
            await (rdbStore as relationalStore.RdbStore).execute("DELETE FROM TEST", txId)
            console.info(TAG + `ReadonlyErrCode005 execute is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode005 execute is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }

          await (rdbStore as relationalStore.RdbStore).execute(SQL_DELETE_TABLE).then(() => {
            console.info(TAG + `ReadonlyErrCode004 execute2 promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode004 execute2 promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          try{
            (rdbStore as relationalStore.RdbStore).executeSync(SQL_DELETE_TABLE);
            console.info(TAG + `ReadonlyErrCode004 executeSync is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode004 executeSync is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }

        }
        done();
      } catch (error) {
        console.error(TAG+ `ReadonlyErrCode004 open read-only database failed, errCode:${error.code}, message:${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* ReadonlyErrCode002 end *************");
    })

    /**
     * @tc.name   ReadonlyErrCode005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0500
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info(TAG + "************* ReadonlyErrCode002 start *************");

      try {
        if(rdbStore != undefined) {
          try{
            (rdbStore as relationalStore.RdbStore).beginTransaction();
            console.info(TAG + `ReadonlyErrCode005 beginTransaction is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode005 beginTransaction is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }

          await (rdbStore as relationalStore.RdbStore).beginTrans().then((txId : number) => {
            console.info(TAG + `ReadonlyErrCode005 beginTrans promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode005 beginTrans promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          try{
            (rdbStore as relationalStore.RdbStore).commit();
            console.info(TAG + `ReadonlyErrCode005 commit is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode005 commit is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }

          try{
            let txId : number = await (rdbStore as relationalStore.RdbStore).beginTrans();
            (rdbStore as relationalStore.RdbStore).commit(txId);
            console.info(TAG + `ReadonlyErrCode005 commit2 is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode005 commit2 is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }


          try{
            (rdbStore as relationalStore.RdbStore).rollBack();
            console.info(TAG + `ReadonlyErrCode005 rollback is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode005 rollback is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }

          try{
            let txId : number = await (rdbStore as relationalStore.RdbStore).beginTrans();
            (rdbStore as relationalStore.RdbStore).rollback(txId);
            console.info(TAG + `ReadonlyErrCode005 rollback2 is successful`);
            expect().assertFail();
          }catch(err){
            console.error(TAG + `ReadonlyErrCode005 rollback2 is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          }

          (rdbStore as relationalStore.RdbStore).backup("dbBackup.db",(err) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode005 backup callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode005 backup callback is successful`);
              expect().assertFail();
            }
          });

          await (rdbStore as relationalStore.RdbStore).backup("dbBackup.db").then(() => {
            console.info(TAG + `ReadonlyErrCode005 backup promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode005 backup promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).restore("dbBackup.db",(err) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode005 restore callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode005 restore callback is successful`);
              expect().assertFail();
            }
          });

          await (rdbStore as relationalStore.RdbStore).restore("dbBackup.db").then(() => {
            console.info(TAG + `ReadonlyErrCode005 restore promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode005 restore promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });


        }
        done();
      } catch (error) {
        console.error(TAG+`ReadonlyErrCode005 open read-only database failed, errCode:${error.code}, message:${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* ReadonlyErrCode005 end *************");
    })

    /**
     * @tc.name   ReadonlyErrCode006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0600
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info(TAG + "************* ReadonlyErrCode002 start *************");

      try {
        if(rdbStore != undefined) {
          let predicates = new relationalStore.RdbPredicates("test");

          await (rdbStore as relationalStore.RdbStore).attach("/path/rdbstore1.db", "attachDB").then(() => {
            console.info(TAG + `ReadonlyErrCode006 attach1 promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode006 attach1 promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          await (rdbStore as relationalStore.RdbStore).attach(context, STORE_CONFIG1,"attachDB").then(() => {
            console.info(TAG + `ReadonlyErrCode006 attach2 promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode006 attach2 promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          await (rdbStore as relationalStore.RdbStore).detach("attachDB").then(() => {
            console.info(TAG + `ReadonlyErrCode006 detach promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode006 detach promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          await (rdbStore as relationalStore.RdbStore).lockRow(predicates).then(() => {
            console.info(TAG + `ReadonlyErrCode006 lockRow promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode006 lockRow promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          await (rdbStore as relationalStore.RdbStore).unlockRow(predicates).then(() => {
            console.info(TAG + `ReadonlyErrCode006 unlockRow promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode006 unlockRow promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          await (rdbStore as relationalStore.RdbStore).queryLockedRow(predicates).then(() => {
            console.info(TAG + `ReadonlyErrCode006 queryLockedRow promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode006 queryLockedRow promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          relationalStore.getRdbStore(context, STORE_CONFIG1,(err) => {
            if (err) {
              console.error(TAG + `ReadonlyErrCode006 getRdbStore callback is failed, code is ${err.code},message is ${err.message}`);
              expect(err.code  == 14800027).assertTrue();
            }else{
              console.info(TAG + `ReadonlyErrCode006 getRdbStore callback is successful`);
            }
          });

          await relationalStore.getRdbStore(context, STORE_CONFIG1).then(() => {
            console.info(TAG + `ReadonlyErrCode006 unlockRow promise is successful`);
            expect().assertFail();
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode006 unlockRow promise is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

        }
        done();
      } catch (error) {
        console.error(TAG+`ReadonlyErrCode006 open read-only database failed, errCode:${error.code}, message:${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* ReadonlyErrCode006 end *************");
    })

    /**
     * @tc.name   ReadonlyErrCode007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ReadOnlyAPITest_0700
     * @tc.desc   1. set isReadOnly as true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ReadonlyErrCode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      console.info(TAG + "************* ReadonlyErrCode002 start *************");
      const SQL_DELETE_TABLE = 'DELETE FROM test';

      try {
        if(rdbStore != undefined) {
          let predicates = new relationalStore.RdbPredicates("test");

          (rdbStore as relationalStore.RdbStore).createTransaction().then(async (transaction: relationalStore.Transaction) => {
            await transaction.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then((rowId: number) => {
              console.info(TAG + `transaction Insert is successful, rowId = ${rowId}`);
              expect().assertFail();
            }).catch((e:BusinessError) => {
              console.error(TAG + `transaction Insert is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            });
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction Insert is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try{
              let rowId: number = (transaction as relationalStore.Transaction).insertSync("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
              console.info(TAG + `transaction insertSync is successful, rowId = ${rowId}`);
              expect().assertFail();
            }catch(err){
              console.error(TAG + `transaction insertSync is failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            }
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction insertSync is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          let valueBuckets = new Array(valueBucket, valueBucket1);

          (rdbStore as relationalStore.RdbStore).createTransaction().then(async (transaction: relationalStore.Transaction) => {
            await transaction.batchInsert("test", valueBuckets).then((insertNum: number) => {
              console.info(TAG + `transaction batchInsert is successful`);
              expect().assertFail();
            }).catch((e:BusinessError) => {
              console.error(TAG + `transaction batchInsert is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            });
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction batchInsert is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try{
              let rowId: number = (transaction as relationalStore.Transaction).batchInsertSync("test",valueBuckets );
              console.info(TAG + `transaction batchInsertSync is successful, rowId = ${rowId}`);
              expect().assertFail();
            }catch(err){
              console.error(TAG + `transaction batchInsertSync is failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            }
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction batchInsertSync is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then(async (transaction: relationalStore.Transaction) => {
            await transaction.update( valueBucket1,predicates).then((rows: Number) => {
              console.info(TAG + `transaction update is successful`);
              expect().assertFail();
            }).catch((e:BusinessError) => {
              console.error(TAG + `transaction update is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            });
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction update is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try{
              let rows: number = (transaction as relationalStore.Transaction).updateSync(valueBucket1,predicates );
              console.info(TAG + `transaction updateSync is successful`);
              expect().assertFail();
            }catch(err){
              console.error(TAG + `transaction updateSync is failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            }
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction updateSync is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then(async (transaction: relationalStore.Transaction) => {
            await transaction.delete( predicates).then((rows: Number) => {
              console.info(TAG + `transaction delete is successful`);
              expect().assertFail();
            }).catch((e:BusinessError) => {
              console.error(TAG + `transaction delete is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            });
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction delete is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try{
              let rows: number = (transaction as relationalStore.Transaction).deleteSync(predicates );
              console.info(TAG + `transaction deleteSync is successful`);
              expect().assertFail();
            }catch(e){
              console.error(TAG + `transaction deleteSync is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            }
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction deleteSync is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then(async (transaction: relationalStore.Transaction) => {
            await transaction.execute( SQL_DELETE_TABLE).then((data) => {
              console.info(TAG + `transaction execute is successful`);
              expect().assertFail();
            }).catch((e:BusinessError) => {
              console.error(TAG + `transaction execute is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            });
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction execute is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try{
              let data = (transaction as relationalStore.Transaction).executeSync(SQL_DELETE_TABLE );
              console.info(TAG + `transaction executeSync is successful`);
              expect().assertFail();
            }catch(err){
              console.error(TAG + `transaction executeSync is failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            }
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction executeSync is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then(async (transaction: relationalStore.Transaction) => {
            await transaction.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rowId: number) => {
              await transaction.commit();
              console.info(TAG + `transaction commit is successful, rowId = ${rowId}`);
              expect().assertFail();
            }).catch((e:BusinessError) => {
              console.error(TAG + `transaction commit is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            });
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction commit is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

          (rdbStore as relationalStore.RdbStore).createTransaction().then(async (transaction: relationalStore.Transaction) => {
            await transaction.insert("test", valueBucket1, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rowId: number) => {
              await transaction.rollback();
              console.info(TAG + `transaction rollback is successful, rowId = ${rowId}`);
              expect().assertFail();
            }).catch((e:BusinessError) => {
              console.error(TAG + `transaction rollback is failed, code is ${e.code},message is ${e.message}`);
              expect().assertFail();
            });
          }).catch((err:BusinessError) => {
            console.error(TAG + `ReadonlyErrCode007 transaction rollback is failed, code is ${err.code},message is ${err.message}`);
            expect(err.code  == 14800027).assertTrue();
          });

        }
        done();
      } catch (error) {
        console.error(TAG+ `ReadonlyErrCode007 open read-only database failed, errCode:${error.code}, message:${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(TAG + "************* ReadonlyErrCode007 end *************");
    })
    console.info(TAG + "*************Unit Test End*************");
  })
}
