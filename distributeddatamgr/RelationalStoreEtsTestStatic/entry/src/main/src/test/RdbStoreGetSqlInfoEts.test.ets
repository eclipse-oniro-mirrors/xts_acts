import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import relationalStore from '@ohos.data.relationalStore';
// import sendableRelationalStore from '@ohos.data.sendableRelationalStore';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let bucket1000: relationalStore.ValuesBucket = {};
for(let i = 0 ; i < 1001; i++) {
    bucket1000["test" + i] = i as long;
}

export default function RdbStoreGetSqlInfoTest() {

    describe("RdbStoreGetSqlInfoTest", (): void => {
//==============================================
        beforeAll(async () => {
            console.info(TAG + 'beforeAll');
        });
        beforeEach(async () => {
            console.info(TAG + 'beforeEach');
        });
        afterEach(async () => {
            console.info(TAG + 'afterEach');
        });
        afterAll(async () => {
            console.info(TAG + 'afterAll');
        });
//==============================================function getDeleteSqlInfo(predicates: RdbPredicates):SqlInfo;==============================================
        /**
         * @tc.number testGetDeleteSqlInfo
         * @tc.name testGetDeleteSqlInfo
         * @tc.desc Verifies that the generated delete SQL statement is correct when the table name is provided.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetDeleteSqlInfo", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetDeleteSqlInfo start *************");
            try {
                console.log(TAG + "************* testGetDeleteSqlInfo start 1*************");
                const predicates = new relationalStore.RdbPredicates("users");
                console.log(TAG + "************* testGetDeleteSqlInfo start 2*************");
                const info: relationalStore.SqlInfo = relationalStore.getDeleteSqlInfo(predicates);
                console.log(TAG + "************* testGetDeleteSqlInfo start 3*************");
                expect(info.sql).assertEqual("DELETE FROM users");
                console.log(TAG + "************* testGetDeleteSqlInfo end4 *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetDeleteSqlInfo end *************");
                done();
            }
        })

        /**
         * @tc.number testGetDeleteSqlInfo2
         * @tc.name testGetDeleteSqlInfo2
         * @tc.desc Verifies that the generated delete SQL statement is correct when the table name is provided.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetDeleteSqlInfo2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetDeleteSqlInfo2 start *************");
            try {
                const predicates = new relationalStore.RdbPredicates("users");
                predicates.equalTo("tableName", "a");
                predicates.notEqualTo("age", 18 as long);
                const info: relationalStore.SqlInfo = relationalStore.getDeleteSqlInfo(predicates);
                expect(info.sql).assertEqual("DELETE FROM users WHERE tableName = ?  AND age <> ? ");
                expect(info.args[0]).assertEqual("a");
                expect(info.args[1]).assertEqual(18);
                console.log(TAG + "************* testGetDeleteSqlInfo2 end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetQuerySqlInfo end *************");
                done();
            }
        });

        /**
         * @tc.number testGetDeleteSqlInfoTableNameTooLong
         * @tc.name testGetDeleteSqlInfoTableNameTooLong
         * @tc.desc Verifies that an error is thrown when the table name is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetDeleteSqlInfoTableNameTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetDeleteSqlInfoTableNameTooLong start *************");
            try {
                let tableName: string = "a".repeat(257);
                const predicates = new relationalStore.RdbPredicates(tableName);
                relationalStore.getDeleteSqlInfo(predicates);
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetDeleteSqlInfoTableNameTooLong end *************");
                done();
            }
        });
//==============================================function getDeleteSqlInfo(table: string, values: ValuesBucket, conflict?: ConflictResolution):SqlInfo;==============================================
        /**
         * @tc.number testGetInsertSqlInfo
         * @tc.name testGetInsertSqlInfo
         * @tc.desc Tests the functionality of generating an INSERT SQL statement and its arguments.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfo", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfo start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "Logitech",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
                    "USER",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(info.sql).assertEqual("INSERT INTO USER(age,desc,name,sex) VALUES (?,?,?,?)");
                expect(info.args[0]).assertEqual("18");
                expect(info.args[1]).assertEqual("asserter");
                expect(info.args[2]).assertEqual("Logitech");
                expect(info.args[3]).assertEqual("man");
                console.log(TAG + "************* testGetInsertSqlInfo end *************");
                done();
            } catch (e){
                expect(null).assertFail();
                console.log(TAG + "************* testGetInsertSqlInfo end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoTabkleNameTooLong
         * @tc.name testGetInsertSqlInfoTabkleNameTooLong
         * @tc.desc Verifies that an error is thrown when the tablename is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoTabkleNameTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoTabkleNameTooLong start *************");
            const bucket: relationalStore.ValuesBucket = {
                "name": "Logitech",
                "age": "18",
                "sex": "man",
                "desc": "asserter"
            };
            let tableName: string = "x".repeat(257);
            try {
                relationalStore.getInsertSqlInfo(
                    tableName,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetInsertSqlInfoTabkleNameTooLong end *************");
                console.log(`************* testGetInsertSqlInfoTabkleNameTooLong end *************${e.code}`);
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoBucketTooLong
         * @tc.name testGetInsertSqlInfoBucketTooLong
         * @tc.desc Verifies that an error is thrown when the bucket is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoBucketTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoBucketTooLong start *************");
            try {
                relationalStore.getInsertSqlInfo(
                    "user",
                    bucket1000,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetInsertSqlInfoBucketTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoBucketColumnTooLong
         * @tc.name testGetInsertSqlInfoBucketColumnTooLong
         * @tc.desc Verifies that an error is thrown when the bucket Column is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoBucketColumnTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoBucketColumnTooLong start *************");
            let tableName: string = "a".repeat(257);
            const bucket: relationalStore.ValuesBucket = {
                "name": tableName,
                "age": "18",
                "sex": "man",
                "desc": "asserter"
            };
            bucket[tableName] = "tableName"
            try {
                relationalStore.getInsertSqlInfo(
                    "user",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetInsertSqlInfoBucketColumnTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoTableNameIsEmpty
         * @tc.name testGetInsertSqlInfoTableNameIsEmpty
         * @tc.desc Verifies that an error is thrown when the table is empty or null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoTableNameIsEmpty", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoTableNameIsEmpty start *************");
            const bucket: relationalStore.ValuesBucket = {
                "name": "tableName",
                "age": "18",
                "sex": "man",
                "desc": "asserter"
            };
            try {
                relationalStore.getInsertSqlInfo(
                    "",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetInsertSqlInfoTableNameIsEmpty end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoConflictResolutionIsNotEmpty
         * @tc.name testGetInsertSqlInfoConflictResolutionIsNotEmpty
         * @tc.desc Verifies that an error is thrown when the ConflictResolution is not empty.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoConflictResolutionIsNotEmpty", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsNotEmpty start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "tableName",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
                    "tableName",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(info.sql).assertEqual("INSERT INTO tableName(age,desc,name,sex) VALUES (?,?,?,?)");
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsNotEmpty end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetInsertSqlInfoConflictResolutionIsNotEmpty end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoBucketIsNull
         * @tc.name testGetInsertSqlInfoBucketIsNull
         * @tc.desc Verifies that an error is thrown when the bucket is empty or null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoBucketIsNull", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoBucketIsNull start *************");
            const bucket: relationalStore.ValuesBucket = {};
            try {
                relationalStore.getInsertSqlInfo(
                    "USER",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetInsertSqlInfoBucketIsNull end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoBucketIsAssets
         * @tc.name testGetInsertSqlInfoBucketIsAssets
         * @tc.desc Verifies that an error is thrown when the bucket contains Assets & ON_CONFLICT_REPLACE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoBucketIsAssets", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoBucketIsAssets start *************");
            const values: relationalStore.Assets = [
                {
                    "name": "a",
                    "uri": "b",
                    "path": "c",
                    "createTime": "d",
                    "modifyTime": "e",
                    'size': "f",
                    "status": relationalStore.AssetStatus.ASSET_INSERT
                }
            ];
            const bucket: relationalStore.ValuesBucket = {
                "value": values
            };
            try {
                relationalStore.getInsertSqlInfo(
                    "ASSETS",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_REPLACE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetInsertSqlInfoBucketIsAssets end *************");
                done();
            }
        });

        /**
         * @tc.number testGetInsertSqlInfoBucketIsAssets2
         * @tc.name testGetInsertSqlInfoBucketIsAssets2
         * @tc.desc Verifies that an error is thrown when the bucket contains Assets & ON_CONFLICT_IGNORE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetInsertSqlInfoBucketIsAssets2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetInsertSqlInfoBucketIsAssets start *************");
            try {
                const values: relationalStore.Assets = [
                    {
                        "name": "a",
                        "uri": "b",
                        "path": "c",
                        "createTime": "d",
                        "modifyTime": "e",
                        "size": "f",
                        "status": relationalStore.AssetStatus.ASSET_INSERT
                    }
                ];
                const bucket: relationalStore.ValuesBucket = {
                    "value": values
                };
                const info: relationalStore.SqlInfo = relationalStore.getInsertSqlInfo(
                    "USER",
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_IGNORE
                );
                const assets = info.args[0] as relationalStore.Assets;
                expect(info.sql).assertEqual("INSERT OR IGNORE INTO USER(value) VALUES (?)");
                expect(assets.length).assertEqual(values.length);
                expect(assets[0].name).assertEqual(values[0].name);
                expect(assets[0].uri).assertEqual(values[0].uri);
                expect(assets[0].path).assertEqual(values[0].path);
                expect(assets[0].createTime).assertEqual(values[0].createTime);
                expect(assets[0].modifyTime).assertEqual(values[0].modifyTime);
                expect(assets[0].size).assertEqual(values[0].size);
                expect(assets[0].status).assertEqual(values[0].status);
                console.log(TAG + "************* testGetInsertSqlInfo end1 *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetInsertSqlInfo end2 *************");
                done();
            }
        });
//==============================================function getQuerySqlInfo(predicates: RdbPredicates, columns?: Array<string>):SqlInfo;==============================================
        /**
         * @tc.number testGetQuerySqlInfo
         * @tc.name testGetQuerySqlInfo
         * @tc.desc Verifies that the generated query SQL statement is correct with default columns.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetQuerySqlInfo", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetQuerySqlInfo start *************");
            try {
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates);
                expect(info.sql).assertEqual("SELECT * FROM users");
                console.log(TAG + "************* testGetQuerySqlInfo end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetQuerySqlInfo end *************");
                done();
            }
        });

        /**
         * @tc.number testGetQuerySqlInfoColumnsIsNullList
         * @tc.name testGetQuerySqlInfoColumnsIsNullList
         * @tc.desc Verifies that the generated query SQL statement is correct when an empty column list is provided.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetQuerySqlInfoColumnsIsNullList", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetQuerySqlInfoColumnsIsNullList start *************");
            try {
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates, []);
                expect(info.sql).assertEqual("SELECT * FROM users");
                console.log(TAG + "************* testGetQuerySqlInfoColumnsIsNullList end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetQuerySqlInfoColumnsIsNullList end *************");
                done();
            }
        });

        /**
         * @tc.number testGetQuerySqlInfoByColumns
         * @tc.name testGetQuerySqlInfoByColumns
         * @tc.desc Verifies that the generated query SQL statement is correct when specific columns are provided.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetQuerySqlInfoByColumns", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetQuerySqlInfoByColumns start *************");
            try {
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getQuerySqlInfo(predicates, ["name", "age"]);
                expect(info.sql).assertEqual("SELECT name, age  FROM users");
                console.log(TAG + "************* testGetQuerySqlInfoByColumns end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetQuerySqlInfoByColumns end *************");
                done();
            }
        });

        /**
         * @tc.number testGetQuerySqlInfoTableNameTooLong
         * @tc.name testGetQuerySqlInfoTableNameTooLong
         * @tc.desc Verifies that an error is thrown when the Table is too Long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetQuerySqlInfoTableNameTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetQuerySqlInfoTableNameTooLong start *************");
            try {
                let tableName: string = "a".repeat(257);
                const predicates = new relationalStore.RdbPredicates(tableName);
                relationalStore.getQuerySqlInfo(predicates);
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetQuerySqlInfoTableNameTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetQuerySqlInfoWhereClauseTooLong
         * @tc.name testGetQuerySqlInfoWhereClauseTooLong
         * @tc.desc Verifies that an error is thrown when the WhereClause is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetQuerySqlInfoWhereClauseTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetQuerySqlInfoWhereClauseTooLong start *************");
            try {
                let tableName: string = "a".repeat(257);
                const predicates = new relationalStore.RdbPredicates("tableName");
                predicates.equalTo(tableName, "a");
                relationalStore.getQuerySqlInfo(predicates);
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetQuerySqlInfoWhereClauseTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetQuerySqlInfoColumnsNotstringarray
         * @tc.name testGetQuerySqlInfoColumnsNotstringarray
         * @tc.desc Verifies that an error is thrown when the Columns is not a string array.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetQuerySqlInfoColumnsNotstringarray", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetQuerySqlInfoColumnsNotstringarray start *************");
            try {
                const predicates = new relationalStore.RdbPredicates("tableName");
                predicates.equalTo("tableName", "a");
                const info: relationalStore.SqlInfo =  relationalStore.getQuerySqlInfo(predicates, ["3", "4"]);
                expect(info.sql).assertEqual("SELECT 3, 4  FROM tableName WHERE tableName = ? ");
                expect(info.args[0]).assertEqual('a');
                console.log(TAG + "************* testGetQuerySqlInfoColumnsNotstringarray end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetQuerySqlInfoColumnsNotstringarray end *************");
                done();
            }
        });

        /**
         * @tc.number testGetQuerySqlInfoColumnsTooLong
         * @tc.name testGetQuerySqlInfoColumnsTooLong
         * @tc.desc Verifies that an error is thrown when the Columns is too length.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetQuerySqlInfoColumnsTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetQuerySqlInfoColumnsTooLong start *************");
            try {
                const colums:string[] = new Array<string>(1003);
                for(let i = 0; i < colums.length; i++) {
                    colums[i] = "a";
                }
                const predicates = new relationalStore.RdbPredicates("tableName");
                predicates.equalTo("tableName", "a");
                relationalStore.getQuerySqlInfo(predicates, colums);
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetQuerySqlInfoColumnsTooLong end *************");
                done();
            }
        });
//==============================================function getUpdateSqlInfo(predicates: RdbPredicates, values: ValuesBucket, conflict?: Configuration):SqlInfo;==============================================
        /**
         * @tc.number testGetUpdateSqlInfo
         * @tc.name testGetUpdateSqlInfo
         * @tc.desc Verifies `getUpdateSqlInfo` function correctly generates an UPDATE SQL statement and its arguments.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfo", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfo start *************");
            try {
                const bucket: relationalStore.ValuesBucket = {
                    "name": "Logitech",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const predicates = new relationalStore.RdbPredicates("users");
                const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(info.sql).assertEqual("UPDATE users SET age=?,desc=?,name=?,sex=?");
                expect(info.args[0]).assertEqual("18");
                expect(info.args[1]).assertEqual("asserter");
                expect(info.args[2]).assertEqual("Logitech");
                expect(info.args[3]).assertEqual("man");
                console.log(TAG + "************* testGetUpdateSqlInfo end *************");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetUpdateSqlInfo end *************");
                done();
            }
        });

        /**
         * @tc.number testGetUpdateSqlInfoBucketIsNull
         * @tc.name testGetUpdateSqlInfoBucketIsNull
         * @tc.desc Verifies that an error is thrown when the bucket is empty.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoBucketIsNull", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoBucketIsNull start *************");
            const predicates = new relationalStore.RdbPredicates("users");
            const bucket: relationalStore.ValuesBucket = {};
            try {
                relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetUpdateSqlInfoBucketIsNull end *************");
                done();
            }
        });

        /**
         * @tc.number testGetUpdateSqlInfoBucketTooLong
         * @tc.name testGetUpdateSqlInfoBucketTooLong
         * @tc.desc Verifies that an error is thrown when the bucket is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoBucketTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoBucketTooLong start *************");
            const predicates = new relationalStore.RdbPredicates("users");
            try {
                relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket1000,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetUpdateSqlInfoBucketTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetUpdateSqlInfoBucketCloumnTooLong
         * @tc.name testGetUpdateSqlInfoBucketCloumnTooLong
         * @tc.desc Verifies that an error is thrown when the column in bucket is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoBucketCloumnTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoBucketCloumnTooLong start *************");
            const predicates = new relationalStore.RdbPredicates("users");
            let tableName: string = "a".repeat(257);
            const bucket: relationalStore.ValuesBucket = {
                "age": "18",
                "sex": "man",
                "desc": "asserter"
            };
            bucket[tableName] = "tableName";
            try {
                relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetUpdateSqlInfoBucketCloumnTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetUpdateSqlInfoTableTooLong
         * @tc.name testGetUpdateSqlInfoTableTooLong
         * @tc.desc Verifies that an error is thrown when the tablename is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoTableTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoTableTooLong start *************");
            let tableName: string = "a".repeat(257);
            for(let i = 0; i < 256; i++) {
                tableName = tableName + "a";
            }
            const predicates = new relationalStore.RdbPredicates(tableName);
            const bucket: relationalStore.ValuesBucket = {
                "name": "tableName",
                "age": "18",
                "sex": "man",
                "desc": "asserter"
            };
            try {
                relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetUpdateSqlInfoTableTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetUpdateSqlInfoWhereClauseTooLong
         * @tc.name testGetUpdateSqlInfoWhereClauseTooLong
         * @tc.desc Verifies that an error is thrown when the WhereClause is too long.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoWhereClauseTooLong", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoWhereClauseTooLong start *************");
            let tableName: string = "";
            for(let i = 0; i < 256; i++) {
                tableName = tableName + "a";
            }
            const predicates = new relationalStore.RdbPredicates("tableName");
            predicates.equalTo(tableName, "user");
            const bucket: relationalStore.ValuesBucket = {
                "name": "tableName",
                "age": "18",
                "sex": "man",
                "desc": "asserter"
            };
            try {
                relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(null).assertFail();
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(e.code).assertEqual(14800001);
                console.log(TAG + "************* testGetUpdateSqlInfoWhereClauseTooLong end *************");
                done();
            }
        });

        /**
         * @tc.number testGetUpdateSqlInfoConflictResolutionIsNotEmpty
         * @tc.name testGetUpdateSqlInfoConflictResolutionIsNotEmpty
         * @tc.desc Verifies that an error is thrown when the Conflict is not empty.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testGetUpdateSqlInfoConflictResolutionIsNotEmpty", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testGetUpdateSqlInfoConflictResolutionIsNotEmpty start *************");
            try {
                const predicates = new relationalStore.RdbPredicates("tableName");
                predicates.equalTo("tableName", "user");
                const bucket: relationalStore.ValuesBucket = {
                    "name": "tableName",
                    "age": "18",
                    "sex": "man",
                    "desc": "asserter"
                };
                const info: relationalStore.SqlInfo = relationalStore.getUpdateSqlInfo(
                    predicates,
                    bucket,
                    relationalStore.ConflictResolution.ON_CONFLICT_NONE
                );
                expect(info.sql).assertEqual("UPDATE tableName SET age=?,desc=?,name=?,sex=? WHERE tableName = ? ");
                done();
            } catch (e) {
                e = e as BusinessError;
                expect(null).assertFail();
                console.log(TAG + "************* testGetUpdateSqlInfoConflictResolutionIsEmpty end *************");
                done();
            }
        });
//==============================================end==============================================
    })

}