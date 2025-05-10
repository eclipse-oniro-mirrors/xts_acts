/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { unifiedDataChannel } from "@kit.ArkData";
import { fileIo as fs, fileUri} from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG = 'ttt';
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let dstDir: string = context.distributedFilesDir + '/dst';

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

export default function PasteboardErrTest() {
  describe('PasteboardErrTest', () => {
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_Pasteboard_convertToText_Callback_ErrTest_0100
     * @tc.name PasteBoardErrTest01
     * @tc.desc Test pasteBoard convertToText Callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_convertToText_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_convertToText_Callback_ErrTest_0100 start ************')
      let record: pasteboard.PasteDataRecord = pasteboard.createUriRecord('dataability:///com.example.myapplication1/user.txt');
      try {
        record.convertToText(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to convertToText. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_Pasteboard_convertToText_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_addEntry_ErrTest_0100
     * @tc.name PasteBoardErrTest02
     * @tc.desc Test pasteBoard addEntry
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_addEntry_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_addEntry_ErrTest_0100 start ************')
      let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      try {
        record.addEntry(pasteboard.MIMETYPE_TEXT_HTML, html);
        record.addEntry(null, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to addEntry. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_addEntry_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getValidTypes_ErrTest_0100
     * @tc.name PasteBoardErrTest03
     * @tc.desc Test pasteBoard getValidTypes
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getValidTypes_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_getValidTypes_ErrTest_0100 start ************')
      let html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      record.addEntry(pasteboard.MIMETYPE_TEXT_HTML, html);
      try {
        let types: string[] = record.getValidTypes(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getValidTypes. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_getValidTypes_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getData_ErrTest_0100
     * @tc.name PasteBoardErrTest04
     * @tc.desc Test pasteBoard getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getData_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_getData_ErrTest_0100 start ************')
      let record: pasteboard.PasteDataRecord = pasteboard.createRecord(pasteboard.MIMETYPE_TEXT_URI, 'dataability:///com.example.myapplication1/user.txt');
      record.addEntry(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      try {
        record.getData(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getData. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_getData_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getRecordAt_ErrTest_0100
     * @tc.name PasteBoardErrTest05
     * @tc.desc Test pasteBoard getRecordAt
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getRecordAt_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_getRecordAt_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('hello');
      try {
        let record: pasteboard.PasteDataRecord = pasteData.getRecordAt(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getRecordAt. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_getRecordAt_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getRecord_ErrTest_0100
     * @tc.name PasteBoardErrTest06
     * @tc.desc Test pasteBoard getRecord
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getRecord_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_getRecord_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      try {
        let record: pasteboard.PasteDataRecord = pasteData.getRecord(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getRecord. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_getRecord_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_hasMimeType_ErrTest_0100
     * @tc.name PasteBoardErrTest07
     * @tc.desc Test pasteBoard hasMimeType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_hasMimeType_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_hasMimeType_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('hello');
      try {
        let hasType: boolean = pasteData.hasMimeType(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to hasMimeType. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_hasMimeType_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_removeRecordAt_ErrTest_0100
     * @tc.name PasteBoardErrTest08
     * @tc.desc Test pasteBoard removeRecordAt
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_removeRecordAt_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_hasMimeType_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('hello');
      try {
        let isRemove: boolean = pasteData.removeRecordAt(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to removeRecordAt. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_removeRecordAt_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_on_ErrTest_0100
     * @tc.name PasteBoardErrTest09
     * @tc.desc Test pasteBoard on
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_on_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_on_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      let listener = () => {
        console.info('The system pasteboard has changed.');
      };
      try {
        systemPasteboard.on(null, listener);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to on. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_on_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_off_ErrTest_0100
     * @tc.name PasteBoardErrTest10
     * @tc.desc Test pasteBoard off
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_off_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_on_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      let listener = () => {
        console.info('The system pasteboard has changed.');
      };
      try {
        systemPasteboard.off(null, listener);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to off. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_off_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_isRemoteData_ErrTest_0100
     * @tc.name PasteBoardErrTest11
     * @tc.desc Test pasteBoard isRemoteData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_isRemoteData_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_isRemoteData_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        let result: boolean = systemPasteboard.isRemoteData();
        console.info(`Succeeded in checking the RemoteData. Result: ${result}`);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(TAG + `Failed to isRemoteData. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_isRemoteData_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getDataSource_ErrTest_0100
     * @tc.name PasteBoardErrTest12
     * @tc.desc Test pasteBoard getDataSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getDataSource_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_getDataSource_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      try {
        let result: string = systemPasteboard.getDataSource();
        console.info(TAG + `Succeeded in checking the RemoteData. Result: ${result}`);
        expect(result).assertEqual('test label');
      } catch (err) {
        console.error(TAG + `Failed to getDataSource. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_getDataSource_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_hasDataType_ErrTest_0100
     * @tc.name PasteBoardErrTest13
     * @tc.desc Test pasteBoard hasDataType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_hasDataType_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_hasDataType_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync()
      try {
        let result: boolean = systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
        console.info(TAG + `Succeeded in checking the RemoteData. Result: ${result}`);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(TAG + `Failed to hasDataType. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_hasDataType_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_hasDataType_ErrTest_0200
     * @tc.name PasteBoardErrTest14
     * @tc.desc Test pasteBoard hasDataType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_hasDataType_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_hasDataType_ErrTest_0200 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        let result: boolean = systemPasteboard.hasDataType(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to hasDataType. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      };
      console.info(TAG + '************ SUB_Pasteboard_hasDataType_ErrTest_0200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_clear_Callback_ErrTest_0100
     * @tc.name PasteBoardErrTest15
     * @tc.desc Test pasteBoard clear
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_clear_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_clear_Callback_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.clear(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to clear. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_clear_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_clearData_Callback_ErrTest_0200
     * @tc.name PasteBoardErrTest16
     * @tc.desc Test pasteBoard clearData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_clearData_Callback_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_clearData_Callback_ErrTest_0200 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.clearData(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to clearData. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_clearData_Callback_ErrTest_0200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_clearDataSync_ErrTest_0100
     * @tc.name PasteBoardErrTest17
     * @tc.desc Test pasteBoard clearDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_clearDataSync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_clearDataSync_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      expect(systemPasteboard.hasDataSync()).assertEqual(true);
      try {
        systemPasteboard.clearDataSync();
        expect(systemPasteboard.hasDataSync()).assertEqual(false);
        console.info('Succeeded in clearing the pasteboard.');
      } catch (err) {
        console.error(TAG + `Failed to clearDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_clearDataSync_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getPasteData_Callback_ErrTest_0100
     * @tc.name PasteBoardErrTest18
     * @tc.desc Test pasteBoard getPasteData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getPasteData_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_getPasteData_Callback_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.getPasteData(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getPasteData. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_getPasteData_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getData_Callback_ErrTest_0100
     * @tc.name PasteBoardErrTest19
     * @tc.desc Test pasteBoard getData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getData_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_getData_Callback_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.getData(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to getData. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_Pasteboard_getData_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getDataSync_ErrTest_0100
     * @tc.name PasteBoardErrTest20
     * @tc.desc Test pasteBoard getDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getDataSync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_getDataSync_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      try {
        let result: pasteboard.PasteData = systemPasteboard.getDataSync();
        expect(result.getPrimaryText()).assertEqual('content');
        console.info('Succeeded in getting PasteData.');
      } catch (err) {
        console.error(TAG + `Failed to getDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_getDataSync_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_hasPasteData_Callback_ErrTest_0100
     * @tc.name PasteBoardErrTest21
     * @tc.desc Test pasteBoard hasPasteData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_hasPasteData_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_hasPasteData_Callback_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.hasPasteData(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to hasPasteData. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_hasPasteData_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_hasData_Callback_ErrTest_0100
     * @tc.name PasteBoardErrTest22
     * @tc.desc Test pasteBoard hasData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_hasData_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_hasData_Callback_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.hasData(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to hasData. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_hasData_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_hasDataSync_ErrTest_0100
     * @tc.name PasteBoardErrTest23
     * @tc.desc Test pasteBoard hasDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_hasDataSync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_hasDataSync_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync()
      try {
        expect(systemPasteboard.hasDataSync()).assertEqual(false);
        await systemPasteboard.setData(pasteData);
        let result: boolean = systemPasteboard.hasDataSync();
        console.info(`Succeeded in checking the PasteData. Result: ${result}`);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(TAG + `Failed to hasDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_hasDataSync_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_setPasteData_Callback_ErrTest_0100
     * @tc.name PasteBoardErrTest24
     * @tc.desc Test pasteBoard setPasteData
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_setPasteData_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_setPasteData_Callback_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        systemPasteboard.setPasteData(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `Failed to hasDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_Pasteboard_setPasteData_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_setDataSync_ErrTest_0100
     * @tc.name PasteBoardErrTest25
     * @tc.desc Test pasteBoard setDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_setDataSync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_setDataSync_ErrTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      expect(systemPasteboard.hasDataSync()).assertEqual(false);
      try {
        systemPasteboard.setDataSync(pasteData);
        expect(systemPasteboard.hasDataSync()).assertEqual(true);
        console.info('Succeeded in setting PasteData.');
      } catch (err) {
        console.error(TAG + `Failed to setDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_setDataSync_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getUnifiedDataSync_ErrTest_0100
     * @tc.name PasteBoardErrTest26
     * @tc.desc Test pasteBoard getUnifiedDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getUnifiedDataSync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_Pasteboard_getUnifiedDataSync_ErrTest_0100 start ************')
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key: 'delayPlaintext',
        Value: 'delayPlaintext',
      };
      plainText.textContent = 'delayTextContent';
      plainText.abstract = 'delayTextContent';
      plainTextData.addRecord(plainText);

      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.setUnifiedData(plainTextData);
      try {
        let result: unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
        let outputDataType = result.getTypes().toString();
        console.info(TAG + outputDataType);
        expect(outputDataType).assertEqual('general.plain-text');
        console.info('Succeeded in getting UnifiedData.');
      } catch (err) {
        console.error(TAG + `Failed to getUnifiedDataSync. Cause: ${err.message + err.code}`);
        expect(err.code).assertEqual('12900005')
      };
      console.info(TAG + '************ SUB_Pasteboard_getUnifiedDataSync_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getDataWithProgress_ErrTest_0100
     * @tc.name PasteBoardErrTest27
     * @tc.desc Test pasteBoard getDataWithProgress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getDataWithProgress_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_getDataWithProgress_ErrTest_0100 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      try {
        await systemPasteboard.getDataWithProgress(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_Pasteboard_getDataWithProgress_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_getDataWithProgress_ErrTest_0200
     * @tc.name PasteBoardErrTest28
     * @tc.desc Test pasteBoard getDataWithProgress
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_getDataWithProgress_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ SUB_Pasteboard_getDataWithProgress_ErrTest_0200 start ************')
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri:' + dstUri + 'length:' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0
      };
      try {
        await systemPasteboard.getDataWithProgress(params);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'getDataWithProgress fail.err:' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual('12900010');
      }
      console.info(TAG + '************ SUB_Pasteboard_getDataWithProgress_ErrTest_0200 end ************')
    })
  })
}