/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import distributedObject from '@ohos.data.distributedDataObject';
import commonType from '@ohos.data.commonType';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import common from "@ohos.app.ability.common";
import { Driver, ON } from "@kit.TestKit";
import { BusinessError } from "@ohos.base";

const CATCH_ERR = -1;
let context: common.UIAbilityContext;
const TAG = "OBJECTSTORE_TEST";
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

function statusCallback1(sessionId: string, networkId: string, status: "online" | "offline") {
  console.info(TAG + "statusCallback1" + " " + sessionId);
}

function statusCallback2(sessionId: string, networkId: string, status: "online" | "offline") {
  console.info(TAG + "statusCallback2" + " " + sessionId);
}

const PERMISSION_USER_SET = 1;
const PERMISSION_USER_NAME = "ohos.permission.DISTRIBUTED_DATASYNC";
let tokenID: number;
async function grantPerm() {
  try {
    console.info("====grant Permission start====");
    let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    tokenID = bundleInfo.appInfo.accessTokenId;
    console.info("accessTokenId" + tokenID);
    let atManager = abilityAccessCtrl.createAtManager();
    console.info("createAtManager success");
    context = AppStorage.Get<common.UIAbilityContext>("context") as common.UIAbilityContext;
    let data = await atManager.requestPermissionsFromUser(context, [PERMISSION_USER_NAME]);
    console.info("requestPermissionsFromUser success data is" + data);
    console.info("====grant Permission end====");
  } catch (err) {
    console.error("error: code:" + err.code + "message:" + err.message)
  }
}

function sleep(ms: number): Promise<void>{
  return new Promise((resolve) => setTimeout(resolve, ms))
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
      await  sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('仅本次允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await  sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

export default function objectStoreTestV9() {
  describe('objectStoreTestV9', () => {
    beforeAll(async (done: Function) => {
      await grantPerm();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
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
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_001
     * @tc.desc: object join session and on,object can receive callback when data has been changed
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2900
     * @tc.type: Function
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_001 start *************");
        let g_object: distributedObject.DataObject;
        try {
          g_object = distributedObject.create(undefined, {
            name: "Amy", age: 18, isVis: false
          });
          expect().assertFail();
        } catch (error) {
          console.info(error.code + error.message);
          expect(error.code == 401).assertEqual(true);
          expect(error.message == "Parameter error. The type of 'context' must be 'Context'.").assertEqual(true);
        }
        try {
          g_object = distributedObject.create(context, undefined);
          expect().assertFail();
        } catch (error) {
          console.info(error.code + error.message);
          expect(error.code == 401).assertEqual(true);
          expect(error.message == "Parameter error. The type of 'source' must be 'object'.").assertEqual(true);
        }
        g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("123456").then((data) => {
          console.info(TAG + "SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_001 setSessionId 123456");
          console.info(TAG + data);
        }).catch((error: BusinessError) => {
          console.info(TAG + error);
          expect().assertFail();
        });
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_001 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + ", data=" + data);
        });
        done();
      })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_002
     * @tc.desc: object join session and on,object can receive callback when data has been changed
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3000
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_002 start *************");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        try {
          await g_object.setSessionId(undefined)
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
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003
     * @tc.desc: object join session and on,object can receive callback when data has been changed
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3100
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003 start *************");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        g_object.setSessionId("session1");
        expect("session1" == g_object["__sessionId"]).assertEqual(true);
        let g_object1 = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        try {
          await g_object1.setSessionId("session1")
          expect().assertFail();
        }catch (err) {
          console.info(TAG + 'setSessionId failed' + err.code + err.message);
          expect(err.code).assertEqual("15400001");
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_003 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004
     * @tc.desc: object join session and on,object can receive callback when data has been changed
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3200
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004 start *************");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        await g_object.setSessionId("123456").then((data) => {
          console.info(TAG + "setSessionId test");
          console.info(TAG + data);
        }).catch((err:BusinessError) => {
          console.info(TAG + err.code + err.message);
          expect().assertFail()
        });
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_004 end *************");
        g_object.setSessionId((error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_005
     * @tc.desc: object join session and on,object can receive callback when data has been changed
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3300
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_005 start *************");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        g_object.setSessionId("123456", (error, data) => {
          console.info(TAG + error + "," + data);
          console.info(TAG + "setSessionId test");
        });
        g_object.setSessionId("", (error, data) => {
          console.info(TAG + error + "," + data);
        });
        try {
          g_object.setSessionId(undefined, (error, data) => {
            console.info(TAG + error + "," + data);
            console.info(TAG + "setSessionId test");
          });
        } catch (error) {
          console.info(error.code + error.message);
          expect().assertFail();
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_005 end *************");
        g_object.setSessionId("", (error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })


    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_On_001
     * @tc.desc: object join session and on,object can receive callback when data has been changed
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2100
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_On_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_001 start *************");
      let g_object = distributedObject.create(context, {
        name: "Amy", age: 18, isVis: false
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("session1").then(() => {
        console.info("join session");
      }).catch((error:BusinessError) => {
        console.info(TAG + error.code + error.message);
      });
      expect("session1" == g_object["__sessionId"]).assertEqual(true);
      console.info(TAG + " start call watch change");
      g_object.on("change", (sessionId, changeData) => {
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
        g_object["age"] = 19;
        g_object["isVis"] = true;
        expect(g_object["name"] == "jack1").assertEqual(true);
        expect(g_object["age"] == 19).assertEqual(true);
        console.info(TAG + " set data success!");
      } else {
        console.info(TAG + " object is null,set name fail");
        expect().assertFail();
      }
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_001 end *************");
      g_object.off("change");
      g_object.setSessionId("", (error, data) => {
        console.info(TAG + error + "," + data);
      });
      done();
    })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_On_002
     * @tc.desc: object join session and on,then object change data twice,object can receive two callbacks when data has been changed
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2200
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_On_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_002 start *************");
      let g_object = distributedObject.create(context, {
        name: "Amy", age: 18, isVis: false
      });
      expect(g_object == undefined).assertEqual(false);
      g_object.setSessionId("session1");
      expect("session1" == g_object["__sessionId"]).assertEqual(true);
      console.info(TAG + " start call watch change");
      try {
        g_object.on(undefined, (sessionId: string, changeData: Array<string>) => {
          console.info("SUB_DDM_AppDataFWK_Object_Api9_On_002 callback start.");
          console.info(TAG + sessionId);
          if (changeData != null && changeData != undefined) {
            changeData.forEach(element => {
              console.info(TAG + "data changed !" + element);
            });
          }
          console.info("SUB_DDM_AppDataFWK_Object_Api9_On_002 callback end.");
        });
        expect().assertFail();
      } catch (error) {
        expect(error.code == 401).assertEqual(true);
      }
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_002 end *************");
      g_object.setSessionId("", (error, data) => {
        console.info(TAG + error + "," + data);
      });
      done();
    })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_On_003
     * @tc.desc object join session and on,then object do not change data,object can not receive callbacks
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1500
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_On_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_003 start *************");
      let g_object = distributedObject.create(context, {
        name: "Amy", age: 18, isVis: false
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("session1").then(() => {
        console.info("join session");
      }).catch((error:BusinessError) => {
        console.info(TAG + error.code + error.message);
        expect().assertFail();
      });
      expect("session1" == g_object["__sessionId"]).assertEqual(true);
      console.info(TAG + " start call watch change");
      try {
        g_object.on(undefined, (sessionId: string, changeData: Array<string>) => {
          console.info("SUB_DDM_AppDataFWK_Object_Api9_On_003 callback start.");
          if (changeData != null && changeData != undefined) {
            changeData.forEach(element => {
              console.info(TAG + "data changed !" + element);
            });
          }
          console.info("SUB_DDM_AppDataFWK_Object_Api9_On_003 callback end.");
        });
        expect().assertFail();
      } catch (error) {
        expect(error.code == 401).assertEqual(true);
      }
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_On_003 end *************");
      g_object.setSessionId("", (error, data) => {
        console.info(TAG + error + "," + data);
      });
      done();
    })

    /**
     * @tc.name SUB_DDM_AppDataFWK_Object_Api9_Off_001
     * @tc.desc object join session and on&off,object can not receive callback after off
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2000
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_Off_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Off_001 start *************");
      let g_object = distributedObject.create(context, {
        name: "Amy", age: 18, isVis: false
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("session5").then(() => {
        console.info("join session");
      }).catch((error:BusinessError) => {
        console.info(TAG + error.code + error.message);
      });
      expect("session5" == g_object["__sessionId"]).assertEqual(true);
      g_object.on("change", changeCallback);
      console.info(TAG + " start call watch change");
      if (g_object != undefined && g_object != null) {
        g_object["name"] = "jack1";
        g_object["age"] = 19;
        g_object["isVis"] = true;
        expect(g_object["name"] == "jack1").assertEqual(true);
        expect(g_object["age"] == 19).assertEqual(true);
        console.info(TAG + " set data success!");
      } else {
        console.info(TAG + " object is null,set name fail");
        expect().assertFail();
      }
      g_object.off("change", changeCallback);
      console.info(TAG + " end call watch change");
      if (g_object != undefined && g_object != null) {
        g_object["name"] = "jack2";
        g_object["age"] = 20;
        g_object["isVis"] = false;
        expect(g_object["name"] == "jack2").assertEqual(true);
        expect(g_object["age"] == 20).assertEqual(true);
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
     * @tc.name:SUB_DDM_AppDataFWK_Object_Api9_Off_002
     * @tc.desc object join session and off,object can not receive callback
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1000
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_Off_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Off_002 start *************");
      let g_object = distributedObject.create(context, {
        name: "Amy", age: 18, isVis: false
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("session6").then(() => {
        console.info("join session");
      }).catch((error:BusinessError) => {
        console.info(TAG + error.code + error.message);
        expect().assertFail();
      });
      expect("session6" == g_object["__sessionId"]).assertEqual(true);
      try {
        g_object.off(undefined);
        expect().assertFail();
      } catch (error) {
        expect(error.code == 401).assertEqual(true);
      }
      console.info(TAG + " end call watch change");
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Off_002 end *************");
      await g_object.setSessionId().then((data) => {
        console.info(TAG + data);
        console.info(TAG + "setSessionId test");
      }).catch((error: BusinessError) => {
        console.info(TAG + error.code + error.message);
        expect().assertFail();
      });
      done();
    })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_OnStatus_001
     * @tc.desc: object set a listener to watch another object online/offline
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2300
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_OnStatus_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_OnStatus_001 start *************");
        console.info(TAG + "start watch status");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        try {
          g_object.on("status", null);
          expect().assertFail();
        } catch (error) {
          expect(error.code == 401).assertEqual(true);
          expect(error.message == "Parameter error. The type of 'callback' must be 'function'.").assertEqual(true);
        }
        console.info(TAG + "watch success");
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_OnStatus_001 end *************");
        await g_object.setSessionId("").then((data) => {
          console.info(TAG + data);
          console.info(TAG + "setSessionId test");
        }).catch((error: BusinessError) => {
          console.info(TAG + error.code + error.message);
          expect().assertFail();
        });
        done();
      })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002
     * @tc.desc: object set several listener and can unWatch all watcher
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2400
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002 start *************");
        console.info(TAG + "start watch status");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        expect(g_object["name"] == "Amy").assertEqual(true);
        g_object.on("status", statusCallback1);
        console.info(TAG + "watch success");
        console.info(TAG + "start call unwatch status");
        g_object.off("status");
        console.info(TAG + "unwatch success");
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_OnStatus_002 end *************");
        await g_object.setSessionId().then(() => {
          console.info("leave session");
        }).catch((error: BusinessError) => {
          console.info(TAG + error.code + error.message);
          expect().assertFail();
        });
        done();
      })

    /**
     * @tc.name: V9testSave001
     * @tc.desc: test save local
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2700
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_Save_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Save_001 start *************");
      console.info(TAG + "************* V9testSave001 start *************");
      let g_object = distributedObject.create(context, {
        name: "Amy", age: 18, isVis: false
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("mySession1").then(() => {
        console.info("join session");
      }).catch((error: BusinessError) => {
        console.info(TAG + error.code + error.message);
        expect().assertFail();
      });
      expect("mySession1" == g_object["__sessionId"]).assertEqual(true);
      await g_object.save("local").then((ret) => {
        expect(ret.sessionId == "mySession1").assertEqual(true);
        expect(ret.version == g_object["__version"]).assertEqual(true);
        expect(ret.deviceId == "local").assertEqual(true);
        done();
        g_object.setSessionId("");
        g_object["name"] = undefined;
        g_object["age"] = undefined;
        g_object["isVis"] = undefined;
        g_object.setSessionId("mySession1");
        expect(g_object["name"] == "Amy").assertEqual(true);
        expect(g_object["age"] == 18).assertEqual(true);
        expect(g_object["isVis"] == false).assertEqual(true);
      }).catch((err: BusinessError) => {
        console.info('testV9Save001 err ' + `, error code is ${err.code}, message is ${err.message}`);
        expect("801").assertEqual(err.code.toString());
        done();
      });
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Save_001 end *************");
    })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_Save_002
     * @tc.desc: test save local
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2800
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_Save_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Save_002 start *************");
      let g_object = distributedObject.create(context, {
        name: "Amy", age: 18, isVis: false
      });
      expect(g_object == undefined).assertEqual(false);
      g_object.setSessionId("mySession2");
      expect("mySession2" == g_object["__sessionId"]).assertEqual(true);
      g_object.save("local", (err, result) => {
        if (err) {
          console.info('testV9Save002 err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect("801").assertEqual(err.code.toString());
          done();
          return;
        }
        expect(result.sessionId == "mySession2").assertEqual(true);
        expect(result.version == g_object["__version"]).assertEqual(true);
        expect(result.deviceId == "local").assertEqual(true);
        g_object.setSessionId("");
        g_object["name"] = undefined;
        g_object["age"] = undefined;
        g_object["isVis"] = undefined;
        g_object.setSessionId("mySession2");
        expect(g_object["name"] == "Amy").assertEqual(true);
        expect(g_object["age"] == 18).assertEqual(true);
        expect(g_object["isVis"] == false).assertEqual(true);
        done();
      });
      console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_Save_002 end *************");
    })


    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_001
     * @tc.desc: test RevokeSave
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2500
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_001 start *************");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        g_object.setSessionId("mySession4");
        expect("mySession4" == g_object["__sessionId"]).assertEqual(true);
        g_object.save("local", (err, result) => {
          if (err) {
            console.info('testV9RevokeSave001 err ' + `, error code is ${err.code}, message is ${err.message}`);
            expect("801").assertEqual(err.code.toString());
            done();
            return;
          }
          expect(result.sessionId == "mySession4").assertEqual(true);
          expect(result.version == g_object["__version"]).assertEqual(true);
          expect(result.deviceId == "local").assertEqual(true);
          g_object.revokeSave((err, result) => {
            if (err) {
              expect("801").assertEqual(err.code.toString());
              done();
              return;
            }
            expect("mySession4" == result.sessionId).assertEqual(true);
            g_object.setSessionId("");
            g_object["name"] = undefined;
            g_object["age"] = undefined;
            g_object["isVis"] = undefined;
            g_object.setSessionId("mySession4");
            expect(g_object["name"] == undefined).assertEqual(true);
            expect(g_object["age"] == undefined).assertEqual(true);
            expect(g_object["isVis"] == undefined).assertEqual(true);
            done();
          });
        });
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_001 end *************");
      })



    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002
     * @tc.desc: test RevokeSave
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_2600
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002 start *************");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object != undefined).assertEqual(true);
        g_object.setSessionId("mySession5");
        expect("mySession5" == g_object["__sessionId"].toString()).assertEqual(true);
        let result: distributedObject.SaveSuccessResponse | number = await g_object.save("local").catch((err: BusinessError) => {
          console.info('testV9Save001 err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect("801").assertEqual(err.code.toString());
          return CATCH_ERR;
        });
        if (result === CATCH_ERR) {
          return;
        }
        expect((result as distributedObject.SaveSuccessResponse).sessionId.toString() == "mySession5").assertEqual(true);
        expect((result as distributedObject.SaveSuccessResponse).version.toString() == g_object["__version"].toString()).assertEqual(true);
        expect((result as distributedObject.SaveSuccessResponse).deviceId.toString() == "local").assertEqual(true);
        let result1 = await g_object.revokeSave().catch((err:BusinessError) => {
          expect("801").assertEqual(err.code.toString());
          return CATCH_ERR;
        });
        if (result1 === CATCH_ERR) {
          return;
        }
        g_object.setSessionId("");
        g_object["name"] = undefined;
        g_object["age"] = undefined;
        g_object["isVis"] = undefined;
        g_object.setSessionId("mySession5");
        expect(g_object["name"] == undefined).assertEqual(true);
        expect(g_object["age"] == undefined).assertEqual(true);
        expect(g_object["isVis"] == undefined).assertEqual(true);
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_RevokeSave_002 end *************");
      })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_NumberMax_0100
     * @tc.desc: test NumberMax
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1800
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberMax_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberMax_0100 start *************");
        try {
          let g_object: distributedObject.DataObject;
          let maxValue = Number.MAX_VALUE;
          g_object = distributedObject.create(context, {
            name: "Amy", age: maxValue, isVis: false
          });
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
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_NumberMin_0100
     * @tc.desc: test NumberMin
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1900
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberMin_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberMin_0100 start *************");
        try {
          let g_object: distributedObject.DataObject;
          let minValue = Number.MIN_VALUE;
          g_object = distributedObject.create(context, {
            name: "Amy", age: minValue, isVis: false
          });
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
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0100
     * @tc.desc: test NumberAbnormal
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1600
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0100 start *************");
        try {
          let g_object: distributedObject.DataObject;
          let abnValue = -1;
          g_object = distributedObject.create(context, {
            name: "Amy", age: abnValue, isVis: false
          });
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
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0200
     * @tc.desc: test NumberAbnormal
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_1700
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_NumberAbnormal_0200 start *************");
        try {
          let g_object: distributedObject.DataObject;
          let abnValue = 0.02;
          g_object = distributedObject.create(context, {
            name: "Amy", age: abnValue, isVis: false
          });
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
     * @tc.name: V9testbindAssetStore010
     * @tc.desc: Test bindAssetStore
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0010
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore010 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset010: {
          status: commonType.AssetStatus.ASSET_NORMAL,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
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
      let result = new Uint8Array(8);
      for (let i = 0; i < 8; i++) {
        result[i] = 1;
      }
      let arr = [asset1, asset2];
      let bindInfo: distributedObject.BindInfo = {
        storeName: "store1",
        tableName: "table1",
        primaryKey: {
          "data1": 123,
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
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name: V9testbindAssetStorePromise010
     * @tc.desc: Test bindAssetStore
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStorePromise_0010
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStorePromise010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStorePromise010 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        assetPromise010: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
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
          "data1": 123,
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
      }).catch((error: BusinessError) => {
        console.info(`V9testbindAssetStorePromise010 err is: ${error.code} and msg is: ${error.message}`);
        expect(null).assertFail();
        done();
      });
    })


    /**
     * @tc.name: V9testbindAssetStore020
     * @tc.desc: Test bindAssetStore
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0020
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore020 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset020: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
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
      let result = new Uint8Array(8);
      for (let i = 0; i < 8; i++) {
        result[i] = 1;
      }
      let arr = [asset1, asset2];
      let bindInfo: distributedObject.BindInfo = {
        storeName: "store1",
        tableName: "table1",
        primaryKey: {
          "data1": 123,
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
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name: V9testbindAssetStore030
     * @tc.desc: Test bindAssetStore
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0030
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore030 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset030: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
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
      let result = new Uint8Array(8);
      for (let i = 0; i < 8; i++) {
        result[i] = 1;
      }
      let arr = [asset1, asset2];
      let bindInfo: distributedObject.BindInfo = {
        storeName: "store1",
        tableName: "table1",
        primaryKey: {
          "data1": 123,
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
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name: V9testbindAssetStore002
     * @tc.desc: Test bindAssetStore with invalid args,storeName is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0200
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore002 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset002: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA2");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
      try {
        g_object.bindAssetStore("asset002", undefined, (err, data) => {
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.info(`V9testbindAssetStore002 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name: V9testbindAssetStore003
     * @tc.desc: Test bindAssetStore with invalid args,tableName is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0300
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore003 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset003: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA3");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
      try {
        g_object.bindAssetStore("asset003", undefined, (err, data) => {
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.info(`V9testbindAssetStore003 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name: V9testbindAssetStore004
     * @tc.desc: Test bindAssetStore with invalid args,primaryKey is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0400
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore004 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset004: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA4");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
      try {
        g_object.bindAssetStore("asset004", undefined, (err, data) => {
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.info(`V9testbindAssetStore004 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name: V9testbindAssetStore005
     * @tc.desc: Test bindAssetStore with invalid args,field is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0500
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore005 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset005: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA5");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
      try {
        g_object.bindAssetStore("asset005", undefined, (err, data) => {
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.info(`V9testbindAssetStore005 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name: V9testbindAssetStore006
     * @tc.desc: Test bindAssetStore with invalid args,assetName is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0600
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore006 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset006: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA6");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
      try {
        g_object.bindAssetStore("asset006", undefined, (err, data) => {
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.info(`V9testbindAssetStore006 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name: V9testbindAssetStore007
     * @tc.desc: Test bindAssetStore with invalid args,assetKey is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0700
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore007 start *************");
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
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA7");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
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
        g_object.bindAssetStore(null, bindInfo, (err, data) => {
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.info(`V9testbindAssetStore007 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })


    /**
     * @tc.name: V9testbindAssetStore008
     * @tc.desc: Test bindAssetStore with invalid args,assetKey is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0800
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* V9testbindAssetStore008 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset008: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("sessionBA8");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
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
        g_object.bindAssetStore("asset008", null, (err, data) => {
          expect(null).assertFail();
          done();
        });
      } catch (error) {
        console.info(`V9testbindAssetStore008 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name: V9testbindAssetStore009
     * @tc.desc: Test bindAssetStore with invalid args,assetKey is null
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_bindAssetStore_0900
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testbindAssetStore009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* V9testbindAssetStore009 start *************");
      let g_object = distributedObject.create(context, {
        title: "bindAssettest-title",
        content: "bindAssettest-content",
        mark: "no mark",
        asset008: {
          status: 0,
          name: "1.txt",
          uri: "file://com.example.myapp/data/dir/1.txt",
          path: "/dir/1.txt",
          createTime: "2023/11/30 19:48:00",
          modifyTime: "2023/11/30 20:10:00",
          size: "1",
        }
      });
      expect(g_object == undefined).assertEqual(false);
      await g_object.setSessionId("session009");
      let asset1: commonType.Asset = {
        name: "name1",
        uri: "uri1",
        createTime: "createTime1",
        modifyTime: "modifyTime1",
        size: "size1",
        path: "path1",
        status: commonType.AssetStatus.ASSET_NORMAL,
      };
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
        await g_object.bindAssetStore("asset009", null);
        expect().assertFail();
      } catch (error) {
        console.info(`V9testbindAssetStore009 err is: ${error.code} and msg is: ${error.message}`);
        expect(error.code).assertEqual('401');
      }
    })

    /**
     * @tc.name: V9testModifyAsset001
     * @tc.desc: object with asset create distributed data object
     * @tc.type: Functiontion
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_ModifyAsset_0100
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('V9testModifyAsset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG + "************* V9testModifyAsset001 start *************");
      let g_object: distributedObject.DataObject;
      const attachment: commonType.Asset = {
        status: 0,
        name: "1.txt",
        uri: "file://com.example.myapplication/data/storage/el2/distributedfiles/dir/1.txt",
        path: "/dir/1.txt",
        createTime: "2023-11-26 10:00:00",
        modifyTime: "2023-11-26 10:00:00",
        size: "1"
      };
      g_object = distributedObject.create(context, {
        title: "my note",
        content: "It's a nice day today.",
        mark: false,
        attachment
      });
      expect(g_object === undefined).assertEqual(false);
      try {
        await g_object.setSessionId("123456").then((data) => {
          console.info(TAG + "V9testModifyAsset001");
          console.info(TAG + data);
        }).catch((error: BusinessError) => {
          console.info(TAG + error);
        });
        g_object["attachment"] = {};
      } catch (error) {
        console.info(error.code + error.message);
        expect(error.code === 401).assertEqual(true);
      }
      g_object.setSessionId("").then((data) => {
        console.info(TAG + "V9testModifyAsset001");
        console.info(TAG + data);
      }).catch((error: BusinessError) => {
        console.info(TAG + error);
        expect().assertFail();
      });
      console.log(TAG + "************* V9testModifyAsset001 end *************");
      g_object.setSessionId((error, data) => {
        console.info(TAG + error + "," + data);
      });
    })

    /**
     * @tc.name: SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006
     * @tc.desc: object join session and on,object can receive callback when data has been changed
     * @tc.type: Function
     * @tc.number: SUB_DistributedData_DataObject_SDK_ObjectJsAPITest_3400
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006 start *************");
        let g_object = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        expect(g_object == undefined).assertEqual(false);
        g_object.setSessionId("123456", (error, data) => {
          console.info(TAG + error + "," + data);
          console.info(TAG + "setSessionId test");
        });
        let g_object1 = distributedObject.create(context, {
          name: "Amy", age: 18, isVis: false
        });
        try {
          g_object1.setSessionId("123456", (error, data) => {
            console.info(TAG + error + "," + data);
            console.info(TAG + "setSessionId test");
          });
          expect().assertFail();
        } catch (error) {
          console.info(TAG + error.code + error.message);
          expect(error.code).assertEqual('15400001');
        }
        console.info(TAG + "************* SUB_DDM_AppDataFWK_Object_Api9_SetSessionId_006 end *************");
        g_object.setSessionId("", (error, data) => {
          console.info(TAG + error + "," + data);
        });
        done();
      })

    console.info(TAG + "*************Unit Test End*************");
  })
}