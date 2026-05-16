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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError, Device, deviceInfo } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { commonType, distributedDataObject } from '@kit.ArkData';
import { Driver, ON } from '@kit.TestKit';

let TAG = 'ttt';
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let context: common.UIAbilityContext | undefined;

let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.DISTRIBUTED_DATASYNC'], (err:BusinessError, data:PermissionRequestResult) => {
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
      let button1 = await driver.findComponent(ON.text('允许'));
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

class Note {
  title: string | undefined
  text: string | undefined
  attachment: commonType.Asset | undefined

  constructor(title: string | undefined, text: string | undefined, attachment: commonType.Asset | undefined) {
    this.title = title;
    this.text = text;
    this.attachment = attachment;
  }
}

let attachment: commonType.Asset = {
  name: 'test_img.jpg',
  uri: 'file://com.example.myapplication/data/storage/el2/distributedfiles/dir/test_img.jpg',
  path: '/dir/test_img.jpg',
  createTime: '2024-01-02 10:00:00',
  modifyTime: '2024-01-02 10:00:00',
  size: '5',
  status: commonType.AssetStatus.ASSET_NORMAL
}
let note: Note = new Note('test', 'test', attachment);

const bindInfo: distributedDataObject.BindInfo = {
  storeName: 'notepad',
  tableName: 'note_t',
  primaryKey: {
    'uuid': '00000000-0000-0000-0000-000000000000'
  },
  field: 'attachment',
  assetName: attachment.name as string
}

let changeCallback1: distributedDataObject.DataObserver = (sessionId: string, fields: Array<string>) => {
}

let changeCallback2: distributedDataObject.DataObserver = (sessionId: string, fields: Array<string>) => {
}

let statusCallback1: distributedDataObject.StatusObserver = (sessionId: string, networkId: string, status: string) => {
}

let statusCallback2: distributedDataObject.StatusObserver = (sessionId: string, networkId: string, status: string) => {
}

let progressCallback1: distributedDataObject.ProgressObserver = (sessionId: string, progress:number) => {
}

let progressCallback2: distributedDataObject.ProgressObserver = (sessionId: string, progress:number) => {
}

export default function DataObjectErrTest() {
  describe('DataObjectErrTest', () => {
    let currentDeviceIsTv = false;
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      context = AppStorage.get('context') as common.UIAbilityContext;
      done()
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_DataObject_on_Change_ErrTest_0100
     * @tc.number SUB_DataObject_on_Change_ErrTest_0100
     * @tc.desc   Test DataObject on Change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DataObject_on_Change_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_on_Change_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on.Code:' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_DataObject_on_Change_ErrTest_0100 end ************')
    })

    /**
     * @tc.name   SUB_DataObject_off_Change_ErrTest_0100
     * @tc.number SUB_DataObject_off_Change_ErrTest_0100
     * @tc.desc   Test DataObject off Change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DataObject_off_Change_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_off_Change_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('change', null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on.Code:' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_DataObject_off_Change_ErrTest_0100 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest03
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0300
     * @tc.desc   Test DataObject offStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest03 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off("status", null)
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on.Code:' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ DataObjectErrTest03 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest04
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0400
     * @tc.desc   Test DataObject save
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest04 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("123456789");
      try {
        g_object.save(null, (err: BusinessError, result:distributedDataObject.SaveSuccessResponse) => {});
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'save fail: error code = ' + err.code)
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ DataObjectErrTest04 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest05
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0500
     * @tc.desc   Test DataObject save
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest05 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("12345678");
      try {
        g_object.save("");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'save fail: error code = ' + err.code)
        expect(err.code).assertEqual('401')
      }

      console.info(TAG + '************ DataObjectErrTest05 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest06
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0600
     * @tc.desc   Test DataObject revokeSave
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest06 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("123456");
      try {
        g_object.revokeSave(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'revokeSave fail: error code = ' + err.code)
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ DataObjectErrTest06 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest07
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0700
     * @tc.desc   Test DataObject bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest07 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("1234567");
      try {
        g_object.bindAssetStore("attachment", bindInfo, (err: BusinessError) => {});
        console.info(TAG + 'bindAssetStore callback success');
      } catch (err) {
        if (err.code == '801') {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual('801');
        } else {
          console.error(TAG + 'Failed to bindAssetStore. Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
        }
      }
      console.info(TAG + '************ DataObjectErrTest07 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest08
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0800
     * @tc.desc   Test DataObject bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest08 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("12345");
      try {
        g_object.bindAssetStore("attachment", bindInfo);
        console.info(TAG + 'bindAssetStore promise success');
      } catch (err) {
        if (err.code == '801') {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual('801');
        } else {
          console.error(TAG + 'Failed to bindAssetStore. Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
        }
      }
      console.info(TAG + '************ DataObjectErrTest08 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest09
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0900
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest09 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      let uri = 'file:1.text';
      g_object.setSessionId(distributedDataObject.genSessionId());
      try {
        g_object.setAsset('file', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400003);
      }

      console.info(TAG + '************ DataObjectErrTest09 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest10
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1000
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest10 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      let uris: string[] = ['file:1.text'];
      g_object.setSessionId(distributedDataObject.genSessionId());
      try {
        g_object.setAssets('file', uris);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400003);
      }
      console.info(TAG + '************ DataObjectErrTest10 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest11
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1100
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest11 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on("change", changeCallback1);
        console.info(TAG + 'on20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest11 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest12
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1200
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest12 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on(undefined, changeCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ DataObjectErrTest12 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest13
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1300
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest13 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ DataObjectErrTest13 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest14
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1400
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest14 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.on('change', changeCallback1);
        console.info(TAG + 'on change 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest14 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest15
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1500
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest15 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.on('change', changeCallback2);
        console.info(TAG + 'on change 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest15 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest16
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1600
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest16 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', statusCallback1);
        console.info(TAG + 'on status 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest16 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest17
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1700
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest17 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ DataObjectErrTest17 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest18
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1800
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest18 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on(undefined, statusCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ DataObjectErrTest18 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest19
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1900
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest19 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', statusCallback1);
        g_object.on('status', statusCallback1);
        console.info(TAG + 'on status 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest19 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest20
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2000
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest20 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', statusCallback1);
        g_object.on('status', statusCallback2);
        console.info(TAG + 'on status 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest20 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest21
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2100
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest21 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.off('change', changeCallback1);
        console.info(TAG + 'off change20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest21 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest22
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2200
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest22 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.on('change', changeCallback2);
        g_object.off('change');
        console.info(TAG + 'off change20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest22 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest23
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2300
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest23 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.off('change', undefined);
        console.info(TAG + 'off change20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest23 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest24
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2400
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest24 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.off(undefined, changeCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ DataObjectErrTest24 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest25
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2500
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest25 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.off(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ DataObjectErrTest25 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest26
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2600
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest26 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('change', changeCallback1);
        g_object.off(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ DataObjectErrTest26 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest27
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2700
     * @tc.desc   Test DataObject off_status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest27 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', statusCallback1);
        g_object.off('status', statusCallback1);
        console.info(TAG + 'off status20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest27 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest28
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2800
     * @tc.desc   Test DataObject off_status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest28 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', statusCallback1);
        g_object.on('status', statusCallback2);
        g_object.off('status');
        console.info(TAG + 'off status20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest28 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest29
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2900
     * @tc.desc   Test DataObject off_status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest29 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', statusCallback1);
        g_object.off('status', undefined);
        console.info(TAG + 'off status20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest29 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest30
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3000
     * @tc.desc   Test DataObject off_status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest30 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('status', statusCallback1);
        g_object.off(undefined, statusCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG + '************ DataObjectErrTest30 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest31
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3100
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest31 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = 'file:1.txt';
        g_object.setAsset('attachment', uri);
        console.info(TAG + 'setAsset success.');
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest31 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest32
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3200
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest32 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = '';
        g_object.setAsset('attachment', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest32 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest33
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3300
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest33 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = undefined;
        g_object.setAsset('attachment', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest33 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest34
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3400
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest34 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = 'file:1.txt';
        g_object.setAsset('', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest34 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest35
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3500
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest35 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = 'file:1.txt';
        g_object.setAsset('', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest35 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest36
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3600
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest36 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = '';
        g_object.setAsset('', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest36 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest37
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3700
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest37 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = 'file:1.txt';
        g_object.setAsset(undefined, uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest37 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest38
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3800
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest38 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uri = 'file:1.txt';
        let uri2 = 'file:2.txt';
        g_object.setAsset('attachment', uri);
        g_object.setAsset('attachment', uri2);
        console.info(TAG + 'setAsset success.')
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest38 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest39
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3900
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest39 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris = ['file:1.txt'];
        g_object.setAssets('attachment', uris);
        console.info(TAG + 'setAssets success.')
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest39 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest40
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4000
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest40 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris: string[] = [];
        for (let index = 0; index < 50; index++) {
          let uri = `file${index + 1}:${index + 1}.txt`;
          uris.push(uri);
        }
        g_object.setAssets('attachment', uris);
        console.info(TAG + 'setAssets success.')
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest40 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest41
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4100
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest41 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris: string[] = [];
        g_object.setAssets('attachment', uris);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest41 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest42
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4200
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest42 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris: string[] = [];
        for (let index = 0; index < 51; index++) {
          let uri = `file${index + 1}:${index + 1}.txt`;
          uris.push(uri);
        }
        g_object.setAssets('attachment', uris);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      } 
      try {
        g_object.setAssets('attachment', ['file:1.txt'])
        console.info(TAG + 'setAssets success.')
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest42 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest43
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4300
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest43 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris1 = ['file:1.txt'];
        let uris2 = ['file:2.txt'];
        g_object.setAssets('attachment', uris1);
        g_object.setAssets('attachment', uris2);
        console.info(TAG + 'setAssets success.')
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest43 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest44
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4400
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest44 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris = ['file:1.txt'];
        g_object.setAssets(undefined, uris);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      } 
      console.info(TAG + '************ DataObjectErrTest44 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest45
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4500
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest45 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris = undefined;
        g_object.setAssets(undefined, uris);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      } 
      console.info(TAG + '************ DataObjectErrTest45 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest46
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4600
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest46 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris = undefined;
        g_object.setAssets('attachment', uris);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      } 
      console.info(TAG + '************ DataObjectErrTest46 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest47
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4700
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest47 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris = ['file:1.txt'];
        g_object.setAssets('', uris);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      } 
      console.info(TAG + '************ DataObjectErrTest47 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest48
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4800
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest48 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris = [];
        g_object.setAssets('', uris);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      } 
      console.info(TAG + '************ DataObjectErrTest48 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest49
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4900
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest49 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        let uris = [];
        g_object.setAssets('attachment', uris);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      } 
      console.info(TAG + '************ DataObjectErrTest49 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest50
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5000
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest50 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', progressCallback1);
        console.info(TAG + 'On progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest50 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest51
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5100
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest51 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on(undefined, progressCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      } 
      console.info(TAG + '************ DataObjectErrTest51 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest52
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5200
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest52', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest52 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      } 
      console.info(TAG + '************ DataObjectErrTest52 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest53
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5300
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest53 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', progressCallback1);
        g_object.on('progressChanged', progressCallback1);
        console.info(TAG + 'On progressChanged twice success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest53 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest54
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5400
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest54 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', progressCallback1);
        g_object.on('progressChanged', progressCallback2);
        console.info(TAG + 'On progressChanged twice success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest54 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest55
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5500
     * @tc.desc   Test DataObject off progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest55 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', progressCallback1);
        g_object.off('progressChanged', progressCallback1);
        console.info(TAG + 'Off progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest55 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest56
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5600
     * @tc.desc   Test DataObject off progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest56', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest56 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', progressCallback1);
        g_object.off(undefined, progressCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('401');
      } 
      console.info(TAG + '************ DataObjectErrTest56 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest57
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5700
     * @tc.desc   Test DataObject off progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest57', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest57 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', progressCallback1);
        g_object.on('progressChanged', progressCallback2);
        g_object.off('progressChanged', undefined);
        console.info(TAG + 'Off progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest57 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest58
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5800
     * @tc.desc   Test DataObject off progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest58', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest58 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.on('progressChanged', progressCallback1);
        g_object.on('progressChanged', progressCallback2);
        g_object.off('progressChanged');
        console.info(TAG + 'Off progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest58 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest59
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5900
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest59', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest59 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('change', changeCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off change20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      console.info(TAG + '************ DataObjectErrTest59 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest60
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6000
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest60', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest60 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('status', statusCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      console.info(TAG + '************ DataObjectErrTest60 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest61
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6100
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest61', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest61 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('change', (sessionId: string, fields: Array<string>) => {});
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off change. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      console.info(TAG + '************ DataObjectErrTest61 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest62
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6200
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest62', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest62 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('status', (sessionId: string, networkId: string, status: 'online' | 'offline') => {});
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off status. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      console.info(TAG + '************ DataObjectErrTest62 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest63
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6300
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest63', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest63 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('progressChanged', progressCallback1);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to off progress. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      console.info(TAG + '************ DataObjectErrTest63 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest64
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6400
     * @tc.desc   Test DataObject on progressChanged 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest64 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        for (let i = 0; i < 2000; i++) {
          g_object.on('progressChanged', progressCallback1);
        }
        console.info(TAG + 'On progressChanged 2000 end!');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest64 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest65
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6500
     * @tc.desc   Test DataObject on status 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest65', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest65 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        for (let i = 0; i < 2000; i++) {
          g_object.on('status', statusCallback1);
        }
        console.info(TAG + 'On status 2000 end!');
      } catch (err) {
        console.error(TAG + 'Failed to on status. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest65 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest66
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6600
     * @tc.desc   Test DataObject on change 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest66', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest66 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        for (let i = 0; i < 2000; i++) {
          g_object.on('change', changeCallback1);
        }
        console.info(TAG + 'On status 2000 end!');
      } catch (err) {
        console.error(TAG + 'Failed to on status. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      } 
      console.info(TAG + '************ DataObjectErrTest66 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest67
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6700
     * @tc.desc   Test DataObject on progressChanged off on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest67', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest67 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('progressChanged', progressCallback1);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      try {
        g_object.on('progressChanged', progressCallback1);
        console.info(TAG + 'on progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest67 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest68
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6800
     * @tc.desc   Test DataObject on status off on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest68', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest68 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('status', statusCallback1);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to off status. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      try {
        g_object.on('status', statusCallback1);
        console.info(TAG + 'on status success');
      } catch (err) {
        console.error(TAG + 'Failed to on status. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest68 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest69
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6900
     * @tc.desc   Test DataObject on change off on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest69', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest69 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off('change', changeCallback1);
        expect().assertFail()
      } catch (err) {
        console.error(TAG + 'Failed to off change. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual('0');
      } 
      try {
        g_object.on('change', changeCallback1);
        console.info(TAG + 'on change success');
      } catch (err) {
        console.error(TAG + 'Failed to on change. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest69 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest70
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7000
     * @tc.desc   Test DataObject SetSessionId Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest70', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest70 start ************')
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
      let source: SourceObject = new SourceObject('jack', 18, false);
      let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(source);
      let result = g_object.setSessionId(distributedDataObject.genSessionId());
      expect(result).assertEqual(true);
      console.info(TAG + '************ DataObjectErrTest70 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest71
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7100
     * @tc.desc   Test DataObject SetSessionId Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest71', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest71 start ************')
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
      let source: SourceObject = new SourceObject('jack', 18, false);
      let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(source);
      let result = g_object.setSessionId('123456@123');
      expect(result).assertEqual(false);
      console.info(TAG + '************ DataObjectErrTest71 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest72
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7200
     * @tc.desc   Test DistributedObject SetSessionId 128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest72', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest72 start ************')
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
      let source: SourceObject = new SourceObject('jack', 18, false);
      let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(source);
      let str = "a".repeat(128);
      let result = g_object.setSessionId(str);
      expect(result).assertEqual(true);
      console.info(TAG + '************ DataObjectErrTest72 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest73
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7300
     * @tc.desc   Test DistributedObject SetSessionId 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest73', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ DataObjectErrTest73 start ************')
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
      let source: SourceObject = new SourceObject('jack', 18, false);
      let g_object: distributedDataObject.DistributedObject = distributedDataObject.createDistributedObject(source);
      let str = "b".repeat(129);
      let result = g_object.setSessionId(str);
      expect(result).assertEqual(false);
      console.info(TAG + '************ DataObjectErrTest73 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest74
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7400
     * @tc.desc   Test Object SetSessionId callback 128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest74', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info(TAG + '************ DataObjectErrTest74 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      let str = "c".repeat(128);
      g_object.setSessionId(str, (err) => {
        if(err){
          console.error(TAG + 'err' + JSON.stringify(err));
          expect().assertFail();
        }
        expect(err).assertNull();
        console.info(TAG + '************ DataObjectErrTest74 end ************');
        done();
      });
    })

    /**
     * @tc.name   DataObjectErrTest75
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7500
     * @tc.desc   Test Object SetSessionId callback 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest75', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info(TAG + '************ DataObjectErrTest75 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      let str = "d".repeat(129);
      try {
        g_object.setSessionId(str, (err) => {
          if(err){
            console.error(TAG + 'err' + JSON.stringify(err));
          }
          expect().assertFail();
        });
      } catch (err) {
        console.error(TAG + 'catchErr' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info(TAG + '************ DataObjectErrTest75 end ************');
        done();
      }
    })

    /**
     * @tc.name   DataObjectErrTest76
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7600
     * @tc.desc   Test Object SetSessionId promise 128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest76', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ DataObjectErrTest76 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      let str = "e".repeat(128);
      try {
        let count = 0;
        await g_object.setSessionId(str);
        count += 1;
        expect(count).assertEqual(1);
      } catch (err) {
        console.error(TAG + 'catchErr' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest76 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest77
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7700
     * @tc.desc   Test Object SetSessionId promise 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest77', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info(TAG + '************ DataObjectErrTest77 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      let str = "e".repeat(129);
      try {
        await g_object.setSessionId(str);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'catchErr' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
      }
      console.info(TAG + '************ DataObjectErrTest77 end ************');
    })
  })
}