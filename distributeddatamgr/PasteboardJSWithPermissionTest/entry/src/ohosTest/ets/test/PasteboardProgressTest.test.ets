import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import pasteboard from '@ohos.pasteboard';
import { abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { fileIo as fs, fileUri} from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const VALUE_TEST_STRING_ELEMENT = 'a'.repeat(1*1024*1024*2);
const VALUE_TEST_STRING_ELEMENT_BIG = 'a'.repeat(1*1024*1024*50);
let filePath: string = context.filesDir + '/src';

let TAG = "ttt"
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let dstDir = context.distributedFilesDir + '/dst';

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

export default function PasteboardProgressTest() {
  describe('PasteboardProgressTest', () => {
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      fs.mkdirSync(dstDir);
      fs.mkdirSync(filePath);
      done();
    })
    beforeEach(() => {
      systemPasteboard.clearDataSync();
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0100
     * @tc.name Single_Level_Path
     * @tc.desc Test pasteBoard progress single level path and no fileConflictOption
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0100', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0100 start ************')
      let fileFullName = filePath + '/test1.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 1
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test1.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0200
     * @tc.name Multi_Level_Path_With_Digit
     * @tc.desc Test pasteBoard progress multi level path with digit
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0200', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0200 start ************')
      let fileFullName = filePath + '/test2.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstDir2 = dstDir + '/dst'
      fs.mkdirSync(dstDir2)
      let dstUri: string = fileUri.getUriFromPath(dstDir2);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 1,
        fileConflictOptions: 0
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir2 + '/test2.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0300
     * @tc.name Path_Not_Exist
     * @tc.desc Test pasteBoard progress path not exist
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0300', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0300 start ************')
      let fileFullName = filePath + '/test3.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: 'file://com.acts.distributeddatamgr.pasteboardtest/dataljw/storage/els/distributedfiles/dst',
        progressIndicator: 1
      };
      try {
        await systemPasteboard.getDataWithProgress(params);
        expect().assertFail();
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + JSON.stringify(err));
        expect(err.code).assertEqual('12900007');
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0300 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0500
     * @tc.name Path_With_Special_Characters
     * @tc.desc Test pasteBoard progress path with special characters and Chinese
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0500', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0500 start ************')
      let fileFullName = filePath + '/test5.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstDir = context.distributedFilesDir + '/dst1*2_3-4.5;6测试';
      fs.mkdirSync(dstDir);
      let dstUri: string = fileUri.getUriFromPath( dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 1,
        fileConflictOptions: 1
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test5.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0500 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0600
     * @tc.name Path_Greater_Than_250
     * @tc.desc Test pasteBoard progress path greater than 250
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0600', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0600 start ************')
      let fileFullName = filePath + '/test6.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri:' + dstUri + 'length:' + dstUri.length)
      let dstUri251: string = fileUri.getUriFromPath(dstDir + 'a'.repeat(250 - dstUri.length) + '/');
      console.info(TAG + 'dstUri:' + dstUri251 + 'length:' + dstUri251.length);
      fs.mkdirSync(dstDir + 'a'.repeat(250 - dstUri.length));
      let params: pasteboard.GetDataParams = {
        destUri: dstUri251,
        progressIndicator: 1
      };
      try {
        await systemPasteboard.getDataWithProgress(params)
        expect().assertFail()
      } catch (err) {
        console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(err));
        expect(JSON.stringify(err)).assertContain('401');
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0600 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0700
     * @tc.name Path_Equal_To_250
     * @tc.desc Test pasteBoard progress path equal to 250
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0700', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0700 start ************')
      let fileFullName = filePath + '/test7.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let dstUri250: string = fileUri.getUriFromPath(dstDir + 'a'.repeat(249 - dstUri.length) + '/');
      console.info(TAG + 'dstUri:' + dstUri250 + 'length:' + dstUri250.length);
      fs.mkdirSync(dstDir + 'a'.repeat(249 - dstUri.length));
      let params: pasteboard.GetDataParams = {
        destUri: dstUri250,
        progressIndicator: 1
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + 'a'.repeat(249-dstUri.length) + '/test7.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0700 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0800
     * @tc.name fileConflictOption_OVERWRITE
     * @tc.desc Test pasteBoard progress fileConflictOptions OVERWRITE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0800', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0800 start ************')
      let fileFullName = filePath + '/test8.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0,
        fileConflictOptions: pasteboard.FileConflictOptions.OVERWRITE,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test8.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0800 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_0900
     * @tc.name fileConflictOption_SKIP
     * @tc.desc Test pasteBoard progress fileConflictOptions SKIP
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_0900', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0900 start ************')
      let fileFullName = filePath + '/test9.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0,
        fileConflictOptions: pasteboard.FileConflictOptions.SKIP,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test9.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_0900 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1000
     * @tc.name fileConflictOption_Invalid_Value
     * @tc.desc Test pasteBoard progress fileConflictOptions invalid value
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1000', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1000 start ************')
      let fileFullName = filePath + '/test10.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0,
        fileConflictOptions: 3,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test10.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1000 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1100
     * @tc.name progressIndicator_Invalid_Value
     * @tc.desc Test pasteBoard progress progressIndicator invalid value
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1100', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1100 start ************')
      let fileFullName = filePath + '/test11.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 3,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test11.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1100 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1200
     * @tc.name progressIndicator_None
     * @tc.desc Test pasteBoard progress progressIndicator None
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1200', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1200 start ************')
      let fileFullName = filePath + '/test12.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: pasteboard.ProgressIndicator.NONE,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test12.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1200 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1300
     * @tc.name progressIndicator_Default
     * @tc.desc Test pasteBoard progress progressIndicator default
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1300', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1300 start ************')
      let fileFullName = filePath + '/test13.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: pasteboard.ProgressIndicator.DEFAULT,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test13.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1300 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1400
     * @tc.name progressListener_UNDEFINED
     * @tc.desc Test pasteBoard progress progressIndicator INVALID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1400', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1400 start ************')
      let fileFullName = filePath + '/test14.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 3,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test14.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1400 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1500
     * @tc.name With_progressListener
     * @tc.desc Test pasteBoard progress with progressListener
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1500', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1500 start ************')
      let fileFullName = filePath + '/test15.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      let ProgressListener = (progress: pasteboard.ProgressInfo) => {
        console.log('progressListener success, progress:' + progress.progress);
      }

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0,
        progressListener: ProgressListener
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test15.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1500 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1600
     * @tc.name progressSignal_UNIFIED
     * @tc.desc Test pasteBoard progress progressSignal UNDEFINED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1600', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1600 start ************')
      let fileFullName = filePath + '/test16.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0,
        progressSignal: undefined
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test16.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1600 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1700
     * @tc.name progressSignal_UNIFIED
     * @tc.desc Test pasteBoard progress progressSignal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1700', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1700 start ************')
      let fileFullName = filePath + '/test17.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, VALUE_TEST_STRING_ELEMENT_BIG);
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      let signal = new pasteboard.ProgressSignal;
      let ProgressListener = (progress: pasteboard.ProgressInfo) => {
        console.log('progressListener success, progress:' + progress.progress);
        signal.cancel();
      }

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0,
        progressListener: ProgressListener
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test17.txt';
          expect(fs.accessSync(pastePath)).assertEqual(false);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1700 end ************')
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_ProgressTest_1800
     * @tc.name filesize_less_than_1K
     * @tc.desc Test pasteBoard file size less than 1K
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Pasteboard_Local_SDK_ProgressTest_1800', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1800 start ************')
      let fileFullName = filePath + '/test18.txt';
      console.info(TAG + 'The fileFullName of str is:' + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, 'VALUE_TEST_STRING_ELEMENT');
      console.info(TAG + 'The size of str is: ' + writeLen);
      fs.closeSync(file);
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, fileUri.getUriFromPath(fileFullName));
      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);

      let dstUri: string = fileUri.getUriFromPath(dstDir);
      console.info(TAG + 'dstUri: ' + dstUri + ' length: ' + dstUri.length);
      let params: pasteboard.GetDataParams = {
        destUri: dstUri,
        progressIndicator: 0,
      };
      try {
        await systemPasteboard.getDataWithProgress(params).then((data) => {
          console.info(TAG + 'getDataWithProgress start');
          let pastePath = dstDir + '/test18.txt';
          expect(fs.accessSync(pastePath)).assertEqual(true);
          console.info(TAG + 'getDataWithProgress success');
        }).catch((error: BusinessError) => {
          console.info(TAG + 'getDataWithProgress failed,error: ' + JSON.stringify(error));
          expect().assertFail();
        })
      } catch (err) {
        console.info(TAG + 'getDataWithProgress fail,err：' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_ProgressTest_1800 end ************')
    })
  })
}