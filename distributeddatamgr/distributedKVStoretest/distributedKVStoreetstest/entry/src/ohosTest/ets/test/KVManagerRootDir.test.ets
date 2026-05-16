/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import factory from '@ohos.data.distributedKVStore';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'KVManagerRootDir';
let kvManager: factory.KVManager|null = null;
let kvStore : factory.SingleKVStore|null = null;

let TEST_KEY_1 = "key1";
let TEST_KEY_2 = "key2";
let TEST_KEY_3 = "key3";
let TEST_KEY_4 = "key4";
let TEST_KEY_5 = "key5";
let TEST_KEY_6 = "key6";

let TEST_VALUE_1 = "string";
let TEST_VALUE_2 = 123;
let TEST_VALUE_3 = 44.5;
let TEST_VALUE_4 = true;
let TEST_VALUE_5 = false;
let TEST_VALUE_6 = "string6";

let TEST_VALUE_11 = "string11";
let TEST_VALUE_22 = 12322;
let TEST_VALUE_33 = 44.533;
let TEST_VALUE_44 = false;
let TEST_VALUE_55 = true;
let TEST_VALUE_66 = "string66";

const TAG = "[testTag >>>>>> ]"

const config: factory.KVManagerConfig = {
    bundleName: TEST_BUNDLE_NAME,
    context: context
};

const g_options: factory.Options = {
    createIfMissing: true,
    encrypt: false,
    backup: false,
    autoSync: false,
    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
    securityLevel: factory.SecurityLevel.S2,
};

let g_rootDir: string = '/data/storage/el2/base';
let g_rootDirDefault: string = '/data/storage/el2/database';

const g_optionsDir: factory.Options = {
    createIfMissing: true,
    encrypt: false,
    backup: false,
    autoSync: false,
    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
    rootDir: g_rootDir,
    securityLevel: factory.SecurityLevel.S2,
};

const g_backupConfig: factory.BackupConfig = {
    fileName: 'DirBK001',
    filePath: g_rootDir,
};

export default function KVManagerRootDir() {
    describe('KVManagerRootDir', () => {
        beforeAll(async (done: Function) => {
            console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
            console.info(TAG + 'beforeAll context.distributedFilesDir=' + context.distributedFilesDir);
            kvManager = factory.createKVManager(config);
            console.info(TAG + 'beforeAll end');
            done();
        });
        afterAll(async (done: Function) => {
            console.info(TAG + 'afterAll');
            done();
        });
        beforeEach(async (done: Function) => {
            console.info(TAG + 'beforeEach');
            g_optionsDir.rootDir = g_rootDir;
            done();
        });
        afterEach(async (done: Function) => {
            console.info(TAG + 'afterEach');
            done();
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0100
         * @tc.name SingleKv_rootDir_GetKVStore_0100
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir=context.databaseDir, /data/storage/el2/database,
         * GetKVStore(dir)， closeKVStore(dir),deleteKVStore(dir),成功
         */
        it('SingleKv_rootDir_GetKVStore_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0100---------');
            try {
                g_optionsDir.rootDir = context.databaseDir;
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                    await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                        console.info(TAG + ' deleteKVStore success');
                        kvStore = null;
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0101
         * @tc.name SingleKv_rootDir_GetKVStore_0101
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir!=context.databaseDir,不等于默认路径 /data/storage/el2/data,
         * GetKVStore(dir)， closeKVStore(dir),deleteKVStore(dir),成功
         */
        it('SingleKv_rootDir_GetKVStore_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0101---------');
            try {
                g_optionsDir.rootDir = g_rootDir;
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                    await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                        console.info(TAG + ' deleteKVStore success');
                        kvStore = null;
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0102
         * @tc.name SingleKv_rootDir_GetKVStore_0102
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir异常，目录为空，rootDir=''
         * getkv返回401， closekv返回401,  deletekv返回401,成功
         */
        it('SingleKv_rootDir_GetKVStore_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0102---------');
            try {
                g_optionsDir.rootDir = '';
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore e ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0103
         * @tc.name SingleKv_rootDir_GetKVStore_0103
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir异常，目录为空，rootDir=' ',getkv返回401， closekv成功,  deletekv返回401
         */
        it('SingleKv_rootDir_GetKVStore_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0103---------');
            try {
                g_optionsDir.rootDir = ' ';
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0104
         * @tc.name SingleKv_rootDir_GetKVStore_0104
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir异常，目录为空，rootDir='/data',getkv返回401， closekv成功,  deletekv返回401
         */
        it('SingleKv_rootDir_GetKVStore_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0104---------');
            try {
                g_optionsDir.rootDir = '/data';
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore e ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0105
         * @tc.name SingleKv_rootDir_GetKVStore_0105
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir异常，目录为空，rootDir='/data/storage/el2/database/111/'
         * getkv返回401， closekv成功,  deletekv返回401
         */
        it('SingleKv_rootDir_GetKVStore_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0105---------');
            try {
                g_optionsDir.rootDir = '/data/storage/el2/database/111/';
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore e ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0106
         * @tc.name SingleKv_rootDir_GetKVStore_0106
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir异常，rootDir=undefined, getkv返回401， closekv返回401,  deletekv返回401
         */
        it('SingleKv_rootDir_GetKVStore_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0106---------');
            try {
                g_optionsDir.rootDir = undefined;
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore e ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0107
         * @tc.name SingleKv_rootDir_GetKVStore_0107
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  属性 createIfMissing:缺少false值覆盖；属性 backup:缺少true值覆盖；属性 autoSync:缺少true值覆盖；S1
         * GetKVStore(dir)， closeKVStore(dir),deleteKVStore(dir),成功
         */
        it('SingleKv_rootDir_GetKVStore_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0107---------');
            try {
                const optionsDir00: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S1,
                };

                await kvManager!.getKVStore(TEST_STORE_ID, optionsDir00).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir00).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                const optionsDir: factory.Options = {
                    createIfMissing: false,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S1,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0108
         * @tc.name SingleKv_rootDir_GetKVStore_0108
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  S3
         */
        it('SingleKv_rootDir_GetKVStore_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0108---------');
            try {
                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S3,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0109
         * @tc.name SingleKv_rootDir_GetKVStore_0109
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  S4
         */
        it('SingleKv_rootDir_GetKVStore_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0109---------');
            try {
                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S4,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0110
         * @tc.name SingleKv_rootDir_GetKVStore_0110
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  属性 rootDir:缺少空值""覆盖；
         */
        it('SingleKv_rootDir_GetKVStore_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0110---------');
            try {
                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
                    rootDir: "",
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore e ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_callback_0110
         * @tc.name SingleKv_rootDir_GetKVStore_callback_0110
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  get callback;第2个参数属性kvStoreType:未覆盖枚举:['DEVICE_COLLABORATION']；属性rootDir:缺少空值""覆盖；
         */
        it('SingleKv_rootDir_GetKVStore_callback_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_callback_0110---------');
            try {
                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: "",
                    securityLevel: factory.SecurityLevel.S3,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);

                kvManager!.getKVStore(TEST_STORE_ID, optionsDir, (err: BusinessError, store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success, err.code='+ err.code);
                    expect(err.code).assertEqual(401);
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0111
         * @tc.name SingleKv_rootDir_GetKVStore_0111
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  属性 kvStoreType:未覆盖枚举:['DEVICE_COLLABORATION']；
         */
        it('SingleKv_rootDir_GetKVStore_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0111---------');
            try {
                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0112
         * @tc.name SingleKv_rootDir_GetKVStore_0112
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第3个参数缺少null/undefined覆盖;
         */
        it('SingleKv_rootDir_GetKVStore_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0112---------');
            try {
                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);

                try{
                    await kvManager!.getKVStore(TEST_STORE_ID, null);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, null);
                    console.info(TAG + 'closeKVStore success');
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(null).assertFail();
                    done();
                }

                try{
                    await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, null);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100004);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_011201
         * @tc.name SingleKv_rootDir_GetKVStore_011201
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第3个参数缺少null/undefined 覆盖;
         */
        it('SingleKv_rootDir_GetKVStore_011201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_011201---------');
            try {
                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);

                try{
                    await kvManager!.getKVStore(TEST_STORE_ID, undefined);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, undefined);
                    console.info(TAG + 'closeKVStore success');
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(null).assertFail();
                    done();
                }

                try{
                    await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, undefined);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100004);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0113
         * @tc.name SingleKv_rootDir_GetKVStore_0113
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第1个参数storeId 缺少空值""//null/undefined覆盖
         */
        it('SingleKv_rootDir_GetKVStore_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0113---------');
            try {
                let storeIdd = "";

                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);

                try{
                    await kvManager!.getKVStore(storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.closeKVStore(TEST_BUNDLE_NAME, storeIdd, optionsDir);
                    console.info(TAG + 'closeKVStore success');
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_011301
         * @tc.name SingleKv_rootDir_GetKVStore_011301
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第1个参数storeId 缺少空值""//null/undefined覆盖
         */
        it('SingleKv_rootDir_GetKVStore_011301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_011301---------');
            try {
                let storeIdd = null;

                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);

                try{
                    await kvManager!.getKVStore(storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.closeKVStore(TEST_BUNDLE_NAME, storeIdd, optionsDir);
                    console.info(TAG + 'closeKVStore success');
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_011302
         * @tc.name SingleKv_rootDir_GetKVStore_011302
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第1个参数storeId 缺少空值""//null/undefined 覆盖
         */
        it('SingleKv_rootDir_GetKVStore_011302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_011302---------');
            try {
                let storeIdd = undefined;

                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + optionsDir.rootDir);

                try{
                    await kvManager!.getKVStore(storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.closeKVStore(TEST_BUNDLE_NAME, storeIdd, optionsDir);
                    console.info(TAG + 'closeKVStore success');
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0114
         * @tc.name SingleKv_rootDir_GetKVStore_0114
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第1个参数BUNDLE_NAME 缺少空值""//null/undefined覆盖
         */
        it('SingleKv_rootDir_GetKVStore_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0114---------');
            try {
                let storeIdd = "storeIdd";
                let bundleName = "";

                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                try{
                    await kvManager!.closeKVStore(bundleName, storeIdd, optionsDir);
                    console.info(TAG + 'closeKVStore success');
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.deleteKVStore(bundleName, storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_011401
         * @tc.name SingleKv_rootDir_GetKVStore_011401
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第1个参数storeId 缺少空值""//null/undefined覆盖
         */
        it('SingleKv_rootDir_GetKVStore_011401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_011401---------');
            try {
                let storeIdd = "storeIdd";
                let bundleName = null;

                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                try{
                    await kvManager!.closeKVStore(bundleName, storeIdd, optionsDir);
                    console.info(TAG + 'closeKVStore success');
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.deleteKVStore(bundleName, storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_011402
         * @tc.name SingleKv_rootDir_GetKVStore_011402
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  第1个参数storeId 缺少空值""//null/undefined 覆盖
         */
        it('SingleKv_rootDir_GetKVStore_011402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_011402---------');
            try {
                let storeIdd = "storeIdd";
                let bundleName = undefined;

                const optionsDir: factory.Options = {
                    createIfMissing: true,
                    encrypt: true,
                    backup: true,
                    autoSync: true,
                    kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
                    rootDir: g_rootDir,
                    securityLevel: factory.SecurityLevel.S2,
                };

                try{
                    await kvManager!.closeKVStore(bundleName, storeIdd, optionsDir);
                    console.info(TAG + 'closeKVStore success');
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' closeKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                }

                try{
                    await kvManager!.deleteKVStore(bundleName, storeIdd, optionsDir);
                    expect(null).assertFail();
                    done();
                } catch (e) {
                    console.error(TAG + ' deleteKVStore e ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(401);
                    done();
                }
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0200
         * @tc.name SingleKv_rootDir_GetKVStore_0200
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDir= /data/storage/el2/data，GetKVStore(dir)， closeKVStore(dir), deleteKVStore(dir),
         * 第二次deleteKVStore(dir)返回15100004
         */
        it('SingleKv_rootDir_GetKVStore_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0200---------');
            try {
                g_optionsDir.rootDir = g_rootDir;
                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore 2 success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100004);
                    done();
                });

            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0201
         * @tc.name SingleKv_rootDir_GetKVStore_0201
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  closekv不存在的目录， closeKVStore(dir)与 GetKVStore(dir)目录不一致
         */
        it('SingleKv_rootDir_GetKVStore_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0201---------');
            try {
                g_optionsDir.rootDir = g_rootDir;
                const optionsErr: factory.Options = {
                    createIfMissing: true,
                    encrypt: false,
                    backup: false,
                    autoSync: false,
                    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
                    rootDir: g_rootDirDefault,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsErr).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0202
         * @tc.name SingleKv_rootDir_GetKVStore_0202
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  deletekv不存在的目录，deleteKVStore(dir)与 GetKVStore(dir)目录不一致
         */
        it('SingleKv_rootDir_GetKVStore_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0202---------');
            try {
                g_optionsDir.rootDir = g_rootDir;
                const optionsErr: factory.Options = {
                    createIfMissing: true,
                    encrypt: false,
                    backup: false,
                    autoSync: false,
                    kvStoreType: factory.KVStoreType.SINGLE_VERSION,
                    rootDir: g_rootDirDefault,
                    securityLevel: factory.SecurityLevel.S2,
                };

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, optionsErr).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100004);
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0203
         * @tc.name SingleKv_rootDir_GetKVStore_0203
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  GetKVStore(dir)，closeKVStore(), deleteKVStore(),
         */
        it('SingleKv_rootDir_GetKVStore_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0203---------');
            try {
                g_optionsDir.rootDir = g_rootDir;

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100004);
                });

                console.info(TAG + '------end closeKVStore success------');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_GetKVStore_0204
         * @tc.name SingleKv_rootDir_GetKVStore_0204
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  GetKVStore()，closeKVStore(dir), deleteKVStore(dir),
         */
        it('SingleKv_rootDir_GetKVStore_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + '---------SingleKv_rootDir_GetKVStore_0204---------');
            try {
                g_optionsDir.rootDir = g_rootDir;

                console.info(TAG + ' context.databaseDir=' + context.databaseDir);
                console.info(TAG + ' options.rootDir=' + g_optionsDir.rootDir);
                await kvManager!.getKVStore(TEST_STORE_ID, g_options).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100004);
                });

                console.info(TAG + '------end closeKVStore success------');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' getKVStore e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }

        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0100
         * @tc.name SingleKv_rootDir_backupEx_0100
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup默认路径， getkvstoreDir,backupEx(), restoreEx(), deleteBackupEx(),成功
         */
        it('SingleKv_rootDir_backupEx_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0100');
            try {
                g_optionsDir.rootDir = g_rootDirDefault;
                g_backupConfig.filePath = g_rootDirDefault;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0200
         * @tc.name SingleKv_rootDir_backupEx_0200
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup不等于默认路径， getkvstoreDir,backupEx(), restoreEx(), deleteBackupEx(),成功
         */
        it('SingleKv_rootDir_backupEx_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0200');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0300
         * @tc.name SingleKv_rootDir_backupEx_0300
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup不等于默认路径， getkvstoreDir, put, get, backupEx(), restoreEx(), deleteBackupEx(),成功
         */
        it('SingleKv_rootDir_backupEx_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0300');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);
                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' 1. getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' 2. put 6, get 6---');
                await kvStore!.put(TEST_KEY_1, TEST_VALUE_1);
                await kvStore!.put(TEST_KEY_2, TEST_VALUE_2);
                await kvStore!.put(TEST_KEY_3, TEST_VALUE_3);
                await kvStore!.put(TEST_KEY_4, TEST_VALUE_4);
                await kvStore!.put(TEST_KEY_5, TEST_VALUE_5);
                await kvStore!.put(TEST_KEY_6, TEST_VALUE_6);

                let query = new factory.Query();
                query.prefixKey("key");
                let resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(6);

                console.info(TAG + ' 3. delete 1, get 5 ---');
                await kvStore!.delete(TEST_KEY_6);
                resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(5);

                console.info(TAG + ' 4. backupEx---');
                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' 5. deleteBatch 4, get 1---');
                await kvStore!.deleteBatch([TEST_KEY_1, TEST_KEY_2, TEST_KEY_3, TEST_KEY_4]).then(() => {
                    console.info(TAG + 'Succeeded in deleteBatch');
                }).catch((err: BusinessError) => {
                    console.error(TAG + `Failed to deleteBatch. code is ${err.code},message is ${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(1);

                console.info(TAG + ' 6. restoreEx , get 5---');
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(5);

                console.info(TAG + ' 7. deleteBackupEx ---');
                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' 8. update 6, get 6---');
                await kvStore!.put(TEST_KEY_1, TEST_VALUE_11);
                await kvStore!.put(TEST_KEY_2, TEST_VALUE_22);
                await kvStore!.put(TEST_KEY_3, TEST_VALUE_33);
                await kvStore!.put(TEST_KEY_4, TEST_VALUE_44);
                await kvStore!.put(TEST_KEY_5, TEST_VALUE_55);
                await kvStore!.put(TEST_KEY_6, TEST_VALUE_66);
                console.info(TAG + ' 8. getResultSize---');
                resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(6);

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0400
         * @tc.name SingleKv_rootDir_backupEx_0400
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup异常，目录为空，rootDirBackup=''  err=15100000，BackupExDir，RestoreExDir,DeleteBackup
         */
        it('SingleKv_rootDir_backupEx_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0400');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = '';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_04001
         * @tc.name SingleKv_rootDir_backupEx_04001
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup异常，目录为空，rootDirBackup=null/undefined  err=15100000，BackupExDir，RestoreExDir,DeleteBackup
         */
        it('SingleKv_rootDir_backupEx_04001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_04001');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                try{
                    await kvStore!.backupEx(null).then(() => {
                        console.info(TAG + ' backupEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, backupEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }

                try{
                    await kvStore!.restoreEx(null).then(() => {
                        console.info(TAG + ' restoreEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, restoreEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }

                try{
                    await kvStore!.deleteBackupEx(null).then(() => {
                        console.info(TAG + ' deleteBackupEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, deleteBackupEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }


                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_04002
         * @tc.name SingleKv_rootDir_backupEx_04002
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup异常，目录为空，rootDirBackup=null/undefined  err=15100000，BackupExDir，RestoreExDir,DeleteBackup
         */
        it('SingleKv_rootDir_backupEx_04002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_04002');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                try{
                    await kvStore!.backupEx(undefined).then(() => {
                        console.info(TAG + ' backupEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, backupEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }

                try{
                    await kvStore!.restoreEx(undefined).then(() => {
                        console.info(TAG + ' restoreEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, restoreEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }

                try{
                    await kvStore!.deleteBackupEx(undefined).then(() => {
                        console.info(TAG + ' deleteBackupEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, deleteBackupEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }


                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0401
         * @tc.name SingleKv_rootDir_backupEx_0401
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup异常，目录为空，rootDirBackup=' '  err=15100000，
         * BackupExDir，RestoreExDir,DeleteBackup成功
         */
        it('SingleKv_rootDir_backupEx_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0401');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = ' ';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0402
         * @tc.name SingleKv_rootDir_backupEx_0402
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup异常，目录存在但没权限，rootDirBackup=/data, err=15100000，
         * BackupExDir，RestoreExDir, DeleteBackup成功
         */
        it('SingleKv_rootDir_backupEx_0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0402');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = '/data';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0403
         * @tc.name SingleKv_rootDir_backupEx_0403
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup异常，目录不存在，rootDirBackup=/data/storage/el2/database/111/, err=15100000，
         * BackupExDir，RestoreExDir, DeleteBackup成功
         */
        it('SingleKv_rootDir_backupEx_0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0403');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = '/data/storage/el2/database/111/';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }

        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0404
         * @tc.name SingleKv_rootDir_backupEx_0404
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  rootDirBackup异常，rootDirBackup和开库路径不一致，err=15100000，
         * BackupExDir，RestoreExDir, DeleteBackup成功
         */
        it('SingleKv_rootDir_backupEx_0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0404');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = '/data/storage/el2/distributedfiles';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }

        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0405
         * @tc.name SingleKv_rootDir_backupEx_0405
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  数据库关闭后，err=15100005，BackupExDir，RestoreExDir, DeleteBackup成功
         */
        it('SingleKv_rootDir_backupEx_0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0405');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDirDefault;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100005);
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100005);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }

        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0406
         * @tc.name SingleKv_rootDir_backupEx_0406
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  BackupExDir，DeleteBackup成功，RestoreExDir失败
         */
        it('SingleKv_rootDir_backupEx_0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0406');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0407
         * @tc.name SingleKv_rootDir_backupEx_0407
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  BackupExDir，closekv，RestoreExDir失败
         */
        it('SingleKv_rootDir_backupEx_0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0407');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100005);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0408
         * @tc.name SingleKv_rootDir_backupEx_0408
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  BackupExDir，deletekv，RestoreExDir失败
         */
        it('SingleKv_rootDir_backupEx_0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0408');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100005);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });


        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0500
         * @tc.name SingleKv_rootDir_backupEx_0500
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  fileName异常，目录为空，fileName=''  err=15100000，
         */
        it('SingleKv_rootDir_backupEx_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0500');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                g_backupConfig.fileName = '';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);
                console.info(TAG + ' g_backupConfig.fileName=' + g_backupConfig.fileName);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                    expect(null).assertFail();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(err.code).assertEqual(15100000);
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }

        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0501
         * @tc.name SingleKv_rootDir_backupEx_0501
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  fileName正常，目录为空，fileName=' '  success，
         */
        it('SingleKv_rootDir_backupEx_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0501');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                g_backupConfig.fileName = ' ';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);
                console.info(TAG + ' g_backupConfig.fileName=' + g_backupConfig.fileName);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0502
         * @tc.name SingleKv_rootDir_backupEx_0502
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  fileName异常，fileName='*-！@#￥%……&*（）——+= ';  success
         */
        it('SingleKv_rootDir_backupEx_0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0502');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                g_backupConfig.fileName = '*-！@#￥%……&*（）——+= ';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);
                console.info(TAG + ' g_backupConfig.fileName=' + g_backupConfig.fileName);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' restoreEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0503
         * @tc.name SingleKv_rootDir_backupEx_0503
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  fileName异常，目录为空，fileName='/<> ?'  err=15100000，
         */
        it('SingleKv_rootDir_backupEx_0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0503');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                g_backupConfig.fileName = '/<>:* ?';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);
                console.info(TAG + ' g_backupConfig.fileName=' + g_backupConfig.fileName);

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' getKVStore success');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' catch e ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                try{
                    await kvStore!.backupEx(g_backupConfig).then(() => {
                        console.info(TAG + ' backupEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' backupEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, backupEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }

                try{
                    await kvStore!.restoreEx(g_backupConfig).then(() => {
                        console.info(TAG + ' restoreEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, restoreEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }

                try{
                    await kvStore!.deleteBackupEx(g_backupConfig).then(() => {
                        console.info(TAG + ' deleteBackupEx success');
                        expect(null).assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(TAG + ' deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                        expect(null).assertFail();
                        done();
                    });
                }catch(e){
                    console.error(TAG + ' catch, deleteBackupEx err ' + `, code=${e.code}, message=${e.message}`);
                    expect(e.code).assertEqual(15100000);
                }

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    g_backupConfig.fileName = 'DirBK001';
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DistributedData_KVStore_SDK_SingleKv_rootDir_backupEx_0600
         * @tc.name SingleKv_rootDir_backupEx_0600
         * @tc.type: FUNC
         * @tc.size: MediumTest
         * @tc.level: Level 2
         * @tc.desc  创建两个数据库,设置带有rootDir的options和不带rootDir的options，分别增删改差数据 ，备份，恢复。
         */
        it('SingleKv_rootDir_backupEx_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            console.info(TAG + ' ------ SingleKv_rootDir_backupEx_0600');
            try {
                g_optionsDir.rootDir = g_rootDir;
                g_backupConfig.filePath = g_rootDir;
                g_backupConfig.fileName = 'DirBK001';
                console.info(TAG + ' g_optionsDir.rootDir   =' + g_optionsDir.rootDir);
                console.info(TAG + ' g_backupConfig.filePath=' + g_backupConfig.filePath);

                let kvStoreDir : factory.SingleKVStore|null = null;
                let kvStore : factory.SingleKVStore|null = null;

                let TEST_KEY_Dir1 = "keyDir1";
                let TEST_KEY_Dir2 = "keyDir2";
                let TEST_KEY_Dir3 = "keyDir3";
                let TEST_KEY_Dir4 = "keyDir4";
                let TEST_VALUE_Dir1 = "stringDir";
                let TEST_VALUE_Dir2 = 66;
                let TEST_VALUE_Dir3 = 65.4;
                let TEST_VALUE_Dir4 = "stringDir4";

                await kvManager!.getKVStore(TEST_STORE_ID, g_optionsDir).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' 1.1 getKVStore success, kvStoreDir');
                    kvStoreDir = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore kvStoreDir err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.getKVStore(TEST_STORE_ID, g_options).then((store: factory.SingleKVStore) => {
                    console.info(TAG + ' 1.2 getKVStore success, kvStore');
                    kvStore = store;
                    expect(store != undefined && store != null).assertTrue();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' getKVStore kvStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' 2. put 3, get 3---');
                await kvStoreDir!.put(TEST_KEY_Dir1, TEST_VALUE_Dir1);
                await kvStoreDir!.put(TEST_KEY_Dir2, TEST_VALUE_Dir2);
                await kvStoreDir!.put(TEST_KEY_Dir3, TEST_VALUE_Dir3);

                await kvStore!.put(TEST_KEY_1, TEST_VALUE_1);
                await kvStore!.put(TEST_KEY_2, TEST_VALUE_2);
                await kvStore!.put(TEST_KEY_3, TEST_VALUE_3);

                let query = new factory.Query();
                query.prefixKey("key");
                let resultSizeDir = await kvStoreDir!.getResultSize(query);
                console.info(TAG + '2.1 resultSizeDir='+ resultSizeDir);
                expect(resultSizeDir).assertEqual(3);
                let resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + '2.2 resultSize='+ resultSize);
                expect(resultSize).assertEqual(3);

                console.info(TAG + ' 3. backup---');
                await kvStoreDir!.backupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' 3.1 backupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' 3.1 backupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.backup('BK002').then(() => {
                    console.info(TAG + ' 3.2 backup success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' 3.2 backup err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' 4. delete 1, get 2 ---');
                await kvStoreDir!.delete(TEST_KEY_Dir3);
                await kvStore!.delete(TEST_KEY_3);
                resultSizeDir = await kvStoreDir!.getResultSize(query);
                console.info(TAG + 'resultSizeDir='+ resultSizeDir);
                expect(resultSizeDir).assertEqual(2);
                resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(2);

                console.info(TAG + ' 5. restoreEx , get 3---');
                await kvStoreDir!.restoreEx(g_backupConfig).then(() => {
                    console.info(TAG + ' 5.1 restoreEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' 5.1 restoreEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvStore!.restore('BK002').then(() => {
                    console.info(TAG + ' 5.2 restore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' 5.2 restore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                resultSizeDir = await kvStoreDir!.getResultSize(query);
                console.info(TAG + 'resultSizeDir='+ resultSizeDir);
                expect(resultSizeDir).assertEqual(3);
                resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(3);

                console.info(TAG + ' 6. deleteBackupEx ---');
                await kvStoreDir!.deleteBackupEx(g_backupConfig).then(() => {
                    console.info(TAG + ' 6.1 deleteBackupEx success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' 6.1 deleteBackupEx err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvStore!.deleteBackup(['BK002']).then(() => {
                    console.info(TAG + ' 6.2 deleteBackup success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' 6.2 deleteBackup err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                console.info(TAG + ' 7. put 1, update 1, get 4---');
                await kvStoreDir!.put(TEST_KEY_Dir1, "DirUpdate1");
                await kvStoreDir!.put(TEST_KEY_Dir4, "DirPut4");

                await kvStore!.put(TEST_KEY_1, "Update1");
                await kvStore!.put(TEST_KEY_4, "Put4");

                resultSizeDir = await kvStoreDir!.getResultSize(query);
                console.info(TAG + 'resultSizeDir='+ resultSizeDir);
                expect(resultSizeDir).assertEqual(4);
                resultSize = await kvStore!.getResultSize(query);
                console.info(TAG + 'resultSize='+ resultSize);
                expect(resultSize).assertEqual(4);

                let dataDir = await kvStoreDir!.get(TEST_KEY_Dir1);
                console.info(TAG + 'dataDir='+ dataDir);
                expect(dataDir).assertEqual("DirUpdate1");
                let data = await kvStore!.get(TEST_KEY_1);
                console.info(TAG + 'data='+ data);
                expect(data).assertEqual("Update1");

                console.info(TAG + ' ---end. closeKVStore,deleteKVStore---');
                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(async () => {
                    console.info(TAG + ' closeKVStoreDir success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStoreDir err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, g_optionsDir).then(() => {
                    console.info(TAG + ' deleteKVStoreDir success');
                    kvStoreDir = null;
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStoreDir err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
                    console.info(TAG + ' closeKVStore success');
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' closeKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });

                await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                    console.info(TAG + ' deleteKVStore success');
                    kvStore = null;
                    done();
                }).catch((err: BusinessError) => {
                    console.error(TAG + ' deleteKVStore err ' + `, code=${err.code}, message=${err.message}`);
                    expect(null).assertFail();
                    done();
                });
            } catch (e) {
                console.error(TAG + ' catch e ' + `, code=${e.code}, message=${e.message}`);
                expect(null).assertFail();
                done();
            }
        });

    })
}
