/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../hypium/index";
import deviceInfo from '@ohos.deviceInfo'
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from "@ohos.app.ability.common"
import distributedDataObject from '@ohos.data.distributedDataObject';
import commonType from '@ohos.data.commonType'
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let TAG = 'OBJECTSTORE_TEST';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let context: common.Context | undefined;

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

class SourceObject {
  name: string
  age: int
  isVis: boolean

  constructor(name: string, age: int, isVis: boolean) {
    this.name = name
    this.age = age
    this.isVis = isVis
  }
}

let attachment: commonType.Asset =
  {
    name: 'test_img.jpg',
    uri: 'file://com.example.myapplication/data/storage/el2/distributedfiles/dir/test_img.jpg',
    path: '/dir/test_img.jpg',
    createTime: '2024-01-02 10:00:00',
    modifyTime: '2024-01-02 10:00:00',
    size: '5',
    // status: commonType.AssetStatus.ASSET_NORMAL
  } as commonType.Asset;
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

let progressCallback1: distributedDataObject.ProgressObserver = (sessionId: string, progress: int) => {
}

let progressCallback2: distributedDataObject.ProgressObserver = (sessionId: string, progress: int) => {
}

export default function DataObjectErrTest() {
  describe('DataObjectErrTest', () => {
    let currentDeviceIsTv = false;
    beforeAll(async (): Promise<void> => {
      await abilityDelegator.startAbility({
        bundleName: 'com.example.actsdataobjectstatictest.static',
        abilityName: 'EntryAbility'
      });
      await sleep(5000);
      await drivenFn();
      await sleep(2000);
      context = AppStorage.get<common.Context>("context")! as common.Context;
    })
    beforeEach(async (): Promise<void> => {
      await sleep(1000);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   DataObjectErrTest05
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0500
     * @tc.desc   Test DataObject save
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest05 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      await g_object.setSessionId("12345678");
      try {
        await g_object.save("");
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'save fail: error code = ' + err.code)
        expect(err.code).assertEqual(401)
      }
      console.info(TAG + '************ DataObjectErrTest05 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest07
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0700
     * @tc.desc   Test DataObject bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest07 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      g_object.setSessionId("1234567");
      try {
        g_object.bindAssetStore("attachment", bindInfo, () => { });
        console.info(TAG + 'bindAssetStore callback success');
      } catch (err) {
        if (err.code === 801) {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(801);
        } else {
          console.error(TAG + 'Failed to bindAssetStore. Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
        }
      }
      console.info(TAG + '************ DataObjectErrTest07 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest08
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0800
     * @tc.desc   Test DataObject bindAssetStore
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest08 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      g_object.setSessionId("12345");
      try {
        g_object.bindAssetStore("attachment", bindInfo);
        console.info(TAG + 'bindAssetStore promise success');
      } catch (err) {
        if (err.code === 801) {
          console.error(TAG + 'This device type does not support. Code: ' + err.code + ',message: ' + err.message);
          expect(err.code).assertEqual(801);
        } else {
          console.error(TAG + 'Failed to bindAssetStore. Code: ' + err.code + ',message: ' + err.message);
          expect().assertFail();
        }
      }
      console.info(TAG + '************ DataObjectErrTest08 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest09
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_0900
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest09 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      let uri = 'file:1.text';
      await g_object.setSessionId(distributedDataObject.genSessionId());
      try {
        await g_object.setAsset('file', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400003);
      }
      console.info(TAG + '************ DataObjectErrTest09 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest10
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1000
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest10 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      let uris: string[] = ['file:1.text'];
      await g_object.setSessionId(distributedDataObject.genSessionId());
      try {
        await g_object.setAssets('file', uris);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400003);
      }
      console.info(TAG + '************ DataObjectErrTest10 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest11
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1100
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest11 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onChange(changeCallback1);
        console.info(TAG + 'on20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest11 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest14
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1400
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest14 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onChange(changeCallback1);
        g_object.onChange(changeCallback1);
        console.info(TAG + 'on change 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest14 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest15
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1500
     * @tc.desc   Test DataObject on change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest15 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onChange(changeCallback1);
        g_object.onChange(changeCallback2);
        console.info(TAG + 'on change 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on change20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest15 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest16
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1600
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest16 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onStatus(statusCallback1);
        console.info(TAG + 'on status 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest16 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest19
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_1900
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest19 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onStatus(statusCallback1);
        g_object.onStatus(statusCallback1);
        console.info(TAG + 'on status 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest19 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest20
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2000
     * @tc.desc   Test DataObject on status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest20 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onStatus(statusCallback1);
        g_object.onStatus(statusCallback2);
        console.info(TAG + 'on status 20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to on status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest20 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest21
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2100
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest21 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onChange(changeCallback1);
        g_object.offChange(changeCallback1);
        console.info(TAG + 'off change20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest21 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest22
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2200
     * @tc.desc   Test DataObject off change20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest22 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onChange(changeCallback1);
        g_object.onChange(changeCallback2);
        g_object.offChange();
        console.info(TAG + 'off change20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest22 end ************');
      done();
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
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onChange(changeCallback1);
        g_object.offChange(undefined);
        console.info(TAG + 'off change20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off change 20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest23 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest27
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2700
     * @tc.desc   Test DataObject off_status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest27 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onStatus(statusCallback1);
        g_object.offStatus(statusCallback1);
        console.info(TAG + 'off status20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest27 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest28
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_2800
     * @tc.desc   Test DataObject off_status20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest28 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onStatus(statusCallback1);
        g_object.onStatus(statusCallback2);
        g_object.offStatus();
        console.info(TAG + 'off status20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest28 end ************');
      done();
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
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onStatus(statusCallback1);
        g_object.offStatus(undefined);
        console.info(TAG + 'off status20 success.');
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest29 end ************')
    })

    /**
     * @tc.name   DataObjectErrTest31
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3100
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest31 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uri = 'file:1.txt';
        g_object.setAsset('attachment', uri);
        console.info(TAG + 'setAsset success.');
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest31 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest32
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3200
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest32 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uri = '';
        await g_object.setAsset('attachment', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest32 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest34
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3400
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest34 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uri = 'file:1.txt';
        await g_object.setAsset('', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest34 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest35
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3500
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest35 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uri = 'file:1.txt';
        await g_object.setAsset('', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest35 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest36
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3600
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest36 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uri = '';
        await g_object.setAsset('', uri);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAsset. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest36 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest38
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3800
     * @tc.desc   Test DataObject setAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest38 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
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
      console.info(TAG + '************ DataObjectErrTest38 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest39
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_3900
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest39 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uris = ['file:1.txt'];
        g_object.setAssets('attachment', uris);
        console.info(TAG + 'setAssets success.')
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest39 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest40
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4000
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest40 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
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
      console.info(TAG + '************ DataObjectErrTest40 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest41
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4100
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest41 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uris: string[] = [];
        await g_object.setAssets('attachment', uris);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest41 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest42
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4200
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest42 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uris: string[] = [];
        for (let index = 0; index < 51; index++) {
          let uri = `file${index + 1}:${index + 1}.txt`;
          uris.push(uri);
        }
        await g_object.setAssets('attachment', uris);
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
      console.info(TAG + '************ DataObjectErrTest42 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest43
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4300
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest43 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
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
      console.info(TAG + '************ DataObjectErrTest43 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest47
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4700
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest47 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uris = ['file:1.txt'];
        g_object.setAssets('', uris).then((err) => {
          expect().assertFail();
          console.error(TAG + 'then' + JSON.stringify(err));
          done();
        }).catch((err: Error) => {
          console.error(TAG + 'catch' + JSON.stringify(err));
          expect(err.code).assertEqual(15400002);
          done();
        })
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
      }
      console.info(TAG + '************ DataObjectErrTest47 end ************');
    })

    /**
     * @tc.name   DataObjectErrTest48
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4800
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest48 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uris: Array<string> = [];
        await g_object.setAssets('', uris);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest48 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest49
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_4900
     * @tc.desc   Test DataObject setAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest49 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        let uris: Array<string> = [];
        await g_object.setAssets('attachment', uris);
        expect().assertFail();
      } catch (err) {
        console.error(TAG + 'Failed to setAssets. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(15400002);
      }
      console.info(TAG + '************ DataObjectErrTest49 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest50
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5000
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest50 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onProgressChanged(progressCallback1);
        console.info(TAG + 'On progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest50 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest53
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5300
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest53 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onProgressChanged(progressCallback1);
        g_object.onProgressChanged(progressCallback1);
        console.info(TAG + 'On progressChanged twice success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest53 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest54
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5400
     * @tc.desc   Test DataObject on progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest54 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onProgressChanged(progressCallback1);
        g_object.onProgressChanged(progressCallback2);
        console.info(TAG + 'On progressChanged twice success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest54 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest55
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5500
     * @tc.desc   Test DataObject off progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest55 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onProgressChanged(progressCallback1);
        g_object.offProgressChanged(progressCallback1);
        console.info(TAG + 'Off progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest55 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest57
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5700
     * @tc.desc   Test DataObject off progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest57', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest57 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onProgressChanged(progressCallback1);
        g_object.onProgressChanged(progressCallback2);
        g_object.offProgressChanged(undefined);
        console.info(TAG + 'Off progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest57 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest58
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5800
     * @tc.desc   Test DataObject off progressChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest58', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest58 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.onProgressChanged(progressCallback1);
        g_object.onProgressChanged(progressCallback2);
        g_object.offProgressChanged();
        console.info(TAG + 'Off progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest58 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest59
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_5900
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest59', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest59 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offChange(changeCallback1);
      } catch (err) {
        console.error(TAG + 'Failed to off change20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      console.info(TAG + '************ DataObjectErrTest59 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest60
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6000
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest60', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest60 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offStatus(statusCallback1);
      } catch (err) {
        console.error(TAG + 'Failed to off status20. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      console.info(TAG + '************ DataObjectErrTest60 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest61
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6100
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest61', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest61 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offChange((sessionId: string, fields: Array<string>) => { });
      } catch (err) {
        console.error(TAG + 'Failed to off change. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      console.info(TAG + '************ DataObjectErrTest61 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest62
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6200
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest62', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest62 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offStatus((sessionId: string, networkId: string, status: string) => { });
      } catch (err) {
        console.error(TAG + 'Failed to off status. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      console.info(TAG + '************ DataObjectErrTest62 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest63
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6300
     * @tc.desc   Test DataObject off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest63', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest63 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offProgressChanged(progressCallback1);
      } catch (err) {
        console.error(TAG + 'Failed to off progress. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      console.info(TAG + '************ DataObjectErrTest63 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest64
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6400
     * @tc.desc   Test DataObject on progressChanged 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest64 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        for (let i = 0; i < 2000; i++) {
          g_object.onProgressChanged(progressCallback1);
        }
        console.info(TAG + 'On progressChanged 2000 end!');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest64 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest65
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6500
     * @tc.desc   Test DataObject on status 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest65', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest65 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        for (let i = 0; i < 2000; i++) {
          g_object.onStatus(statusCallback1);
        }
        console.info(TAG + 'On status 2000 end!');
      } catch (err) {
        console.error(TAG + 'Failed to on status. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest65 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest66
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6600
     * @tc.desc   Test DataObject on change 2000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest66', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest66 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        for (let i = 0; i < 2000; i++) {
          g_object.onChange(changeCallback1);
        }
        console.info(TAG + 'On status 2000 end!');
      } catch (err) {
        console.error(TAG + 'Failed to on status. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest66 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest67
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6700
     * @tc.desc   Test DataObject on progressChanged off on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest67', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest67 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offProgressChanged(progressCallback1);
      } catch (err) {
        console.error(TAG + 'Failed to off progressChanged. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      try {
        g_object.onProgressChanged(progressCallback1);
        console.info(TAG + 'on progressChanged success');
      } catch (err) {
        console.error(TAG + 'Failed to on progressChanged. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest67 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest68
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6800
     * @tc.desc   Test DataObject on status off on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest68', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest68 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offStatus(statusCallback1);
      } catch (err) {
        console.error(TAG + 'Failed to off status. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      try {
        g_object.onStatus(statusCallback1);
        console.info(TAG + 'on status success');
      } catch (err) {
        console.error(TAG + 'Failed to on status. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest68 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest69
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_6900
     * @tc.desc   Test DataObject on change off on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest69', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest69 start ************')
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, note);
      try {
        g_object.offChange(changeCallback1);
      } catch (err) {
        console.error(TAG + 'Failed to off change. code: ' + err.code + '.message:' + err.message);
        expect(err.code).assertEqual(0);
      }
      try {
        g_object.onChange(changeCallback1);
        console.info(TAG + 'on change success');
      } catch (err) {
        console.error(TAG + 'Failed to on change. code: ' + err.code + '.message:' + err.message);
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest69 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest70
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7000
     * @tc.desc   Test DataObject SetSessionId Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest70', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest70 start ************')
      let source: SourceObject = new SourceObject('jack', 18, false);
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, source);
      try {
        let sessionId= distributedDataObject.genSessionId();
        await g_object.setSessionId(sessionId);
        await sleep(2000);
        expect(sessionId == g_object["__sessionId"]).assertTrue();
      } catch (err) {
        expect().assertFail();
      }
      console.info(TAG + '************ DataObjectErrTest70 end ************');
      done();
    })

    /**
     * @tc.name   DataObjectErrTest71
     * @tc.number SUB_DistributedData_DataObject_JsApiErrTest_7100
     * @tc.desc   Test DataObject SetSessionId Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DataObjectErrTest71', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + '************ DataObjectErrTest71 start ************')
      let source: SourceObject = new SourceObject('jack', 18, false);
      let g_object: distributedDataObject.DataObject = distributedDataObject.create(context!, source);
      try {
        await g_object.setSessionId('123456@123');
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      console.info(TAG + '************ DataObjectErrTest71 end ************');
      done();
    })
  })
}