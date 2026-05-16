import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import relationalStore from '@ohos.data.relationalStore';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common'
import { fileIo as fs } from '@kit.CoreFileKit';
import contextConstant from '@ohos.app.ability.contextConstant';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let context:common.UIAbilityContext | undefined;

const DISTRIBUTED_CONFIG_COLLABORATION:relationalStore.DistributedConfig= {
    autoSync: false,
    asyncDownloadAsset: false,
    enableCloud: false,
    tableType: relationalStore.DistributedTableType.DEVICE_COLLABORATION
}
const DISTRIBUTED_CONFIG_SINGLE:relationalStore.DistributedConfig = {
    autoSync: false,
    asyncDownloadAsset: false,
    enableCloud: false,
    tableType: relationalStore.DistributedTableType.SINGLE_VERSION
}
const DISTRIBUTED_CONFIG_UNDEFINED:relationalStore.DistributedConfig = {
    autoSync: false,
    asyncDownloadAsset: false,
    enableCloud: false,
    tableType: undefined
}
const DISTRIBUTED_CONFIG_NOTABLETYPE:relationalStore.DistributedConfig = {
    autoSync: false,
}
const STORE_CONFIG:relationalStore.StoreConfig = {
    name: "RdbTest.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIGNoschema:relationalStore.StoreConfig = {
    name: "RdbTestNoschema.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}

const STORE_CONFIG1:relationalStore.StoreConfig = {
    name: "RdbTest1.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG2:relationalStore.StoreConfig = {
    name: "RdbTest2.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG3:relationalStore.StoreConfig = {
    name: "RdbTest3.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG4:relationalStore.StoreConfig = {
    name: "RdbTest4.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG5:relationalStore.StoreConfig = {
    name: "RdbTest5.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}
const STORE_CONFIG6:relationalStore.StoreConfig = {
    name: "RdbTest6.db",
    securityLevel: relationalStore.SecurityLevel.S1,
}

let rdbStore: relationalStore.RdbStore | undefined;
let rdbStoreNoschema: relationalStore.RdbStore | undefined;
let rdbStore1: relationalStore.RdbStore | undefined;
let rdbStore2: relationalStore.RdbStore | undefined;
let rdbStore3: relationalStore.RdbStore | undefined;
let rdbStore4: relationalStore.RdbStore | undefined;
let rdbStore5: relationalStore.RdbStore | undefined;
let rdbStore6: relationalStore.RdbStore | undefined;

export default function RdbSetdistributedtableTest() {
    describe("RdbSetdistributedtableTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll');
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.relationalstore")
            await Utils.msSleep(5000)
            context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        })
        beforeEach(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach');
            rdbStore = await relationalStore.getRdbStore(context!, STORE_CONFIG);
            rdbStore1 = await relationalStore.getRdbStore(context!, STORE_CONFIG1);
            rdbStoreNoschema = await relationalStore.getRdbStore(context!, STORE_CONFIGNoschema);
            rdbStore2 = await relationalStore.getRdbStore(context!, STORE_CONFIG2);
            rdbStore3 = await relationalStore.getRdbStore(context!, STORE_CONFIG3);
            rdbStore4 = await relationalStore.getRdbStore(context!, STORE_CONFIG4);
            rdbStore5 = await relationalStore.getRdbStore(context!, STORE_CONFIG5);
            rdbStore6 = await relationalStore.getRdbStore(context!, STORE_CONFIG6);
        })
        afterEach(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'afterEach');
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG1);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG2);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG3);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG4);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG5);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIG6);
            await relationalStore.deleteRdbStore(context!, STORE_CONFIGNoschema);
        })
        afterAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'afterAll');
        })
        console.log(tag + "*************Unit Test Begin*************");
        /**
         * @tc.name   setDistributedTableTest0001
         * @tc.number setDistributedTableTest0001
         * @tc.desc   has schema set DEVICE_COLLABORATION success, after set SINGLE_VERSION fail
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* SetDistributedTableTest0001 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0001 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect().assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_COLLABORATION);
                    hilog.info(domain, tag, '%{public}s',
                        `SetDistributedTableTest0001 EMPLOYEE DEVICE_COLLABORATION successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s',
                        `SetDistributedTableTest0001 EMPLOYEE DEVICE_COLLABORATION failed message:${e.message} code:${e.code}`);
                    expect().assertFail();
                }
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `SetDistributedTableTest0001 EMPLOYEE SINGLE_VERSION successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s',
                        `SetDistributedTableTest0001 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* SetDistributedTableTest0001 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0002
         * @tc.number setDistributedTableTest0002
         * @tc.desc   has schema set SINGLE_VERSION success, after set DEVICE_COLLABORATION fail
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0002 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0002 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `SetDistributedTableTest0002 EMPLOYEE SINGLE_VERSION successfully.`);              
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0002 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_COLLABORATION);
                    hilog.info(domain, tag, '%{public}s',
                        `SetDistributedTableTest0002 EMPLOYEE DEVICE_COLLABORATION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0002 EMPLOYEE DEVICE_COLLABORATION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', `************* setDistributedTableTest0002 end *************`);
        })

        /**
         * @tc.name   setDistributedTableTest0003
         * @tc.number setDistributedTableTest0003
         * @tc.desc   no schema set SINGLE_VERSION fail, after set DEVICE_COLLABORATION success
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0003 start *************");
            if (rdbStoreNoschema == undefined) {
                hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0003 rdbStoreNoschema is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStoreNoschema!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStoreNoschema!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `SetDistributedTableTest0003 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0003 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
                try {
                    await rdbStoreNoschema!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
                    hilog.info(domain, tag, '%{public}s', `SetDistributedTableTest0003 EMPLOYEE DEVICE_COLLABORATION successfully.`);                  
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s',
                        `SetDistributedTableTest0001 EMPLOYEE DEVICE_COLLABORATION failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
            }
            hilog.info(domain, tag, '%{public}s', `************* setDistributedTableTest0003 end *************`);
        })

        /**
         * @tc.name   setDistributedTableTest0004
         * @tc.number setDistributedTableTest0004
         * @tc.desc   rdbStore has schema set SINGLE_VERSION sucsess, rdbStoreNoschema noschema set SINGLE_VERSION fail
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0004 start *************");
            if (rdbStoreNoschema == undefined) {
                hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0004 rdbStoreNoschema is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStoreNoschema!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStoreNoschema!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `SetDistributedTableTest0004 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s',
                        `SetDistributedTableTest0004 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0004 rdbstore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `SetDistributedTableTest0004 EMPLOYEE SINGLE_VERSION successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s',
                        `SetDistributedTableTest0004 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
            }
            hilog.info(domain, tag, '%{public}s', `************* setDistributedTableTest0004 end *************`);
        })

        /**
         * @tc.name   setDistributedTableTest0005
         * @tc.number setDistributedTableTest0005
         * @tc.desc   rdbStore1 has schema set SINGLE_VERSION fail due to bundlename is fail
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0005 start *************");
            if (rdbStore1 == undefined) {
                hilog.error(domain, tag, '%{public}s', `SetDistributedTableTest0005 rdbStore1 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore1!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore1!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `SetDistributedTableTest0005 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s',
                        `SetDistributedTableTest0005 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
        })

        /**
         * @tc.name   setDistributedTableTest0006
         * @tc.number setDistributedTableTest0006
         * @tc.desc   has schema set table type is default
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0006 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0006 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"]);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0006 EMPLOYEE default successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s',
                        `setDistributedTableTest0006 EMPLOYEE default failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0006 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0007
         * @tc.number setDistributedTableTest0007
         * @tc.desc   has schema set table single type fail due to sync field is not in table
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0007 begin *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0007 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0007 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0007 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0007 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0008
         * @tc.number setDistributedTableTest0008
         * @tc.desc   has schema set table single type fail due to sync specialfield is not unique
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0008 begin *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0008 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER UNIQUE ON CONFLICT REPLACE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0008 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0008 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0008 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0009
         * @tc.number setDistributedTableTest0009
         * @tc.desc   has schema set table single type success
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0009 begin *************");
            if (rdbStore2 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0009 rdbStore2 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore2!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore2!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0009 EMPLOYEE SINGLE_VERSION successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0009 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0009 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0010
         * @tc.number setDistributedTableTest0010
         * @tc.desc   has schema set table single type fail sync primarykey but table has other unique field not null not sync
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0010 begin *************");
            if (rdbStore2 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0010 rdbStore2 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore2!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER UNIQUE NOT NULL, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore2!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0010 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0010 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0010 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0011
         * @tc.number setDistributedTableTest0011
         * @tc.desc   has schema set table single type fail sync primarykey but table has other unique field not sync
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0011 start *************");
            if (rdbStore2 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0011 rdbStore2 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore2!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore2!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0011 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0011 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0011 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0012
         * @tc.number setDistributedTableTest0012
         * @tc.desc   has schema set table single type fail primarykey table but primarykey is not sync
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0012 start *************");
            if (rdbStore3 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0012 rdbStore3 is undefined`);
            } else {
                try {
                    await rdbStore3!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL PRIMARY KEY, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore3!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0012 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0012 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0012 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0013
         * @tc.number setDistributedTableTest0013
         * @tc.desc   has schema set table single type fail table is no primarykey table
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0013 start *************");
            if (rdbStore3 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0013 rdbStore3 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore3!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore3!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                        DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0013 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0013 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0013 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0014
         * @tc.number setDistributedTableTest0014
         * @tc.desc   has schema set table single type fail table is has primarykey table and Spcialfield is primarykey, but table has not null field no default value is not sync
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0014 start *************");
            if (rdbStore3 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0014 rdbStore3 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore3!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL, AGE INTEGER PRIMARY KEY, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore3!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0014 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0014 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0014 start *************");
        })

        /**
         * @tc.name   setDistributedTableTest0015
         * @tc.number setDistributedTableTest0015
         * @tc.desc   has schema set table single type fail table is has primarykey table and primarykey is autoIncrement&sync, but Spcialfield is not unique
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0015 start *************");
            if (rdbStore4 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0015 rdbStore4 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore4!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore4!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0015 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0015 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0015 start *************");
        })

        /**
         * @tc.name   setDistributedTableTest0016
         * @tc.number setDistributedTableTest0016
         * @tc.desc   has schema set table single type fail table is has primarykey table and primarykey is autoIncrement&nosync, but has two Spcialfields
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0016 start *************");
            if (rdbStore5 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0016 rdbStore5 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore5!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE , AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore5!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0016 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0016 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0016 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0017
         * @tc.number setDistributedTableTest0017
         * @tc.desc   has schema set table single type fail due to deviceSyncFields is empty
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0017 start *************");
            if (rdbStore6 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0017 rdbStore6 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore6!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE , AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore6!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0017 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0017 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0017 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0018
         * @tc.number setDistributedTableTest0018
         * @tc.desc   has schema set table single type success table is has primarykey table and Spcialfield is primarykey, table has not null field default value is not sync
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0018 start *************");
            if (rdbStore3 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0018 rdbStore3 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore3!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (NAME TEXT NOT NULL DEFAULT "zhangsan", AGE INTEGER PRIMARY KEY, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore3!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0018 EMPLOYEE SINGLE_VERSION successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0018 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0018 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0019
         * @tc.number setDistributedTableTest0019
         * @tc.desc   has schema set table single type success has two unique feild and sync all
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0019 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0019 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER UNIQUE ON CONFLICT REPLACE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0019 EMPLOYEE SINGLE_VERSION successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0019 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0019 end *************");
        })

        /**
         * @tc.name   setDistributedTableTest0020
         * @tc.number setDistributedTableTest0020
         * @tc.desc   has schema set table single type fail table is has primarykey table and primarykey is autoIncrement&sync
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setDistributedTableTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0020 start *************");
            if (rdbStore4 == undefined) {
                hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0020 rdbStore4 is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore4!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER UNIQUE, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore4!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setDistributedTableTest0020 EMPLOYEE SINGLE_VERSION successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setDistributedTableTest0020 EMPLOYEE SINGLE_VERSION failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setDistributedTableTest0020 end *************");
        })

        /**
         * @tc.name   setCloudDistributedTableTest0001
         * @tc.number setCloudDistributedTableTest0001
         * @tc.desc   setCloudDistributedTable table config no tabletype
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setCloudDistributedTableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setCloudDistributedTableTest0001 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0001 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_NOTABLETYPE);
                    hilog.info(domain, tag, '%{public}s', `setCloudDistributedTableTest0001 EMPLOYEE successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0001 EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
            }
            console.log(tag + "************* setCloudDistributedTableTest0001 end *************");
        })

        /**
         * @tc.name   setCloudDistributedTableTest0002
         * @tc.number setCloudDistributedTableTest0002
         * @tc.desc   setCloudDistributedTable fail due to type is COLLABORATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setCloudDistributedTableTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setCloudDistributedTableTest0002 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0002 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_COLLABORATION);
                    hilog.info(domain, tag, '%{public}s', `setCloudDistributedTableTest0002 EMPLOYEE successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0002 EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(801);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setCloudDistributedTableTest0002 end *************");
        })

        /**
         * @tc.name   setCloudDistributedTableTest0003
         * @tc.number setCloudDistributedTableTest0003
         * @tc.desc   setCloudDistributedTable success type is SINGLE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setCloudDistributedTableTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setCloudDistributedTableTest0003 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0003 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_SINGLE);
                    hilog.info(domain, tag, '%{public}s', `setCloudDistributedTableTest0003 EMPLOYEE successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0003 EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setCloudDistributedTableTest0003 end *************");
        })

        /**
         * @tc.name   setCloudDistributedTableTest0004
         * @tc.number setCloudDistributedTableTest0004
         * @tc.desc   setCloudDistributedTable success type is undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setCloudDistributedTableTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setCloudDistributedTableTest0004 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0004 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_UNDEFINED);
                    hilog.info(domain, tag, '%{public}s', `setCloudDistributedTableTest0004 EMPLOYEE successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setCloudDistributedTableTest0004 EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setCloudDistributedTableTest0004 end *************");
        })

        /**
         * @tc.name   setMultiDistributedTableTest0001
         * @tc.number setMultiDistributedTableTest0001
         * @tc.desc   setCloudDistributedTable first and setDeviceDistributedTable fail due to table type device and cloud is exclusive
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setMultiDistributedTableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setMultiDistributedTableTest0001 start *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setMultiDistributedTableTest0001 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetCloudDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_UNDEFINED);
                    hilog.info(domain, tag, '%{public}s', `setMultiDistributedTableTest0001 SetCloudDistributedTables EMPLOYEE successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setMultiDistributedTableTest0001 SetCloudDistributedTables EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDeviceDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
                    hilog.info(domain, tag, '%{public}s', `setMultiDistributedTableTest0001 SetDeviceDistributedTables EMPLOYEE successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setMultiDistributedTableTest0001 SetDeviceDistributedTables EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setMultiDistributedTableTest0001 end *************");
        })

        /**
         * @tc.name   setMultiDistributedTableTest0002
         * @tc.number setMultiDistributedTableTest0002
         * @tc.desc   setDeviceDistributedTable first and setCloudDistributedTable fail due to table type device and cloud is exclusive
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('setMultiDistributedTableTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "************* setMultiDistributedTableTest0002 end *************");
            if (rdbStore == undefined) {
                hilog.error(domain, tag, '%{public}s', `setMultiDistributedTableTest0002 rdbStore is undefined`);
                expect().assertFail();
            } else {
                try {
                    await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, SALARY REAL, CODES BLOB)');
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `executeSql failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetDeviceDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, DISTRIBUTED_CONFIG_COLLABORATION);
                    hilog.info(domain, tag, '%{public}s', `setMultiDistributedTableTest0002 SetDeviceDistributedTables EMPLOYEE successfully.`);
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setMultiDistributedTableTest0002 SetDeviceDistributedTables EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(null).assertFail();
                }
                hilog.info(domain, tag, '%{public}s', `SetCloudDistributedTables EMPLOYEE begin`);
                try {
                    await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_CLOUD, DISTRIBUTED_CONFIG_UNDEFINED);
                    hilog.info(domain, tag, '%{public}s', `setMultiDistributedTableTest0001 SetCloudDistributedTables EMPLOYEE successfully.`);
                    expect(null).assertFail();
                } catch (e) {
                    hilog.error(domain, tag, '%{public}s', `setMultiDistributedTableTest0001 SetCloudDistributedTables EMPLOYEE failed message:${e.message} code:${e.code}`);
                    expect(e.code).assertEqual(14800000);
                }
            }
            hilog.info(domain, tag, '%{public}s', "************* setMultiDistributedTableTest0002 end *************");
        })

        console.log(tag + "*************Unit Test End*************");
    })
}