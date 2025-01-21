/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import uniformDataStruct from '@ohos.data.uniformDataStruct';
import { BusinessError } from '@ohos.base';

export default function UDMFApiDataStructTest() {
  describe('UDMFApiDataStructTest', () => {
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100
     * @tc.desc      : Verify the properties of the PlainText type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100 start');
      let plainTextDetails : Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText : uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent : 'This is plainText textContent example',
        abstract : 'this is abstract',
        details : plainTextDetails,
      }
      let obj = plainText;
      expect(obj.uniformDataType).assertEqual(plainText.uniformDataType)
      expect(obj.textContent).assertEqual(plainText.textContent)
      expect(obj.abstract).assertEqual(plainText.abstract)
      expect(obj.details).assertEqual(plainText.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0100 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200
     * @tc.desc      : Verify the properties of the Hyperlink type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200 start');
      let hyperlinkDetails : Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let hyperlink : uniformDataStruct.Hyperlink = {
        uniformDataType:'general.hyperlink',
        url : 'www.XXX.com',
        description : 'This is the description of this hyperlink',
        details : hyperlinkDetails,
      }
      let obj = hyperlink;
      expect(obj.uniformDataType).assertEqual(hyperlink.uniformDataType)
      expect(obj.url).assertEqual(hyperlink.url)
      expect(obj.description).assertEqual(hyperlink.description)
      expect(obj.details).assertEqual(hyperlink.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0200 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300
     * @tc.desc      : Verify the properties of the HTML type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300 start');
      let htmlObjDetails : Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let htmlObj : uniformDataStruct.HTML = {
        uniformDataType :'general.html',
        htmlContent : '<div><p>标题</p></div>',
        plainContent : 'this is plainContent',
        details : htmlObjDetails,
      }
      let obj = htmlObj;
      expect(obj.uniformDataType).assertEqual(htmlObj.uniformDataType)
      expect(obj.htmlContent).assertEqual(htmlObj.htmlContent)
      expect(obj.plainContent).assertEqual(htmlObj.plainContent)
      expect(obj.details).assertEqual(htmlObj.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0300 end");
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUDMFApiDataStructTest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400
     * @tc.desc      : Verify the properties of the OpenHarmonyAppItem type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400', 0, () => {
      console.log('SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 start');
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let appItemDetails : Record<string, number | string | Uint8Array> = {
        'appItemKey1': 123,
        'appItemKey2': 'appItemValue',
        'appItemKey3': u8Array,
      }
      let appItem : uniformDataStruct.OpenHarmonyAppItem = {
        uniformDataType:'openharmony.app-item',
        appId : 'MyAppId',
        appName : 'MyAppName',
        appIconId : 'MyAppIconId',
        appLabelId : 'MyAppLabelId',
        bundleName : 'MyBundleName',
        abilityName : 'MyAbilityName',
        details : appItemDetails,
      }
      let obj = appItem;
      expect(obj.uniformDataType).assertEqual(appItem.uniformDataType)
      expect(obj.appId).assertEqual(appItem.appId)
      expect(obj.appName).assertEqual(appItem.appName)
      expect(obj.appIconId).assertEqual(appItem.appIconId)
      expect(obj.appIconId).assertEqual(appItem.appIconId)
      expect(obj.bundleName).assertEqual(appItem.bundleName)
      expect(obj.abilityName).assertEqual(appItem.abilityName)
      expect(obj.details).assertEqual(appItem.details)
      console.log("SUB_DistributedData_UDMF_SDK_UDMFApiDataStructTest_0400 end");
    });

  })
}