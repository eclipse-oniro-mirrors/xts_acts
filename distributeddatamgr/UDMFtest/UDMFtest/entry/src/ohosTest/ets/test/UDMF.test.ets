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
import { BusinessError } from '@ohos.base';
import uniformDataStruct from '@ohos.data.uniformDataStruct';
let resProgressInfo:unifiedDataChannel.ProgressInfo;

export default function UDMFApiTest() {
  describe('UDMFApiTest', () => {
    
    beforeEach(async () => {
      console.info("beforeEach")
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options).then((data) => {
        let size = data.length;
        console.info(`[beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err:BusinessError) => {
        console.info(`[beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    afterEach(async () => {
      console.info("beforeEach")
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options).then((data) => {
        let size = data.length;
        console.info(`[beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err:BusinessError) => {
        console.info(`[beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

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
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
          key:data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
          }).catch((err: BusinessError) => {
            console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
            expect().assertFail();
          })
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
          expect().assertFail();
        });
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 end");
        done();
      })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.PICKER,
          key:data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
     console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.MENU,
          key:data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6500 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6600 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700 " + data);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(e){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700 e" + e.code + e.message);
        expect(e.code).assertEqual("401");
      } 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      try{
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800 " + data);
          expect().assertFail();
        })
      }catch(e){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800 e" + e.code + e.message);
        expect(e.code).assertEqual("401");
      } 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      try{
        await unifiedDataChannel.queryData(options).then(async (data) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900 " + data);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(e){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900 e" + e.code + e.message);
        expect(e.code).assertEqual("401");
      } 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      try{
        unifiedDataChannel.queryData(options, (data) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000 " + data);
          expect().assertFail();
        })
      }catch(e){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000 e" + e.code + e.message);
        expect(e.code).assertEqual("401");
      } 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      try{
        await unifiedDataChannel.deleteData(options).then(async (data) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100 " + data);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(e){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100 e" + e.code + e.message);
        expect(e.code).assertEqual("401");
      } 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      let plainTextDetails: Record<string, string> = {
        'attr1': 'value1',
        'attr2': 'value2',
      }
      let plainText: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example',
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let contentFormRecord = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(contentFormRecord);
      try{
        unifiedDataChannel.deleteData(options, (data) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200 " + data);
          expect().assertFail();
        })
      }catch(e){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200 e" + e.code + e.message);
        expect(e.code).assertEqual("401");
      } 
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200 end");
      done();
    })


    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7300
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7300
     * @tc.desc      : unifiedDataChannel updateData callback interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options= {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info( `insertData0100 success; data = ${data}, options = ${options}`);
          unifiedDataChannel.updateData({
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          }, unifiedData, (err, ret) => {
            if (err === undefined) {
              console.info( `updateData success; data = ${ret}, options = ${options}`);
              expect(err === undefined).assertTrue()
              done();
            } else {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            }
          });
        });
      } catch (error) {
        console.error(`Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7400
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7400
     * @tc.desc      : unifiedDataChannel updateData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info( ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info( `insertData0100 success; data = ${data}, options = ${options}`);
          unifiedDataChannel.updateData({
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          }, unifiedData).then((ret) => {
            console.info(`updateData success; data = ${ret}, options = ${options}`);
            expect(ret !== null).assertTrue();
            done();
          }).catch((err:BusinessError) => {
            console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      } catch (error) {
        console.error( `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7500
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7500
     * @tc.desc      : unifiedDataChannel updateData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.MENU
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        if (e !== undefined) {
          console.info( ` Failed to insertData. code is ${e.code},message is ${e.message} `);
          return;
        }
        console.info( `insertData0100 success; data = ${data}, options = ${options}`);
          try{
            unifiedDataChannel.updateData({
              intention: unifiedDataChannel.Intention.MENU,
              key: data
            }, unifiedData).then((ret) => {
              console.info( `updateData success; data = ${ret}, options = ${options}`);
              expect(ret !== null).assertTrue();
              done();
            }).catch((err:BusinessError) => {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          } catch (error) {
            console.error( `Failed, code is ${error.code},message is ${error.message} `);
            expect(error.code).assertEqual("401");
            done();
          }
      });
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7600
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7600
     * @tc.desc      : unifiedDataChannel updateData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.SYSTEM_SHARE
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        if (e !== undefined) {
          console.info(` Failed to insertData. code is ${e.code},message is ${e.message} `);
          return;
        }
        console.info(`insertData0100 success; data = ${data}, options = ${options}`);
          try{
            unifiedDataChannel.updateData({
              intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
              key: data
            }, unifiedData).then((ret) => {
              console.info(`updateData success; data = ${ret}, options = ${options}`);
              expect(ret !== null).assertFail();
              done();
            }).catch((err:BusinessError) => {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err.code).assertEqual("401");
              done();
            });
          } catch (error) {
            console.error(`Failed, code is ${error.code},message is ${error.message} `);
            expect(error.code).assertEqual("401");
            done();
          }
      });
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7700
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7700
     * @tc.desc      : unifiedDataChannel updateData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.PICKER
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        if (e !== undefined) {
          console.info(` Failed to insertData. code is ${e.code},message is ${e.message} `);
          return;
        }
        console.info(`insertData0100 success; data = ${data}, options = ${options}`);
          try{
            unifiedDataChannel.updateData({
              intention: unifiedDataChannel.Intention.PICKER,
              key: data
            }, unifiedData).then((ret) => {
              console.info( `updateData success; data = ${ret}, options = ${options}`);
              expect(ret !== null).assertFail();
              done();
            }).catch((err:BusinessError) => {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err.code).assertEqual("401");
              done();
            });
          } catch (error) {
            console.error( `Failed, code is ${error.code},message is ${error.message} `);
            expect(error.code).assertEqual("401");
            done();
          }
      });
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7800
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7800
     * @tc.desc      : unifiedDataChannel updateData callback interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options= {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        if (e !== undefined) {
          console.info(` Failed to insertData. code is ${e.code},message is ${e.message} `);
          return;
        }
        console.info(`insertData0100 success; data = ${data}, options = ${options}`);
        try{
          unifiedDataChannel.updateData({
            intention: unifiedDataChannel.Intention.PICKER,
            key: data
          }, unifiedData, (err, ret) => {
            if (err === undefined) {
              console.info(`updateData success; data = ${ret}, options = ${options}`);
              expect(err === undefined).assertTrue()
              done();
            } else {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            }
          });
      }catch (error) {
        console.error(`Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual("401");
        done();
      }
      })
    })
     /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7900
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7900
     * @tc.desc      : unifiedDataChannel updateData callback interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options= {
        intention: unifiedDataChannel.Intention.PICKER
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
        if (e !== undefined) {
          console.info(` Failed to insertData. code is ${e.code},message is ${e.message} `);
          return;
        }
        console.info( `insertData0100 success; data = ${data}, options = ${options}`);
        try{
          unifiedDataChannel.updateData({
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          }, unifiedData, (err, ret) => {
            if (err === undefined) {
              console.info( `updateData success; data = ${ret}, options = ${options}`);
              expect(err === undefined).assertTrue()
              done();
            } else {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            }
          });
        }catch (error) {
          console.error(`Failed, code is ${error.code},message is ${error.message} `);
          expect(error.code).assertEqual("401");
          done();
        }
      })
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        recordCount: 0
      }
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE,
        acceptableInfo: dataLoadInfo
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8100
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8000 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
      }
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE,
        acceptableInfo: dataLoadInfo
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8100 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8200
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8000 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = null;
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE,
        acceptableInfo: dataLoadInfo
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8200 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8700
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8700 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = undefined;
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE,
        acceptableInfo: dataLoadInfo
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8700 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const stringSet = new Set<string>();
      stringSet.add("111");
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        types:  stringSet
      }
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE,
        acceptableInfo: dataLoadInfo
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const stringSet = new Set<string>();
      stringSet.add("");
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        types: stringSet,
        recordCount: 0
      }
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE,
        acceptableInfo: dataLoadInfo
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8500
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8500 start');
      const progressInfo:unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data:unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        recordCount: null
      }
      const getDataParams:unifiedDataChannel.GetDataParams  = {
        progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
        dataProgressListener: progressListener,
        destUri: "/data/files",
        fileConflictOptions: unifiedDataChannel.FileConflictOptions.OVERWRITE,
        acceptableInfo: dataLoadInfo
      }
      let obj = getDataParams;
      progressListener(progressInfo, null);
      expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);
      expect(obj.destUri).assertEqual(getDataParams.destUri);
      expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
      expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);
      expect(resProgressInfo.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8500 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600 start');
      const stringSet = new Set<string>();
      stringSet.add("general.plain-text");
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        types: stringSet,
        recordCount: 0
      }
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      let dataLoadHandler = (dataLoadInfo: unifiedDataChannel.DataLoadInfo) => {
        return unifiedData;
      };

      const dataLoadParams :unifiedDataChannel.DataLoadParams   = {
       loadHandler: dataLoadHandler,
       dataLoadInfo:dataLoadInfo
      }
      let obj = dataLoadParams;
      let reunifiedData = dataLoadHandler(dataLoadInfo);
      let records = reunifiedData.getRecords();
      let record:unifiedDataChannel.PlainText = (records[0]) as unifiedDataChannel.PlainText;
      expect(records.length).assertEqual(1);
      if (record.details != undefined){
        expect(record.details.title).assertEqual('标题');
        expect(record.details.content).assertEqual('内容');
      }
      expect(record.textContent).assertEqual('textContent');
      expect(record.abstract).assertEqual('abstract');
      expect(obj.loadHandler).assertEqual(dataLoadParams.loadHandler);
      expect(obj.dataLoadInfo).assertEqual(dataLoadParams.dataLoadInfo);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900 start');
      const stringSet = new Set<string>();
      stringSet.add("hello");
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        types: stringSet,
        recordCount: 0
      }
      let dataLoadHandler = () =>{
        return null;
      };

      const dataLoadParams :unifiedDataChannel.DataLoadParams   = {
       loadHandler: dataLoadHandler,
       dataLoadInfo:dataLoadInfo
      }
      let obj = dataLoadParams;
      let obj2 = dataLoadHandler();
      expect(obj.loadHandler).assertEqual(dataLoadParams.loadHandler);
      expect(obj2).assertEqual(null);
      expect(obj.dataLoadInfo).assertEqual(dataLoadParams.dataLoadInfo);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000 start');
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9100 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200 start');
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9210 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9220 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 start');
      let reVisibility = null;
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 " + err.code + err.message);
          expect(err.code).assertEqual("401");
        });
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 " + err.code + err.message);
        expect(err.code).assertEqual("401");
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 " + err.code + err.message);
          expect(err.code).assertEqual("401");
        });
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 " + err.code + err.message);
        expect(err.code).assertEqual("401");
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250 start');
      let reVisibility:unifiedDataChannel.Visibility = 5;
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250 11111111" + data );
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250 " + err.code + err.message);
        expect(err.code).assertEqual("401");
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9250 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 " + err.code + err.message);
          expect(err.code).assertEqual("401");
        });
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 " + err.code + err.message);
        expect(err.code).assertEqual("401");
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9320
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9320
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.PICKER,
          key:data,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9300 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9230 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
          key:data,
          visibility: unifiedDataChannel.Visibility.OWN_PROCESS
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9240 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9310 end");
      done();
    })

     /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.MENU,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9330 end");
      done();
    })

        /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.PICKER,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9350 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9360 end");
      done();
    })

     /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370 " + data);
        let options1: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.MENU,
          key:data,
          visibility: unifiedDataChannel.Visibility.ALL
        };
        await unifiedDataChannel.queryData(options1).then(async (ret) => {
          let size = ret.length;
          console.info(`data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
              let record = unifiedDataRecord.getValue() as object;
              if (record != undefined) {
                expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
                expect(record["textContent"]).assertEqual(plainText.textContent);
                expect(record["abstract"]).assertEqual(plainText.abstract);
                expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370 " + err.code + err.message);
          expect().assertFail();
        })
      }).catch((err: BusinessError) => {
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370 " + err.code + err.message);
        expect().assertFail();
      });
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9370 end");
      done();
    })

     /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
           expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(e){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380 " + e.code + e.message);
        expect(e.code).assertEqual("401");
      }    
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9380 end");
      done();
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          expect( data!=null ).assertTrue();
          let options1: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data,
            visibility: unifiedDataChannel.Visibility.ALL
          };
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9400 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      try{
        await unifiedDataChannel.insertData(options, unifiedData).then(async (data) => {
          expect( data!=null ).assertTrue();
          let options1: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data,
            visibility: unifiedDataChannel.Visibility.ALL
          };
          await unifiedDataChannel.deleteData(options1);
        }).catch((err: BusinessError) => {
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410 " + err.code + err.message);
          expect().assertFail();
        });
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9410 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
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
        abstract: 'this is abstract 000000000',
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
            let record = unifiedDataRecord.getValue() as object;
            if (record != undefined) {
              expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
              expect(record["textContent"]).assertEqual(plainText.textContent);
              expect(record["abstract"]).assertEqual(plainText.abstract);
              expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
            }
          }
        }
        for (let i = 0; i < ret1.length; i++) {
          let records = ret1[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
            let record = unifiedDataRecord.getValue() as object;
            if (record != undefined) {
              expect(record["uniformDataType"]).assertEqual(plainText1.uniformDataType);
              expect(record["textContent"]).assertEqual(plainText1.textContent);
              expect(record["abstract"]).assertEqual(plainText1.abstract);
              expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText1.details));
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        abstract: 'this is abstract',
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
        abstract: 'this is abstract 0000000',
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
            let record = unifiedDataRecord.getValue() as object;
            if (record != undefined) {
              expect(record["uniformDataType"]).assertEqual(plainText.uniformDataType);
              expect(record["textContent"]).assertEqual(plainText.textContent);
              expect(record["abstract"]).assertEqual(plainText.abstract);
              expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText.details));
            }
          }
        }
        for (let i = 0; i < ret1.length; i++) {
          let records = ret1[i].getRecords();
          let size = records.length;
          for (let j = 0; j < size; j++) {
            let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
            let record = unifiedDataRecord.getValue() as object;
            if (record != undefined) {
              expect(record["uniformDataType"]).assertEqual(plainText1.uniformDataType);
              expect(record["textContent"]).assertEqual(plainText1.textContent);
              expect(record["abstract"]).assertEqual(plainText1.abstract);
              expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText1.details));
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        abstract: 'this is abstract 11111112222',
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
        await unifiedDataChannel.updateData(options1,unifiedData1).then(async (ret) =>{
          console.info(`updateData success; data = ${ret}, options = ${options1}`);
          expect(options1.visibility).assertEqual(unifiedDataChannel.Visibility.ALL);
          await unifiedDataChannel.deleteData(options1);
          done();
        }).catch((err: BusinessError) =>{
          console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440 " + err.code + err.message);
          expect().assertFail();
        })
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9440 end");
      done();
    })


    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9450
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9450
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        abstract: 'this is abstract 11111112222',
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
          await unifiedDataChannel.updateData(options1,unifiedData1).then(async (ret) =>{
            console.info(`updateData success; data = ${ret}, options = ${options1}`);
            expect(options1.visibility).assertEqual(unifiedDataChannel.Visibility.OWN_PROCESS);
            await unifiedDataChannel.queryData(options1).then(async (ret) => {
              let size = ret.length;
              console.info(`data.size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                  let record = unifiedDataRecord.getValue() as object;
                  if (record != undefined) {
                    expect(record["uniformDataType"]).assertEqual(plainText1.uniformDataType);
                    expect(record["textContent"]).assertEqual(plainText1.textContent);
                    expect(record["abstract"]).assertEqual(plainText1.abstract);
                    expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText1.details));
                  }
                }
              }
              await unifiedDataChannel.deleteData(options1);
              done();
            }).catch((err: BusinessError) => {
              console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 " + err.code + err.message);
              expect().assertFail();
            })
          }).catch((err: BusinessError) =>{
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        abstract: 'this is abstract 11111112222',
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
          await unifiedDataChannel.updateData(options1,unifiedData1).then(async (ret) =>{
            console.info(`updateData success; data = ${ret}, options = ${options1}`);
            expect(options1.visibility).assertEqual(unifiedDataChannel.Visibility.ALL);
            await unifiedDataChannel.queryData(options1).then(async (ret) => {
              let size = ret.length;
              console.info(`data.size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
                  let record = unifiedDataRecord.getValue() as object;
                  if (record != undefined) {
                    expect(record["uniformDataType"]).assertEqual(plainText1.uniformDataType);
                    expect(record["textContent"]).assertEqual(plainText1.textContent);
                    expect(record["abstract"]).assertEqual(plainText1.abstract);
                    expect(JSON.stringify(record["details"])).assertEqual(JSON.stringify(plainText1.details));
                  }
                }
              }
              await unifiedDataChannel.deleteData(options1);
              done();
            }).catch((err: BusinessError) => {
              console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 " + err.code + err.message);
              expect().assertFail();
            })
          }).catch((err: BusinessError) =>{
            console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 " + err.code + err.message);
            expect().assertFail();
          })
        } catch (e) {
          let error: BusinessError = e as BusinessError;
          console.error(`Update data throws an exception. code is ${error.code}, message is ${error.message} `);
        }
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 " + err.code + err.message);
        expect().assertFail();
      }
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9470 end");
      done();
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480 start');
      let options6: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
      };
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        abstract: 'this is abstract 11111112222',
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
          key: keyData
        };
        await unifiedDataChannel.deleteData(options4);
        await unifiedDataChannel.deleteData(options5);
        done();
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480 " + err.code + err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9490
     * @tc.name      : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9490
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
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
        abstract: 'this is abstract',
        details: plainTextDetails,
      }
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
      unifiedData.addRecord(record);
      let plainText1: uniformDataStruct.PlainText = {
        uniformDataType: 'general.plain-text',
        textContent: 'This is plainText textContent example 111111',
        abstract: 'this is abstract 11111112222',
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
          key: keyData
        };
        await unifiedDataChannel.deleteData(options4);
        await unifiedDataChannel.deleteData(options5);
        done();
      }catch(err){
        console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9480 " + err.code + err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0150
     * @tc.name      : CreateData type is text
     * @tc.desc      : Test UDMF creating a unifieddata with a text record.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0150 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(0);
      done();
    })


    
  })
}