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

import Extension from '@ohos.application.DataShareExtensionAbility';
import rdb from '@ohos.data.rdb';

let DB_NAME = "book.db";
let TBL_NAME = "book";
let DDL_TBL_CREATE = "CREATE TABLE IF NOT EXISTS " + TBL_NAME + " (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, introduction TEXT NOT NULL)";

let rdbStore;

function sleep(time: number) {
  return new Promise((resolve) => {
    setTimeout(resolve, time);
  })
}

async function output() {
  let out = await sleep(1000);
  console.log('1');
  return out;
}

export default class DataShareExtAbility extends Extension {
  async onCreate(want, callback) {
    console.log('[DataShareServer]: DataShareExtAbility onCreate, want:' + want.abilityName);
    console.log('[DataShareServer]: DataShareExtAbility onCreate this.context.databaseDir:' + this.context.databaseDir);
    // @ts-ignore
    rdbStore = await rdb.getRdbStore(this.context, {
      name: DB_NAME
    }, 1);
    console.log('[DataShareServer]: DataShareExtAbility getRdbStore done');
    await rdbStore.executeSql(DDL_TBL_CREATE, []);
    console.log('[DataShareServer]: DataShareExtAbility executeSql done');
    let err = {
      "code": 0
    };
    callback(err);
    console.log('[DataShareServer]: DataShareExtAbility onCreate end');
  }

  async getFileTypes(uri: string, mimeTypeFilter: string, callback) {
    console.log('[DataShareServer]: [getFileTypes] enter');
    let ret = new Array("type01", "type00", "type03");
    console.log('[DataShareServer]: [getFileTypes] leave, ret:' + ret);
    let err = {
      "code": 0
    };
    await callback(err, ret);
    return ret;
  }

  async openFile(uri: string, mode: string, callback) {
    console.log('[DataShareServer]: [openFile] enter');
    let ret = 1;
    let err = {
      "code": 0
    };
    await callback(err, ret);
    console.log('[DataShareServer]: [openFile] leave, ret:' + ret);
  }

  async insert(uri, value, callback) {
    console.log('[DataShareServer]: [insert] enter');
    if (value == null) {
      console.error('[DataShareServer]: [insert] invalid valueBuckets');
      return;
    }
    console.log('[DataShareServer]: [insert]  value = ' + value);
    console.log('[DataShareServer]: [insert]  value = ' + JSON.stringify(value));
    await rdbStore.insert(TBL_NAME, value, (err, ret) => {
      console.log('[DataShareServer]: <<Provider>> [insert] callback ret:' + ret);
      if (callback != undefined) {
        callback(err, ret);
      }
    });
    console.log('[DataShareServer]: [insert] leave');
  }

  async update(uri, predicates, value, callback) {
    console.log('[DataShareServer]: [update] enter');
    if (predicates == null || predicates == undefined) {
      console.error('[DataShareServer]: <<Provider>> [update] invalid predicates');
      return;
    }
    console.log('[DataShareServer]: [update]  values = ' + value);
    console.log('[DataShareServer]: [update]  values = ' + JSON.stringify(value));
    console.log('[DataShareServer]: [update]  predicates = ' + predicates);
    console.log('[DataShareServer]: [update]  predicates = ' + JSON.stringify(predicates));
    try {
      await rdbStore.update(TBL_NAME, value, predicates, function (err, ret) {
        console.log('[DataShareServer]: [update] callback ret:' + ret);
        console.log('[DataShareServer]: [update] callback err:' + err);
        if (callback != undefined) {
          callback(err, ret);
        }
      });
    } catch (err) {
      console.error('[DataShareServer]: [update] error' + err);
    }
    sleep(1);
    console.log('[DataShareServer]: [update] leave');
  }

  async delete(uri, predicates, callback) {
    console.log('[DataShareServer]: [delete] enter');
    if (predicates == null || predicates == undefined) {
      console.error('[DataShareServer]: [delete] invalid predicates');
      return;
    }
    console.log('[DataShareServer]: [delete]  predicates = ' + predicates);
    console.log('[DataShareServer]: [delete]  predicates = ' + JSON.stringify(predicates));
    try {
      await rdbStore.delete(TBL_NAME, predicates, (err, ret) => {
        console.log('[DataShareServer]: [delete] ret:' + ret);
        if (callback != undefined) {
          callback(err, ret);
        }
      });
    } catch (err) {
      console.error('[DataShareServer]: [delete] error' + err);
    }
    console.log('[DataShareServer]: [delete] leave');
  }

  async query(uri, predicates, columns, callback) {
    console.log('[DataShareServer]: [query] enter');
    if (predicates == null || predicates == undefined) {
      console.error('[DataShareServer]: [query] invalid predicates');
    }
    console.log('[DataShareServer]: [query]  values = ' + columns);
    console.log('[DataShareServer]: [query]  values = ' + JSON.stringify(columns));
    console.log('[DataShareServer]: [query]  predicates = ' + predicates);
    console.log('[DataShareServer]: [query]  predicates = ' + JSON.stringify(predicates));
    try {
      await rdbStore.query(TBL_NAME, predicates, columns, (err, resultSet) => {
        console.log('[DataShareServer]: [query] ret: ' + resultSet);
        if (resultSet != undefined) {
          console.log('[DataShareServer]: [query] resultSet.rowCount: ' + resultSet.rowCount);
        }
        if (callback != undefined) {
          callback(err, resultSet);
        }
      });
    } catch (err) {
      console.error('[DataShareServer]: [query] error' + err);
    }

    console.log('[DataShareServer]: [query] leave');
  }

  async getType(uri: string, callback) {
    console.log('[DataShareServer]: [getType] enter');
    let ret = "image";
    console.log('[DataShareServer]: [getType] leave, ret:' + ret);
    let err = {
      "code": 0
    };
    await callback(err, ret);
    return ret;
  }

  async batchInsert(uri: string, valueBuckets, callback) {
    console.log('[DataShareServer]: [batchInsert] enter');
    if (valueBuckets == null || valueBuckets.length == undefined) {
      console.error('[DataShareServer]: <<Provider>> [batchInsert] invalid valueBuckets');
      return;
    }
    console.log('[DataShareServer]: [batchInsert] valueBuckets.length:' + valueBuckets.length);
    let resultNum = valueBuckets.length
    await valueBuckets.forEach(vb => {
      console.log('[DataShareServer]: [batchInsert] vb:' + JSON.stringify(vb));
      rdbStore.insert(TBL_NAME, vb, function (err, ret) {
        console.log('[DataShareServer]: [batchInsert] callback ret:' + ret);
        if (callback != undefined) {
          callback(err, resultNum);
        }
      });
    });
    console.log('[DataShareServer]: [batchInsert] leave');
  }

  async normalizeUri(uri: string, callback) {
    console.log('[DataShareServer]: [normalizeUri] enter');
    let ret = uri;
    let err = {
      "code": 0
    };
    await callback(err, ret);
    console.log('[DataShareServer]: [normalizeUri] leave, ret:' + ret);
  }

  async denormalizeUri(uri: string, callback) {
    console.log('[DataShareServer]: [denormalizeUri] enter');
    let ret = uri;
    let err = {
      "code": 0
    };
    await callback(err, ret);
    console.log('[DataShareServer]: [denormalizeUri] leave, ret:' + ret);
  }
}