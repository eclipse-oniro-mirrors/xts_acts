/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium";
import distributedObject from '@ohos.data.distributedDataObject';
import commonType from '@ohos.data.commonType';
import common from "@ohos.app.ability.common";
import { Driver, ON } from "@kit.TestKit";
import { BusinessError } from "@ohos.base";
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let context1: common.UIAbilityContext | undefined;
const TAG = "OBJECTSTORE_TEST";
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function changeCallback(sessionId: string, changeData: Array<string>) {
  console.info("changeCallback start");
  console.info(TAG + "sessionId:" + " " + sessionId);
  if (changeData != null && changeData != undefined) {
    changeData.forEach(element => {
      console.info(TAG + "data changed !" + element);
    });
  }
  console.info("changeCallback end");
}

function statusCallback1(sessionId: string, networkId: string, status: string) {
  console.info(TAG + "statusCallback1" + " " + sessionId);
}

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
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
      await button1!.click();
      await sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
  }
}

export default function objectStoreTestV9() {
  describe('objectStoreTestV9', () => {
    beforeAll(async (done: () => void) => {
      await abilityDelegator.startAbility({
        bundleName: 'com.example.actsdataobjectstatictest.static',
        abilityName: 'EntryAbility'
      });
      await sleep(5000);
      await drivenFn();
      await sleep(2000);
      context1 = AppStorage.get<common.UIAbilityContext>("context")! as common.UIAbilityContext;
      done();
    });
    beforeEach(() => {
      console.info(TAG + 'beforeEach');
    });
    afterEach(() => {
      console.info(TAG + 'afterEach');
    });
    afterAll(() => {
      console.info(TAG + 'afterAll');
    });
    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_002
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3000
     * @tc.desc   object join session and on,object can receive callback when data has been changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_002 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        try {
          await g_object.setSessionId(undefined) //参数不合法
          console.info("setSessionId success")
        } catch (error) {
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_002 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3100
     * @tc.desc   object join session and on,object can receive callback when data has been changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false };
        let g_object = distributedObject.create(context1!, source);
        await sleep(2000);
        expect(g_object == undefined).assertEqual(false);
        if (g_object) {
          await g_object.setSessionId("session1");
          sleep(2000);
          expect("session1" == g_object["__sessionId"]).assertTrue();
        }
        let g_object1 = distributedObject.create(context1!, source);
        try {
          await g_object1.setSessionId("session1");
        } catch (err) {
          console.info(TAG + 'setSessionId failed' + err.code + err.message);
          expect(err.code).assertEqual(15400001);
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3200
     * @tc.desc   object join session and on,object can receive callback when data has been changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false };
        let g_object = distributedObject.create(context1!, source);
        await sleep(2000);
        expect(g_object == undefined).assertEqual(false);
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004 start *************" + JSON.stringify(g_object));
        g_object.setSessionId("123456").then(() => {
          console.info(TAG + "setSessionId test");
        }).catch((err: Error) => {
          console.info(TAG + err.code + err.message);
          expect().assertFail();
        });
        await sleep(2000);
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + "," + data);
        });
        await sleep(2000);
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_On_001
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2100
     * @tc.desc   object join session and on,object can receive callback when data has been changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_On_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_001 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false };
        let g_object = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        g_object.setSessionId("session1").then(() => {
          console.info("join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });
        await sleep(2000);
        expect("session1" == g_object["__sessionId"]).assertEqual(true);
        console.info(TAG + " start call watch change");
        g_object.onChange((sessionId, changeData) => {
          console.info("SUB_DDM_AppDataFWK_Object_Api9_On_001 callback start.");
          if (changeData != null && changeData != undefined) {
            changeData.forEach(element => {
              console.info(TAG + "data changed !" + element);
            });
          }
          console.info("SUB_DDM_AppDataFWK_Object_Api9_On_001 callback end.");
        });
        if (g_object != undefined && g_object != null) {
          g_object["name"] = "jack1";
          g_object["age"] = 19.0;
          g_object["isVis"] = true;
          expect(g_object["name"] == "jack1").assertEqual(true);
          expect(g_object["age"] == 19.0).assertEqual(true);
          console.info(TAG + " set data success!");
        } else {
          console.info(TAG + " object is null,set name fail");
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_001 end *************");
        g_object.offChange();
        g_object.setSessionId("", (error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_Off_001
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2000
     * @tc.desc   object join session and on&off,object can not receive callback after off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_Off_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Off_001 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false };
        let g_object = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("session5").then(() => {
          console.info("join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });
        expect("session5" == g_object["__sessionId"]).assertEqual(true);
        g_object.onChange(changeCallback);
        console.info(TAG + " start call watch change");
        if (g_object != undefined && g_object != null) {
          g_object["name"] = "jack1";
          g_object["age"] = 19.0;
          g_object["isVis"] = true;
          expect(g_object["name"] == "jack1").assertEqual(true);
          expect(g_object["age"] == 19.0).assertEqual(true);
          console.info(TAG + " set data success!");
        } else {
          console.info(TAG + " object is null,set name fail");
          expect().assertFail();
        }
        g_object.offChange(changeCallback);
        console.info(TAG + " end call watch change");
        if (g_object != undefined && g_object != null) {
          g_object["name"] = "jack2";
          g_object["age"] = 20.0;
          g_object["isVis"] = false;
          expect(g_object["name"] == "jack2").assertEqual(true);
          expect(g_object["age"] == 20.0).assertEqual(true);
          console.info(TAG + " set data success!");
        } else {
          console.info(TAG + " object is null,set name fail");
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Off_001 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2400
     * @tc.desc   object set several listener and can unWatch all watcher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002 start *************");
        console.info(TAG + "start watch status");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false };
        let g_object = distributedObject.create(context1!, source);
        await sleep(2000);
        expect(g_object == undefined).assertEqual(false);
        expect(g_object["name"] == "Amy").assertEqual(true);
        g_object.onStatus(statusCallback1);
        console.info(TAG + "watch success");
        console.info(TAG + "start call unwatch status");
        g_object.offStatus();
        console.info(TAG + "unwatch success");
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002 end *************");
        await g_object.setSessionId().then(() => {
          console.info("leave session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
          expect().assertFail();
        });
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_Save_001
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2700
     * @tc.desc   test save local
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_Save_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Save_001 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false };
        let g_object = distributedObject.create(context1!, source);
        await sleep(2000);
        expect(g_object == undefined).assertEqual(false);
        g_object.setSessionId("mySession1").then(() => {
          console.info("join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
          expect().assertFail();
        });
        await sleep(2000);
        expect("mySession1" == g_object["__sessionId"]).assertEqual(true);
        try {
          const ret: distributedObject.SaveSuccessResponse = await g_object.save("local");
          expect(ret.sessionId == "mySession1").assertEqual(true);
          expect(ret.version == g_object["__version"]).assertEqual(true);
          expect(ret.deviceId == "local").assertEqual(true);
          await g_object.setSessionId("");
          g_object["name"] = "Tom";
          g_object["age"] = 17.0;
          g_object["isVis"] = true;
          await g_object.setSessionId("mySession1");
          expect(g_object["name"] == "Tom").assertEqual(true);
          expect(g_object["age"] == 17.0).assertEqual(true);
          expect(g_object["isVis"] == true).assertEqual(true);
        } catch (e) {
          const err = e as Error;
          console.info('testV9Save001 err ' + `, error code is ${(err as any).code}, message is ${err.message}`);
          expect().assertFail();
        }
        done();
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Save_001 end *************");
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2600
     * @tc.desc   test RevokeSave
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18.0, "isVis": false };
        let g_object = distributedObject.create(context1!, source);
        await sleep(2000);
        expect(g_object != undefined).assertEqual(true);
        await g_object.setSessionId("mySession5");

        let sessionId = g_object["__sessionId"]?.toString();
        expect(sessionId).assertEqual("mySession5");
        let result: distributedObject.SaveSuccessResponse | int = 0;
        g_object.save("local").then((data: distributedObject.SaveSuccessResponse) => {
          result = data;
        }).catch((err: Error) => {
          expect(0).assertEqual(err.code);
        });
        await sleep(2000);
        expect((result as distributedObject.SaveSuccessResponse).sessionId.toString() == "mySession5")
          .assertEqual(true);
        let saveResponse = result as distributedObject.SaveSuccessResponse;
        let actualVersion = saveResponse.version.toString();
        let expectedVersion = g_object["__version"]?.toString();
        expect(actualVersion).assertEqual(expectedVersion);
        expect((result as distributedObject.SaveSuccessResponse).deviceId.toString() == "local").assertEqual(true);
        let result1: distributedObject.RevokeSaveSuccessResponse | int = 0;
        g_object.revokeSave().then((data: distributedObject.RevokeSaveSuccessResponse) => {
          result1 = data;
        }).catch((err: Error) => {
          expect(0).assertEqual(err.code);
        });
        await g_object.setSessionId("");
        g_object["name"] = 'Tom';
        g_object["age"] = 18.0;
        g_object["isVis"] = true;
        await g_object.setSessionId("mySession5");
        expect(g_object["name"] == 'Tom').assertEqual(true);
        expect(g_object["age"] == 18.0).assertEqual(true);
        expect(g_object["isVis"] == true).assertEqual(true);
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002 end *************");
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_NumberMax_0100
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1800
     * @tc.desc   test NumberMax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberMax_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberMax_0100 start *************");
        try {
          let g_object: distributedObject.DataObject;
          let maxValue = Number.MAX_VALUE;
          let source: Record<String, object> = { "name": "Amy", "age": maxValue, "isVis": false };
          g_object = distributedObject.create(context1!, source);
          console.info(TAG + "_age = " + g_object["age"]);
          expect(g_object == undefined).assertEqual(false);
        } catch (error) {
          console.info(error.code + error.message);
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberMax_0100 end *************");
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_NumberMin_0100
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1900
     * @tc.desc   test NumberMin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberMin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberMin_0100 start *************");
        try {
          let g_object: distributedObject.DataObject;
          let minValue = Number.MIN_VALUE;
          let source: Record<String, object> = { "name": "Amy", "age": minValue, "isVis": false };
          g_object = distributedObject.create(context1!, source);
          console.info(TAG + "_age = " + g_object["age"]);
          expect(g_object == undefined).assertEqual(false);
        } catch (error) {
          console.info(error.code + error.message);
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberMin_0100 end *************");
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0100
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1600
     * @tc.desc   test NumberAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0100 start *************");
        try {
          let g_object: distributedObject.DataObject;
          let abnValue = -1;
          let source: Record<String, object> = { "name": "Amy", "age": abnValue, "isVis": false };
          g_object = distributedObject.create(context1!, source);
          console.info(TAG + "_age = " + g_object["age"]);
          expect(g_object == undefined).assertEqual(false);
        } catch (error) {
          console.info(error.code + error.message);
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0100 end *************");
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0200
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1700
     * @tc.desc   test NumberAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0200 start *************");
        try {
          let abnValue = 0.02;
          let source: Record<String, object> = { "name": "Amy", "age": abnValue, "isVis": false };
          let g_object: distributedObject.DataObject;
          g_object = distributedObject.create(context1!, source);
          console.info(TAG + "_age = " + g_object["age"]);
          expect(g_object == undefined).assertEqual(false);
        } catch (error) {
          console.info(error.code + error.message);
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0200 end *************");
        done();
      })

    /**
     * @tc.name   V9testbindAssetStore010
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0010
     * @tc.desc   Test bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testbindAssetStore010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetStore010 start *************");
        let asset010: commonType.Asset = {
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        }
        let source: Record<String, object> = {
          "title": "bindAssettest-title",
          "content": "bindAssettest-content",
          "mark": "no mark",
          "asset010": asset010
        }
        let g_object = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("sessionBA010");
        let asset1: commonType.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        };
        let asset2: commonType.Asset = {
          name: "name2",
          uri: "uri2",
          createTime: "createTime2",
          modifyTime: "modifyTime2",
          size: "size2",
          path: "path2",
          status: commonType.AssetStatus.ASSET_UPDATE,
        };
        let asset3: commonType.Asset = {
          name: "name3",
          uri: "uri3",
          createTime: "createTime3",
          modifyTime: "modifyTime3",
          size: "size3",
          path: "path3",
        };
        let result = new Uint8Array();
        let arr = [asset1, asset2];
        let bindInfo: distributedObject.BindInfo = {
          storeName: "store1",
          tableName: "table1",
          primaryKey: {
            "data1": 123.0,
            "data2": arr,
            "data3": asset3,
            "data4": 101.5,
            "data5": result,
            "data6": false,
            "data7": null,
            "data8": "test1"
          },
          field: "field1",
          assetName: "asset1"
        };
        try {
          g_object.bindAssetStore("asset010", bindInfo, (err, data) => {
            expect(err == undefined).assertEqual(true);
            done();
          });
        } catch (error) {
          console.info(`V9testbindAssetStore010 err is: ${error.code} and msg is: ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   V9testbindAssetStorePromise010
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStorePromise_0010
     * @tc.desc   Test bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testbindAssetStorePromise010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetStorePromise010 start *************");
        let assetPromise010: commonType.Asset = {
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        }
        let source: Record<String, object> = {
          "title": "bindAssettest-title",
          "content": "bindAssettest-content",
          "mark": "no mark",
          "assetPromise010": assetPromise010
        }
        let g_object = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("sessionBAassetPromise010");
        let asset1: commonType.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        };
        let asset2: commonType.Asset = {
          name: "name2",
          uri: "uri2",
          createTime: "createTime2",
          modifyTime: "modifyTime2",
          size: "size2",
          path: "path2",
          status: commonType.AssetStatus.ASSET_UPDATE,
        };
        let asset3: commonType.Asset = {
          name: "name3",
          uri: "uri3",
          createTime: "createTime3",
          modifyTime: "modifyTime3",
          size: "size3",
          path: "path3",
        };
        let result = new Uint8Array(8);
        for (let i = 0; i < 8; i++) {
          result[i] = 1;
        }
        let arr = [asset1, asset2];
        let bindInfo: distributedObject.BindInfo = {
          storeName: "store1",
          tableName: "table1",
          primaryKey: {
            "data1": 123.0,
            "data2": arr,
            "data3": asset3,
            "data4": 101.5,
            "data5": result,
            "data6": false,
            "data7": null,
            "data8": "test1"
          },
          field: "field1",
          assetName: "asset1"
        };
        g_object.bindAssetStore("assetPromise010", bindInfo).then((err) => {
          console.info('V9testbindAssetStorePromise010 bindAssetStore success.');
          expect(err == undefined).assertEqual(true);
          done();
        }).catch((error: Error) => {
          console.info(`V9testbindAssetStorePromise010 err is: ${error.code} and msg is: ${error.message}`);
          expect().assertFail();
          done();
        });
      })

    /**
     * @tc.name   V9testbindAssetStore020
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0020
     * @tc.desc   Test bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testbindAssetStore020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetStore020 start *************");
        let asset020: commonType.Asset = {
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        }
        let source: Record<String, object> = {
          "title": "bindAssettest-title",
          "content": "bindAssettest-content",
          "mark": "no mark",
          "asset020": asset020
        }
        let g_object = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("sessionBA020");
        let asset1: commonType.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        };
        let asset2: commonType.Asset = {
          name: "name2",
          uri: "uri2",
          createTime: "createTime2",
          modifyTime: "modifyTime2",
          size: "size2",
          path: "path2",
          status: commonType.AssetStatus.ASSET_UPDATE,
        };
        let asset3: commonType.Asset = {
          name: "name3",
          uri: "uri3",
          createTime: "createTime3",
          modifyTime: "modifyTime3",
          size: "size3",
          path: "path3",
          status: commonType.AssetStatus.ASSET_UPDATE,
        };
        let result = new Uint8Array();
        let arr = [asset1, asset2];
        let bindInfo: distributedObject.BindInfo = {
          storeName: "store1",
          tableName: "table1",
          primaryKey: {
            "data1": 123.0,
            "data2": arr,
            "data3": asset3,
            "data4": 101.5,
            "data5": result,
            "data6": false,
            "data7": null,
            "data8": "test1"
          },
          field: "field1",
          assetName: "asset2"
        };
        try {
          g_object.bindAssetStore("asset020", bindInfo, (err, data) => {
            expect(err == undefined).assertEqual(true);
            done();
          });
        } catch (error) {
          console.info(`V9testbindAssetStore020 err is: ${error.code} and msg is: ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   V9testbindAssetStore030
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0030
     * @tc.desc   Test bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testbindAssetStore030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testbindAssetStore030 start *************");
        let asset030: commonType.Asset = {
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        }
        let source: Record<String, object> = {
          "title": "bindAssettest-title",
          "content": "bindAssettest-content",
          "mark": "no mark",
          "asset030": asset030
        }
        let g_object = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("sessionBA030");
        let asset1: commonType.Asset = {
          name: "name1",
          uri: "uri1",
          createTime: "createTime1",
          modifyTime: "modifyTime1",
          size: "size1",
          path: "path1",
          status: commonType.AssetStatus.ASSET_NORMAL,
        };
        let asset2: commonType.Asset = {
          name: "name2",
          uri: "uri2",
          createTime: "createTime2",
          modifyTime: "modifyTime2",
          size: "size2",
          path: "path2",
          status: commonType.AssetStatus.ASSET_UPDATE,
        };
        let asset3: commonType.Asset = {
          name: "name3",
          uri: "uri3",
          createTime: "createTime3",
          modifyTime: "modifyTime3",
          size: "size3",
          path: "path3",
          status: commonType.AssetStatus.ASSET_UPDATE,
        };
        let result = new Uint8Array();
        let arr = [asset1, asset2];
        let bindInfo: distributedObject.BindInfo = {
          storeName: "store1",
          tableName: "table1",
          primaryKey: {
            "data1": 123.0,
            "data2": arr,
            "data3": asset3,
            "data4": 101.5,
            "data5": result,
            "data6": false,
            "data7": null,
            "data8": "test1"
          },
          field: "field1",
          assetName: "asset3"
        };
        try {
          g_object.bindAssetStore("asset030", bindInfo, (err, data) => {
            expect(err == undefined).assertEqual(true);
            done();
          });
        } catch (error) {
          console.info(`V9testbindAssetStore030 err is: ${error.code} and msg is: ${error.message}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   V9testModifyAsset001
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_ModifyAsset_0100
     * @tc.desc   object with asset create distributed data object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('V9testModifyAsset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.log(TAG + "************* V9testModifyAsset001 start *************");
        let g_object: distributedObject.DataObject;
        const attachment: commonType.Asset = {
          name: "1.txt",
          uri: "file://com.example.myapplication/data/storage/el2/distributedfiles/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023-11-26 10:00:00",
          modifyTime: "2023-11-26 10:00:00",
          size: "1",
          status: commonType.AssetStatus.ASSET_NORMAL
        };
        let source: Record<String, object> = {
          "title": "my note",
          "content": "It's a nice day today.",
          "mark": false,
          "name": attachment
        };
        g_object = distributedObject.create(context1!, source);
        expect(g_object === undefined).assertEqual(false);
        try {
          await g_object.setSessionId("123456").then((data) => {
            console.info(TAG + "V9testModifyAsset001");
            console.info(TAG + data);
          }).catch((error: Error) => {
            console.info(TAG + error);
          });
          g_object["attachment"] = {};
        } catch (error) {
          console.info(error.code + error.message);
          expect(error.code === 401).assertEqual(true);
        }
        g_object.setSessionId("").then((data) => {
          console.info(TAG + "V9testModifyAsset001");
          console.info(TAG + JSON.stringify(data));
        }).catch((error: Error) => {
          console.info(TAG + error);
          expect().assertFail();
        });
        console.log(TAG + "************* V9testModifyAsset001 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.name   SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006
     * @tc.number SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3400
     * @tc.desc   object join session and on,object can receive callback when data has been changed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006 start *************");
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false };
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        g_object.setSessionId("123456", (error, data) => {
          console.info(TAG + error + "," + data);
          console.info(TAG + "setSessionId test");
        });
        await sleep(2000);
        let g_object1: distributedObject.DataObject = distributedObject.create(context1!, source);
        // let source = new SourceObject("Amy", 18, false);
        // let g_object1: distributedObject.DataObject | null = null;
        // g_object1: distributedObject.DataObject = distributedObject.create(context1, source)
        g_object1.setSessionId("123456", (error, data) => {
          if (error) {
            console.info(TAG + error.code + error.message);
            expect(error.code).assertEqual(15400001);
            done();
          }
          console.info(TAG + error + "," + data);
          console.info(TAG + "setSessionId test");
        });
        await sleep(2000);
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006 end *************");
        g_object.setSessionId("", (error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_create_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_create_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc distributedDataObject function create(context: Context, source: object): DataObject;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_create_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_create_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        console.info(TAG + 'g_object=' + g_object);
        expect(g_object == undefined).assertEqual(false);
        expect(g_object["name"]).assertEqual("Amy");
        expect(g_object["age"]).assertEqual(18);
        expect(g_object["isVis"]).assertEqual(false);

        await g_object.setSessionId("create_0100").then(() => {
          console.info(TAG + "join session");
        }).catch((error) => {
          console.info(TAG + error.code + error.message);
        });

        done();
      } catch (err) {
        console.info(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setSessionId_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_setSessionId_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setSessionId(sessionId: string, callback: AsyncCallback): void;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setSessionId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setSessionId_0100 begin---------  ');
      try {
       let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
       let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
       console.info(TAG + 'g_object=' + g_object);
       expect(g_object == undefined).assertEqual(false);

        g_object.setSessionId('', (err)=>{
          console.info(TAG + "join session, err=" + err);
          expect(err).assertEqual(null);
          done();
        });
      } catch (err) {
        if (err.code === 201) {
          console.error(TAG + 'Permission verification failed. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(201);
        } else {
          console.error(TAG + 'Failed to bindAssetStore. Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setSessionId_0101
     * @tc.name SUB_DDM_SKV_ObjectNull_setSessionId_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setSessionId(sessionId: string, callback: AsyncCallback): void;  err=401
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setSessionId_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setSessionId_0101 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        console.info(TAG + 'g_object=' + g_object);
        expect(g_object == undefined).assertEqual(false);

        g_object.setSessionId('123456@#123', (err)=>{
          console.info(TAG + "join session, err=" + err!);
          expect(err!.code).assertEqual(401);
          done();
        });
      } catch (err) {
          console.error(TAG + 'catch failed. Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
          done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setSessionId_Promise_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setSessionId(sessionId?: string): Promise;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        console.info(TAG + 'g_object=' + g_object);
        expect(g_object == undefined).assertEqual(false);

        await g_object.setSessionId("").then(() => {
          console.info(TAG + "join session");
          done();
        });

      } catch (err) {
        if (err.code === 201) {
          console.error(TAG + 'Permission verification failed. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(201);
        } else {
          console.error(TAG + 'Failed to bindAssetStore. Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
        }
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setSessionId_Promise_0101
     * @tc.name SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setSessionId(sessionId?: string): Promise; err=401
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setSessionId_Promise_0101 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        console.info(TAG + 'g_object=' + g_object);
        expect(g_object == undefined).assertEqual(false);

        await g_object.setSessionId('123456@#123').then(() => {
          console.info(TAG + "join session");
          expect().assertFail();
          done();
        });

      } catch (err) {
          console.error(TAG + 'Permission verification failed. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(401);
          done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_save_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_save_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject save(deviceId: string, callback: AsyncCallback): void;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_save_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_save_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("save_0100").then(() => {
          console.info(TAG + "join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });

        g_object!.save("local", (err, result): void => {
          let ret: distributedObject.SaveSuccessResponse|undefined = result;
          console.info(TAG + "save callback");
          console.info(TAG + "save sessionId: " + ret!.sessionId);
          console.info(TAG + "save version: " + ret!.version);
          console.info(TAG + "save deviceId:  " + ret!.deviceId);
          expect(ret!.sessionId).assertEqual("save_0100");
          expect(ret!.version).assertEqual(g_object["__version"]);
          expect(ret!.deviceId).assertEqual("local");
          done();
        });

      } catch (err) {
        console.log(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_save_0102
     * @tc.name SUB_DDM_SKV_ObjectNull_save_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject save(deviceId: string, callback: AsyncCallback): void;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_save_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_save_0102 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("save_0102").then(() => {
          console.info(TAG + "join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });

        g_object!.save("", (err, result): void => {
          console.info(TAG + "save callback, err=" + err!.code + err!.message);
          expect(err!.code).assertEqual(401);
          done();
        });

      } catch (err) {
        console.log(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_save_0103
     * @tc.name SUB_DDM_SKV_ObjectNull_save_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject save(deviceId: string, callback: AsyncCallback): void; 801
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_save_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_save_0103 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("save_0103");

        g_object!.save("local", (err, result): void => {
          let ret: distributedObject.SaveSuccessResponse|undefined = result;
          console.info(TAG + "save sessionId: " + ret!.sessionId);
          expect(ret!.sessionId).assertEqual("save_0103");
          done();
        });

      } catch (err) {
        if (err.code === 801) {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(801);
          done();
        } else {
          console.error(TAG + 'catch err Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
          done();
        }
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_save_Promise_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_save_Promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject save(deviceId: string): Promise<SaveSuccessResponse>
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_save_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_save_Promise_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("save_Promise_0100").then(() => {
          console.info(TAG + "join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });

        await g_object.save("local").then((result: distributedObject.SaveSuccessResponse) => {
          let ret: distributedObject.SaveSuccessResponse|undefined = result;
          console.info(TAG + "save callback");
          console.info(TAG + "save sessionId: " + ret!.sessionId);
          console.info(TAG + "save version: " + ret!.version);
          console.info(TAG + "save deviceId:  " + ret!.deviceId);
          expect(ret!.sessionId).assertEqual("save_Promise_0100");
          expect(ret!.version).assertEqual(g_object["__version"]);
          expect(ret!.deviceId).assertEqual("local");
          done();
        });

      } catch (err) {
        console.log(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_save_Promise_0102
     * @tc.name SUB_DDM_SKV_ObjectNull_save_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject save(deviceId: string): Promise<SaveSuccessResponse>
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_save_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_save_Promise_0102 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("save_Promise_0102").then(() => {
          console.info(TAG + "join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });

        await g_object.save("").then((result: distributedObject.SaveSuccessResponse) => {
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG + "save failed, error code = " + err.code + err.message);
          expect(err!.code).assertEqual(401);
          done();
        });

      } catch (e) {
        console.log(TAG + ` catch err code is ${e.code}, message is ${e.message}.`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_save_Promise_0103
     * @tc.name SUB_DDM_SKV_ObjectNull_save_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject save(deviceId: string): Promise<SaveSuccessResponse>
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_save_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_save_Promise_0103 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("save_Promise_0103");

        await g_object.save("local").then((result: distributedObject.SaveSuccessResponse) => {
          let ret: distributedObject.SaveSuccessResponse|undefined = result;
          console.info(TAG + "save callback");
          expect(ret!.sessionId).assertEqual("save_Promise_0103");
          done();
        });

      } catch (err) {
        if (err.code === 801) {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(801);
          done();
        } else {
          console.error(TAG + 'catch err Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
          done();
        }
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_revokeSave_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_revokeSave_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject revokeSave(callback: AsyncCallback<RevokeSaveSuccessResponse>): void
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_revokeSave_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_revokeSave_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("revokeSave_0100").then(() => {
          console.info(TAG + "join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });

        await g_object.save("local").then((result: distributedObject.SaveSuccessResponse) => {
          let ret: distributedObject.SaveSuccessResponse|undefined = result;
          console.info(TAG + "save callback");
          console.info(TAG + "save sessionId: " + ret!.sessionId);
          console.info(TAG + "save version: " + ret!.version);
          console.info(TAG + "save deviceId:  " + ret!.deviceId);
          expect(ret!.sessionId).assertEqual("revokeSave_0100");
          expect(ret!.version).assertEqual(g_object["__version"]);
          expect(ret!.deviceId).assertEqual("local");
        });

        // 删除持久化保存的数据
        g_object.revokeSave((err, result) => {
          console.info(TAG + "revokeSave sessionId=" + result!.sessionId);
          let ret: distributedObject.RevokeSaveSuccessResponse|undefined = result;
          expect(ret!.sessionId).assertEqual("revokeSave_0100");
          done();
        });

      } catch (e) {
        console.log(TAG + ` catch err code is ${e.code}, message is ${e.message}.`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_revokeSave_0102
     * @tc.name SUB_DDM_SKV_ObjectNull_revokeSave_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject revokeSave(callback: AsyncCallback<RevokeSaveSuccessResponse>): void 801
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_revokeSave_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_revokeSave_0102 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("revokeSave_0102");
        await g_object.save("local");

        // 删除持久化保存的数据
        g_object.revokeSave((err, result) => {
          console.info(TAG + "revokeSave sessionId=" + result!.sessionId);
          let ret: distributedObject.RevokeSaveSuccessResponse|undefined = result;
          expect(ret!.sessionId).assertEqual("revokeSave_0102");
          done();
        });

      } catch (err) {
        if (err.code === 801) {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(801);
          done();
        } else {
          console.error(TAG + 'catch err Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
          done();
        }
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_revokeSave_Promise_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_revokeSave_Promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject revokeSave(): Promise<RevokeSaveSuccessResponse>
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_revokeSave_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_revokeSave_Promise_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("revokeSave_Promise_0100").then(() => {
          console.info(TAG + "join session");
        }).catch((error: Error) => {
          console.info(TAG + error.code + error.message);
        });

        await g_object.save("local").then((result: distributedObject.SaveSuccessResponse) => {
          let ret: distributedObject.SaveSuccessResponse|undefined = result;
          console.info(TAG + "save callback");
          console.info(TAG + "save sessionId: " + ret!.sessionId);
          console.info(TAG + "save version: " + ret!.version);
          console.info(TAG + "save deviceId:  " + ret!.deviceId);
          expect(ret!.sessionId).assertEqual("revokeSave_Promise_0100");
          expect(ret!.version).assertEqual(g_object["__version"]);
          expect(ret!.deviceId).assertEqual("local");
        });

        // 删除持久化保存的数据
        await g_object.revokeSave().then((result: distributedObject.RevokeSaveSuccessResponse) => {
          console.info(TAG + "revokeSave sessionId=" + result!.sessionId);
          expect(result!.sessionId).assertEqual("revokeSave_Promise_0100");
          done();
        }).catch((err)=> {
          console.error(TAG + "revokeSave failed, error code = " + err.code +err.message);
          expect().assertFail();
          done();
        });

      } catch (e) {
        console.log(TAG + ` catch err code is ${e.code}, message is ${e.message}.`);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_revokeSave_Promise_0102
     * @tc.name SUB_DDM_SKV_ObjectNull_revokeSave_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject revokeSave(): Promise<RevokeSaveSuccessResponse> 801
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_revokeSave_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_revokeSave_Promise_0102 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("revokeSave_Promise_0102");
        await g_object.save("local");

        // 删除持久化保存的数据
        await g_object.revokeSave().then((result: distributedObject.RevokeSaveSuccessResponse) => {
          console.info(TAG + "revokeSave sessionId=" + result!.sessionId);
          expect(result!.sessionId).assertEqual("revokeSave_Promise_0102");
          done();
        });
      } catch (err) {
        if (err.code === 801) {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(801);
          done();
        } else {
          console.error(TAG + 'catch err Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
          done();
        }
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_bindAssetStore_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_bindAssetStore_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject bindAssetStore(assetKey: string, bindInfo: BindInfo, callback: AsyncCallback): void;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_bindAssetStore_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_bindAssetStore_0100 begin---------  ');
      let asset010: commonType.Asset = {
        name: "1.txt",
        uri: "file://com.example.myapp/data/dir/1.txt",
        path: "/dir/1.txt",
        createTime: "2023/11/30 19:48:00",
        modifyTime: "2023/11/30 20:10:00",
        size: "1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      }
      let source: Record<String, object> = {
        "title": "bindAssettest-title",
        "content": "bindAssettest-content",
        "mark": "no mark",
        "asset010": asset010
      }

      let g_object = distributedObject.create(context1!, source);
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionNullBA010");

      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
      let asset2: commonType.Asset = {
        name: "name2",
        uri: "uri2",
        createTime: "createTime2",
        modifyTime: "modifyTime2",
        size: "size2",
        path: "path2",
        status: commonType.AssetStatus.ASSET_UPDATE,
      };
      let asset3: commonType.Asset = {
        name: "name3",
        uri: "uri3",
        createTime: "createTime3",
        modifyTime: "modifyTime3",
        size: "size3",
        path: "path3",
      };
      let result = new Uint8Array();
      let arr = [asset1, asset2];
      let bindInfo: distributedObject.BindInfo = {
        storeName: "store1",
        tableName: "table1",
        primaryKey: {
          "data1": 123.0,
          "data2": arr,
          "data3": asset3,
          "data4": 101.5,
          "data5": result,
          "data6": false,
          "data7": null,
          "data8": "test1"
        },
        field: "field1",
        assetName: "asset1"
      };
      try {
        g_object.bindAssetStore("", bindInfo, (err) => {
          console.info(TAG + ' bindAssetStore success,err= ' + err!.code + err!.message);
          expect(err!.message).assertEqual("operation failed");
          done();
        });
      } catch (e) {
        console.error(TAG + `catch err is: ${e.code} and msg is: ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_bindAssetStore_Promise_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_bindAssetStore_Promise_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject DataObject bindAssetStore(assetKey: string, bindInfo: BindInfo): Promise;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_bindAssetStore_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_bindAssetStore_Promise_0100 begin---------  ');
      let assetPromise010: commonType.Asset = {
        name: "1.txt",
        uri: "file://com.example.myapp/data/dir/1.txt",
        path: "/dir/1.txt",
        createTime: "2023/11/30 19:48:00",
        modifyTime: "2023/11/30 20:10:00",
        size: "1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      }
      let source: Record<String, object> = {
        "title": "bindAssettest-title",
        "content": "bindAssettest-content",
        "mark": "no mark",
        "assetPromise010": assetPromise010
      }
      let g_object = distributedObject.create(context1!, source);
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionNullBAassetPromise010");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
      let asset2: commonType.Asset = {
        name: "name2",
        uri: "uri2",
        createTime: "createTime2",
        modifyTime: "modifyTime2",
        size: "size2",
        path: "path2",
        status: commonType.AssetStatus.ASSET_UPDATE,
      };
      let asset3: commonType.Asset = {
        name: "name3",
        uri: "uri3",
        createTime: "createTime3",
        modifyTime: "modifyTime3",
        size: "size3",
        path: "path3",
      };
      let result = new Uint8Array(8);
      for (let i = 0; i < 8; i++) {
        result[i] = 1;
      }
      let arr = [asset1, asset2];
      let bindInfo: distributedObject.BindInfo = {
        storeName: "store1",
        tableName: "table1",
        primaryKey: {
          "data1": 123.0,
          "data2": arr,
          "data3": asset3,
          "data4": 101.5,
          "data5": result,
          "data6": false,
          "data7": null,
          "data8": "test1"
        },
        field: "field1",
        assetName: "asset1"
      };

      try {
        await g_object.bindAssetStore("", bindInfo).then(() => {
          console.info(TAG +' bindAssetStore_Promise success.');
          expect().assertFail();
          done();
        }).catch((error: Error) => {
          console.info(TAG +`fail err is: ${error.code} and msg is: ${error.message}`);
          expect(error!.message).assertEqual("operation failed");
          done();
        });

      } catch (e) {
        console.error(TAG + `catch err is: ${e.code} and msg is: ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setAsset_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_setAsset_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setAsset(assetKey: string, uri: string): Promise;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setAsset_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setAsset_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        await g_object.setAsset('', 'file:1.text');
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect(err!.code).assertEqual(15400002);
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setAsset_0200
     * @tc.name SUB_DDM_SKV_ObjectNull_setAsset_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setAsset(assetKey: string, uri: string): Promise;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setAsset_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setAsset_0200 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        await g_object.setAsset('file', '');
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect(err!.code).assertEqual(15400002);
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setAssets_0100
     * @tc.name SUB_DDM_SKV_ObjectNull_setAssets_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setAssets(assetKey: string, uris: Array): Promise;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setAssets_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setAssets_0100 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        await g_object.setAssets('', ['file:1.text']);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect(err!.code).assertEqual(15400002);
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_ObjectNull_setAssets_0200
     * @tc.name SUB_DDM_SKV_ObjectNull_setAssets_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc DataObject setAssets(assetKey: string, uris: Array): Promise;
     * p1='', p2=''
     */
    it('SUB_DDM_SKV_ObjectNull_setAssets_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_ObjectNull_setAssets_0200 begin---------  ');
      try {
        let source: Record<String, object> = { "name": "Amy", "age": 18, "isVis": false }
        let g_object: distributedObject.DataObject = distributedObject.create(context1!, source);
        await g_object.setAssets('file', []);
        expect(null).assertFail();
        done();
      } catch (err) {
        console.log(TAG + ` catch err code is ${err.code}, message is ${err.message}.`);
        expect(err!.code).assertEqual(15400002);
        done();
      }

    })


    console.info(TAG + "*************Unit Test End*************");
  })
}