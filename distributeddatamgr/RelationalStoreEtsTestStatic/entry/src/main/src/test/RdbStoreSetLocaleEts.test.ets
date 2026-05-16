import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll, } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import relationalStore from '@ohos.data.relationalStore';
// import sendableRelationalStore from '@ohos.data.sendableRelationalStore';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
const TAG = "[STAGE_RELATIONAL_STORE_JSKITS_TEST]";
let rdbStore:relationalStore.RdbStore | undefined;

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
    "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";

const STORE_CONFIG: relationalStore.StoreConfig = {
    name: "rdbStore.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}

let context: common.UIAbilityContext | undefined;
let delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function RdbStoreSetLocaleTest() {

    describe("RdbStoreSetLocaleTest", (): void => {
//==============================================
        beforeAll(async () => {
            console.info(TAG, "*************Unit Test Begin*************");
            delegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
            await Utils.msSleep(5000);
            context = AppStorage.get<common.UIAbilityContext>('abilityContextMainAbility2') as common.UIAbilityContext;
            console.info(TAG + 'beforeAll')
        })
        beforeEach(async () => {
            console.info(TAG + 'beforeEach');
            rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            expect(rdbStore != undefined).assertTrue();
            await rdbStore!.executeSql(CREATE_TABLE_TEST);
            const valueBucket: relationalStore.ValuesBucket = {
                'name': '张三',
                'age': 18 as long,
                'salary': 25000 as long,
            };
            const valueBucket1: relationalStore.ValuesBucket = {
                'name': '李四',
                'age': 18 as long,
                'salary': 25000 as long,
            };
            const valueBucket2: relationalStore.ValuesBucket = {
                'name': '王五',
                'age': 18 as long,
                'salary': 25000 as long,
            };
            await rdbStore!.insert('test', valueBucket);
            await rdbStore!.insert('test', valueBucket1);
            await rdbStore!.insert('test', valueBucket2);

        })
        afterEach(async () => {
            console.info(TAG + 'afterEach');
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
        })
        afterAll(async () => {
            console.info(TAG + 'afterAll');
        })
//==============================================setLocale(locale:string):Promise<void>==============================================
        /**
         * @tc.name testRdbStoreSetLocale_0001
         * @tc.number testRdbStoreSetLocale_0001
         * @tc.desc Verifies SetLocale.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testRdbStoreSetLocale_0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreSetLocale_0001 start *************");
            try {
                await rdbStore!.setLocale("zh");
                let resultSet = await rdbStore!.querySql("select * from test order by name collate LOCALES")
                resultSet.goToNextRow()

                expect('李四').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                resultSet.goToNextRow()
                expect('王五').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                resultSet.goToNextRow()
                expect('张三').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                done();
            } catch (e) {
                console.error(`message is ${e.message}  code  ${e.code}`);
                expect().assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreSetLocale_0001 end *************");
        })

        /**
         * @tc.name testRdbStoreSetLocale_0002
         * @tc.number testRdbStoreSetLocale_0002
         * @tc.desc Verifies SetLocale.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testRdbStoreSetLocale_0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreSetLocale_0002 start *************");
            try {
                await rdbStore!.close();
                await rdbStore!.setLocale("zh");
                done();
            } catch (e) {
                e = e as BusinessError;
                console.error(`message is ${e.message}  code  ${e.code}`);
                expect(e.code).assertEqual(14800014);
                done();
            }
            console.log(TAG + "************* testRdbStoreSetLocale_0002 end *************");
        })

        /**
         * @tc.name testRdbStoreSetLocale_0003
         * @tc.number testRdbStoreSetLocale_0003
         * @tc.desc Verifies SetLocale.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testRdbStoreSetLocale_0003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreSetLocale_0003 start *************");
            try {
                await rdbStore!.setLocale("111");
                done();
            } catch (e) {
                e = e as BusinessError;
                console.error(`message is ${e.message}  code  ${e.code}`);
                expect(e.code).assertEqual(14800001);
                done();
            }
            console.log(TAG + "************* testRdbStoreSetLocale_0003 end *************");
        })

        /**
         * @tc.name testRdbStoreSetLocale_0004
         * @tc.number testRdbStoreSetLocale_0004
         * @tc.desc Verifies SetLocale.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testRdbStoreSetLocale_0004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreSetLocale_0004 start *************");
            try {
                for (let i = 0; i < 10; i++) {
                    await rdbStore!.querySql("select * from test")
                }
                await rdbStore!.setLocale("zh");
                let resultSet = await rdbStore!.querySql("select * from test order by name collate LOCALES")
                resultSet.goToNextRow()

                expect('李四').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                resultSet.goToNextRow()
                expect('王五').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                resultSet.goToNextRow()
                expect('张三').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                done();
            } catch (e) {
                console.error(`message is ${e.message}  code  ${e.code}`);
                expect().assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreSetLocale_0004 end *************");
        })

        /**
         * @tc.name testRdbStoreSetLocale_0005
         * @tc.number testRdbStoreSetLocale_0005
         * @tc.desc Verifies SetLocale.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testRdbStoreSetLocale_0005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreSetLocale_0005 start *************");
            try {
                await rdbStore!.setLocale("zh");
                const rdbTrans = await rdbStore!.createTransaction();
                let resultSet = await rdbTrans.querySql("select * from test order by name collate LOCALES")
                console.log(`rowCount ${resultSet.rowCount}`)
                resultSet.goToNextRow()
                expect('李四').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                resultSet.goToNextRow()
                expect('王五').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                resultSet.goToNextRow()
                expect('张三').assertEqual(resultSet.getString(resultSet.getColumnIndex("name")));
                await rdbTrans.commit();
                done();
            } catch (e) {
                console.error(`message is ${e.message}  code  ${e.code}`);
                expect().assertFail();
                done();
            }
            console.log(TAG + "************* testRdbStoreSetLocale_0005 end *************");
        })

        /**
         * @tc.name testRdbStoreSetLocale_0006
         * @tc.number testRdbStoreSetLocale_0006
         * @tc.desc Verifies SetLocale.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("testRdbStoreSetLocale_0006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            console.log(TAG + "************* testRdbStoreSetLocale_0006 start *************");
            try {
                await rdbStore!.setLocale("");
                done();
            } catch (e) {
                e = e as BusinessError;
                console.error(`message is ${e.message}  code  ${e.code}`);
                expect(e.code).assertEqual(14800001);
                done();
            }
            console.log(TAG + "************* testRdbStoreSetLocale_0006 end *************");
        })
//==============================================end==============================================

//==============================================end==============================================
    })

}