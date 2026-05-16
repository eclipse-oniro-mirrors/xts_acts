/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';

let tag: string = 'testTag: '

const KEY_TEST_ELEMENT = 'TestKey';
const VALUE_TEST_ELEMENT = 'TestValue';

function func(inputStr:string) {
  console.log(tag, `execute func`);
  let text = new unifiedDataChannel.Text();
  text.details = {
    Key: inputStr + KEY_TEST_ELEMENT,
    Value: inputStr + VALUE_TEST_ELEMENT
  };
  let data = new unifiedDataChannel.UnifiedData(text);
  data.properties.tag = 'FileTag';
  return data;
}

export default function UDMFAddAPITest() {
  describe("UDMFAddAPITest", (): void => {
    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0100
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0100
    * @tc.desc   unifiedDataChannel addRecord interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      try {
        unifiedData.addRecord(undefined);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect(error.code).assertEqual('401');
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0100 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0200
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0200
    * @tc.desc   unifiedDataChannel addRecord interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      try {
        unifiedData.addRecord(null);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect(error.code).assertEqual('401');
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFAddRecordTest_0200 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0100
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0100
    * @tc.desc   unifiedDataChannel hasType interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      try {
        let hasType = unifiedData.hasType('');
        expect(hasType).assertEqual(false);
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect().assertFail();
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0100 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0200
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0200
    * @tc.desc   unifiedDataChannel hasType interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      try {
        let hasType = unifiedData.hasType(undefined);
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.error(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect(error.code).assertEqual('401');
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0200 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0300
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0300
    * @tc.desc   unifiedDataChannel hasType interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0300 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      try {
        let hasType = unifiedData.hasType(null);
        expect().assertFail();
      } catch (e) {
        let error: BusinessError = e as BusinessError;
        console.log(tag, `Failed. code: ${error.code}, message: ${error.message}`)
        expect(error.code).assertEqual('401');
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFHasTypeTest_0300 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFDataTypeTest_0100
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFDataTypeTest_0100
    * @tc.desc   unifiedDataChannel data type interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFDataTypeTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFDataTypeTest_0100 start');
      let text = new unifiedDataChannel.PlainText();
      text.textContent = 'this is textContent';
      text.abstract = 'This is abstract';
      expect(text.textContent).assertEqual('this is textContent');
      expect(text.abstract).assertEqual('This is abstract');

      let link = new unifiedDataChannel.Hyperlink();
      link.url = 'www.XXX.com';
      link.description = 'This is description';
      expect(link.url).assertEqual('www.XXX.com');
      expect(link.description).assertEqual('This is description');

      let html = new unifiedDataChannel.HTML();
      html.htmlContent = '<div><p>标题</p></div>';
      html.plainContent = 'This is plainContent';
      expect(html.htmlContent).assertEqual('<div><p>标题</p></div>');
      expect(html.plainContent).assertEqual('This is plainContent');

      let file = new unifiedDataChannel.File();
      file.details = {
        name: 'test',
        type: 'txt'
      };
      file.uri = 'uri';
      expect(JSON.stringify(file.details)).assertEqual(JSON.stringify({ name: 'test', type: 'txt' }));
      expect(file.uri).assertEqual('uri');

      let image = new unifiedDataChannel.Image();
      image.imageUri = 'uri';
      expect(image.imageUri).assertEqual('uri');

      let video = new unifiedDataChannel.Video();
      video.videoUri = 'uri';
      expect(video.videoUri).assertEqual('uri');

      let audio = new unifiedDataChannel.Audio();
      audio.audioUri = 'uri';
      expect(audio.audioUri).assertEqual('uri');

      let folder = new unifiedDataChannel.Folder();
      folder.folderUri = 'uri';
      expect(folder.folderUri).assertEqual('uri');

      let form = new unifiedDataChannel.SystemDefinedForm();
      form.formId = 123456;
      form.formName = 'MyFormName';
      form.bundleName = 'MyBundleName';
      form.abilityName = 'MyAbilityName';
      form.module = 'MyModule';
      expect(form.formId).assertEqual(123456);
      expect(form.formName).assertEqual('MyFormName');
      expect(form.bundleName).assertEqual('MyBundleName');
      expect(form.abilityName).assertEqual('MyAbilityName');
      expect(form.module).assertEqual('MyModule');

      let appItem = new unifiedDataChannel.SystemDefinedAppItem();
      appItem.appId = 'MyAppId';
      appItem.appName = 'MyAppName';
      appItem.appIconId = 'MyAppIconId';
      appItem.appLabelId = 'MyAppLabelId';
      appItem.bundleName = 'MyBundleName';
      appItem.abilityName = 'MyAbilityName';
      expect(appItem.appId).assertEqual('MyAppId');
      expect(appItem.appName).assertEqual('MyAppName');
      expect(appItem.appIconId).assertEqual('MyAppIconId');
      expect(appItem.appLabelId).assertEqual('MyAppLabelId');
      expect(appItem.bundleName).assertEqual('MyBundleName');
      expect(appItem.abilityName).assertEqual('MyAbilityName');

      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let sdPixel = new unifiedDataChannel.SystemDefinedPixelMap();
      sdPixel.rawData = u8Array;
      expect(JSON.stringify(sdPixel.rawData)).assertEqual(JSON.stringify(new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])));

      let record = new unifiedDataChannel.ApplicationDefinedRecord();
      record.applicationDefinedType = 'ApplicationDefinedType';
      record.rawData = u8Array;
      expect(record.applicationDefinedType).assertEqual('ApplicationDefinedType');
      expect(JSON.stringify(record.rawData)).assertEqual(JSON.stringify(new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])));
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFDataTypeTest_0100 end');
    })

    /**
    * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFPropertiesTest_0100
    * @tc.number testSUB_DistributedData_UDMF_SDK_UDMFPropertiesTest_0100
    * @tc.desc   unifiedDataChannel data type interface test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
    it('SUB_DistributedData_UDMF_SDK_UDMFPropertiesTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFPropertiesTest_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      unifiedData.properties.extras = {
        key: {
          title: 'MyTitle',
          content: 'MyContent'
        }
      };
      unifiedData.properties.tag = 'This is a tag of properties';
      unifiedData.properties.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
      unifiedData.properties.getDelayData = func;
      let data = unifiedData.properties.getDelayData('inputTest');

      if (unifiedData.properties.extras !== undefined) {
        expect(JSON.stringify(unifiedData.properties.extras.key)).assertEqual(JSON.stringify({content: 'MyContent', title: 'MyTitle'}));
      };
      expect(unifiedData.properties.tag).assertEqual('This is a tag of properties');
      console.log(tag, `${unifiedData.properties.timestamp}`);
      let str = String(unifiedData.properties.timestamp);
      let list = str.split(' ');
      expect(list).assertContain('GMT+0800');
      expect(unifiedData.properties.shareOptions).assertEqual(1);

      let records = data.getRecords();
      expect(records.length).assertEqual(1);
      if (records[0].getType() == uniformTypeDescriptor.UniformDataType.TEXT) {
        let text = records[0] as unifiedDataChannel.Text;
        if (text.details !== undefined) {
          expect(text.details.Key).assertEqual('inputTest' + KEY_TEST_ELEMENT);
          expect(text.details.Value).assertEqual('inputTest' + VALUE_TEST_ELEMENT);
          expect(data.properties.tag).assertEqual('FileTag');
        }
      }
      console.log(tag + 'SUB_DistributedData_UDMF_SDK_UDMFPropertiesTest_0100 end');
    })
  });
}