/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import testndk from 'libentry.so';
import pasteboard from "libpasteboard.so"
import udmf from "libudmf.so"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import batteryInfo from '@ohos.batteryInfo';
import { BusinessError } from '@ohos.base';
import { abilityAccessCtrl, common, PermissionRequestResult} from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

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

let TAG = '[testLog-ets]';
export default function pasteboardTestNdkTest() {
  describe('pasteboardTestNdkTest', async (done: Function) => {
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })


    /**
     * @tc.name   OH_PasteboardSubscriber_Create0100
     * @tc.number OH_PasteboardSubscriber_Create0100
     * @tc.desc   OH_PasteboardSubscriber_Create0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PasteboardSubscriber_Create0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data = testndk.OH_PasteboardSubscriber_Create0100();
      console.info(TAG + "OH_PasteboardSubscriber_Create0100 data = " + data );
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.name   OH_PasteboardObserver_SetData0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.desc   OH_PasteboardObserver_SetData test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_PasteboardObserver_SetData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0100' );
      let data = testndk.OH_PasteboardObserver_SetData0100();
      console.info( TAG + 'OH_PasteboardObserver_SetData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_PasteboardObserver_SetData0200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0300
     * @tc.desc   OH_PasteboardObserver_SetData test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PasteboardObserver_SetData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0200' );
      let data = testndk.OH_PasteboardObserver_SetData0200();
      console.info( TAG + 'OH_PasteboardObserver_SetData0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_PasteboardObserver_SetData0300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0400
     * @tc.desc   OH_PasteboardObserver_SetData test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PasteboardObserver_SetData0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0300' );
      let data = testndk.OH_PasteboardObserver_SetData0300();
      console.info( TAG + 'OH_PasteboardObserver_SetData0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_PasteboardObserver_SetData0400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0500
     * @tc.desc   OH_PasteboardObserver_SetData test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_PasteboardObserver_SetData0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0400' );
      let data = testndk.OH_PasteboardObserver_SetData0400();
      console.info( TAG + 'OH_PasteboardObserver_SetData0400 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Create0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0600
     * @tc.desc   OH_Pasteboard_Subscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_Pasteboard_Create0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      console.info( TAG + 'OH_Pasteboard_Create0100' );
      let data = testndk.OH_Pasteboard_Create0100();
      console.info( TAG + 'OH_Pasteboard_Create0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Subscribe0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0700
     * @tc.desc   OH_Pasteboard_Subscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Subscribe0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0100' );
      let data = testndk.OH_Pasteboard_Subscribe0100();
      console.info( TAG + 'OH_Pasteboard_Subscribe0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Subscribe0200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0800
     * @tc.desc   OH_Pasteboard_Subscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Subscribe0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0200' );
      let data = testndk.OH_Pasteboard_Subscribe0200();
      console.info( TAG + 'OH_Pasteboard_Subscribe0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Subscribe0300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0900
     * @tc.desc   OH_Pasteboard_Subscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Subscribe0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0300' );
      let data = testndk.OH_Pasteboard_Subscribe0300();
      console.info( TAG + 'OH_Pasteboard_Subscribe0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Subscribe0400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1000
     * @tc.desc   OH_Pasteboard_Subscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Subscribe0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0400' );
      let data = testndk.OH_Pasteboard_Subscribe0400();
      console.info( TAG + 'OH_Pasteboard_Subscribe0400 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Subscribe0500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1100
     * @tc.desc   OH_Pasteboard_Subscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Subscribe0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0500' );
      let data = testndk.OH_Pasteboard_Subscribe0500();
      console.info( TAG + 'OH_Pasteboard_Subscribe0500 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Subscribe0600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1200
     * @tc.desc   OH_Pasteboard_Subscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Subscribe0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0600' );
      let data = testndk.OH_Pasteboard_Subscribe0600();
      console.info( TAG + 'OH_Pasteboard_Subscribe0600 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Unsubcribe0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1300
     * @tc.desc   OH_Pasteboard_Unsubscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Unsubcribe0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0100' );
      let data = testndk.OH_Pasteboard_Unsubcribe0100();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Unsubcribe0200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1400
     * @tc.desc   OH_Pasteboard_Unsubscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Unsubcribe0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0200' );
      let data = testndk.OH_Pasteboard_Unsubcribe0200();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Unsubcribe0300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1500
     * @tc.desc   OH_Pasteboard_Unsubscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Unsubcribe0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0300' );
      let data = testndk.OH_Pasteboard_Unsubcribe0300();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Unsubcribe0400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1600
     * @tc.desc   OH_Pasteboard_Unsubscribe test invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Unsubcribe0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0400' );
      let data = testndk.OH_Pasteboard_Unsubcribe0400();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0400 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_Unsubcribe0500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1700
     * @tc.desc   OH_PasteboardObserver_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_Unsubcribe0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0500' );
      let data = testndk.OH_Pasteboard_Unsubcribe0500();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0500 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_IsRemoteData0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1800
     * @tc.desc   OH_Pasteboard_IsRemoteData test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_IsRemoteData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_IsRemoteData0100' );
      let data = testndk.OH_Pasteboard_IsRemoteData0100();
      console.info( TAG + 'OH_Pasteboard_IsRemoteData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.name   OH_Pasteboard_GetDataSrouce0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1900
     * @tc.desc   OH_Pasteboard_GetDataSrouce test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataSrouce0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_GetDataSrouce0100' );
      let data = testndk.OH_Pasteboard_GetDataSrouce0100();
      console.info( TAG + 'OH_Pasteboard_GetDataSrouce0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasType0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2000
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0100' );
      let data = testndk.OH_Pasteboard_HasType0100();
      console.info( TAG + 'OH_Pasteboard_HasType0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasData0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2100
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasData0100' );
      let data = testndk.OH_Pasteboard_HasData0100();
      console.info( TAG + 'OH_Pasteboard_HasData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_ClearData0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2200
     * @tc.desc   OH_Pasteboard_HasData test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_ClearData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_ClearData0100' );
      let data = testndk.OH_Pasteboard_ClearData0100();
      console.info( TAG + 'OH_Pasteboard_ClearData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_SetData0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2300
     * @tc.desc   OH_Pasteboard_SetData test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_SetData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_SetData0100' );
      let data = testndk.OH_Pasteboard_SetData0100();
      console.info( TAG + 'OH_Pasteboard_SetData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_GetData0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2400
     * @tc.desc   OH_Pasteboard_GetData test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetData0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_GetData0100' );
      let data = testndk.OH_Pasteboard_GetData0100();
      console.info( TAG + 'OH_Pasteboard_GetData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_GetData0200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2500
     * @tc.desc   OH_Pasteboard_GetData test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetData0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_GetData0200' );
      let data = testndk.OH_Pasteboard_GetData0200();
      console.info( TAG + 'OH_Pasteboard_GetData0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_GetData0300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2600
     * @tc.desc   OH_Pasteboard_GetData test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetData0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_GetData0300' );
      let data = testndk.OH_Pasteboard_GetData0300();
      console.info( TAG + 'OH_Pasteboard_GetData0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_SyncDelayedDataAsyncTest0100
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2700
     * @tc.desc   OH_Pasteboard_SyncDelayedDataAsync test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_SyncDelayedDataAsyncTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_SyncDelayedDataAsyncTest0100' );
      let data = testndk.OH_Pasteboard_SyncDelayedDataAsyncTest0100();
      console.info( TAG + 'OH_Pasteboard_SyncDelayedDataAsyncTest0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_SyncDelayedDataAsyncTest0200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2800
     * @tc.desc   OH_Pasteboard_SyncDelayedDataAsync test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_SyncDelayedDataAsyncTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_SyncDelayedDataAsyncTest0200' );
      let data = testndk.OH_Pasteboard_SyncDelayedDataAsyncTest0200();
      console.info( TAG + 'OH_Pasteboard_SyncDelayedDataAsyncTest0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_SyncDelayedDataAsyncTest0300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2900
     * @tc.desc   OH_Pasteboard_SyncDelayedDataAsync test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_SyncDelayedDataAsyncTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_SyncDelayedDataAsyncTest0300' );
      let data = testndk.OH_Pasteboard_SyncDelayedDataAsyncTest0300();
      console.info( TAG + 'OH_Pasteboard_SyncDelayedDataAsyncTest0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasType0200
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_3000
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0200' );
      let data = testndk.OH_Pasteboard_HasType0200();
      console.info( TAG + 'OH_Pasteboard_HasType0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasType0300
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_3100
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0300' );
      let data = testndk.OH_Pasteboard_HasType0300();
      console.info( TAG + 'OH_Pasteboard_HasType0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasType0400
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_3200
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0400' );
      let data = testndk.OH_Pasteboard_HasType0400();
      console.info( TAG + 'OH_Pasteboard_HasType0400 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasType0500
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_3300
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0500' );
      let data = testndk.OH_Pasteboard_HasType0500();
      console.info( TAG + 'OH_Pasteboard_HasType0500 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasType0600
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_3400
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0600' );
      let data = testndk.OH_Pasteboard_HasType0600();
      console.info( TAG + 'OH_Pasteboard_HasType0600 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })

    /**
     * @tc.name   OH_Pasteboard_HasType0700
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_3500
     * @tc.desc   OH_Pasteboard_HasType test valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_HasType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0700' );
      let data = testndk.OH_Pasteboard_HasType0700();
      console.info( TAG + 'OH_Pasteboard_HasType0700 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
  })
}