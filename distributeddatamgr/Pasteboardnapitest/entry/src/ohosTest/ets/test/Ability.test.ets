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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import batteryInfo from '@ohos.batteryInfo';

let TAG = '[testLog-ets]';
export default function pasteboardTestNdkTest() {
  describe('pasteboardTestNdkTest', async (done: Function) => {




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0100
     * @tc.name OH_PasteboardSubscriber_Create0100
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_PasteboardSubscriber_Create0100', 0, async (done: Function) => {
      let data = testndk.OH_PasteboardSubscriber_Create0100();
      console.info(TAG + "OH_PasteboardSubscriber_Create0100 data = " + data );
      expect(data).assertEqual(1);
      done();
    });






    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_PasteboardObserver_SetData0100
     * @tc.desc OH_PasteboardObserver_SetData test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_PasteboardObserver_SetData0100',0, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0100' );
      let data = testndk.OH_PasteboardObserver_SetData0100();
      console.info( TAG + 'OH_PasteboardObserver_SetData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })



    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0300
     * @tc.name OH_PasteboardObserver_SetData0200
     * @tc.desc OH_PasteboardObserver_SetData test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_PasteboardObserver_SetData0200',0, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0200' );
      let data = testndk.OH_PasteboardObserver_SetData0200();
      console.info( TAG + 'OH_PasteboardObserver_SetData0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })



    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0400
     * @tc.name OH_PasteboardObserver_SetData0300
     * @tc.desc OH_PasteboardObserver_SetData test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_PasteboardObserver_SetData0300',0, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0300' );
      let data = testndk.OH_PasteboardObserver_SetData0300();
      console.info( TAG + 'OH_PasteboardObserver_SetData0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })



    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0500
     * @tc.name OH_PasteboardObserver_SetData0400
     * @tc.desc OH_PasteboardObserver_SetData test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_PasteboardObserver_SetData0400',0, async function () {
      console.info( TAG + 'OH_PasteboardObserver_SetData0400' );
      let data = testndk.OH_PasteboardObserver_SetData0400();
      console.info( TAG + 'OH_PasteboardObserver_SetData0400 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })



    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0600
     * @tc.name OH_Pasteboard_Create0100
     * @tc.desc OH_Pasteboard_Subscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Create0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Create0100' );
      let data = testndk.OH_Pasteboard_Create0100();
      console.info( TAG + 'OH_Pasteboard_Create0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0700
     * @tc.name OH_PasteboardObserver_SetData0300
     * @tc.desc OH_Pasteboard_Subscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Subscribe0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0100' );
      let data = testndk.OH_Pasteboard_Subscribe0100();
      console.info( TAG + 'OH_Pasteboard_Subscribe0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0800
     * @tc.name OH_Pasteboard_Subscribe0200
     * @tc.desc OH_Pasteboard_Subscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Subscribe0200',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0200' );
      let data = testndk.OH_Pasteboard_Subscribe0200();
      console.info( TAG + 'OH_Pasteboard_Subscribe0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })





    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0900
     * @tc.name OH_Pasteboard_Subscribe0300
     * @tc.desc OH_Pasteboard_Subscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Subscribe0300',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0300' );
      let data = testndk.OH_Pasteboard_Subscribe0300();
      console.info( TAG + 'OH_Pasteboard_Subscribe0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1000
     * @tc.name OH_Pasteboard_Subscribe0400
     * @tc.desc OH_Pasteboard_Subscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Subscribe0400',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0400' );
      let data = testndk.OH_Pasteboard_Subscribe0400();
      console.info( TAG + 'OH_Pasteboard_Subscribe0400 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1100
     * @tc.name OH_Pasteboard_Subscribe0500
     * @tc.desc OH_Pasteboard_Subscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Subscribe0500',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0500' );
      let data = testndk.OH_Pasteboard_Subscribe0500();
      console.info( TAG + 'OH_Pasteboard_Subscribe0500 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1200
     * @tc.name OH_Pasteboard_Subscribe0600
     * @tc.desc OH_Pasteboard_Subscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Subscribe0600',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Subscribe0600' );
      let data = testndk.OH_Pasteboard_Subscribe0600();
      console.info( TAG + 'OH_Pasteboard_Subscribe0600 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1300
     * @tc.name OH_Pasteboard_Unsubcribe0100
     * @tc.desc OH_Pasteboard_Unsubscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Unsubcribe0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0100' );
      let data = testndk.OH_Pasteboard_Unsubcribe0100();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1400
     * @tc.name OH_Pasteboard_Unsubcribe0200
     * @tc.desc OH_Pasteboard_Unsubscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Unsubcribe0200',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0200' );
      let data = testndk.OH_Pasteboard_Unsubcribe0200();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1500
     * @tc.name OH_Pasteboard_Unsubcribe0300
     * @tc.desc OH_Pasteboard_Unsubscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Unsubcribe0300',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0300' );
      let data = testndk.OH_Pasteboard_Unsubcribe0300();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })



    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1600
     * @tc.name OH_Pasteboard_Unsubcribe0400
     * @tc.desc OH_Pasteboard_Unsubscribe test invalid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Unsubcribe0400',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0400' );
      let data = testndk.OH_Pasteboard_Unsubcribe0400();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0400 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1700
     * @tc.name OH_Pasteboard_Unsubcribe0500
     * @tc.desc OH_PasteboardObserver_Create
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_Unsubcribe0500',0, async function () {
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0500' );
      let data = testndk.OH_Pasteboard_Unsubcribe0500();
      console.info( TAG + 'OH_Pasteboard_Unsubcribe0500 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1800
     * @tc.name OH_Pasteboard_IsRemoteData0100
     * @tc.desc OH_Pasteboard_IsRemoteData test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_IsRemoteData0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_IsRemoteData0100' );
      let data = testndk.OH_Pasteboard_IsRemoteData0100();
      console.info( TAG + 'OH_Pasteboard_IsRemoteData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_1900
     * @tc.name OH_Pasteboard_GetDataSrouce0100
     * @tc.desc OH_Pasteboard_GetDataSrouce test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_GetDataSrouce0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_GetDataSrouce0100' );
      let data = testndk.OH_Pasteboard_GetDataSrouce0100();
      console.info( TAG + 'OH_Pasteboard_GetDataSrouce0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2000
     * @tc.name OH_Pasteboard_HasType0100
     * @tc.desc OH_Pasteboard_HasType test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_HasType0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_HasType0100' );
      let data = testndk.OH_Pasteboard_HasType0100();
      console.info( TAG + 'OH_Pasteboard_HasType0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })





    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2100
     * @tc.name OH_Pasteboard_HasData0100
     * @tc.desc OH_Pasteboard_HasType test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_HasData0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_HasData0100' );
      let data = testndk.OH_Pasteboard_HasData0100();
      console.info( TAG + 'OH_Pasteboard_HasData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })





    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2200
     * @tc.name OH_Pasteboard_ClearData0100
     * @tc.desc OH_Pasteboard_HasData test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_ClearData0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_ClearData0100' );
      let data = testndk.OH_Pasteboard_ClearData0100();
      console.info( TAG + 'OH_Pasteboard_ClearData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })





    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2300
     * @tc.name OH_Pasteboard_SetData0100
     * @tc.desc OH_Pasteboard_SetData test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_SetData0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_SetData0100' );
      let data = testndk.OH_Pasteboard_SetData0100();
      console.info( TAG + 'OH_Pasteboard_SetData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })





    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2400
     * @tc.name OH_Pasteboard_GetData0100
     * @tc.desc OH_Pasteboard_GetData test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_GetData0100',0, async function () {
      console.info( TAG + 'OH_Pasteboard_GetData0100' );
      let data = testndk.OH_Pasteboard_GetData0100();
      console.info( TAG + 'OH_Pasteboard_GetData0100 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })




    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2500
     * @tc.name OH_Pasteboard_GetData0200
     * @tc.desc OH_Pasteboard_GetData test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_GetData0200',0, async function () {
      console.info( TAG + 'OH_Pasteboard_GetData0200' );
      let data = testndk.OH_Pasteboard_GetData0200();
      console.info( TAG + 'OH_Pasteboard_GetData0200 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })





    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_2600
     * @tc.name OH_Pasteboard_GetData0300
     * @tc.desc OH_Pasteboard_GetData test valid
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_GetData0300',0, async function () {
      console.info( TAG + 'OH_Pasteboard_GetData0300' );
      let data = testndk.OH_Pasteboard_GetData0300();
      console.info( TAG + 'OH_Pasteboard_GetData0300 data= ' + JSON.stringify(data));
      expect(data).assertEqual(1);
    })
  })
}