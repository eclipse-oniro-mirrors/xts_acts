/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';

export default function UDMFApiTest() {
  describe('UDMFApiTest', function () {
    console.info('start UDMFApiTest');
    let text = new unifiedDataChannel.Text();
    text.details = {
      title:"标题",
      content:"内容"
    };

    let plainText = new unifiedDataChannel.PlainText();
    plainText.details = {
      title:"标题",
      content:"内容"
    };
    plainText.textContent = "textContent";
    plainText.abstract = "abstract";

    let link = new unifiedDataChannel.Hyperlink();
    link.details = {
      title:"标题",
      content:"内容"
    };
    link.url = "url";
    link.description = "description";

    let html = new unifiedDataChannel.HTML();
    html.details = {
      title:"标题",
      content:"内容"
    };
    html.htmlContent = "htmlContent";
    html.plainContent = "plainContent";

    let file = new unifiedDataChannel.File();
    file.details = {
      title:"标题",
      content:"内容"
    };
    file.uri = "uri";

    let folder = new unifiedDataChannel.Folder();
    folder.details = {
      title:"标题",
      content:"内容"
    };
    folder.folderUri = "folderUri";

    let image = new unifiedDataChannel.Image();
    image.details = {
      title:"标题",
      content:"内容"
    };
    image.imageUri = "imageUri";

    let video = new unifiedDataChannel.Video();
    video.details = {
      title:"标题",
      content:"内容"
    };
    video.videoUri = "videoUri";

    let audio = new unifiedDataChannel.Audio();
    audio.details = {
      title:"标题",
      content:"内容"
    };
    audio.audioUri = "audioUri";

    let arrayBuf = new ArrayBuffer(2 * 3 * 4);
    let u8Array = new Uint8Array(arrayBuf);

    let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
    systemDefinedRecord.details = {
      title:"标题",
      version:1,
      content:u8Array
    };

    let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
    systemDefinedForm.details = {
      title:"标题",
      version:1,
      content:u8Array
    };
    systemDefinedForm.formId = 123456;
    systemDefinedForm.formName = 'formName';
    systemDefinedForm.bundleName = 'bundleName';
    systemDefinedForm.abilityName = 'abilityName';
    systemDefinedForm.module = 'module';

    let systemDefinedAppItem = new unifiedDataChannel.SystemDefinedAppItem();
    systemDefinedAppItem.details = {
      title:"标题",
      version:1,
      content:u8Array
    };
    systemDefinedAppItem.appId = 'appId';
    systemDefinedAppItem.appName = 'appName';
    systemDefinedAppItem.appIconId = 'appIconId';
    systemDefinedAppItem.appLabelId = 'appLabelId';
    systemDefinedAppItem.bundleName = 'bundleName';
    systemDefinedAppItem.abilityName = 'abilityName';

    let systemDefinedPixelMap = new unifiedDataChannel.SystemDefinedPixelMap();
    systemDefinedPixelMap.details = {
      title:"标题",
      version:1,
      content:u8Array
    };
    systemDefinedPixelMap.rawData = u8Array;

    let applicationDefinedRecord = new unifiedDataChannel.ApplicationDefinedRecord();
    applicationDefinedRecord.applicationDefinedType = 'applicationDefinedType';
    applicationDefinedRecord.rawData = u8Array;

    let summary = new unifiedDataChannel.Summary;
    let records1 = summary.summary;
    console.info("ttt " + records1);
    let records2 = summary.totalSize;

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.Text>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200
     * @tc.name      : CreateData type is plainText
     * @tc.desc      : Test UDMF creating a unifieddata with a plaintext record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.PlainText>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.textContent).assertEqual('textContent');
      expect(record.abstract).assertEqual('abstract');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300
     * @tc.name      : CreateData  type is link
     * @tc.desc      : Test UDMF creating a unifieddata with a hyperlink record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(link);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.Hyperlink>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.url).assertEqual('url');
      expect(record.description).assertEqual('description');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400
     * @tc.name      : CreateData type is html
     * @tc.desc      : Test UDMF creating a unifieddata with a html record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(html);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.HTML>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.htmlContent).assertEqual('htmlContent');
      expect(record.plainContent).assertEqual('plainContent');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500
     * @tc.name      : CreateData  type is file
     * @tc.desc      : Test UDMF creating a unifieddata with a file record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(file);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.File>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.uri).assertEqual('uri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600
     * @tc.name      : CreateData  type is folder
     * @tc.desc      : Test UDMF creating a unifieddata with a folder record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(folder);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.Folder>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.folderUri).assertEqual('folderUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700
     * @tc.name      : CreateData type is image
     * @tc.desc      : Test UDMF creating a unifieddata with a image record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(image);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.Image>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.imageUri).assertEqual('imageUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800
     * @tc.name      : CreateData type is video
     * @tc.desc      : Test UDMF creating a unifieddata with a video record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(video);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.Video>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.videoUri).assertEqual('videoUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900
     * @tc.name      : CreateData type is audio
     * @tc.desc      : Test UDMF creating a unifieddata with a audio record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(audio);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.Audio>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.content).assertEqual('内容');
      expect(record.audioUri).assertEqual('audioUri');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000
     * @tc.name      : CreateData type is systemDefinedRecord
     * @tc.desc      : Test UDMF creating a unifieddata with a systemdefinedrecord record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.SystemDefinedRecord>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.version).assertEqual(1);
      for(let i = 0; i<u8Array.length; i++){
        expect(record.details.content[i]).assertEqual(u8Array[i]);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100
     * @tc.name      : CreateData type is systemDefinedForm
     * @tc.desc      : Test UDMF creating a unifieddata with a systemdefinedform record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.SystemDefinedForm>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.version).assertEqual(1);
      for(let i = 0; i<u8Array.length; i++){
        expect(record.details.content[i]).assertEqual(u8Array[i]);
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200
     * @tc.name      : CreateData type is systemDefinedAppItem
     * @tc.desc      : Test UDMF creating a unifieddata with a systemdefinedappitem record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedAppItem);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.SystemDefinedAppItem>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.version).assertEqual(1);
      for(let i = 0; i<u8Array.length; i++){
        expect(record.details.content[i]).assertEqual(u8Array[i]);
      }
      expect(record.appId).assertEqual('appId');
      expect(record.appName).assertEqual('appName');
      expect(record.appIconId).assertEqual('appIconId');
      expect(record.appLabelId).assertEqual('appLabelId');
      expect(record.bundleName).assertEqual('bundleName');
      expect(record.abilityName).assertEqual('abilityName');
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300
     * @tc.name      : CreateData type is systemDefinedPixelMap
     * @tc.desc      : Test UDMF creating a unifieddata with a systemdefinedpixelmap record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedPixelMap);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.SystemDefinedPixelMap>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.details.title).assertEqual('标题');
      expect(record.details.version).assertEqual(1);
      for(let i = 0; i<u8Array.length; i++){
        expect(record.details.content[i]).assertEqual(u8Array[i]);
      }
      for(let i = 0; i<u8Array.length; i++){
        expect(record.rawData[i]).assertEqual(u8Array[i]);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400
     * @tc.name      : CreateData type is applicationDefinedRecord
     * @tc.desc      : Test UDMF creating a unifieddata with a applicationdefinedrecord record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400',0, async function (done) {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(applicationDefinedRecord);
      let records = unifiedData.getRecords();
      let record = <unifiedDataChannel.ApplicationDefinedRecord>(records[0]);
      expect(records.length).assertEqual(1);
      expect(record.applicationDefinedType).assertEqual('applicationDefinedType');
      for(let i = 0; i<u8Array.length; i++){
        expect(record.rawData[i]).assertEqual(u8Array[i]);
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500
     * @tc.name      : CreateData with a recordgroup contain all type
     * @tc.desc      : Test UDMF creating a unifieddata with a recordgroup.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500',0, async function (done) {
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
      let record1 = <unifiedDataChannel.Text>(records[0]);
      let record2 = <unifiedDataChannel.PlainText>(records[1]);
      let record3 = <unifiedDataChannel.Hyperlink>(records[2]);
      let record4 = <unifiedDataChannel.HTML>(records[3]);
      let record5 = <unifiedDataChannel.File>(records[4]);
      let record6 = <unifiedDataChannel.Folder>(records[5]);
      let record7 = <unifiedDataChannel.Image>(records[6]);
      let record8 = <unifiedDataChannel.Video>(records[7]);
      let record9 = <unifiedDataChannel.Audio>(records[8]);
      let record10 = <unifiedDataChannel.SystemDefinedRecord>(records[9]);
      let record11 = <unifiedDataChannel.SystemDefinedForm>(records[10]);
      let record12 = <unifiedDataChannel.SystemDefinedAppItem>(records[11]);
      let record13 = <unifiedDataChannel.SystemDefinedPixelMap>(records[12]);
      let record14 = <unifiedDataChannel.ApplicationDefinedRecord>(records[13]);
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
  })
}