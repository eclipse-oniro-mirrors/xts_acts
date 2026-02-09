/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '../../../hypium';
import factory from '@ohos.data.distributedKVStore';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';

import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import hilog from '@ohos.hilog';

const domain = 0xFF00;
const tag = "TestTag";
const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'SchemaFieldNodeId';
let kvManager: factory.KVManager|null = null;
let kvStore : factory.SingleKVStore|null = null;
let entries: factory.Entry[] = [];
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


const TAG = "[testtag >>>>>> ]"


export default function SchemaFieldNode(){
  describe('SchemaFieldNode', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done: () => void) => {
      try {
        hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        // await abilityDelegator.startAbility({
        //   bundleName: 'com.example.kvstoreetstest.static',
        //   abilityName: 'EntryAbility'
        // });
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
      }

      const config : factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context
      };
      console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
      done();

    });

    beforeEach(async (done: () => void) => {
      console.info(TAG + 'beforeEach');
      done();
    });
    afterEach(async (done: () => void) => {
      console.info(TAG + 'afterEach ------------');
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info(TAG + 'afterEach closeKVStore success  ');
      }).catch((err: Error) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + 'afterEach deleteKVStore success');
        kvStore = null;
        done();
      }).catch((err: Error) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });
    });

    afterAll(async (done: () => void) => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0100
     * @tc.desc   FieldNode.type=STRING，default='field'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0100 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = 'field';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0100 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"field"}');
          await kvStore!.put("test_key_2", '{"name":"+"}');
          await kvStore!.put("test_key_3", '{"name":"-"}');
          await kvStore!.put("test_key_4", '{"name":" "}');
          await kvStore!.put("test_key_5", '{"name":"~!@#$%^&*()"}');
          await kvStore!.put("test_key_6", '{"name":"//;,.=-"}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0100 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0100 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0100 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0100 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0100 gentries.length=' + entries.length);
          expect(entries.length).assertEqual(7);
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0100 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0100 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0200
     * @tc.desc   FieldNode.type=STRING，default='+'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0200 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = '+';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0200 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"field1"}');
          await kvStore!.put("test_key_2", '{"name":"+"}');
          await kvStore!.put("test_key_3", '{"name":"-"}');
          await kvStore!.put("test_key_4", '{"name":" "}');
          await kvStore!.put("test_key_5", '{"name":"~!@#$%^&*()"}');
          await kvStore!.put("test_key_6", '{"name":"//;,.=-"}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0200 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0200 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0200 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0200 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0200 gentries.length=' + entries.length);
          expect(entries.length == 7).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0200 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0200 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0300
     * @tc.desc   FieldNode.type=STRING，default='-'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0300 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = '-';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0300 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"field1"}');
          await kvStore!.put("test_key_2", '{"name":"+"}');
          await kvStore!.put("test_key_3", '{"name":"-"}');
          await kvStore!.put("test_key_4", '{"name":" "}');
          await kvStore!.put("test_key_5", '{"name":"~!@#$%^&*()"}');
          await kvStore!.put("test_key_6", '{"name":"//;,.=-"}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0300 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0300 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0300 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0300 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0300 gentries.length=' + entries.length);
          expect(entries.length == 7).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0300 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0300 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0400
     * @tc.desc   FieldNode.type=STRING，default=' '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0400 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = ' ';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0400 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"field1"}');
          await kvStore!.put("test_key_2", '{"name":"+"}');
          await kvStore!.put("test_key_3", '{"name":"-"}');
          await kvStore!.put("test_key_4", '{"name":" "}');
          await kvStore!.put("test_key_5", '{"name":"~!@#$%^&*()"}');
          await kvStore!.put("test_key_6", '{"name":"//;,.=-"}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0400 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0400 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0400 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0400 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0400 gentries.length=' + entries.length);
          expect(entries.length == 7).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0400 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0400 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0500
     * @tc.desc   FieldNode.type=STRING，default='~!@#$%^&*()'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0500 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = '~!@#$%^&*()';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0500 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"field1"}');
          await kvStore!.put("test_key_2", '{"name":"+"}');
          await kvStore!.put("test_key_3", '{"name":"-"}');
          await kvStore!.put("test_key_4", '{"name":" "}');
          await kvStore!.put("test_key_5", '{"name":"~!@#$%^&*()"}');
          await kvStore!.put("test_key_6", '{"name":"//;,.=-"}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0500 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0500 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0500 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0500 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0500 gentries.length=' + entries.length);
          expect(entries.length == 7).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0500 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0500 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0600
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0600
     * @tc.desc   FieldNode.type=STRING，default='//;,.=-'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0600 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = '//;,.=-';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0600 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"field1"}');
          await kvStore!.put("test_key_2", '{"name":"+"}');
          await kvStore!.put("test_key_3", '{"name":"-"}');
          await kvStore!.put("test_key_4", '{"name":" "}');
          await kvStore!.put("test_key_5", '{"name":"~!@#$%^&*()"}');
          await kvStore!.put("test_key_6", '{"name":"//;,.=-"}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0600 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0600 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0600 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0600 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0600 gentries.length=' + entries.length);
          expect(entries.length == 7).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0600 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0600 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0700
     * @tc.desc   FieldNode.type=STRING，default='3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0700 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = '3';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0700 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"3"}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0700 Put success 3');

          await kvStore!.put("test_key_1", '{"name":4}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0700 Put success 4');
        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0700 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0700 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0700 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0700 gentries.length=' + entries.length);
          expect(entries.length == 1).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0700 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0700 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0800
     * @tc.desc   FieldNode.type=STRING，default='true'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0800 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = 'true';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0800 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":"true"}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0800 Put success true');

          await kvStore!.put("test_key_1", '{"name":true}');
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0800 Put success true 222');
        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0800 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_STRING_0800 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0800 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0800 gentries.length=' + entries.length);
          expect(entries.length == 1).assertTrue();
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0800 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0800 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_STRING_0900
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_STRING_0900
     * @tc.desc   FieldNode('+- *#')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_STRING_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_STRING_0900 begin---------  ');

        let name = new factory.FieldNode('+- *#');
        name.type = factory.ValueType.STRING;
        name.nullable = true;

        name.defaultValue = '+';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_STRING_0900 getKVStore success');
          expect(null).assertFail();
          done();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_STRING_0900 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(err != null).assertTrue();
          done();
        });


      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_STRING_0900 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_DOUBLE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_DOUBLE_0100
     * @tc.desc   FieldNode.type=DOUBLE，default='3.21'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_DOUBLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_DOUBLE_0100 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.DOUBLE;
        name.nullable = true;
        name.defaultValue = '3.21';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":1.11}');
          await kvStore!.put("test_key_2", '{"name":2.11}');
          await kvStore!.put("test_key_3", '{"name":3.11}');
          await kvStore!.put("test_key_4", '{"name":4}');
          await kvStore!.put("test_key_5", '{"name":5}');
          await kvStore!.put("test_key_6", '{"name":6}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 gentries.length=' + entries.length);
          expect(entries.length).assertEqual(7);
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0100 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_SchemaFieldNode_DOUBLE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_DOUBLE_0200
     * @tc.desc   FieldNode.type=DOUBLE，default='field', 失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_DOUBLE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_DOUBLE_0200 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.DOUBLE;
        name.nullable = true;

        name.defaultValue = 'field';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0200 getKVStore success');
          expect(null).assertFail();
          done();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0200 getKVStore err ' + `, err=${err}, err.code=${err.code}, message=${err.message}`);
          expect(err != null).assertTrue();
          done();
        });


      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0200 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_SchemaFieldNode_DOUBLE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_DOUBLE_0300
     * @tc.desc   FieldNode.type=DOUBLE，default='+-  ', 失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_DOUBLE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_DOUBLE_0300 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.DOUBLE;
        name.nullable = true;

        name.defaultValue = '+-  ';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0300 getKVStore success');
          expect(null).assertFail();
          done();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0300 getKVStore err ' + `, err=${err}, err.code=${err.code}, message=${err.message}`);
          expect(err != null).assertTrue();
          done();
        });


      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0300 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_DOUBLE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_DOUBLE_0400
     * @tc.desc   FieldNode.type=DOUBLE，default='~!@#$%^&*()//;,.=-', 失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_DOUBLE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_DOUBLE_0400 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.DOUBLE;
        name.nullable = true;

        name.defaultValue = '~!@#$%^&*()//;,.=-';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0400 getKVStore success');
          expect(null).assertFail();
          done();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0400 getKVStore err ' + `, err=${err}, err.code=${err.code}, message=${err.message}`);
          expect(err != null).assertTrue();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0400 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_DOUBLE_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_DOUBLE_0500
     * @tc.desc   FieldNode.type=DOUBLE，default='true', 失败
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_DOUBLE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_DOUBLE_0500 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.DOUBLE;
        name.nullable = true;
        name.defaultValue = 'true';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_DOUBLE_0500 getKVStore success');
          expect(null).assertFail();
          done();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0500 getKVStore err ' + `, err=${err}, err.code=${err.code}, message=${err.message}`);
          expect(err != null).assertTrue();
          done();
        });


      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_DOUBLE_0500 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0100
     * @tc.desc   FieldNode.type=BOOLEAN，default='true'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0100 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;

        name.defaultValue = 'true';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":true}');
          await kvStore!.put("test_key_2", '{"name":true}');
          await kvStore!.put("test_key_3", '{"name":true}');
          await kvStore!.put("test_key_4", '{"name":false}');
          await kvStore!.put("test_key_5", '{"name":false}');
          await kvStore!.put("test_key_6", '{"name":false}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 gentries.length=' + entries.length);
          expect(entries.length).assertEqual(7);
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0100 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0101
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0101
     * @tc.desc   FieldNode.type=BOOLEAN，default='false'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0101 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;
        name.defaultValue = 'false';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 getKVStore success');
          expect(store != null).assertTrue();

          await kvStore!.put("test_key_1", '{"name":true}');
          await kvStore!.put("test_key_2", '{"name":true}');
          await kvStore!.put("test_key_3", '{"name":true}');
          await kvStore!.put("test_key_4", '{"name":false}');
          await kvStore!.put("test_key_5", '{"name":false}');
          await kvStore!.put("test_key_6", '{"name":false}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 start Query ...');
        await kvStore!.getEntries('test_key_').then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 gentries.length=' + entries.length);
          expect(entries.length).assertEqual(7);
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0101 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0102
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0102
     * @tc.desc   FieldNode.type=BOOLEAN，default='TRUE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0102 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;
        name.defaultValue = 'TRUE';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0102 getKVStore success');
          expect(null).assertFail();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0102 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(err != null).assertTrue();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0102 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0103
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0103
     * @tc.desc   FieldNode.type=BOOLEAN，default='FALSE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0103 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;
        name.defaultValue = 'FALSE';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0103 getKVStore success');
          expect(null).assertFail();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0103 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(err != null).assertTrue();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0103 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0200
     * @tc.desc   FieldNode.type=BOOLEAN，default='field'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0200 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;
        name.defaultValue = 'field';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0200 getKVStore success');
          expect(null).assertFail();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0200 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(err != null).assertTrue();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0200 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0300
     * @tc.desc   FieldNode.type=BOOLEAN，default='+-  '
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0300 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;
        name.defaultValue = '+-  ';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0300 getKVStore success');
          expect(null).assertFail();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0300 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(err != null).assertTrue();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0300 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0400
     * @tc.desc   FieldNode.type=BOOLEAN，default='~!@#$%^&*()//;,.=-'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0400 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;
        name.defaultValue = '~!@#$%^&*()//;,.=-';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0400 getKVStore success');
          expect(null).assertFail();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0400 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(err != null).assertTrue();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0400 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_BOOLEAN_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_SchemaFieldNode_BOOLEAN_0500
     * @tc.desc   FieldNode.type=BOOLEAN，default='0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_BOOLEAN_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_BOOLEAN_0500 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.BOOLEAN;
        name.nullable = true;
        name.defaultValue = '0';

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0500 getKVStore success');
          expect(null).assertFail();

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0500 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(err != null).assertTrue();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_BOOLEAN_0500 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.name   SUB_SchemaFieldNode_Long_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SUB_SchemaFieldNode_Long_0100
     * @tc.desc   FieldNode.type=STRING，default='field'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_SchemaFieldNode_Long_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        console.info(TAG + ' --------- SUB_SchemaFieldNode_Long_0100 begin---------  ');

        let name = new factory.FieldNode('name');
        name.type = factory.ValueType.LONG;
        name.nullable = true;
        name.defaultValue = "1";

        let schema = new factory.Schema();
        schema.root.appendChild(name);
        schema.indexes = [];
        schema.mode = 1;
        options.kvStoreType = factory.KVStoreType.SINGLE_VERSION;
        options.schema = schema;

        await kvManager!.getKVStore(TEST_STORE_ID, options).then(async (store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'SUB_SchemaFieldNode_Long_0100 getKVStore success');
          expect(store != null).assertTrue();
          await kvStore!.put("test_key_1", '{"name":1323213214411323113}');
          await kvStore!.put("test_key_2", '{"name":1323213214411323113}');
          await kvStore!.put("test_key_3", '{"name":1323213214411323113}');
          await kvStore!.put("test_key_4", '{"name":1323213214411323113}');
          await kvStore!.put("test_key_5", '{"name":1323213214411323113}');
          await kvStore!.put("test_key_6", '{"name":1323213214411323113}');
          await kvStore!.put("test_key_7", '{}');
          console.info(TAG + 'SUB_SchemaFieldNode_Long_0100 Put success');

        }).catch((err: Error) => {
          console.error(TAG + 'SUB_SchemaFieldNode_Long_0100 getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        console.info(TAG + 'SUB_SchemaFieldNode_Long_0100 start Query ...');
        await kvStore!.getEntries("test_key_").then((entries: factory.Entry[]) => {
          console.info(TAG + 'SUB_SchemaFieldNode_Long_0100 gentries=' + JSON.stringify(entries));
          console.info(TAG + 'SUB_SchemaFieldNode_Long_0100 gentries.length=' + entries.length);
          expect(entries.length).assertEqual(7);
          done();
        }).catch((err: Error) => {
          console.info(TAG + 'SUB_SchemaFieldNode_Long_0100 get fail ' + err);
          expect(null).assertFail();
          done();
        });

      } catch (e: Error) {
        console.error(TAG + 'SUB_SchemaFieldNode_Long_0100 catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    console.info(TAG + '-------------------describe SchemaFieldNode  end-------------------');
  })
}