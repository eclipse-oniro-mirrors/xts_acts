/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { commonType, distributedDataObject } from '@kit.ArkData';
import { Driver, ON } from '@kit.TestKit';
import distributedObject from '@ohos.data.distributedDataObject';
let tag: string = 'DataObject: ';
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let context: common.UIAbilityContext | undefined;

let getPermission = async () => {
  console.info('getPermission is start');
  let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.DISTRIBUTED_DATASYNC'], (err: BusinessError, data: PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms: number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
    console.info('driver is ${JSON.stringify(driver)}');
    await sleep(1000);
    let button = await driver.findComponent(ON.text('始终允许'));
    if (button) {
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

class SourceObject {
  name: string
  age: number
  isVis: boolean

  constructor(name: string, age: number, isVis: boolean) {
    this.name = name
    this.age = age
    this.isVis = isVis
  }
}

let source: SourceObject = new SourceObject("jack", 18, false);

export default function DataObjectAddAPITest() {
  beforeAll(async (done: Function) => {
    await getPermission();
    await sleep(1000);
    await drivenFn();
    await sleep(1000);
    context = AppStorage.get('context') as common.UIAbilityContext;
    done()
  })
  describe("DataObjectAddAPITest", (): void => {
    /**
    * @tc.name   SUB_DistributedData_DataObject_CreateDistributedObjectTest_0100
    * @tc.number testSUB_DistributedData_DataObject_CreateDistributedObjectTest_0100
    * @tc.desc   unifiedDataChannel createDistributedObject interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_DataObject_CreateDistributedObjectTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_DataObject_CreateDistributedObjectTest_0100 start');
      try {
        let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(undefined);
        console.log(tag, `${JSON.stringify(g_object)}`);
        expect(JSON.stringify(g_object)).assertEqual('null');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'SUB_DistributedData_DataObject_CreateDistributedObjectTest_0100 end');
    })

    /**
    * @tc.name   SUB_DistributedData_DataObject_CreateDistributedObjectTest_0200
    * @tc.number testSUB_DistributedData_DataObject_CreateDistributedObjectTest_0200
    * @tc.desc   unifiedDataChannel createDistributedObject interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_DataObject_CreateDistributedObjectTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_DataObject_CreateDistributedObjectTest_0200 start');
      try {
        let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(null);
        console.log(tag, `${JSON.stringify(g_object)}`);
        expect(JSON.stringify(g_object)).assertEqual('null');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'SUB_DistributedData_DataObject_CreateDistributedObjectTest_0200 end');
    })

    /**
    * @tc.name   SUB_DistributedData_DataObject_CreateTest_0100
    * @tc.number testSUB_DistributedData_DataObject_CreateTest_0100
    * @tc.desc   unifiedDataChannel addRecord interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_DataObject_CreateTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_DataObject_CreateTest_0100 start');
      try {
        let g_object = distributedDataObject.create(null, source);
        console.log(tag, `${JSON.stringify(g_object)}`);
        expect(JSON.stringify(g_object)).assertContain('"__context":null')
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'SUB_DistributedData_DataObject_CreateTest_0100 end');
    })

    /**
    * @tc.name   SUB_DistributedData_DataObject_CreateTest_0200
    * @tc.number testSUB_DistributedData_DataObject_CreateTest_0200
    * @tc.desc   unifiedDataChannel create interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_DataObject_CreateTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_DataObject_CreateTest_0200 start');
      try {
        let g_object = distributedDataObject.create(context, null);
        console.log(tag, `${JSON.stringify(g_object)}`);
        expect(JSON.stringify(g_object)).assertEqual('null');
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + 'SUB_DistributedData_DataObject_CreateTest_0200 end');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0100
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0100
     * @tc.desc   Test Object SetSessionId boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0100 start ************')
      let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(source);
      try {
        let result = await g_object.setSessionId(null);
        expect(result).assertEqual(false);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0100 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0200
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0200
     * @tc.desc   Test Object SetSessionId boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0200 start ************')
      let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(source);
      try {
        let result = await g_object.setSessionId('');
        expect(result).assertEqual(false);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0200 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0300
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0300
     * @tc.desc   Test Object SetSessionId boolean.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0300 start ************')
      let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(source);
      try {
        let result = await g_object.setSessionId(undefined);
        expect(result).assertEqual(false);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0300 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0400
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0400
     * @tc.desc   Test Object SetSessionId callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0400 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      await g_object.setSessionId('10');
      expect(g_object['__sessionId']).assertEqual('10')
      try {
        g_object.setSessionId(null, () => {
          expect(g_object['__sessionId']).assertEqual(undefined)
        });
        done();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
        done();
      }
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0400 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0500
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0500
     * @tc.desc   Test Object SetSessionId callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0500 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      await g_object.setSessionId('210');
      expect(g_object['__sessionId']).assertEqual('210')
      try {
        g_object.setSessionId('', () => {
          expect(g_object['__sessionId']).assertEqual(undefined)
        });
        done();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0500 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0600
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0600
     * @tc.desc   Test Object SetSessionId callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0600 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      let g_object_2: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      g_object.setSessionId('321123', () => {
        console.info("join session");
      });
      try {
        g_object_2.setSessionId('321123', () => {
          console.info("join session");
        });
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual('15400001');
      }
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0600 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0700
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0700
     * @tc.desc   Test Object SetSessionId promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0700 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      let g_object_2: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      await g_object.setSessionId('43211234');
      try {
        await g_object_2.setSessionId('43211234');
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual('15400001');
      }
      console.log(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0700 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0800
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0800
     * @tc.desc   Test DataObject setSessionId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0800 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      await g_object.setSessionId('3210');
      expect(g_object["__sessionId"]).assertEqual('3210');
      try {
        await g_object.setSessionId('');
        expect(g_object["__sessionId"]).assertEqual(undefined);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0800 end ************')
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_SetSessionIdTest_0900
     * @tc.number testSUB_DistributedData_DataObject_SetSessionIdTest_0900
     * @tc.desc   Test DataObject setSessionId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_SetSessionIdTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0900 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, source);
      await g_object.setSessionId('43210');
      expect(g_object["__sessionId"]).assertEqual('43210');
      try {
        await g_object.setSessionId(null);
        expect(g_object["__sessionId"]).assertEqual(undefined);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_SetSessionIdTest_0900 end ************')
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_BindAssetStoreTest_0100
     * @tc.number testSUB_DistributedData_DataObject_BindAssetStoreTest_0100
     * @tc.desc   Test DataObject bindAssetStore callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_BindAssetStoreTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0100 start ************')
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset007: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      await g_object.setSessionId("sessionBA9");
      console.log(tag, `setSessionId success.`)
      let bindInfo: distributedObject.BindInfo = {
        storeName: "name1",
        tableName: "table1",
        primaryKey: {
          "data1": 123
        },
        field: "field1",
        assetName: "asset1"
      };
      try {
        g_object.bindAssetStore(undefined, bindInfo, (err, data) => {
          expect().assertFail();
          done();
        });
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0100 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_BindAssetStoreTest_0200
     * @tc.number testSUB_DistributedData_DataObject_BindAssetStoreTest_0200
     * @tc.desc   Test DataObject bindAssetStore callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_BindAssetStoreTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0200 start ************')
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset007: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      await g_object.setSessionId("sessionBA10");
      console.log(tag, `setSessionId success.`)
      let bindInfo: distributedObject.BindInfo = {
        storeName: "name1",
        tableName: "table1",
        primaryKey: {
          "data1": 123
        },
        field: "field1",
        assetName: "asset1"
      };
      try {
        g_object.bindAssetStore('', bindInfo, (err, data) => {
          expect().assertFail();
          done();
        });
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0200 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_BindAssetStoreTest_0300
     * @tc.number testSUB_DistributedData_DataObject_BindAssetStoreTest_0300
     * @tc.desc   Test DataObject bindAssetStore promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_BindAssetStoreTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0300 start ************')
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset009: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      await g_object.setSessionId("sessionBA11");
      console.log(tag, `setSessionId success.`)
      try {
        await g_object.bindAssetStore("asset009", undefined);
        expect().assertFail();
      } catch (error) {
        console.info(`V9testbindAssetStore009 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code).assertEqual('401');
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0300 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_BindAssetStoreTest_0400
     * @tc.number testSUB_DistributedData_DataObject_BindAssetStoreTest_0400
     * @tc.desc   Test DataObject bindAssetStore promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_BindAssetStoreTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0400 start ************')
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset007: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      let bindInfo: distributedObject.BindInfo = {
        storeName: "name1",
        tableName: "table1",
        primaryKey: {
          "data1": 123
        },
        field: "field1",
        assetName: "asset1"
      };
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA12");
      console.log(tag, `setSessionId success.`)
      try {
        await g_object.bindAssetStore('', bindInfo);
        expect().assertFail();
      } catch (error) {
        console.info(`V9testbindAssetStore009 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code).assertEqual('401');
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0400 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_BindAssetStoreTest_0500
     * @tc.number testSUB_DistributedData_DataObject_BindAssetStoreTest_0500
     * @tc.desc   Test DataObject bindAssetStore promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_BindAssetStoreTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0500 start ************')
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset007: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      let bindInfo: distributedObject.BindInfo = {
        storeName: "name1",
        tableName: "table1",
        primaryKey: {
          "data1": 123
        },
        field: "field1",
        assetName: "asset1"
      };
      await g_object.setSessionId("sessionBA13");
      console.log(tag, `setSessionId success.`)
      try {
        await g_object.bindAssetStore(null, bindInfo);
        expect().assertFail();
      } catch (error) {
        console.info(`V9testbindAssetStore009 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code).assertEqual('401');
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0500 end ************');
    })

    /**
     * @tc.name   SUB_DistributedData_DataObject_BindAssetStoreTest_0600
     * @tc.number testSUB_DistributedData_DataObject_BindAssetStoreTest_0600
     * @tc.desc   Test DataObject bindAssetStore promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_DataObject_BindAssetStoreTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0600 start ************')
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset007: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      let bindInfo: distributedObject.BindInfo = {
        storeName: "name1",
        tableName: "table1",
        primaryKey: {
          "data1": 123
        },
        field: "field1",
        assetName: "asset1"
      };
      await g_object.setSessionId("sessionBA14");
      console.log(tag, `setSessionId success.`)
      try {
        await g_object.bindAssetStore(undefined, bindInfo);
        expect().assertFail();
      } catch (error) {
        console.info(`V9testbindAssetStore009 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code).assertEqual('401');
      }
      console.info(tag + '************ SUB_DistributedData_DataObject_BindAssetStoreTest_0600 end ************');
    })
  });
}