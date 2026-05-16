/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import pasteboard from '@ohos.pasteboard';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import { abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let error: ESObject = undefined
let tag = "PASTEBOARDSYNC--------------------"
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
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
export default function pasteboardSyncTest() {
  describe("pasteboardSyncTest", () => {
    console.info("start#############################start")
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })
    beforeEach(() => {
      error = undefined;
      systemPasteboard.clearDataSync();
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardSync_0100
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0100
     * @tc.desc   Test clearDataSync when systemPasteBoard has data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0100 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      systemPasteBoard.setDataSync(pasteData);
      expect(systemPasteBoard.hasDataSync()).assertEqual(true);
      console.info(tag + "Succeeded in setting PasteData");

      systemPasteBoard.clearDataSync();

      let result = systemPasteBoard.hasDataSync();
      console.info(tag + `Succeed in checking the PasteBoard. Result: ${result}`)
      expect(result).assertEqual(false);
      console.info(tag + "Clear the data in the system PasteBoard finished")

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0100 ---------end")
    })


    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardSync_0200
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0200
     * @tc.desc   Test setDataSync in systemPasteBoard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0200 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      console.info(tag + `${systemPasteBoard}`);
      systemPasteBoard.setDataSync(pasteData);
      console.info(tag + "Succeeded in setting PasteData");
      let result = systemPasteBoard.getDataSync();

      console.info(tag + `Get the pasteboard from system PasteBoard success. Result: ${result}`)
      expect(result.getPrimaryText()).assertEqual("pasteboard");

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0200 ---------end")
    })


    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardSync_0300
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0300
     * @tc.desc   Test setDataSync when parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0300 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      console.info(tag + `${systemPasteBoard}`)
      try {
        systemPasteBoard.setDataSync(null);
        expect().assertFail()
        console.info(tag + "Succeeded in setting PasteData");
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0300 ---------end")
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardSync_0400
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0400
     * @tc.desc   Test setDataSync parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0400 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      console.info(tag + `${systemPasteBoard}`);
      try {
        systemPasteBoard.setDataSync(undefined);
        expect().assertFail()
        console.info(tag + "Succeeded in setting PasteData");
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0400 ---------end")
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardSync_0500
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0500
     * @tc.desc   Test getDataSync when setDataSync in systemPasteBoard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0500 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      await systemPasteBoard.setData(pasteData);
      console.info(tag + "Succeeded in setting PasteData");

      let resultFlg = systemPasteBoard.hasDataSync();
      expect(resultFlg).assertTrue();

      let resultText = systemPasteBoard.getDataSync().getPrimaryText();
      expect(resultText).assertEqual("pasteboard");
      console.info(tag + `Get the pasteboard from system PasteBoard success. Result: ${resultText}`)

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0500 ---------end")
    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardSync_0600
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0600
     * @tc.desc   Test hasDataSync when systemPasteBoard has parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0600 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "pasteboard");
      let systemPasteBoard = pasteboard.getSystemPasteboard();

      systemPasteBoard.setDataSync(pasteData);
      console.info(tag + "Succeeded in setting PasteData");
      let result = systemPasteBoard.hasDataSync();
      expect(result).assertTrue();
      console.info(tag + `Succeed in checking the PasteBoard. Result: ${result}`);
      ;

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0600 ---------end");

    })

    /**
     * @tc.name   SUB_Pasteboard_Local_SDK_PasteboardSync_0700
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardSync_0700
     * @tc.desc   Test hasDataSync when systemPasteBoard is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Pasteboard_Local_SDK_PasteboardSync_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0700 ---------start")
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      systemPasteBoard.clearDataSync();
      let result = systemPasteBoard.hasDataSync();
      expect(result).assertEqual(false);
      console.info(tag + `Succeed in checking the PasteBoard. Result: ${result}`)

      console.info(tag + "SUB_Pasteboard_Local_SDK_PasteboardSync_0700 ---------end")

    })

  })
}