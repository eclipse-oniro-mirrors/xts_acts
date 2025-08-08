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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';

let resProgressInfo:unifiedDataChannel.ProgressInfo;

export default function UDMFApiTest() {
  describe('UDMFApiTest', () => {
    console.info('start UDMFApiTest');
    let text = new unifiedDataChannel.Text();
    text.details = {
      title: "标题",
      content: "内容"
    };

    let plainText:unifiedDataChannel.PlainText = new unifiedDataChannel.PlainText();
    plainText.details = {
      title: "标题",
      content: "内容"
    };
    plainText.textContent = "textContent";
    plainText.abstract = "abstract";

    let link:unifiedDataChannel.Hyperlink = new unifiedDataChannel.Hyperlink();
    link.details = {
      title: "标题",
      content: "内容"
    };
    link.url = "url";
    link.description = "description";

    let html:unifiedDataChannel.HTML = new unifiedDataChannel.HTML();
    html.details = {
      title: "标题",
      content: "内容"
    };
    html.htmlContent = "htmlContent";
    html.plainContent = "plainContent";

    let file:unifiedDataChannel.File = new unifiedDataChannel.File();
    file.details = {
      title: "标题",
      content: "内容"
    };
    file.uri = "uri";

    let folder:unifiedDataChannel.Folder = new unifiedDataChannel.Folder();
    folder.details = {
      title: "标题",
      content: "内容"
    };
    folder.folderUri = "folderUri";

    let image:unifiedDataChannel.Image = new unifiedDataChannel.Image();
    image.details = {
      title: "标题",
      content: "内容"
    };
    image.imageUri = "imageUri";

    let video:unifiedDataChannel.Video = new unifiedDataChannel.Video();
    video.details = {
      title: "标题",
      content: "内容"
    };
    video.videoUri = "videoUri";

    let audio:unifiedDataChannel.Audio = new unifiedDataChannel.Audio();
    audio.details = {
      title: "标题",
      content: "内容"
    };
    audio.audioUri = "audioUri";

    let arrayBuf = new ArrayBuffer(2 * 3 * 4);
    let u8Array = new Uint8Array(arrayBuf);

    let systemDefinedRecord:unifiedDataChannel.SystemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
    systemDefinedRecord.details = {
      title: "标题",
      version: 1,
      content: u8Array
    };

    let systemDefinedForm:unifiedDataChannel.SystemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
    systemDefinedForm.details = {
      title: "标题",
      version: 1,
      content: u8Array
    };
    systemDefinedForm.formId = 123456;
    systemDefinedForm.formName = 'formName';
    systemDefinedForm.bundleName = 'bundleName';
    systemDefinedForm.abilityName = 'abilityName';
    systemDefinedForm.module = 'module';

    let systemDefinedAppItem:unifiedDataChannel.SystemDefinedAppItem = new unifiedDataChannel.SystemDefinedAppItem();
    systemDefinedAppItem.details = {
      title: "标题",
      version: 1,
      content: u8Array
    };
    systemDefinedAppItem.appId = 'appId';
    systemDefinedAppItem.appName = 'appName';
    systemDefinedAppItem.appIconId = 'appIconId';
    systemDefinedAppItem.appLabelId = 'appLabelId';
    systemDefinedAppItem.bundleName = 'bundleName';
    systemDefinedAppItem.abilityName = 'abilityName';

    let systemDefinedPixelMap:unifiedDataChannel.SystemDefinedPixelMap = new unifiedDataChannel.SystemDefinedPixelMap();
    systemDefinedPixelMap.details = {
      title: "标题",
      version: 1,
      content: u8Array
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.Text = (records[0]) as unifiedDataChannel.Text;
      expect(records.length).assertEqual(1);
      if (record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.PlainText = (records[0]) as unifiedDataChannel.PlainText;
      expect(records.length).assertEqual(1);
      if (record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(link);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.Hyperlink = (records[0]) as unifiedDataChannel.Hyperlink;
      expect(records.length).assertEqual(1);
      if(record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(html);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.HTML = (records[0]) as unifiedDataChannel.HTML;
      expect(records.length).assertEqual(1);
      if(record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }

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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(file);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.File = (records[0]) as unifiedDataChannel.File;
      expect(records.length).assertEqual(1);
      if (record.details != undefined) {
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0600 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(folder);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.Folder = (records[0]) as unifiedDataChannel.Folder;
      expect(records.length).assertEqual(1);
      if (record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0700 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(image);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.Image = (records[0]) as unifiedDataChannel.Image;
      expect(records.length).assertEqual(1);
      if (record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0800 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(video);
      let records = unifiedData.getRecords();
      let record = (records[0]) as unifiedDataChannel.Video;
      if ( record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
      expect(records.length).assertEqual(1);
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0900 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(audio);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.Audio = (records[0]) as unifiedDataChannel.Audio;
      if(record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
      expect(records.length).assertEqual(1);
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1000 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.SystemDefinedRecord= (records[0]) as unifiedDataChannel.SystemDefinedRecord;
      expect(records.length).assertEqual(1);
      if( record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.version).assertEqual(1);
        expect(JSON.stringify(record.details.content)).assertEqual(JSON.stringify(u8Array));
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.SystemDefinedForm = (records[0]) as unifiedDataChannel.SystemDefinedForm;
      expect(records.length).assertEqual(1);
      if(record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.version).assertEqual(1);
        expect(JSON.stringify(record.details.content)).assertEqual(JSON.stringify(u8Array));
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedAppItem);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.SystemDefinedAppItem = (records[0]) as unifiedDataChannel.SystemDefinedAppItem;
      expect(records.length).assertEqual(1);
      if ( record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.version).assertEqual(1);
        expect(JSON.stringify(record.details.content)).assertEqual(JSON.stringify(u8Array));
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1300 start');
      let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedPixelMap);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.SystemDefinedPixelMap = (records[0]) as unifiedDataChannel.SystemDefinedPixelMap;
      expect(records.length).assertEqual(1);
      if (record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.version).assertEqual(1);
        expect(JSON.stringify(record.details.content)).assertEqual(JSON.stringify(u8Array));
      }

      for (let i = 0; i < u8Array.length; i++) {
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
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500
     * @tc.name      : CreateData with a recordgroup contain all type
     * @tc.desc      : Test UDMF creating a unifieddata with a recordgroup.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status); 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000 end");
      done();
    })
   
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status); 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800 end");
      done();
    })
   
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700 end");
      done();
    })

     /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500 end");
      done();
    })


     /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300 end");
      done();
    })
  })
}