/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import taskpool from '@ohos.taskpool';
import collections from '@arkts.collections';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import relationalStore from '@ohos.data.relationalStore';
import sendableRelationalStore from '@ohos.data.sendableRelationalStore'

const TAG = "[RELATIONAL_STORE_JSKITS_TEST]";
const TABLE = 'test';
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS " + TABLE + " (" +
  "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "nil TEXT, " +
  "name TEXT NOT NULL, " +
  "age INTEGER, " +
  "salary REAL, " +
  "blobType BLOB, " +
  "blobFloat floatvector(128), " +
  "passed BOOLEAN, " +
  "bigValue UNLIMITED INT, " +
  "data1 ASSET, " +
  "data2 ASSETS)";
const asset1: relationalStore.Asset = {
  name: 'hangman',
  uri: '//path/example',
  path: '//path/example',
  createTime: 'createTime1',
  modifyTime: 'modifyTime1',
  size: 'size1',
  status: relationalStore.AssetStatus.ASSET_NORMAL,
};
const asset2: relationalStore.Asset = {
  name: 'hangman2',
  uri: '//path/example',
  path: '//path/example',
  createTime: 'createTime1',
  modifyTime: 'modifyTime1',
  size: 'size1',
  status: relationalStore.AssetStatus.ASSET_NORMAL,
}
const u8 = new Uint8Array([1, 2, 3]);
const valuesBucket1: relationalStore.ValuesBucket = {
  nil: null,
  age: 18,
  name: "hangman",
  salary: 100.5,
  blobType: u8,
  blobFloat: new Float32Array([.125, 0.1875]),
  passed: true,
  bigValue: BigInt('15822401018187971961171'),
  data1: asset1,
  data2: [asset1, asset2],
};
const valuesBucket2: sendableRelationalStore.NonSendableBucket = {
  nil: null,
  age: 18,
  name: "wangman",
  salary: 100.5,
  blobType: u8,
  blobFloat: new Float32Array([.125, 0.1875]),
  passed: true,
  bigValue: BigInt('15822401018187971961171'),
  data1: asset1,
  data2: [asset1, asset2],
}

@Concurrent
function checkInTaskPool(data: sendableRelationalStore.ValuesBucket) {
  if (data.get('nil') !== null) return new Error('nil check failed');
  if (data.get('age') !== 18) return new Error('age check failed');
  if (data.get('name') !== "wangman") return new Error('name check failed');
  if (data.get('salary') !== 100.5) return new Error('salary check failed');
  if (data.get('passed') !== Number(true)) return new Error('passed check failed');

  const blobType: sendableRelationalStore.ValueType|undefined= data.get('blobType');
  if (!(blobType instanceof collections.Uint8Array)) {
    return new Error('blobType type check failed');
  }
  if ((blobType as collections.Uint8Array)[1] !== 2) {
    return new Error('blobType value check failed');
  }

  if ((typeof data.get('bigValue')) !== 'bigint') return new Error('bigValue type check failed');
  if (data.get('bigValue') !== BigInt('15822401018187971961171')) return new Error('bigValue value check failed');

  const data1 = data.get('data1') as relationalStore.Asset;
  if (!data1) return new Error('Asset check failed, Asset is：' + data1);
  if (data1.name !== 'hangman') return new Error('Asset Attr:name check failed');
  if (data1.uri !== '//path/example') return new Error('Asset Attr:uri check failed');
  if (data1.path !== '//path/example') return new Error('Asset Attr:path check failed');
  if (data1.createTime !== 'createTime1') return new Error('Asset Attr:createTime check failed');
  if (data1.modifyTime !== 'modifyTime1') return new Error('Asset Attr:modifyTime check failed');
  if (data1.size !== 'size1') return new Error('Asset Attr:size check failed');
  if (data1.status !== relationalStore.AssetStatus.ASSET_INSERT) return new Error('Asset Attr:status check failed');

  const data2: sendableRelationalStore.ValueType|undefined = data.get('data2');
  if (!(data2 instanceof collections.Array)) return false;
  if (data2.length !== 2) return false;
  return true;
}

@Concurrent
function compareAsset(sendableAsset: sendableRelationalStore.Asset | sendableRelationalStore.NonSendableAsset, asset: relationalStore.Asset) {
  if (sendableAsset.name       !== asset.name)       return new Error('Asset compare failed, attr:name, ' + sendableAsset.name + ' ' + asset.name);
  if (sendableAsset.uri        !== asset.uri)        return new Error('Asset compare failed, attr:uri');
  if (sendableAsset.path       !== asset.path)       return new Error('Asset compare failed, attr:path');
  if (sendableAsset.createTime !== asset.createTime) return new Error('Asset compare failed, attr:createTime');
  if (sendableAsset.modifyTime !== asset.modifyTime) return new Error('Asset compare failed, attr:modifyTime');
  if (sendableAsset.size       !== asset.size)       return new Error('Asset compare failed, attr:size');
  return true;
}

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "SendableTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
let rdbStore: relationalStore.RdbStore | undefined = undefined;
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

export default function rdbStoreSendableTest() {
  describe('rdbStoreSendableTest', () => {
    beforeAll(async (done: Function) => {
      console.info(TAG + 'beforeAll');
      try {
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST);
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
      }
      done();
    });

    beforeEach(() => {
      console.info(TAG + 'beforeEach');
    });

    afterEach(() => {
      console.info(TAG + 'afterEach');
    });

    afterAll(async () => {
      console.info(TAG + 'afterAll');
      await relationalStore.deleteRdbStore(context, "QueryTest.db");
    });

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0100
     * @tc.name testRdbStoreSendable0001
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0001', 0, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreSendable0001 start *************");
      if (!rdbStore) {
        expect().assertFail();
        return;
      }
      try {
        let sendableValuesBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket(valuesBucket2);
        const rowId = rdbStore.insertSync(TABLE, sendableValuesBucket);
        expect(rowId).assertEqual(1);
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* testRdbStoreSendable0001 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0200
     * @tc.name testRdbStoreSendable0002
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0002', 0, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreSendable0002 start *************");
      if (!rdbStore) {
        expect(null).assertFail();
        return;
      }
      try {
        const rowId = rdbStore.insertSync(TABLE, valuesBucket1);
        expect(rowId).assertEqual(2);
        const predicates = new relationalStore.RdbPredicates(TABLE);
        predicates.equalTo('name', valuesBucket1.name);
        const resultSet = await rdbStore!.query(predicates);
        const hasFirst = resultSet.goToFirstRow();
        expect(hasFirst).assertTrue();
        const sendableValuesBucket: sendableRelationalStore.ValuesBucket = resultSet.getSendableRow();
        const noSendableBucket = valuesBucket1;
        expect(sendableValuesBucket.get('nil')).assertNull();
        expect(sendableValuesBucket.get('age')).assertEqual(noSendableBucket['age']);
        expect(sendableValuesBucket.get('name')).assertEqual(noSendableBucket['name']);
        expect(sendableValuesBucket.get('salary')).assertEqual(noSendableBucket['salary']);
        expect(sendableValuesBucket.get('passed')).assertEqual(Number(noSendableBucket['passed']));
        const blobType: sendableRelationalStore.ValueType|undefined = sendableValuesBucket.get('blobType');
        if (blobType instanceof collections.Uint8Array) {
          expect((blobType as collections.Uint8Array)[1]).assertEqual(2);
        } else {
          console.log(TAG + 'collections.Uint8Array type check failed')
          expect().assertFail();
        }
        expect(typeof sendableValuesBucket.get('bigValue')).assertEqual('bigint');
        expect(sendableValuesBucket.get('bigValue')).assertEqual(noSendableBucket['bigValue']);
        const sendableAsset: sendableRelationalStore.ValueType|undefined = sendableValuesBucket.get('data1');
        const noSendableAsset = noSendableBucket['data1'];
        if (
          sendableAsset &&
            typeof sendableAsset === 'object' &&
            !(sendableAsset instanceof collections.Uint8Array) &&
            !(sendableAsset instanceof collections.Array) &&
            !(sendableAsset instanceof collections.Float32Array) &&
            noSendableAsset &&
            typeof noSendableAsset === 'object' &&
            !(noSendableAsset instanceof Uint8Array) &&
            !(noSendableAsset instanceof Float32Array) &&
            !(noSendableAsset instanceof Array)
        ) {
          const assetCompare = compareAsset(sendableAsset, noSendableAsset);
          expect(assetCompare).assertTrue();
          expect(sendableAsset.status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
        }
        const sendableAssets: sendableRelationalStore.ValueType|undefined = sendableValuesBucket.get('data2');
        const noSendableAssets = noSendableBucket['data2'];
        if (sendableAssets instanceof collections.Array && noSendableAssets instanceof Array) {
          expect(sendableAssets.length).assertEqual(noSendableAssets.length);
          expect(compareAsset(sendableAssets[0], noSendableAssets[0])).assertTrue();
          expect(compareAsset(sendableAssets[1], noSendableAssets[1])).assertTrue();
          expect(sendableAssets[0].status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
          expect(sendableAssets[1].status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
        } else {
          expect(null).assertFail();
        }
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* testRdbStoreSendable0002 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0300
     * @tc.name testRdbStoreSendable0003
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0003', 0, async (done: () => void) => {
      console.log(TAG + "************* testRdbStoreSendable0003 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates(TABLE);
        predicates.equalTo('name', valuesBucket2.name);
        const resultSet = await rdbStore!.query(predicates);
        const hasFirst = resultSet.goToFirstRow();
        expect(hasFirst).assertTrue();
        const valuesBucket = resultSet.getRow();
        const noSendableBucket = valuesBucket2;
        expect(valuesBucket['nil']).assertNull();
        expect(valuesBucket['age']).assertEqual(noSendableBucket['age']);
        expect(valuesBucket['name']).assertEqual(noSendableBucket['name']);
        expect(valuesBucket['salary']).assertEqual(noSendableBucket['salary']);
        expect(valuesBucket['passed']).assertEqual(Number(noSendableBucket['passed']));
        const blobType = valuesBucket['blobType'];
        if (blobType instanceof Uint8Array) {
          expect(blobType[1]).assertEqual(2);
        } else {
          console.log(TAG + 'collections.Uint8Array type check failed')
          expect(null).assertFail();
        }
        expect(typeof valuesBucket['bigValue']).assertEqual('bigint');
        expect(valuesBucket['bigValue']).assertEqual(noSendableBucket['bigValue']);
        const sendableAsset = valuesBucket['data1'];
        const noSendableAsset = noSendableBucket['data1'];
        if (
          sendableAsset &&
            typeof sendableAsset === 'object' &&
            !(sendableAsset instanceof Uint8Array) &&
            !(sendableAsset instanceof Array) &&
            !(sendableAsset instanceof Float32Array) &&
            noSendableAsset &&
            typeof noSendableAsset === 'object' &&
            !(noSendableAsset instanceof Uint8Array) &&
            !(noSendableAsset instanceof Float32Array) &&
            !(noSendableAsset instanceof Array)
        ) {
          const assetCompare = compareAsset(sendableAsset, noSendableAsset);
          expect(assetCompare).assertTrue();
          expect(sendableAsset.status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
        }
        const sendableAssets = valuesBucket['data2'];
        const noSendableAssets = noSendableBucket['data2'];
        if (sendableAssets instanceof Array && noSendableAssets instanceof Array) {
          expect(sendableAssets.length).assertEqual(noSendableAssets.length);
          expect(compareAsset(sendableAssets[0], noSendableAssets[0])).assertTrue();
          expect(compareAsset(sendableAssets[1], noSendableAssets[1])).assertTrue();
          expect(sendableAssets[0].status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
          expect(sendableAssets[1].status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
        } else {
          expect(null).assertFail();
        }
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }
      done();
      console.log(TAG + "************* testRdbStoreSendable0003 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0400
     * @tc.name testRdbStoreSendable0004
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0004', 0, async () => {
      console.log(TAG + "************* testRdbStoreSendable0004 start *************");
      try {
        const sendableValuesBucket: sendableRelationalStore.ValuesBucket = sendableRelationalStore.toSendableValuesBucket(valuesBucket1);
        const noSendableBucket = valuesBucket1;
        expect(sendableValuesBucket.get('nil')).assertNull();
        expect(sendableValuesBucket.get('age')).assertEqual(noSendableBucket['age']);
        expect(sendableValuesBucket.get('name')).assertEqual(noSendableBucket['name']);
        expect(sendableValuesBucket.get('salary')).assertEqual(noSendableBucket['salary']);
        expect(sendableValuesBucket.get('passed')).assertEqual(noSendableBucket['passed']);
        const blobType: sendableRelationalStore.ValueType|undefined = sendableValuesBucket.get('blobType');
        if (blobType instanceof collections.Uint8Array) {
          expect((blobType as collections.Uint8Array)[1]).assertEqual(2);
        } else {
          expect(null).assertFail();
        }
        expect(typeof sendableValuesBucket.get('bigValue')).assertEqual('bigint');
        expect(sendableValuesBucket.get('bigValue')).assertEqual(noSendableBucket['bigValue']);
        const sendableAsset: sendableRelationalStore.ValueType|undefined = sendableValuesBucket.get('data1');
        const noSendableAsset = noSendableBucket['data1'];
        if (
          sendableAsset &&
            typeof sendableAsset === 'object' &&
            !(sendableAsset instanceof collections.Uint8Array) &&
            !(sendableAsset instanceof collections.Array) &&
            !(sendableAsset instanceof collections.Float32Array) &&
            noSendableAsset &&
            typeof noSendableAsset === 'object' &&
            !(noSendableAsset instanceof Uint8Array) &&
            !(noSendableAsset instanceof Float32Array) &&
            !(noSendableAsset instanceof Array)
        ) {
          const assetCompare = compareAsset(sendableAsset, noSendableAsset);
          expect(assetCompare).assertTrue();
          expect(sendableAsset.status).assertEqual(relationalStore.AssetStatus.ASSET_NORMAL);
        } else {
          expect(null).assertFail();
        }
        const sendableAssets: sendableRelationalStore.ValueType|undefined = sendableValuesBucket.get('data2');
        const normalAssets = noSendableBucket['data2'];
        if (sendableAssets instanceof collections.Array && normalAssets instanceof Array) {
          expect(sendableAssets.length).assertEqual(normalAssets.length);
          expect(compareAsset(sendableAssets[0], normalAssets[0])).assertTrue();
          expect(compareAsset(sendableAssets[1], normalAssets[1])).assertTrue();
          expect(sendableAssets[0].status).assertEqual(relationalStore.AssetStatus.ASSET_NORMAL);
          expect(sendableAssets[1].status).assertEqual(relationalStore.AssetStatus.ASSET_NORMAL);
        } else {
          expect(null).assertFail();
        }
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }
      console.log(TAG + "************* testRdbStoreSendable0004 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0500
     * @tc.name testRdbStoreSendable0005
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0005', 0, async () => {
      console.log(TAG + "************* testRdbStoreSendable0005 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates(TABLE);
        predicates.equalTo('name', valuesBucket2.name);
        const resultSet = await rdbStore!.query(predicates)
        const hasFirst = resultSet.goToFirstRow();
        expect(hasFirst).assertTrue();
        const sendableValuesBucket: sendableRelationalStore.ValuesBucket = resultSet.getSendableRow();
        const valuesBucket: sendableRelationalStore.NonSendableBucket = sendableRelationalStore.fromSendableValuesBucket(sendableValuesBucket);
        expect(valuesBucket['nil']).assertNull();
        expect(valuesBucket['age']).assertEqual(valuesBucket2['age']);
        expect(valuesBucket['name']).assertEqual(valuesBucket2['name']);
        expect(valuesBucket['salary']).assertEqual(valuesBucket2['salary']);
        expect(valuesBucket['passed']).assertEqual(Number(valuesBucket2['passed']));
        const blobType: relationalStore.ValueType|undefined = valuesBucket['blobType'];
        if (blobType instanceof Uint8Array) {
          expect((blobType as Uint8Array)[1]).assertEqual(2);
        } else {
          console.log(TAG + 'collections.Uint8Array type check failed')
          expect(null).assertFail();
        }
        expect(typeof valuesBucket['bigValue']).assertEqual('bigint');
        expect(valuesBucket['bigValue']).assertEqual(valuesBucket2['bigValue']);
        const asset: relationalStore.ValueType = valuesBucket['data1'];
        const originAsset = valuesBucket2['data1'];
        if (
          asset &&
            typeof asset === 'object' &&
            !(asset instanceof Uint8Array) &&
            !(asset instanceof Float32Array) &&
            !(asset instanceof Array) &&
            originAsset &&
            typeof originAsset === 'object' &&
            !(originAsset instanceof Uint8Array) &&
            !(originAsset instanceof Float32Array) &&
            !(originAsset instanceof Array)
        ) {
          const assetCompare = compareAsset(asset, originAsset);
          console.log(TAG + 'testRdbStoreSendable0005 assertCompare result: ' + assetCompare);
          expect(assetCompare).assertTrue();
          expect(asset.status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
        }
        const assets: relationalStore.ValueType = valuesBucket['data2'];
        const originAssets = valuesBucket2['data2'];
        if (assets instanceof Array && originAssets instanceof Array) {
          expect(assets.length).assertEqual(originAssets.length);
          expect(compareAsset(assets[0], originAssets[0])).assertTrue();
          expect(compareAsset(assets[1], originAssets[1])).assertTrue();
          expect(assets[0].status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
          expect(assets[1].status).assertEqual(relationalStore.AssetStatus.ASSET_INSERT);
        } else {
          expect(null).assertFail();
        }
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }
      console.log(TAG + "************* testRdbStoreSendable0005 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0600
     * @tc.name testRdbStoreSendable0006
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0006', 0, async () => {
      console.log(TAG + "************* testRdbStoreSendable0006 start *************");
      try {
        const sendableAsset: sendableRelationalStore.Asset = sendableRelationalStore.toSendableAsset(asset1);
        const normalAsset: sendableRelationalStore.NonSendableAsset = sendableRelationalStore.fromSendableAsset(sendableAsset);
        expect(compareAsset(sendableAsset, normalAsset)).assertTrue();
        expect(sendableAsset.status).assertEqual(relationalStore.AssetStatus.ASSET_NORMAL);
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }
      console.log(TAG + "************* testRdbStoreSendable0006 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0700
     * @tc.name testRdbStoreSendable0007
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0007', 0, async () => {
      console.log(TAG + "************* testRdbStoreSendable0007 start *************");
      try {
        const sendableAsset: sendableRelationalStore.Asset = sendableRelationalStore.toSendableAsset(asset1);
        expect(compareAsset(sendableAsset, asset1)).assertTrue();
        expect(sendableAsset.status).assertEqual(relationalStore.AssetStatus.ASSET_NORMAL);
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }
      console.log(TAG + "************* testRdbStoreSendable0007 end *************");
    })

    /**
     * @tc.number SUB_DistributedData_SendableRelationStore_SDK_RelationalStoreEtsApiPromiseTest_0800
     * @tc.name testRdbStoreSendable0008
     * @tc.desc Normal test case of sendableRelationalStore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbStoreSendable0008', 0, async () => {
      console.log(TAG + "************* testRdbStoreSendable0008 start *************");
      try {
        const predicates = new relationalStore.RdbPredicates(TABLE);
        predicates.equalTo('name', valuesBucket2.name);
        const resultSet = await rdbStore!.query(predicates)
        const hasFirst = resultSet.goToFirstRow();
        expect(hasFirst).assertTrue();
        const sendableRow: sendableRelationalStore.ValuesBucket = resultSet.getSendableRow();
        const task = new taskpool.Task(checkInTaskPool, sendableRow);
        const taskResult = await taskpool.execute(task);
        expect(taskResult).assertTrue();
      } catch (err) {
        console.log(TAG + "catch err: failed, err: code=" + err.code + " message=" + err.message);
        expect(null).assertFail();
      }
      console.log(TAG + "************* testRdbStoreSendable0008 end *************");
    })
  })
}