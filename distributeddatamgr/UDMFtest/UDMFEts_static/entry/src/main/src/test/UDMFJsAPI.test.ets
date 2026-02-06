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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { image } from '@kit.ImageKit';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
let domain: int = 0x0000;
let tag: string = 'testTag';
let resProgressInfo: unifiedDataChannel.ProgressInfo | undefined;

const KEY_TEST_ELEMENT = 'TestKey';
const VALUE_TEST_ELEMENT = 'TestValue';
const TAG = '[ttt]'

function func(inputStr: string): unifiedDataChannel.UnifiedData {
  console.info('pjl execute func');
  let text = new unifiedDataChannel.Text();
  text.details = {
    "Key": inputStr + KEY_TEST_ELEMENT,
    "Value": inputStr + VALUE_TEST_ELEMENT,
  };
  let data = new unifiedDataChannel.UnifiedData(text);
  data.properties.tag = "FileTag";
  return data;
}

interface PersonData {
  f_name: string;
  l_name: string;
  age: number;
};

interface PersonData1 {
  f_name: string;
  l_name: string;
  f_name1: string;
  l_name1: string;
  age: number;
};

export default function UDMFJsApiTest() {
  describe("UDMFJsApiTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'UDMFApiDescriptorTest start');
    let TAG = '';

    beforeAll(() => {
      console.info("beforeAll");
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      unifiedDataChannel.deleteData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
        let size = data.length;
        console.info(` [beforeAll] success to deleteData data.size = ${size}`);
      }).catch((error) => {
        let err: BusinessError = error as BusinessError;
        console.info(` [beforeAll] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    afterAll(() => {
      console.info("afterAll");
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      unifiedDataChannel.deleteData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
        let size = data.length;
        console.info(` [afterAll] success to deleteData data.size = ${size}`);
      }).catch((error) => {
        let err: BusinessError = error as BusinessError;
        console.info(` [afterAll] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    console.info('start UDMFApiTest');
    let text = new unifiedDataChannel.Text();
    text.details = {
      'title': "标题",
      'content': "内容"
    };

    let plainText:unifiedDataChannel.PlainText = new unifiedDataChannel.PlainText();
    plainText.details = {
      'title': "标题",
      'content': "内容"
    };
    plainText.textContent = "textContent";
    plainText.textAbstract = "abstract";

    let link:unifiedDataChannel.Hyperlink = new unifiedDataChannel.Hyperlink();
    link.details = {
      'title': "标题",
      'content': "内容"
    };
    link.url = "url";
    link.description = "description";

    let html:unifiedDataChannel.HTML = new unifiedDataChannel.HTML();
    html.details = {
      'title': "标题",
      'content': "内容"
    };
    html.htmlContent = "htmlContent";
    html.plainContent = "plainContent";

    let file:unifiedDataChannel.File = new unifiedDataChannel.File();
    file.details = {
      'title': "标题",
      'content': "内容"
    };
    file.uri = "uri";

    let folder:unifiedDataChannel.Folder = new unifiedDataChannel.Folder();
    folder.details = {
      'title': "标题",
      'content': "内容"
    };
    folder.folderUri = "folderUri";

    let image:unifiedDataChannel.Image = new unifiedDataChannel.Image();
    image.details = {
      'title': "标题",
      'content': "内容"
    };
    image.imageUri = "imageUri";

    let video:unifiedDataChannel.Video = new unifiedDataChannel.Video();
    video.details = {
      'title': "标题",
      'content': "内容"
    };
    video.videoUri = "videoUri";

    let audio:unifiedDataChannel.Audio = new unifiedDataChannel.Audio();
    audio.details = {
      'title': "标题",
      'content': "内容"
    };
    audio.audioUri = "audioUri";

    let arrayBuf = new ArrayBuffer(2 * 3 * 4);
    let u8Array = new Uint8Array(arrayBuf);

    let systemDefinedRecord:unifiedDataChannel.SystemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
    systemDefinedRecord.details = {
      'title': "标题",
      'version': 1,
      'content': u8Array
    };

    let systemDefinedForm:unifiedDataChannel.SystemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
    systemDefinedForm.details = {
      'title': "标题",
      'version': 1,
      'content': u8Array
    };
    systemDefinedForm.formId = 123456;
    systemDefinedForm.formName = 'formName';
    systemDefinedForm.bundleName = 'bundleName';
    systemDefinedForm.abilityName = 'abilityName';
    systemDefinedForm.module = 'module';

    let systemDefinedAppItem:unifiedDataChannel.SystemDefinedAppItem = new unifiedDataChannel.SystemDefinedAppItem();
    systemDefinedAppItem.details = {
      'title': "标题",
      'version': 1,
      'content': u8Array
    };
    systemDefinedAppItem.appId = 'appId';
    systemDefinedAppItem.appName = 'appName';
    systemDefinedAppItem.appIconId = 'appIconId';
    systemDefinedAppItem.appLabelId = 'appLabelId';
    systemDefinedAppItem.bundleName = 'bundleName';
    systemDefinedAppItem.abilityName = 'abilityName';

    let systemDefinedPixelMap:unifiedDataChannel.SystemDefinedPixelMap = new unifiedDataChannel.SystemDefinedPixelMap();
    systemDefinedPixelMap.details = {
      'title': "标题",
      'version': 1,
      'content': u8Array
    };
    systemDefinedPixelMap.rawData = u8Array;

    let applicationDefinedRecord:unifiedDataChannel.ApplicationDefinedRecord = new unifiedDataChannel.ApplicationDefinedRecord();
    applicationDefinedRecord.applicationDefinedType = 'applicationDefinedType';
    applicationDefinedRecord.rawData = u8Array;

    let summary:unifiedDataChannel.Summary = new unifiedDataChannel.Summary;
    let records1 = summary.summary;
    console.info("ttt " + records1);
    let records2 = summary.totalSize;

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.Text = (records[0]) as unifiedDataChannel.Text;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200
     * @tc.desc   Test UDMF creating a unifieddata with a plaintext record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.PlainText = (records[0]) as unifiedDataChannel.PlainText;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(record.textContent).assertEqual('textContent');
      expect(record.textAbstract).assertEqual('abstract');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300
     * @tc.desc   Test UDMF creating a unifieddata with a hyperlink record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(link);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.Hyperlink = (records[0]) as unifiedDataChannel.Hyperlink;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(record.url).assertEqual('url');
      expect(record.description).assertEqual('description');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400
     * @tc.desc   Test UDMF creating a unifieddata with a html record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(html);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.HTML = (records[0]) as unifiedDataChannel.HTML;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }

      expect(record.htmlContent).assertEqual('htmlContent');
      expect(record.plainContent).assertEqual('plainContent');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500
     * @tc.desc   Test UDMF creating a unifieddata with a file record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(file);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.File = (records[0]) as unifiedDataChannel.File;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(record.uri).assertEqual('uri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600
     * @tc.desc   Test UDMF creating a unifieddata with a folder record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(folder);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.Folder = (records[0]) as unifiedDataChannel.Folder;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(record.folderUri).assertEqual('folderUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700
     * @tc.desc   Test UDMF creating a unifieddata with a image record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(image);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.Image = (records[0]) as unifiedDataChannel.Image;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(record.imageUri).assertEqual('imageUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800
     * @tc.desc   Test UDMF creating a unifieddata with a video record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(video);
      let records = unifiedData.getRecords();
      let record = (records[0]) as unifiedDataChannel.Video;
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(records.length).assertEqual(1);
      expect(record.videoUri).assertEqual('videoUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900
     * @tc.desc   Test UDMF creating a unifieddata with a audio record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(audio);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.Audio = (records[0]) as unifiedDataChannel.Audio;
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(records.length).assertEqual(1);
      expect(record.audioUri).assertEqual('audioUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000
     * @tc.desc   Test UDMF creating a unifieddata with a systemdefinedrecord record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.SystemDefinedRecord= (records[0]) as unifiedDataChannel.SystemDefinedRecord;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
      if(detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['version']).assertEqual(1);
        let contentGet = detailsGet['content'] as Uint8Array;
        expect(Utils.arraysEqual(contentGet, u8Array)).assertEqual(true);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100
     * @tc.desc   Test UDMF creating a unifieddata with a systemdefinedform record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.SystemDefinedForm = (records[0]) as unifiedDataChannel.SystemDefinedForm;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
      if(detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['version']).assertEqual(1);
        let contentGet = detailsGet['content'] as Uint8Array;
        expect(Utils.arraysEqual(contentGet, u8Array)).assertEqual(true);
      }
      expect(record.formId).assertEqual(123456);
      expect(record.formName).assertEqual('formName');
      expect(record.bundleName).assertEqual('bundleName');
      expect(record.abilityName).assertEqual('abilityName');
      expect(record.module).assertEqual('module');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300
     * @tc.desc   Test UDMF creating a unifieddata with a systemdefinedpixelmap record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedPixelMap);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.SystemDefinedPixelMap = (records[0]) as unifiedDataChannel.SystemDefinedPixelMap;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
      if(detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['version']).assertEqual(1);
        let contentGet = detailsGet['content'] as Uint8Array;
        expect(Utils.arraysEqual(contentGet, u8Array)).assertEqual(true);
      }

      for (let i = 0; i < u8Array.length; i++) {
        expect(record.rawData[i]).assertEqual(u8Array[i]);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400
     * @tc.desc   Test UDMF creating a unifieddata with a applicationdefinedrecord record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(applicationDefinedRecord);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.ApplicationDefinedRecord = (records[0]) as unifiedDataChannel.ApplicationDefinedRecord;
      expect(records.length).assertEqual(1);
      expect(record.applicationDefinedType).assertEqual('applicationDefinedType');
      for (let i = 0; i < u8Array.length; i++) {
        expect(record.rawData[i]).assertEqual(u8Array[i]);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500
     * @tc.desc   Test UDMF creating a unifieddata with a recordgroup.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      unifiedData.addRecord(plainText);
      unifiedData.addRecord(link);
      unifiedData.addRecord(html);
      unifiedData.addRecord(file);
      unifiedData.addRecord(folder);
      unifiedData.addRecord(image);
      unifiedData.addRecord(video);
      unifiedData.addRecord(audio);
      unifiedData.addRecord(systemDefinedRecord);
      unifiedData.addRecord(systemDefinedForm);
      unifiedData.addRecord(systemDefinedAppItem);
      unifiedData.addRecord(systemDefinedPixelMap);
      unifiedData.addRecord(applicationDefinedRecord);
      let records = unifiedData.getRecords();
      let record1:unifiedDataChannel.Text = (records[0]) as unifiedDataChannel.Text;
      let record2:unifiedDataChannel.PlainText = (records[1]) as unifiedDataChannel.PlainText;
      let record3:unifiedDataChannel.Hyperlink = (records[2]) as unifiedDataChannel.Hyperlink;
      let record4:unifiedDataChannel.HTML = (records[3]) as unifiedDataChannel.HTML;
      let record5:unifiedDataChannel.File = (records[4]) as unifiedDataChannel.File;
      let record6:unifiedDataChannel.Folder = (records[5]) as unifiedDataChannel.Folder;
      let record7:unifiedDataChannel.Image = (records[6]) as unifiedDataChannel.Image;
      let record8: unifiedDataChannel.Video = (records[7]) as unifiedDataChannel.Video;
      let record9:unifiedDataChannel.Audio = (records[8]) as unifiedDataChannel.Audio;
      let record10:unifiedDataChannel.SystemDefinedRecord = (records[9]) as unifiedDataChannel.SystemDefinedRecord;
      let record11:unifiedDataChannel.SystemDefinedForm = (records[10]) as unifiedDataChannel.SystemDefinedForm;
      let record12:unifiedDataChannel.SystemDefinedAppItem = (records[11]) as unifiedDataChannel.SystemDefinedAppItem;
      let record13:unifiedDataChannel.SystemDefinedPixelMap = (records[12]) as unifiedDataChannel.SystemDefinedPixelMap;
      let record14:unifiedDataChannel.ApplicationDefinedRecord = (records[13]) as unifiedDataChannel.ApplicationDefinedRecord;
      expect(records.length).assertEqual(14);
      expect(record1.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.TEXT);
      expect(record2.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT);
      expect(record3.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.HYPERLINK);
      expect(record4.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.HTML);
      expect(record5.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.FILE);
      expect(record6.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.FOLDER);
      expect(record7.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.IMAGE);
      expect(record8.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.VIDEO);
      expect(record9.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.AUDIO);
      expect(record11.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.OPENHARMONY_FORM);
      expect(record12.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.OPENHARMONY_APP_ITEM);
      expect(record13.getType()).assertEqual(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator)
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.DEFAULT,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files"
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500 end");
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
          key:data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((error) => {
          let err: BusinessError = error as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((error) => {
        let err: BusinessError = error as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.PICKER,
          key:data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((error) => {
          let err: BusinessError = error as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((error) => {
        let err: BusinessError = error as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.MENU,
          key:data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((error) => {
          let err: BusinessError = error as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((error) => {
        let err: BusinessError = error as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7500
     * @tc.desc   unifiedDataChannel updateData promise interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        console.info( `insertData0100 success; data = ${data}, options = ${options}`);
        try{
          unifiedDataChannel.updateData({
            intention: unifiedDataChannel.Intention.MENU,
            key: data
          }, unifiedData).then((ret) => {
            console.info( `updateData success; data = ${ret}, options = ${options}`);
            expect(ret !== null).assertTrue();
            done();
          }).catch((err1) => {
            let err = err1 as BusinessError;
            console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
            expect(err.code).assertEqual(401);
            done();
          });
        } catch (error1) {
          let error = error1 as BusinessError;
          console.error( `Failed, code is ${error.code},message is ${error.message} `);
          expect(error.code).assertEqual(401);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7700
     * @tc.desc   unifiedDataChannel updateData promise interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        console.info(`insertData0100 success; data = ${data}, options = ${options}`);
        try{
          unifiedDataChannel.updateData({
            intention: unifiedDataChannel.Intention.PICKER,
            key: data
          }, unifiedData).then((ret) => {
            console.info( `updateData success; data = ${ret}, options = ${options}`);
            expect(ret !== null).assertFail();
            done();
          }).catch((err1) => {
            let err = err1 as BusinessError;
            console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
            expect(err.code).assertEqual(401);
            done();
          });
        } catch (error1) {
          let error = error1 as BusinessError;
          console.error( `Failed, code is ${error.code},message is ${error.message} `);
          expect(error.code).assertEqual(401);
          done();
        }
      });
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7900
     * @tc.desc   unifiedDataChannel updateData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      let options:unifiedDataChannel.Options= {
        intention: unifiedDataChannel.Intention.PICKER
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        try{
          unifiedDataChannel.updateData({
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          }, unifiedData, (err1, ret) => {
            let err = err1 as BusinessError;
            expect(err.code).assertEqual(401);
            done();
          });
        } catch (error1) {
          let error = error1 as BusinessError;
          console.error(`Failed, code is ${error.code},message is ${error.message} `);
          expect(error.code).assertEqual(401);
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 start');
      let reVisibility = undefined;
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: reVisibility
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 " + err.code + err.message);
          expect(err.code).assertEqual(401);
        });
      }catch(err1){
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 " + err.code + err.message);
        expect(err.code).assertEqual(401);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
          expect().assertFail();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 " + err.code + err.message);
          expect(err.code).assertEqual(401);
        });
      }catch(err1){
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 " + err.code + err.message);
        expect(err.code).assertEqual(401);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9320
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9320
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.PICKER,
          key:data,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records: Array<unifiedDataChannel.UnifiedRecord> = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
          key:data,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.MENU,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.PICKER,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.MENU,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
              if (record != undefined) {
                expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(record.textContent).assertEqual(plainText.textContent);
                expect(record.textAbstract).assertEqual(plainText.textAbstract);
                let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                if (detailsGet) {
                  expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                }
              }
            }
          }
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }).catch((err1) => {
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
        done();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
          expect().assertFail();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380 " + err.code + err.message);
          expect(err.code).assertEqual(401);
        });
      }catch(e1){
        let e = e1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380 " + e.code + e.message);
        expect(e.code).assertEqual(401);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380 end");
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
          expect(data != null).assertTrue();
          let options1: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data,
            visibility: unifiedDataChannel.Visibility.ALL
          };
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(err1){
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
          expect(data != null).assertTrue();
          let options1: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data,
            visibility: unifiedDataChannel.Visibility.ALL
          };
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) => {
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(err1){
        let err = err1 as BusinessError;
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);

      let options1: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        textAbstract: 'this is abstract 000000000',
        details: plainTextDetails,
      }
      let unifiedData1 = new unifiedDataChannel.UnifiedData();
      let record1 = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText1);
      unifiedData1.addRecord(record1);
      try{
        let  keyData = await unifiedDataChannel.insertData(options, unifiedData);
        let  keyData1 = await unifiedDataChannel.insertData(options1, unifiedData1);
        let options2: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        let ret = await unifiedDataChannel.queryData(options2);
        let options3: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData1,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        let ret1 = await unifiedDataChannel.queryData(options3);
        for (let i = 0; i < ret.length; i++) {
          let records = ret[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
            let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
            if (record != undefined) {
              expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
              expect(record.textContent).assertEqual(plainText.textContent);
              expect(record.textAbstract).assertEqual(plainText.textAbstract);
              let detailsGet: Record<string, string> = record.details as Record<string, string> ;
              if (detailsGet) {
                expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
              }
            }
          }
        }
        for (let i = 0; i < ret1.length; i++) {
          let records = ret1[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
            let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
            if (record != undefined) {
              expect(record.uniformDataType).assertEqual(plainText1.uniformDataType);
              expect(record.textContent).assertEqual(plainText1.textContent);
              expect(record.textAbstract).assertEqual(plainText1.textAbstract);
              let detailsGet: Record<string, string> = record.details as Record<string, string> ;
              if (detailsGet) {
                expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
              }
            }
          }
        }
        await unifiedDataChannel.deleteData(options3);
        await unifiedDataChannel.deleteData(options2);
        done();
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);

      let options1: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        textAbstract: 'this is abstract 0000000',
        details: plainTextDetails,
      }
      let unifiedData1 = new unifiedDataChannel.UnifiedData();
      let record1 = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText1);
      unifiedData1.addRecord(record1);
      try{
        let  keyData = await unifiedDataChannel.insertData(options, unifiedData);
        let  keyData1 = await unifiedDataChannel.insertData(options1, unifiedData1);
        let options2: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        let ret = await unifiedDataChannel.queryData(options2);
        let options3: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData1,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        let ret1 = await unifiedDataChannel.queryData(options3);
        for (let i = 0; i < ret.length; i++) {
          let records = ret[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
            let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
            if (record != undefined) {
              expect(record.uniformDataType).assertEqual(plainText.uniformDataType);
              expect(record.textContent).assertEqual(plainText.textContent);
              expect(record.textAbstract).assertEqual(plainText.textAbstract);
              let detailsGet: Record<string, string> = record.details as Record<string, string> ;
              if (detailsGet) {
                expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
              }
            }
          }
        }
        for (let i = 0; i < ret1.length; i++) {
          let records = ret1[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
            let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
            if (record != undefined) {
              expect(record.uniformDataType).assertEqual(plainText1.uniformDataType);
              expect(record.textContent).assertEqual(plainText1.textContent);
              expect(record.textAbstract).assertEqual(plainText1.textAbstract);
              let detailsGet: Record<string, string> = record.details as Record<string, string> ;
              if (detailsGet) {
                expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
              }
            }
          }
        }
        await unifiedDataChannel.deleteData(options2);
        await unifiedDataChannel.deleteData(options3);
        done();
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        textAbstract: 'this is abstract 11111112222',
        details: plainTextDetails,
      }
      let unifiedData1 = new unifiedDataChannel.UnifiedData();
      let record1 = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText1);
      unifiedData1.addRecord(record1);
      try{
        let  keyData = await unifiedDataChannel.insertData(options, unifiedData);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        unifiedDataChannel.updateData(options1,unifiedData1).then((ret) =>{
          console.info(`updateData success; data = ${ret}, options = ${options1}`);
          expect(options1.visibility).assertEqual(unifiedDataChannel.Visibility.ALL);
          unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err1) =>{
          let err = err1 as BusinessError;
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440 " + err.code + err.message);
          expect().assertFail();
          done();
        })
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440 " + err.code + err.message);
        expect().assertFail();
        done();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9450
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9450
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9460 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        textAbstract: 'this is abstract 11111112222',
        details: plainTextDetails,
      }
      let unifiedData1 = new unifiedDataChannel.UnifiedData();
      let record1 = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText1);
      unifiedData1.addRecord(record1);
      try{
        let  keyData = await unifiedDataChannel.insertData(options, unifiedData);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:keyData,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        try {
          unifiedDataChannel.updateData(options1,unifiedData1).then((ret) =>{
            console.info(`updateData success; data = ${ret}, options = ${options1}`);
            expect(options1.visibility).assertEqual(unifiedDataChannel.Visibility.OWN_PROCESS);
            unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
              let size = ret.length;
              console.info(`data.size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                  let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
                  if (record != undefined) {
                    expect(record.uniformDataType).assertEqual(plainText1.uniformDataType);
                    expect(record.textContent).assertEqual(plainText1.textContent);
                    expect(record.textAbstract).assertEqual(plainText1.textAbstract);
                    let detailsGet: Record<string, string> = record.details as Record<string, string>;
                    if (detailsGet) {
                      expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                    }
                  }
                }
              }
              unifiedDataChannel.deleteData(options1);
              done();
            }).catch((err1) => {
              let err = err1 as BusinessError;
              console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
              expect().assertFail();
            })
          }).catch((err1) =>{
            let err = err1 as BusinessError;
            console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9460 " + err.code + err.message);
            expect().assertFail();
          })
        } catch (e) {
          let error: BusinessError = e as BusinessError;
          console.error(`Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        }
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9460 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9460 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        textAbstract: 'this is abstract 11111112222',
        details: plainTextDetails,
      }
      let unifiedData1 = new unifiedDataChannel.UnifiedData();
      let record1 = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText1);
      unifiedData1.addRecord(record1);
      try{
        let  keyData = await unifiedDataChannel.insertData(options, unifiedData);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:keyData,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        try {
          await unifiedDataChannel.updateData(options1,unifiedData1).then((ret) =>{
            console.info(`updateData success; data = ${ret}, options = ${options1}`);
            expect(options1.visibility).assertEqual(unifiedDataChannel.Visibility.ALL);
            await unifiedDataChannel.queryData(options1).then((ret: Array<unifiedDataChannel.UnifiedData>) => {
              let size = ret.length;
              console.info(`data.size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords() as Array<unifiedDataChannel.UnifiedRecord>;
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                  let record = unifiedDataRecord.getValue() as uniformDataStruct.PlainText;
                  if (record != undefined) {
                    expect(record.uniformDataType).assertEqual(plainText1.uniformDataType);
                    expect(record.textContent).assertEqual(plainText1.textContent);
                    expect(record.textAbstract).assertEqual(plainText1.textAbstract);
                    let detailsGet: Record<string, string> = record.details as Record<string, string> ;
                    if (detailsGet) {
                      expect(detailsGet['attr1']).assertEqual(plainTextDetails['attr1']);
                    }
                  }
                }
              }
              await unifiedDataChannel.deleteData(options1);
              done();
            }).catch((err1) => {
              let err = err1 as BusinessError;
              console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 " + err.code + err.message);
              expect().assertFail();
              done();
            })
          }).catch((err1) =>{
            let err = err1 as BusinessError;
            console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 " + err.code + err.message);
            expect().assertFail();
            done();
          })
        } catch (e) {
          let error: BusinessError = e as BusinessError;
          console.error(`Update data throws an exception. code is ${error.code}, message is ${error.message} `);
          done();
        }
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 " + err.code + err.message);
        expect().assertFail();
        done();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 end");
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480 start');
      let options6: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
      };
      await unifiedDataChannel.deleteData(options6);
      let ret2 = await unifiedDataChannel.queryData(options6);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.ALL
      };
      let options1: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        textAbstract: 'this is abstract 11111112222',
        details: plainTextDetails,
      }
      let unifiedData1 = new unifiedDataChannel.UnifiedData();
      let record1 = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText1);
      unifiedData1.addRecord(record1);
      try{
        let keyData = await unifiedDataChannel.insertData(options, unifiedData);
        let keyData1 = await unifiedDataChannel.insertData(options1, unifiedData1);
        let options2: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        let ret = await unifiedDataChannel.queryData(options2);
        expect(ret.length - ret2.length).assertEqual(2);
        let options4: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData
        };
        let options5: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData1
        };
        await unifiedDataChannel.deleteData(options4);
        await unifiedDataChannel.deleteData(options5);
        done();
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480 " + err.code + err.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9490
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9490
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9490 start');
      let options6: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
      };
      let ret2 = await unifiedDataChannel.queryData(options6);
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        visibility: unifiedDataChannel.Visibility.OWN_PROCESS
      };
      let options1: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        textAbstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        textAbstract: 'this is abstract 11111112222',
        details: plainTextDetails,
      }
      let unifiedData1 = new unifiedDataChannel.UnifiedData();
      let record1 = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText1);
      unifiedData1.addRecord(record1);
      try{
        let keyData = await unifiedDataChannel.insertData(options, unifiedData);
        let keyData1 = await unifiedDataChannel.insertData(options1, unifiedData1);
        let options2: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        let ret = await unifiedDataChannel.queryData(options2);
        expect(ret.length - ret2.length).assertEqual(2);
        let options4: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData
        };
        let options5: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: keyData1
        };
        await unifiedDataChannel.deleteData(options4);
        await unifiedDataChannel.deleteData(options5);
        done();
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480 " + err.code + err.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0150
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0150
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0150 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(0);
      done();
    })
  });
}

