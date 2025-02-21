/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import dataAbility from '@ohos.data.dataAbility'
import fileio from '@ohos.fileio'
import dataRdb from '@ohos.data.rdb'

const TABLE_NAME = 'book'
const STORE_CONFIG = {name: 'book.db'}
const SQL_CREATE_TABLE = 'CREATE TABLE IF NOT EXISTS book' +
    '(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER, introduction TEXT NOT NULL)'
let rdbStore: any = undefined
const TAG = 'ACTS_ DataAbility.data'
const context = featureAbility.getContext()

let defaultReturn = 1;
let returnError = 0;
let returnError1 = -1;
let returnError2 = -2;
let returnError3 = -3;
let dataAbilityUri = ("dataability:///com.example.myapplication.DataAbility");

export default {

    onInitialized(abilityInfo) {
        console.debug('ACTS_ DataAbility onInitialized,abilityInfo=' + abilityInfo.bundleName)
        dataRdb.getRdbStore(context, STORE_CONFIG, 1, (err, store) => {
            console.debug('ACTS_ [data]getRdbStoreThen')
            store.executeSql(SQL_CREATE_TABLE, [])
            rdbStore = store
        });
    },

    insert(uri, valueBucket, callback) {
        console.debug(TAG + ' insert start 1121')
        console.debug(TAG + ' valueBucket json=>' + JSON.stringify(valueBucket))

        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }

        console.debug(TAG + ' valueBucket.age =>' + valueBucket.age)
        console.debug(TAG + ' valueBucket.name =>' + valueBucket.name)
        console.debug(TAG + ' valueBucket.salary =>' + valueBucket.salary)
        if (valueBucket.age != 24) {
            err = "Error age"
            callback(err, returnError2);
        }
        if (valueBucket.name != "ActsDataAbilityHelperTest") {
            err = "Error name"
            callback(err, returnError2);
        }
        if (valueBucket.salary != 2024.20) {
            err = "Error salary"
            callback(err, returnError2);
        }

        err = "Error insert"
        console.debug(TAG + ' rdbStore.insert ')
        rdbStore.insert(TABLE_NAME, valueBucket, function (err, resultSet) {
            console.log(TAG + "insert callback resultSet:" + resultSet
                + " ,json=" + JSON.stringify(resultSet) + ' ,err' + err)
            callback(err, defaultReturn);
        })
    },

    query(uri, columns, predicates, callback) {
        console.debug(TAG + ' query start')

        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }

        let rdbPredicates = dataAbility.createRdbPredicates(TABLE_NAME, predicates)
        rdbStore.query(rdbPredicates, columns, callback)
    },

    update(uri, valueBucket, predicates, callback) {
        console.debug(TAG + 'update start')

        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }

        console.debug(TAG + ' valueBucket.age =>' + valueBucket.age)
        console.debug(TAG + ' valueBucket.name =>' + valueBucket.name)
        console.debug(TAG + ' valueBucket.salary =>' + valueBucket.salary)
        if (valueBucket.age != 24) {
            err = "Error age"
            callback(err, returnError2);
        }
        if (valueBucket.name != "ActsDataAbilityHelperTest") {
            err = "Error name"
            callback(err, returnError2);
        }
        if (valueBucket.salary != 2024.20) {
            err = "Error salary"
            callback(err, returnError2);
        }

        err = "Error update"
        let rdbPredicates = dataAbility.createRdbPredicates(TABLE_NAME, predicates)
        rdbStore.update(valueBucket, rdbPredicates, function (err, resultSet) {
            console.log(TAG + "insert callback resultSet:" + resultSet
                + " ,json=" + JSON.stringify(resultSet) + ' ,err' + err)
            callback(err, defaultReturn);
        })
    },

    delete(uri, predicates, callback) {
        console.debug(TAG + 'delete start')

        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }

        let rdbPredicates = dataAbility.createRdbPredicates(TABLE_NAME, predicates)
        rdbStore.delete(rdbPredicates, function (err, resultSet) {
            console.log(TAG + "insert callback resultSet:" + resultSet
                + " ,json=" + JSON.stringify(resultSet) + ' ,err' + err)
            callback(err, defaultReturn);
        })
    },
    call(uri, method, arg, extras, callback) {
        console.debug(TAG + 'call start')
        console.debug(TAG + 'uri---->' + uri)
        console.debug(TAG + 'method---->' + uri)
    },

    batchInsert(uri, values, callback) {
        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }

        for (var j = 0; j < values.length; j++) {
            rdbStore.insert("EMPLOYEE", values[j], function (err, ret) {
                console.log(TAG + "batchInsert callback ret:" + JSON.stringify(ret))
            })
        }
        console.log(TAG + "batchInsert values.length:" + values.length + ' ,json=' + JSON.stringify(values.length))
        callback(err, values.length);
    },

    getType(uri, callback) {
        console.info(TAG + '==================== DataAbility test interface by getType ================');
        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }
        callback("success", uri);
    },

    getFileTypes(uri, mimeTypeFilter, callback) {
        console.info(TAG + '==================== DataAbility test interface by GetFileTypes ================');
        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }
        let type1 = " ";
        let type2 = " ";
        let type3 = " ";
        let types;
        if (mimeTypeFilter == "*/*") {
            type1 = ("hap");
            type2 = ("jpg");
            type3 = ("image/png");
            types = [type1, type2, type3];
        } else if (mimeTypeFilter == "image/*") {
            type1 = ("image/png");
            types = [type1];
        } else if (mimeTypeFilter == "*/jpg") {
            type1 = ("jpg");
            types = [type1];
        }

        console.log(TAG + "GetFileTypes callback ret:" + JSON.stringify(types))
        callback("success", types);
    },

    openFile(uri, mode, callback) {
        console.info(TAG + '==================== DataAbility test interface by openFile ================');
        let defaultReturn = 1;
        let returnError1 = -1;

        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, returnError1);
        }
        if (!(mode == ("r") || mode == ("w") || mode == ("wt") || mode == ("wa") ||
            mode == ("rw") || mode == ("rwt"))) {
            if (mode == ("A1@k#4%$,.<>)(oioiu*((*&(&*giIGT^%&^Ug;sdfk;losd*7873iug8%&^$&%]ERFUy&^%&&R7")) {
                defaultReturn = returnError2;
            } else
                defaultReturn = returnError3;
        }
        console.info(TAG + " path = /data/test ");
        let path = "/data/test"
        fileio.stat(path).then(function (stat) {
            console.info(TAG + "openFile getFileInfo successfully callback ret:" + JSON.stringify(stat));
        }).catch(function (err) {
            console.info(TAG + "openFile getFileInfo failed with error callback ret:" + err);
            defaultReturn = returnError1;
        });
        console.info(TAG + " path ==>" + path);
        callback("success", defaultReturn);
    },

    normalizeUri(uri, callback) {
        console.info(TAG + '==================== DataAbility test interface by normalizeUri ================');
        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, "");
        }
        callback("success", uri);
    },

    denormalizeUri(uri, callback) {
        console.info(TAG + '==================== DataAbility test interface by denormalizeUri ================');
        console.info(TAG + "denormalizeUri uri:" + JSON.stringify(uri));

        let err = "Error Uri"
        if (uri != dataAbilityUri) {
            console.debug(TAG + ' uri != dataAbilityUri')
            callback(err, "");
        }
        callback("success", uri);
    }
};
