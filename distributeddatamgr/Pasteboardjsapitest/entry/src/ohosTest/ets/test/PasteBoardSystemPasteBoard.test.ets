/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import pasteboard from '@ohos.pasteboard'
import { BusinessError } from '@ohos.base';
import { abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let error: ESObject = undefined;

const ARRAY_BUFFER = new ArrayBuffer(256)
const TAG = '[TEST_PASTEBOARD_DATA]'
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
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


function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function clearData(systemPasteBoard: pasteboard.SystemPasteboard, callback: ESObject) {
  systemPasteBoard.clearData(callback)
}

function getData(systemPasteBoard: pasteboard.SystemPasteboard, callback: ESObject) {
  systemPasteBoard.getData(callback)
}

function hasData(systemPasteBoard: pasteboard.SystemPasteboard, callback: ESObject) {
  systemPasteBoard.hasData(callback)
}

async function setData(systemPasteBoard: pasteboard.SystemPasteboard, pasteData: ESObject, callBack: ESObject) {
  await systemPasteBoard.setData(pasteData, callBack)
}

function setDataSync(systemPasteBoard: pasteboard.SystemPasteboard, pasteData: ESObject, callBack: ESObject) {
  systemPasteBoard.setData(pasteData, callBack)
}

function setData2(systemPasteBoard: pasteboard.SystemPasteboard, pasteData: ESObject) {
  systemPasteBoard.setData(pasteData)
}

function setDataFunc(func: Function, pasteData: ESObject) {
  func()
}

export default function pasteBoardSystemPasteBoardTest() {
  describe('pasteBoardSystemPasteBoardTest', () => {
    console.info('start################################start');
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })
    beforeEach(() => {
      error = undefined;
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1800
     * @tc.desc   Clear the data in the system pasteBoard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData)
      await systemPasteBoard.clearData(async (err, data) => {
        console.info("Clear the data in the system pasteBoard finished")
        await systemPasteBoard.hasData().then((data: boolean) => {
          console.info(`Succeeded in checking the PasteData. Data: ${data}`);
          expect(data).assertEqual(false);
          done();
          console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0100 end")
        })
      })
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2000
     * @tc.desc   Clear the data in the system pasteBoard fail,type of parameter "callback" is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      try {
        clearData(systemPasteBoard, "callback")
      } catch (err) {
        console.info("Clear the data in the system pasteBoard error,error code: " + err.code)
        error = err;
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_CALLBACK_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1900
     * @tc.desc   Clear the data in the system pasteBoard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        await systemPasteBoard.hasData().then(async (data: boolean) => {
          expect(data).assertTrue();
          await systemPasteBoard.clearData().then(async () => {
            console.info("Clear the data in the system pasteBoard success")
            await systemPasteBoard.hasData().then((data: boolean) => {
              expect(data).assertEqual(false);
            })
          }).catch((err: Error) => {
            console.info("Clear the data in the system pasteBoard error,error: " + err)
            expect(false).assertTrue();
          })
        }).catch((err: Error) => {
          console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
          expect(false).assertTrue();
        })
      }).catch((err: Error) => {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(false).assertTrue();
      })
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_CLEARDATA_PROMISE_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_3200
     * @tc.desc   get the pastedata from system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        await systemPasteBoard.getData((err, data) => {
          if (err != null) {
            console.info("Get the pastedata from system pasteboard failed" + err)
            expect(false).assertTrue();
          } else {
            let recordCount = data.getRecordCount()
            expect(recordCount).assertEqual(1)
          }
        })
      }).catch((err: Error) => {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(false).assertTrue();
      })
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_3400
     * @tc.desc   get the pastedata from system pasteBoard fail,type of parameter "callback" is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      try {
        getData(systemPasteBoard, "callback")
      } catch (err) {
        console.info("Get the pastedata from system pasteBoard fail,error code: " + err.code)
        error = err;
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_3300
     * @tc.desc   get the pastedata from system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        await systemPasteBoard.getData().then(async (data) => {
          console.info("Get the pastedata from system pasteboard success")
          let recordCount = data.getRecordCount()
          expect(recordCount).assertEqual(1)
        }).catch((err: Error) => {
          console.info("Get the pastedata from system pasteboard failed" + err)
          expect(false).assertTrue();
        })
      }).catch((err: Error) => {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(false).assertTrue();
      })
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_PROMISE_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1300
     * @tc.desc   Determine if there is data in the system pasteboard success, result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        await systemPasteBoard.hasData((err, data: boolean) => {
          if (err != undefined) {
            console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
            expect(false).assertTrue();
          } else {
            expect(data).assertTrue();
			console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0100 end");
			done();
          }
        })
      }).catch((err: Error) => {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(false).assertTrue();
      })
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1600
     * @tc.desc   Determine if there is data in the system pasteboard success, result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clearData().then(async () => {
        await systemPasteBoard.hasData((err, data: boolean) => {
          if (err != undefined) {
            console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
            expect(false).assertTrue();
          } else {
            expect(data == false).assertTrue();
			console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0200 end")
			done();
          }
        })
      })
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0300
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1500
     * @tc.desc   Determine if there is data in the system pasteboard fail,type of parameter "callback" is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0300 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      try {
        hasData(systemPasteBoard, "callback")
      } catch (err) {
        console.info("Judge whether there is data in the system pasteBoard error,error code: " + err.code)
        error = err;
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_CALLBACK_0300 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1400
     * @tc.desc   Determine if there is data in the system pasteboard success, result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        await systemPasteBoard.hasData().then((data: boolean) => {
          expect(data).assertTrue();
        }).catch((err: Error) => {
          console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
          expect(false).assertTrue();
        })
      }).catch((err: Error) => {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(false).assertTrue();
      })
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_1700
     * @tc.desc   Determine if there is data in the system pasteboard success, result is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.clearData().then(async () => {
        await systemPasteBoard.hasData().then((data: boolean) => {
          expect(data == false).assertTrue();
        }).catch((err: Error) => {
          console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
          expect(false).assertTrue();
        })
      })
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_HASDATA_PROMISE_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2600
     * @tc.desc   Put pastedata to system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData, async (err, data) => {
        if (err != null) {
          console.info("System pasteBoard set pastedata error,error: " + err)
          expect(false).assertTrue();
        } else {
          await systemPasteBoard.hasData().then((data: boolean) => {
            expect(data).assertTrue();
          }).catch((err: Error) => {
            console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
            expect(false).assertTrue();
          })
        }
      })
      await sleep(500);
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2800
     * @tc.desc   Put pastedata to system pasteBoard fail,type of parameter "pasteData" is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      try {
        await setData(systemPasteBoard, "pasteData", async (err: BusinessError, data: ESObject) => {
          if (err != null) {
            console.info("System pasteBoard set pastedata error,error: " + err)
            expect(err.code).assertEqual("401");
          } else {
            expect(false).assertTrue();
          }
        })
      } catch (err) {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(err.code).assertEqual("401");
      }
      await sleep(500);
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_3100
     * @tc.desc   Put pastedata to system pasteBoard fail,type of parameter "pasteData" is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      try {
        setDataSync(systemPasteBoard, "pasteData", "callback")
      } catch (err) {
        console.info("Put pastedata to system pasteBoard fail,error code: " + err.code)
        error = err;
        expect(err.code).assertEqual("401")
      }
      expect(error != undefined).assertTrue();
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_CALLBACK_0300 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2700
     * @tc.desc   Put pastedata to system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100 start")
      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        await systemPasteBoard.hasData().then((data: boolean) => {
          expect(data).assertTrue();
        }).catch((err: Error) => {
          console.info("Judge whether there is data in the system pasteBoard error,error is: " + err)
          expect(false).assertTrue();
        })
      }).catch((err: Error) => {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(false).assertTrue();
      })
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0100 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_2900
     * @tc.desc   Put pastedata to system pasteBoard fail,type of parameter "pasteData" is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      try {
        setData2(systemPasteBoard, "pasteData")
      } catch (err) {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(err.code).assertEqual("401");
      }
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_3000
     * @tc.desc   Put pastedata to system pasteBoard fail without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300 start")
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      try {
        setDataFunc(systemPasteBoard.setData, "pasteData")
      } catch (err) {
        console.info("System pasteBoard set pastedata error,error: " + err)
        expect(err.code).assertEqual("401");
      }
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_SETDATA_PROMISE_0300 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_ISREMOTEDATA_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_SourceOrType_0100
     * @tc.desc   clear data than check the data whether it is from remote device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_ISREMOTEDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "SUB_PASTEBOARD_ISREMOTEDATA_0100 start")
      let systemPasteboard = pasteboard.getSystemPasteboard()
      await systemPasteboard.clearData().then(async () => {
        try {
          let boolean: boolean = systemPasteboard.isRemoteData()
          expect(boolean == false).assertTrue()
          done()
        } catch (err) {
          console.error(TAG + "test isRemoteData err:" + err)
          expect().assertFail();
        }
      })
      console.info(TAG + "SUB_PASTEBOARD_ISREMOTEDATA_0100 end")
    })

    /**
     * @tc.name   SUB_PASTEBOARD_ISREMOTEDATA_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_SourceOrType_0200
     * @tc.desc   set data than check the data whether it is from remote device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_ISREMOTEDATA_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "SUB_PASTEBOARD_ISREMOTEDATA_0200 start")
      let systemPasteboard = pasteboard.getSystemPasteboard()
      await systemPasteboard.clearData().then(async () => {
        let dataText = 'hello';
        let PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPasteboard.setData(PasteData).then(async () => {
          try {
            let boolean: boolean = systemPasteboard.isRemoteData()
            expect(boolean == false).assertTrue()
            done();
          } catch (err) {
            console.error(TAG + "test isRemoteData err:" + err)
            expect().assertFail();
          }
        })
      })
      console.info(TAG + "SUB_PASTEBOARD_ISREMOTEDATA_0200 end")

    })

    /**
     * @tc.name   SUB_PASTEBOARD_HASDATATYPE_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_SourceOrType_0300
     * @tc.desc   set data than check the data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_HASDATATYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "SUB_PASTEBOARD_HASDATATYPE_0100 start")
      let systemPasteboard = pasteboard.getSystemPasteboard()
      await systemPasteboard.clearData().then(async () => {
        let dataText = 'hello';
        let PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPasteboard.setData(PasteData).then(async () => {
          try {
            let boolean: boolean = systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN)
            expect(boolean).assertTrue()
            done();
          } catch (err) {
            console.error(TAG + "test hasDataType err:" + err)
            expect().assertFail();
          }
        })
      })
      console.info(TAG + "SUB_PASTEBOARD_HASDATATYPE_0100 end")
    })

    /**
     * @tc.name   SUB_PASTEBOARD_HASDATATYPE_0200
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_SourceOrType_0400
     * @tc.desc   set data than check the data type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_HASDATATYPE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "SUB_PASTEBOARD_HASDATATYPE_0200 start")
      let systemPasteboard = pasteboard.getSystemPasteboard()
      await systemPasteboard.clearData().then(async () => {
        let dataText = 'hello';
        let PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPasteboard.setData(PasteData).then(async () => {
          try {
            let boolean: boolean = systemPasteboard.hasDataType(pasteboard.MIMETYPE_PIXELMAP)
            expect(boolean == false).assertTrue()
            done();
          } catch (err) {
            console.error(TAG + "test hasDataType err:" + err)
            expect().assertFail();
          }
        })
      })
      console.info(TAG + "SUB_PASTEBOARD_HASDATATYPE_0200 end")
      done();
    })

    /**
     * @tc.name   SUB_PASTEBOARD_GETDATASOURCE_0100
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_SourceOrType_0500
     * @tc.desc   set data than get the data source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_GETDATASOURCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "SUB_PASTEBOARD_GETDATASOURCE_0100 start")
      let systemPasteboard = pasteboard.getSystemPasteboard()
      await systemPasteboard.clearData().then(async () => {
        let dataText = 'hello';
        let PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPasteboard.setData(PasteData).then(async () => {
          try {
            let string = systemPasteboard.getDataSource()
            console.info(TAG + "bundle name :" + string)
            expect(string != null).assertTrue()
            done();
          } catch (err) {
            console.error(TAG + "test getDataSource err:" + err)
            expect().assertFail();
          }
        })
      })
      console.info(TAG + "SUB_PASTEBOARD_GETDATASOURCE_0100 end")
    })


    /**
     * @tc.name   SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0800
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboard_ClearOrHas_9900
     * @tc.desc   get the pastedata from system pasteBoard success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0800 start")
      let uri = "www.baidu.com"
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri)
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData);
      let data = await systemPasteBoard.getData();
      let recordCount = data.getRecordCount();
      expect(recordCount).assertEqual(1);
      expect(data.getRecord(0).uri).assertEqual(uri);

      try {
        data.pasteStart()
      } catch (err) {
        console.info(TAG + "pasteStart fail" + err);
        expect().assertFail();
      }

      try {
        data.pasteComplete()
      } catch (err) {
        console.info(TAG + "pasteComplete fail" + err);
        expect().assertFail();
      }
      console.info("SUB_PASTEBOARD_FUNCTION_ETS_GETDATA_CALLBACK_0800 end")
      done();
    })
  });
}