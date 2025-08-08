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

export default function DataObjectErrTest() {
  describe('DataObjectErrTest', () => {
    let currentDeviceIsTv = false;
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      context = AppStorage.get('context') as common.UIAbilityContext;
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsTv = deviceTypeInfo ==='tv' ? true : false;
      console.info(TAG + 'the value of the deviceType is:' + deviceInfo.deviceType);
      done()
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_DataObject_on_Change_ErrTest_0100
     * @tc.name DataObjectErrTest01
     * @tc.desc Test DataObject on Change
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number SUB_DataObject_off_Change_ErrTest_0100
     * @tc.name DataObjectErrTest02
     * @tc.desc Test DataObject off Change
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number SUB_DataObject_off_Status_ErrTest_0100
     * @tc.name DataObjectErrTest03
     * @tc.desc Test DataObject offStatus
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_off_Status_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_off_Status_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      try {
        g_object.off("status", null)
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to on.Code:' + err.code + ',message:' + err.message);
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_DataObject_off_Status_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_DataObject_save_Callback_ErrTest_0100
     * @tc.name DataObjectErrTest04
     * @tc.desc Test DataObject save
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_save_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_save_Callback_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("123456789");
      try {
        g_object.save(null, (err: BusinessError, result:distributedDataObject.SaveSuccessResponse) => {});
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'save fail: error code = ' + err.code)
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_DataObject_save_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_DataObject_save_Promise_ErrTest_0100
     * @tc.name DataObjectErrTest05
     * @tc.desc Test DataObject save
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_save_Promise_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_save_Promise_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("12345678");
      try {
        g_object.save("");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'save fail: error code = ' + err.code)
        expect(err.code).assertEqual('401')
      }

      console.info(TAG + '************ SUB_DataObject_save_Promise_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_DataObject_revokeSave_Callback_ErrTest_0100
     * @tc.name DataObjectErrTest06
     * @tc.desc Test DataObject revokeSave
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_revokeSave_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_revokeSave_Callback_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("123456");
      try {
        g_object.revokeSave(null);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'revokeSave fail: error code = ' + err.code)
        expect(err.code).assertEqual('401')
      }
      console.info(TAG + '************ SUB_DataObject_revokeSave_Callback_ErrTest_0100 end ************')
    })

    /**
     * @tc.number SUB_DataObject_bindAssetStore_Callback_ErrTest_0100
     * @tc.name DataObjectErrTest07
     * @tc.desc Test DataObject bindAssetStore
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_bindAssetStore_Callback_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      console.info(TAG + '************ SUB_DataObject_bindAssetStore_Callback_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("1234567");

      try {
        g_object.bindAssetStore('attachment', bindInfo, (err: BusinessError) => {
          if (currentDeviceIsTv) {
            console.info(TAG + 'bindAssetStore fail.Code: ' + err.code + ',message: ' + err.message);
            expect(err.code).assertEqual('801');
          } else if (!currentDeviceIsTv && err) {
            expect().assertFail();
          }
          expect(err).assertEqual(undefined);
          console.info(TAG + 'bindAssetStore success.');
          console.info(TAG + '************ SUB_DataObject_bindAssetStore_Callback_ErrTest_0100 end ************')
          done();
        });
      } catch (err) {
        console.error(TAG + 'Code: ' + err.code + ',message: ' + err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_DataObject_bindAssetStore_Promise_ErrTest_0100
     * @tc.name DataObjectErrTest08
     * @tc.desc Test DataObject bindAssetStore
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DataObject_bindAssetStore_Promise_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(TAG + '************ SUB_DataObject_bindAssetStore_Promise_ErrTest_0100 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context, note);
      g_object.setSessionId("12345");

      g_object.bindAssetStore("attachment", bindInfo).then(() => {
        console.info(TAG + 'bindAssetStore success.');
      }).catch((err: BusinessError) => {
        if (currentDeviceIsTv && err) {
          console.info(TAG + 'bindAssetStore fail. Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        } else if (!currentDeviceIsTv && err) {
          expect().assertFail();
        }
      });
      console.info(TAG + '************ SUB_DataObject_bindAssetStore_Promise_ErrTest_0100 end ************')
    })
  })
}