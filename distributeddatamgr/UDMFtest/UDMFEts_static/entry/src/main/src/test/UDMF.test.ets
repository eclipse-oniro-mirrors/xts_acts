/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import { image } from '@kit.ImageKit';
import UTD from '@ohos.data.uniformTypeDescriptor';
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

export default function UDMFApiTest() {
  describe("UDMFApiTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'UDMFApiTest start');
    let TAG = '';
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
     * @tc.number UnifiedDataTest01
     * @tc.desc   predicates orderByAsc normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedRecord = new unifiedDataChannel.UnifiedRecord();
      let unifiedData = new unifiedDataChannel.UnifiedData(unifiedRecord);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.UnifiedRecord = (records[0]) as unifiedDataChannel.UnifiedRecord;
      expect(records.length == 1).assertEqual(true);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 end');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200
     * @tc.number UnifiedDataTest02
     * @tc.desc   predicates orderByAsc normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(0);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 end');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300
     * @tc.number UnifiedDataTest03
     * @tc.desc   predicates orderByAsc normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 start');
      let unifiedRecord = new unifiedDataChannel.UnifiedRecord("general.composite-object", "string");
      let unifiedData = new unifiedDataChannel.UnifiedData(unifiedRecord);
      let records = unifiedData.getRecords();
      let record: unifiedDataChannel.UnifiedRecord = (records[0]) as unifiedDataChannel.UnifiedRecord;
      expect(records.length == 1).assertEqual(true);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300 end');
      done();
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001
     * @tc.number UDMFApiTest01
     * @tc.desc   getUniformDataTypeByFilenameExtension JPEG test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".jpg");
        expect(result).assertEqual(UTD.UniformDataType.JPEG);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".jpeg");
        expect(result1).assertEqual(UTD.UniformDataType.JPEG);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".jpe");
        expect(result2).assertEqual(UTD.UniformDataType.JPEG);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".jpg", "general.image");
        expect(result3).assertEqual(UTD.UniformDataType.JPEG);
        let result4 = UTD.getUniformDataTypeByFilenameExtension(".jpeg", "general.image");
        expect(result4).assertEqual(UTD.UniformDataType.JPEG);
        let result5 = UTD.getUniformDataTypeByFilenameExtension(".jpe", "general.image");
        expect(result5).assertEqual(UTD.UniformDataType.JPEG);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_001 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002
     * @tc.number UDMFApiTest02
     * @tc.desc   getUniformDataTypeByFilenameExtension HTML test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".html");
        expect(result).assertEqual(UTD.UniformDataType.HTML);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".htm");
        expect(result1).assertEqual(UTD.UniformDataType.HTML);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".html", "general.text");
        expect(result2).assertEqual(UTD.UniformDataType.HTML);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".htm", "general.text");
        expect(result3).assertEqual(UTD.UniformDataType.HTML);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_002 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003
     * @tc.number UDMFApiTest03
     * @tc.desc   getUniformDataTypeByFilenameExtension PLAIN_TEXT test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".txt");
        expect(result).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".text");
        expect(result1).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".txt", "general.text");
        expect(result2).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".text", "general.text");
        expect(result3).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_003 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004
     * @tc.number UDMFApiTest04
     * @tc.desc   getUniformDataTypeByFilenameExtension PNG test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".png");
        expect(result).assertEqual(UTD.UniformDataType.PNG);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".png", "general.image");
        expect(result1).assertEqual(UTD.UniformDataType.PNG);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_004 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005
     * @tc.number UDMFApiTest05
     * @tc.desc   getUniformDataTypeByFilenameExtension MPEG4 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".mpeg4");
        expect(result).assertEqual(UTD.UniformDataType.MPEG4);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".mp4v");
        expect(result1).assertEqual(UTD.UniformDataType.MPEG4);
        let result2 = UTD.getUniformDataTypeByFilenameExtension(".mp4");
        expect(result2).assertEqual(UTD.UniformDataType.MPEG4);
        let result3 = UTD.getUniformDataTypeByFilenameExtension(".mpeg4", "general.video");
        expect(result3).assertEqual(UTD.UniformDataType.MPEG4);
        let result4 = UTD.getUniformDataTypeByFilenameExtension(".mp4v", "general.video");
        expect(result4).assertEqual(UTD.UniformDataType.MPEG4);
        let result5 = UTD.getUniformDataTypeByFilenameExtension(".mp4", "general.video");
        expect(result5).assertEqual(UTD.UniformDataType.MPEG4);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_005 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006
     * @tc.number UDMFApiTest06
     * @tc.desc   getUniformDataTypeByFilenameExtension PDF test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".pdf");
        expect(result).assertEqual(UTD.UniformDataType.PDF);
        let result1 = UTD.getUniformDataTypeByFilenameExtension(".pdf", "general.composite-object");
        expect(result1).assertEqual(UTD.UniformDataType.PDF);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_006 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007
     * @tc.number UDMFApiTest07
     * @tc.desc   getUniformDataTypeByFilenameExtension "" test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension("");
        done();
      } catch (error) {
        let err = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect(err.code).assertEqual(401);
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_007 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008
     * @tc.number UDMFApiTest08
     * @tc.desc   getType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008 start');
      try {
        let file = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FILE, "file");
        expect(file.getType()).assertEqual(UTD.UniformDataType.FILE);

        let folder = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FOLDER, "folder");
        expect(folder.getType()).assertEqual(UTD.UniformDataType.FOLDER);

        let audio = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.AUDIO, "audio");
        expect(audio.getType()).assertEqual(UTD.UniformDataType.AUDIO);

        let video = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.VIDEO, "video");
        expect(video.getType()).assertEqual(UTD.UniformDataType.VIDEO);

        let hyperlink = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.HYPERLINK, "hyperlink");
        expect(hyperlink.getType()).assertEqual(UTD.UniformDataType.HYPERLINK);

        let text = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.TEXT, "text");
        expect(text.getType()).assertEqual(UTD.UniformDataType.TEXT);

        let jpeg = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.JPEG, "jpeg");
        expect(jpeg.getType()).assertEqual(UTD.UniformDataType.JPEG);

        let atomicService = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE, "atomicService");
        expect(atomicService.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);

        let appitem = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_APP_ITEM, "appitem");
        expect(appitem.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_APP_ITEM);

        let pixelMap = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP, "pixelMap");
        expect(pixelMap.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_008 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009
     * @tc.number UDMFApiTest09
     * @tc.desc   getRecords test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = "fileUri";
        let fileDetails: Record<string, string> = {
          'fileTitle': 'fileTitle',
          'fileValue': 'fileValue'
        };
        file.details = fileDetails;

        let folder = new unifiedDataChannel.Folder();
        folder.folderUri = "folderUri";
        folder.uri = "folderUri1111111111";
        let folderDetails: Record<string, string> = {
          'folderTitle': 'folderTitle',
          'folderValue': 'folderValue'
        };
        folder.details = folderDetails;

        let audio = new unifiedDataChannel.Audio();
        audio.audioUri = "audioUri";
        audio.uri = "audioUri2222222222";
        let audioDetails: Record<string, string> = {
          'audioTitle': 'audioTitle',
          'audioValue': 'audioValue'
        };
        audio.details = audioDetails;

        let video = new unifiedDataChannel.Video();
        video.videoUri = "videoUri";
        video.uri = "videoUri3333333333";
        let videoDetails: Record<string, string> = {
          'videoTitle': 'videoTitle',
          'videoValue': 'videoValue'
        };
        video.details = videoDetails;

        let image = new unifiedDataChannel.Image();
        image.imageUri = "imageUri";
        image.uri = "imageUri4444444444";
        let imageDetails: Record<string, string> = {
          'imageTitle': 'imageTitle',
          'imageValue': 'imageValue'
        };
        image.details = imageDetails;

        let image1 = new unifiedDataChannel.Image();
        image1.imageUri = "imageUri1111111111";
        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(file);
        unifiedData.addRecord(folder);
        unifiedData.addRecord(audio);
        unifiedData.addRecord(video);
        unifiedData.addRecord(image);
        unifiedData.addRecord(image1);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(6);
        let re = records[0] as unifiedDataChannel.File;
        expect(re.getType()).assertEqual("general.file");
        expect(re.uri).assertEqual(file.uri);
        expect(JSON.stringify(re.details)).assertEqual(JSON.stringify(file.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 file: ' + re.details);
        let re1 = records[1] as unifiedDataChannel.Folder;
        expect(re1.getType()).assertEqual("general.folder");
        expect(re1.folderUri).assertEqual(folder.folderUri);
        expect(re1.uri).assertEqual(folder.uri);
        expect(JSON.stringify(re1.details)).assertEqual(JSON.stringify(folder.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 folder: ' + re1.details);
        let re2 = records[2] as unifiedDataChannel.Audio;
        expect(re2.getType()).assertEqual("general.audio");
        expect(re2.audioUri).assertEqual(audio.audioUri);
        expect(re2.uri).assertEqual(audio.uri);
        expect(JSON.stringify(re2.details)).assertEqual(JSON.stringify(audio.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 audio: ' + re2.details);
        let re3 = records[3] as unifiedDataChannel.Video;
        expect(re3.getType()).assertEqual("general.video");
        expect(re3.videoUri).assertEqual(video.videoUri);
        expect(re3.uri).assertEqual(video.uri);
        expect(JSON.stringify(re3.details)).assertEqual(JSON.stringify(video.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 video: ' + re3.details);
        let re4 = records[4] as unifiedDataChannel.Image;
        expect(re4.getType()).assertEqual("general.image");
        expect(re4.imageUri).assertEqual(image.imageUri);
        expect(re4.uri).assertEqual(image.uri);
        expect(JSON.stringify(re4.details)).assertEqual(JSON.stringify(image.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 image: ' + re4.details);
        let re5 = records[5] as unifiedDataChannel.Image;
        expect(re5.getType()).assertEqual("general.image");
        expect(re5.imageUri).assertEqual(image1.imageUri);
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 image: ' + re5.details);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_009 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010
     * @tc.number UDMFApiTest10
     * @tc.desc   getRecords test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 start');
      try {
        let text = new unifiedDataChannel.Text();
        let textDetails: Record<string, string> = {
          'textTitle': 'textTitle',
          'textValue': 'textValue'
        };
        text.details = textDetails;

        let html = new unifiedDataChannel.HTML();
        html.htmlContent = "htmlContent";
        html.plainContent = "plainContent";
        let htmlDetails: Record<string, string> = {
          'htmlTitle': 'htmlTitle',
          'htmlValue': 'htmlValue'
        };
        html.details = htmlDetails;

        let hyperlink = new unifiedDataChannel.Hyperlink();
        hyperlink.url = "hyperlinkurl";
        hyperlink.description = "hyperlinkdescription";
        let hyperlinkDetails: Record<string, string> = {
          'hyperlinkTitle': 'hyperlinkTitle',
          'hyperlinkValue': 'hyperlinkValue'
        };
        hyperlink.details = hyperlinkDetails;

        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = "plaintext";
        let plainTextDetails: Record<string, string> = {
          'plainTextTitle': 'plainTextTitle',
          'plainTextValue': 'plainTextValue'
        };
        plainText.details = plainTextDetails;
        plainText.textAbstract = "plainTextAbstract"

        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(text);
        unifiedData.addRecord(html);
        unifiedData.addRecord(hyperlink);
        unifiedData.addRecord(plainText);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(4);
        let re = records[0] as unifiedDataChannel.Text;
        expect(re.getType()).assertEqual("general.text");
        expect(JSON.stringify(re.details)).assertEqual(JSON.stringify(text.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 text: ' + re.details);
        let re1 = records[1] as unifiedDataChannel.HTML;
        expect(re1.getType()).assertEqual("general.html");
        expect(re1.htmlContent).assertEqual(html.htmlContent);
        expect(re1.plainContent).assertEqual(html.plainContent);
        expect(JSON.stringify(re1.details)).assertEqual(JSON.stringify(html.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 html: ' + re1.details);
        let re2 = records[2] as unifiedDataChannel.Hyperlink;
        expect(re2.getType()).assertEqual("general.hyperlink");
        expect(re2.url).assertEqual(hyperlink.url);
        expect(re2.description).assertEqual(hyperlink.description);
        expect(JSON.stringify(re2.details)).assertEqual(JSON.stringify(hyperlink.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 hyperlink: ' + re2.details);
        let re3 = records[3] as unifiedDataChannel.PlainText;
        expect(re3.getType()).assertEqual("general.plain-text");
        expect(re3.textContent).assertEqual(plainText.textContent);
        expect(re3.textAbstract).assertEqual(plainText.textAbstract);
        expect(JSON.stringify(re3.details)).assertEqual(JSON.stringify(plainText.details));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 text: ' + re3.details);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_010 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011
     * @tc.number UDMFApiTest11
     * @tc.desc   getRecords test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        let systemDefinedRecordDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedRecordDetailsString': 'systemDefinedRecordDetailsString',
          'systemDefinedRecordDetailsNumber': 10,
          'systemDefinedRecordDetailsUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedRecord.details = systemDefinedRecordDetails;

        let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.formId = 20;
        systemDefinedForm.module = "systemDefinedForm-module";
        systemDefinedForm.formName = "systemDefinedForm-formName";
        systemDefinedForm.bundleName = "systemDefinedForm-bundleName";
        systemDefinedForm.abilityName = "systemDefinedForm-abilityName";
        let systemDefinedFormDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedFormString': 'systemDefinedFormString',
          'systemDefinedFormNumber': 10,
          'systemDefinedFormUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedForm.details = systemDefinedFormDetails;

        let systemDefinedAppItem = new unifiedDataChannel.SystemDefinedAppItem();
        systemDefinedAppItem.appId = "systemDefinedAppItem-appId";
        systemDefinedAppItem.appName = "systemDefinedAppItem-appName";
        systemDefinedAppItem.appIconId = "systemDefinedAppItem-appIconId";
        systemDefinedAppItem.appLabelId = "systemDefinedAppItem-appLabelId";
        systemDefinedAppItem.bundleName = "systemDefinedAppItem-bundleName";
        systemDefinedAppItem.abilityName = "systemDefinedAppItem-abilityName";
        let systemDefinedAppItemDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedAppItemString': 'systemDefinedAppItemString',
          'systemDefinedAppItemNumber': 10,
          'systemDefinedAppItemUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedAppItem.details = systemDefinedAppItemDetails;

        let systemDefinedPixelMap = new unifiedDataChannel.SystemDefinedPixelMap();
        let systemDefinedPixelMapDetails: Record<String, Int | Long | Double | String | Uint8Array> | undefined = {
          'systemDefinedPixelMapString': 'systemDefinedPixelMapString',
          'systemDefinedPixelMapNumber': 10,
          'systemDefinedPixelMapUint8Array': new Uint8Array([1, 2, 3, 4, 5, 6, 7])
        };
        systemDefinedPixelMap.details = systemDefinedPixelMapDetails;
        let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7]);
        systemDefinedPixelMap.rawData = u8Array;
        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(systemDefinedRecord);
        unifiedData.addRecord(systemDefinedForm);
        unifiedData.addRecord(systemDefinedAppItem);
        unifiedData.addRecord(systemDefinedPixelMap);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(4);

        let re = records[0] as unifiedDataChannel.SystemDefinedRecord;
        expect(re.getType()).assertEqual("SystemDefinedType");
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedRecord details: ' + re.details);
        let re1 = records[1] as unifiedDataChannel.SystemDefinedForm;
        expect(re1.getType()).assertEqual("openharmony.form");
        expect(re1.formId).assertEqual(systemDefinedForm.formId);
        expect(re1.formName).assertEqual(systemDefinedForm.formName);
        expect(re1.bundleName).assertEqual(systemDefinedForm.bundleName);
        expect(re1.abilityName).assertEqual(systemDefinedForm.abilityName);
        expect(re1.module).assertEqual(systemDefinedForm.module);
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedForm details: ' + re1.details);
        let re2 = records[2] as unifiedDataChannel.SystemDefinedAppItem;
        expect(re2.getType()).assertEqual("openharmony.app-item");
        expect(re2.appId).assertEqual(systemDefinedAppItem.appId);
        expect(re2.appName).assertEqual(systemDefinedAppItem.appName);
        expect(re2.appIconId).assertEqual(systemDefinedAppItem.appIconId);
        expect(re2.appLabelId).assertEqual(systemDefinedAppItem.appLabelId);
        expect(re2.bundleName).assertEqual(systemDefinedAppItem.bundleName);
        expect(re2.abilityName).assertEqual(systemDefinedAppItem.abilityName);
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedAppItem details: ' + re2.details);
        let re3 = records[3] as unifiedDataChannel.SystemDefinedPixelMap;
        expect(re3.getType()).assertEqual("openharmony.pixel-map");
        expect(JSON.stringify(re3.rawData)).assertEqual(JSON.stringify(u8Array));
        hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 SystemDefinedPixelMap details: ' + re3.details);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_011 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012
     * @tc.number UDMFApiTest12
     * @tc.desc   getRecords test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012 start');
      try {
        let record = new unifiedDataChannel.UnifiedRecord();
        let plainText = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.PLAIN_TEXT, "PLAIN_TEXT");
        let folder = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FOLDER, "FOLDER");
        let file = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.FILE, "FILE");
        let audio = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.AUDIO, "AUDIO");
        let video = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.VIDEO, "VIDEO");
        let image = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.IMAGE, "IMAGE");
        let hyperlink = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.HYPERLINK, "HYPERLINK");
        let html = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.HTML, "HTML");
        let text = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.TEXT, "TEXT");
        let jpeg = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.JPEG, "JPEG");
        let png = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.PNG, "PNG");
        let mpeg4 = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.MPEG4, "MPEG4");
        let pixelMap = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP, "OPENHARMONY_PIXEL_MAP");
        let atomicService = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE, "OPENHARMONY_ATOMIC_SERVICE");
        let appItem = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.OPENHARMONY_APP_ITEM, "OPENHARMONY_APP_ITEM");
        let pdf = new unifiedDataChannel.UnifiedRecord(UTD.UniformDataType.PDF, "PDF");
        let unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(record);
        unifiedData.addRecord(plainText);
        unifiedData.addRecord(folder);
        unifiedData.addRecord(file);
        unifiedData.addRecord(audio);
        unifiedData.addRecord(video);
        unifiedData.addRecord(image);
        unifiedData.addRecord(hyperlink);
        unifiedData.addRecord(html);
        unifiedData.addRecord(text);
        unifiedData.addRecord(jpeg);
        unifiedData.addRecord(png);
        unifiedData.addRecord(mpeg4);
        unifiedData.addRecord(pixelMap);
        unifiedData.addRecord(atomicService);
        unifiedData.addRecord(appItem);
        unifiedData.addRecord(pdf);
        let records = unifiedData.getRecords();
        expect(records.length).assertEqual(17);

        let re = records[0];
        expect(re.getType()).assertEqual("");
        let re1 = records[1] as unifiedDataChannel.PlainText;
        expect(re1.getType()).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
        expect(re1.getValue()).assertEqual("PLAIN_TEXT");
        let re2 = records[2] as unifiedDataChannel.Folder;
        expect(re2.getType()).assertEqual(UTD.UniformDataType.FOLDER);
        expect(re2.getValue()).assertEqual("FOLDER");
        let re3 = records[3] as unifiedDataChannel.File;
        expect(re3.getType()).assertEqual(UTD.UniformDataType.FILE);
        expect(re3.getValue()).assertEqual("FILE");
        let re4 = records[4] as unifiedDataChannel.Audio;
        expect(re4.getType()).assertEqual(UTD.UniformDataType.AUDIO);
        expect(re4.getValue()).assertEqual("AUDIO");
        let re5 = records[5] as unifiedDataChannel.Video;
        expect(re5.getType()).assertEqual(UTD.UniformDataType.VIDEO);
        expect(re5.getValue()).assertEqual("VIDEO")
        let re6 = records[6] as unifiedDataChannel.Image;
        expect(re6.getType()).assertEqual(UTD.UniformDataType.IMAGE);
        expect(re6.getValue()).assertEqual("IMAGE");
        let re7 = records[7] as unifiedDataChannel.Hyperlink;
        expect(re7.getType()).assertEqual(UTD.UniformDataType.HYPERLINK);
        expect(re7.getValue()).assertEqual("HYPERLINK");
        let re8 = records[8] as unifiedDataChannel.HTML;
        expect(re8.getType()).assertEqual(UTD.UniformDataType.HTML);
        expect(re8.getValue()).assertEqual("HTML");
        let re9 = records[9] as unifiedDataChannel.Text;
        expect(re9.getType()).assertEqual(UTD.UniformDataType.TEXT);
        expect(re9.getValue()).assertEqual("TEXT");
        let re10 = records[10];
        expect(re10.getType()).assertEqual(UTD.UniformDataType.JPEG);
        expect(re10.getValue()).assertEqual("JPEG");
        let re11 = records[11];
        expect(re11.getType()).assertEqual(UTD.UniformDataType.PNG);
        expect(re11.getValue()).assertEqual("PNG");
        let re12 = records[12];
        expect(re12.getType()).assertEqual(UTD.UniformDataType.MPEG4);
        expect(re12.getValue()).assertEqual("MPEG4");
        let re13 = records[13];
        expect(re13.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP);
        expect(re13.getValue()).assertEqual("OPENHARMONY_PIXEL_MAP");
        let re14 = records[14];
        expect(re14.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE);
        expect(re14.getValue()).assertEqual("OPENHARMONY_ATOMIC_SERVICE");
        let re15 = records[15];
        expect(re15.getType()).assertEqual(UTD.UniformDataType.OPENHARMONY_APP_ITEM);
        expect(re15.getValue()).assertEqual("OPENHARMONY_APP_ITEM");
        let re16 = records[16];
        expect(re16.getType()).assertEqual(UTD.UniformDataType.PDF);
        expect(re16.getValue()).assertEqual("PDF");
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_012 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013
     * @tc.number UDMFApiTest13
     * @tc.desc   insertData queryData callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013 start');
      let options1: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
          let options2: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          };
          unifiedDataChannel.queryData(options2, (err, ret) => {
            if (ret !== undefined) {
              let size = ret.length;
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() === 'general.plain-text') {
                    let text: unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                    expect(text.getType()).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
                  }
                }
              }
            }
            done();
          });
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        let err = error as BusinessError;
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013 end');
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_014
     * @tc.number UDMFApiTest14
     * @tc.desc   insertData queryData promise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_013 start');
      let options: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        let data = await unifiedDataChannel.insertData(options, unifiedData);
        let options2: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          key: data
        };

        let ret = await unifiedDataChannel.queryData(options2);
        if (ret !== undefined) {
          let size = ret.length;
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              if (records[j].getType() === 'general.plain-text') {
                let text: unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                expect(text.getType()).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
              }
            }
          }
        }
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'Exception error: ' + error);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UtdfileNameExtentionsJsAPITest_014 end');
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600
     * @tc.number UDMFApiTest16
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700
     * @tc.number UDMFApiTest17
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800
     * @tc.number UDMFApiTest18
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900
     * @tc.number UDMFApiTest19
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000
     * @tc.number UDMFApiTest20
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100
     * @tc.number UDMFApiTest21
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200
     * @tc.number UDMFApiTest22
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300
     * @tc.number UDMFApiTest23
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400
     * @tc.number UDMFApiTest24
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2400 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500
     * @tc.number UDMFApiTest25
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2500 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600
     * @tc.number UDMFApiTest26
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700
     * @tc.number UDMFApiTest27
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800
     * @tc.number UDMFApiTest28
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900
     * @tc.number UDMFApiTest29
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_2900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000
     * @tc.number UDMFApiTest30
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100
     * @tc.number UDMFApiTest31
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200
     * @tc.number UDMFApiTest32
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300
     * @tc.number UDMFApiTest33
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400
     * @tc.number UDMFApiTest34
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3400 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500
     * @tc.number UDMFApiTest35
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3500 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600
     * @tc.number UDMFApiTest36
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700
     * @tc.number UDMFApiTest37
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800
     * @tc.number UDMFApiTest38
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900
     * @tc.number UDMFApiTest39
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_3900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000
     * @tc.number UDMFApiTest40
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100
     * @tc.number UDMFApiTest41
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200
     * @tc.number UDMFApiTest42
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300
     * @tc.number UDMFApiTest43
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400
     * @tc.number UDMFApiTest44
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4400 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500
     * @tc.number UDMFApiTest45
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4500 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600
     * @tc.number UDMFApiTest46
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700
     * @tc.number UDMFApiTest47
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
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
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800
     * @tc.number UDMFApiTest48
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900
     * @tc.number UDMFApiTest49
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_4900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000
     * @tc.number UDMFApiTest50
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100
     * @tc.number UDMFApiTest51
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200
     * @tc.number UDMFApiTest52
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300
     * @tc.number UDMFApiTest53
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400
     * @tc.number UDMFApiTest54
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5400 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500
     * @tc.number UDMFApiTest55
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5500 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600
     * @tc.number UDMFApiTest56
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5600 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.FINISHED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700
     * @tc.number UDMFApiTest57
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5700 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.PROCESSING
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800
     * @tc.number UDMFApiTest58
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5800 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.CANCELED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900
     * @tc.number UDMFApiTest59
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_5900 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INNER_ERROR
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000
     * @tc.number UDMFApiTest60
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6000 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100
     * @tc.number UDMFApiTest61
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6100 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.DATA_NOT_FOUND
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200
     * @tc.number UDMFApiTest62
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6200 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.SYNC_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300
     * @tc.number UDMFApiTest63
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6300 start');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.COPY_FILE_FAILED
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };
      const getDataParams: unifiedDataChannel.GetDataParams = {
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
    })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400
     * @tc.number UDMFApiTest64
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 start');
      expect(JSON.stringify(UTD.UniformDataType.ENTITY)).assertEqual(JSON.stringify("general.entity"))
      expect(JSON.stringify(UTD.UniformDataType.OBJECT)).assertEqual(JSON.stringify("general.object"));
      expect(JSON.stringify(UTD.UniformDataType.COMPOSITE_OBJECT)).assertEqual(JSON.stringify("general.composite-object"));
      expect(JSON.stringify(UTD.UniformDataType.TEXT)).assertEqual(JSON.stringify("general.text"));
      expect(JSON.stringify(UTD.UniformDataType.PLAIN_TEXT)).assertEqual(JSON.stringify("general.plain-text"));
      expect(JSON.stringify(UTD.UniformDataType.HTML)).assertEqual(JSON.stringify("general.html"));
      expect(JSON.stringify(UTD.UniformDataType.HYPERLINK)).assertEqual(JSON.stringify("general.hyperlink"));
      expect(JSON.stringify(UTD.UniformDataType.XML)).assertEqual(JSON.stringify("general.xml"));
      expect(JSON.stringify(UTD.UniformDataType.XHTML)).assertEqual(JSON.stringify("general.xhtml"));
      expect(JSON.stringify(UTD.UniformDataType.RSS)).assertEqual(JSON.stringify("general.rss"));
      expect(JSON.stringify(UTD.UniformDataType.SMIL)).assertEqual(JSON.stringify("com.real.smil"));
      expect(JSON.stringify(UTD.UniformDataType.SOURCE_CODE)).assertEqual(JSON.stringify("general.source-code"));
      expect(JSON.stringify(UTD.UniformDataType.SCRIPT)).assertEqual(JSON.stringify("general.script"));
      expect(JSON.stringify(UTD.UniformDataType.SHELL_SCRIPT)).assertEqual(JSON.stringify("general.shell-script"));
      expect(JSON.stringify(UTD.UniformDataType.CSH_SCRIPT)).assertEqual(JSON.stringify("general.csh-script"));
      expect(JSON.stringify(UTD.UniformDataType.PERL_SCRIPT)).assertEqual(JSON.stringify("general.perl-script"));
      expect(JSON.stringify(UTD.UniformDataType.PHP_SCRIPT)).assertEqual(JSON.stringify("general.php-script"));
      expect(JSON.stringify(UTD.UniformDataType.PYTHON_SCRIPT)).assertEqual(JSON.stringify("general.python-script"));
      expect(JSON.stringify(UTD.UniformDataType.RUBY_SCRIPT)).assertEqual(JSON.stringify("general.ruby-script"));
      expect(JSON.stringify(UTD.UniformDataType.TYPE_SCRIPT)).assertEqual(JSON.stringify("general.type-script"));
      expect(JSON.stringify(UTD.UniformDataType.JAVA_SCRIPT)).assertEqual(JSON.stringify("general.java-script"));
      expect(JSON.stringify(UTD.UniformDataType.C_HEADER)).assertEqual(JSON.stringify("general.c-header"));
      expect(JSON.stringify(UTD.UniformDataType.C_SOURCE)).assertEqual(JSON.stringify("general.c-source"));
      expect(JSON.stringify(UTD.UniformDataType.C_PLUS_PLUS_HEADER)).assertEqual(JSON.stringify("general.c-plus-plus-header"));
      expect(JSON.stringify(UTD.UniformDataType.C_PLUS_PLUS_SOURCE)).assertEqual(JSON.stringify("general.c-plus-plus-source"));
      expect(JSON.stringify(UTD.UniformDataType.JAVA_SOURCE)).assertEqual(JSON.stringify("general.java-source"));
      expect(JSON.stringify(UTD.UniformDataType.EBOOK)).assertEqual(JSON.stringify("general.ebook"));
      expect(JSON.stringify(UTD.UniformDataType.EPUB)).assertEqual(JSON.stringify("general.epub"));
      expect(JSON.stringify(UTD.UniformDataType.AZW)).assertEqual(JSON.stringify("com.amazon.azw"));
      expect(JSON.stringify(UTD.UniformDataType.AZW3)).assertEqual(JSON.stringify("com.amazon.azw3"));
      expect(JSON.stringify(UTD.UniformDataType.KFX)).assertEqual(JSON.stringify("com.amazon.kfx"));
      expect(JSON.stringify(UTD.UniformDataType.MOBI)).assertEqual(JSON.stringify("com.amazon.mobi"));
      expect(JSON.stringify(UTD.UniformDataType.MEDIA)).assertEqual(JSON.stringify("general.media"));
      expect(JSON.stringify(UTD.UniformDataType.IMAGE)).assertEqual(JSON.stringify("general.image"));
      expect(JSON.stringify(UTD.UniformDataType.JPEG)).assertEqual(JSON.stringify("general.jpeg"));
      expect(JSON.stringify(UTD.UniformDataType.PNG)).assertEqual(JSON.stringify("general.png"));
      expect(JSON.stringify(UTD.UniformDataType.RAW_IMAGE)).assertEqual(JSON.stringify("general.raw-image"));
      expect(JSON.stringify(UTD.UniformDataType.TIFF)).assertEqual(JSON.stringify("general.tiff"));
      expect(JSON.stringify(UTD.UniformDataType.BMP)).assertEqual(JSON.stringify("com.microsoft.bmp"));
      expect(JSON.stringify(UTD.UniformDataType.ICO)).assertEqual(JSON.stringify("com.microsoft.ico"));
      expect(JSON.stringify(UTD.UniformDataType.PHOTOSHOP_IMAGE)).assertEqual(JSON.stringify("com.adobe.photoshop-image"));
      expect(JSON.stringify(UTD.UniformDataType.AI_IMAGE)).assertEqual(JSON.stringify("com.adobe.illustrator.ai-image"));
      expect(JSON.stringify(UTD.UniformDataType.WORD_DOC)).assertEqual(JSON.stringify("com.microsoft.word.doc"));
      expect(JSON.stringify(UTD.UniformDataType.EXCEL)).assertEqual(JSON.stringify("com.microsoft.excel.xls"));
      expect(JSON.stringify(UTD.UniformDataType.PPT)).assertEqual(JSON.stringify("com.microsoft.powerpoint.ppt"));
      expect(JSON.stringify(UTD.UniformDataType.PDF)).assertEqual(JSON.stringify("com.adobe.pdf"));
      expect(JSON.stringify(UTD.UniformDataType.POSTSCRIPT)).assertEqual(JSON.stringify("com.adobe.postscript"));
      expect(JSON.stringify(UTD.UniformDataType.ENCAPSULATED_POSTSCRIPT)).assertEqual(JSON.stringify("com.adobe.encapsulated-postscript"));
      expect(JSON.stringify(UTD.UniformDataType.VIDEO)).assertEqual(JSON.stringify("general.video"));
      expect(JSON.stringify(UTD.UniformDataType.AVI)).assertEqual(JSON.stringify("general.avi"));
      expect(JSON.stringify(UTD.UniformDataType.MPEG)).assertEqual(JSON.stringify("general.mpeg"));
      expect(JSON.stringify(UTD.UniformDataType.MPEG4)).assertEqual(JSON.stringify("general.mpeg-4"));
      expect(JSON.stringify(UTD.UniformDataType.VIDEO_3GPP)).assertEqual(JSON.stringify("general.3gpp"));
      expect(JSON.stringify(UTD.UniformDataType.VIDEO_3GPP2)).assertEqual(JSON.stringify("general.3gpp2"));
      expect(JSON.stringify(UTD.UniformDataType.WINDOWS_MEDIA_WM)).assertEqual(JSON.stringify("com.microsoft.windows-media-wm"));
      expect(JSON.stringify(UTD.UniformDataType.WINDOWS_MEDIA_WMV)).assertEqual(JSON.stringify("com.microsoft.windows-media-wmv"));
      expect(JSON.stringify(UTD.UniformDataType.WINDOWS_MEDIA_WMP)).assertEqual(JSON.stringify("com.microsoft.windows-media-wmp"));
      expect(JSON.stringify(UTD.UniformDataType.AUDIO)).assertEqual(JSON.stringify("general.audio"));
      expect(JSON.stringify(UTD.UniformDataType.AAC)).assertEqual(JSON.stringify("general.aac"));
      expect(JSON.stringify(UTD.UniformDataType.AIFF)).assertEqual(JSON.stringify("general.aiff"));
      expect(JSON.stringify(UTD.UniformDataType.ALAC)).assertEqual(JSON.stringify("general.alac"));
      expect(JSON.stringify(UTD.UniformDataType.FLAC)).assertEqual(JSON.stringify("general.flac"));
      expect(JSON.stringify(UTD.UniformDataType.MP3)).assertEqual(JSON.stringify("general.mp3"));
      expect(JSON.stringify(UTD.UniformDataType.OGG)).assertEqual(JSON.stringify("general.ogg"));
      expect(JSON.stringify(UTD.UniformDataType.PCM)).assertEqual(JSON.stringify("general.pcm"));
      expect(JSON.stringify(UTD.UniformDataType.WINDOWS_MEDIA_WMA)).assertEqual(JSON.stringify("com.microsoft.windows-media-wma"));
      expect(JSON.stringify(UTD.UniformDataType.WAVEFORM_AUDIO)).assertEqual(JSON.stringify("com.microsoft.waveform-audio"));
      expect(JSON.stringify(UTD.UniformDataType.WINDOWS_MEDIA_WMX)).assertEqual(JSON.stringify("com.microsoft.windows-media-wmx"));
      expect(JSON.stringify(UTD.UniformDataType.WINDOWS_MEDIA_WVX)).assertEqual(JSON.stringify("com.microsoft.windows-media-wvx"));
      expect(JSON.stringify(UTD.UniformDataType.WINDOWS_MEDIA_WAX)).assertEqual(JSON.stringify("com.microsoft.windows-media-wax"));
      expect(JSON.stringify(UTD.UniformDataType.FILE)).assertEqual(JSON.stringify("general.file"));
      expect(JSON.stringify(UTD.UniformDataType.DIRECTORY)).assertEqual(JSON.stringify("general.directory"));
      expect(JSON.stringify(UTD.UniformDataType.FOLDER)).assertEqual(JSON.stringify("general.folder"));
      expect(JSON.stringify(UTD.UniformDataType.SYMLINK)).assertEqual(JSON.stringify("general.symlink"));
      expect(JSON.stringify(UTD.UniformDataType.ARCHIVE)).assertEqual(JSON.stringify("general.archive"));
      expect(JSON.stringify(UTD.UniformDataType.BZ2_ARCHIVE)).assertEqual(JSON.stringify("general.bz2-archive"));
      expect(JSON.stringify(UTD.UniformDataType.DISK_IMAGE)).assertEqual(JSON.stringify("general.disk-image"));
      expect(JSON.stringify(UTD.UniformDataType.TAR_ARCHIVE)).assertEqual(JSON.stringify("general.tar-archive"));
      expect(JSON.stringify(UTD.UniformDataType.ZIP_ARCHIVE)).assertEqual(JSON.stringify("general.zip-archive"));
      expect(JSON.stringify(UTD.UniformDataType.JAVA_ARCHIVE)).assertEqual(JSON.stringify("com.sun.java-archive"));
      expect(JSON.stringify(UTD.UniformDataType.GNU_TAR_ARCHIVE)).assertEqual(JSON.stringify("org.gnu.gnu-tar-archive"));
      expect(JSON.stringify(UTD.UniformDataType.GNU_ZIP_ARCHIVE)).assertEqual(JSON.stringify("org.gnu.gnu-zip-archive"));
      expect(JSON.stringify(UTD.UniformDataType.GNU_ZIP_TAR_ARCHIVE)).assertEqual(JSON.stringify("org.gnu.gnu-zip-tar-archive"));
      expect(JSON.stringify(UTD.UniformDataType.CALENDAR)).assertEqual(JSON.stringify("general.calendar"));
      expect(JSON.stringify(UTD.UniformDataType.CONTACT)).assertEqual(JSON.stringify("general.contact"));
      expect(JSON.stringify(UTD.UniformDataType.DATABASE)).assertEqual(JSON.stringify("general.database"));
      expect(JSON.stringify(UTD.UniformDataType.MESSAGE)).assertEqual(JSON.stringify("general.message"));
      expect(JSON.stringify(UTD.UniformDataType.VCARD)).assertEqual(JSON.stringify("general.vcard"));
      expect(JSON.stringify(UTD.UniformDataType.NAVIGATION)).assertEqual(JSON.stringify("general.navigation"));
      expect(JSON.stringify(UTD.UniformDataType.LOCATION)).assertEqual(JSON.stringify("general.location"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_FORM)).assertEqual(JSON.stringify("openharmony.form"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_APP_ITEM)).assertEqual(JSON.stringify("openharmony.app-item"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_PIXEL_MAP)).assertEqual(JSON.stringify("openharmony.pixel-map"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_ATOMIC_SERVICE)).assertEqual(JSON.stringify("openharmony.atomic-service"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_PACKAGE)).assertEqual(JSON.stringify("openharmony.package"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_HAP)).assertEqual(JSON.stringify("openharmony.hap"));
      expect(JSON.stringify(UTD.UniformDataType.CSS)).assertEqual(JSON.stringify("general.css"));
      expect(JSON.stringify(UTD.UniformDataType.TEX)).assertEqual(JSON.stringify("general.tex"));
      expect(JSON.stringify(UTD.UniformDataType.ASC_TEXT)).assertEqual(JSON.stringify("general.asc-text"));
      expect(JSON.stringify(UTD.UniformDataType.RICH_TEXT)).assertEqual(JSON.stringify("general.rich-text"));
      expect(JSON.stringify(UTD.UniformDataType.DELIMITED_VALUES_TEXT)).assertEqual(JSON.stringify("general.delimited-values-text"));
      expect(JSON.stringify(UTD.UniformDataType.COMMA_SEPARATED_VALUES_TEXT)).assertEqual(JSON.stringify("general.comma-separated-values-text"));
      expect(JSON.stringify(UTD.UniformDataType.TAB_SEPARATED_VALUES_TEXT)).assertEqual(JSON.stringify("general.tab-separated-values-text"));
      expect(JSON.stringify(UTD.UniformDataType.GIF)).assertEqual(JSON.stringify("general.gif"));
      expect(JSON.stringify(UTD.UniformDataType.WORD_DOT)).assertEqual(JSON.stringify("com.microsoft.word.dot"));
      expect(JSON.stringify(UTD.UniformDataType.POWERPOINT_PPS)).assertEqual(JSON.stringify("com.microsoft.powerpoint.pps"));
      expect(JSON.stringify(UTD.UniformDataType.POWERPOINT_POT)).assertEqual(JSON.stringify("com.microsoft.powerpoint.pot"));
      expect(JSON.stringify(UTD.UniformDataType.EXCEL_XLT)).assertEqual(JSON.stringify("com.microsoft.excel.xlt"));
      expect(JSON.stringify(UTD.UniformDataType.VISIO_VSD)).assertEqual(JSON.stringify("com.microsoft.visio.vsd"));
      expect(JSON.stringify(UTD.UniformDataType.TS)).assertEqual(JSON.stringify("general.ts"));
      expect(JSON.stringify(UTD.UniformDataType.MPEGURL_VIDEO)).assertEqual(JSON.stringify("general.mpegurl-video"));
      expect(JSON.stringify(UTD.UniformDataType.MATROSKA_VIDEO)).assertEqual(JSON.stringify("org.matroska.mkv"));
      expect(JSON.stringify(UTD.UniformDataType.FLASH)).assertEqual(JSON.stringify("com.adobe.flash"));
      expect(JSON.stringify(UTD.UniformDataType.MPEGURL_AUDIO)).assertEqual(JSON.stringify("general.mpegurl-audio"));
      expect(JSON.stringify(UTD.UniformDataType.MPEG_4_AUDIO)).assertEqual(JSON.stringify("general.mpeg-4-audio"));
      expect(JSON.stringify(UTD.UniformDataType.MP2)).assertEqual(JSON.stringify("general.mp2"));
      expect(JSON.stringify(UTD.UniformDataType.MPEG_AUDIO)).assertEqual(JSON.stringify("general.mpeg-audio"));
      expect(JSON.stringify(UTD.UniformDataType.ULAW_AUDIO)).assertEqual(JSON.stringify("general.ulaw-audio"));
      expect(JSON.stringify(UTD.UniformDataType.MATROSKA_AUDIO)).assertEqual(JSON.stringify("org.matroska.mka"));
      expect(JSON.stringify(UTD.UniformDataType.OPG)).assertEqual(JSON.stringify("general.opg"));
      expect(JSON.stringify(UTD.UniformDataType.TAZ_ARCHIVE)).assertEqual(JSON.stringify("general.taz-archive"));
      expect(JSON.stringify(UTD.UniformDataType.WEB_ARCHIVE)).assertEqual(JSON.stringify("general.web-archive"));
      expect(JSON.stringify(UTD.UniformDataType.ISO)).assertEqual(JSON.stringify("general.iso"));
      expect(JSON.stringify(UTD.UniformDataType.DRAWINGML_VISIO)).assertEqual(JSON.stringify("org.openxmlformats.drawingml.visio"));
      expect(JSON.stringify(UTD.UniformDataType.DRAWINGML_TEMPLATE)).assertEqual(JSON.stringify("org.openxmlformats.drawingml.template"));
      expect(JSON.stringify(UTD.UniformDataType.WORDPROCESSINGML_TEMPLATE)).assertEqual(JSON.stringify("org.openxmlformats.wordprocessingml.template"));
      expect(JSON.stringify(UTD.UniformDataType.PRESENTATIONML_TEMPLATE)).assertEqual(JSON.stringify("org.openxmlformats.presentationml.template"));
      expect(JSON.stringify(UTD.UniformDataType.PRESENTATIONML_SLIDESHOW)).assertEqual(JSON.stringify("org.openxmlformats.presentationml.slideshow"));
      expect(JSON.stringify(UTD.UniformDataType.SPREADSHEETML_TEMPLATE)).assertEqual(JSON.stringify("org.openxmlformats.spreadsheetml.template"));
      expect(JSON.stringify(UTD.UniformDataType.RAR_ARCHIVE)).assertEqual(JSON.stringify("com.rarlab.rar-archive"));
      expect(JSON.stringify(UTD.UniformDataType.SEVEN_ZIP_ARCHIVE)).assertEqual(JSON.stringify("org.7-zip.7-zip-archive"));
      expect(JSON.stringify(UTD.UniformDataType.OFD)).assertEqual(JSON.stringify("general.ofd"));
      expect(JSON.stringify(UTD.UniformDataType.CAD)).assertEqual(JSON.stringify("general.cad"));
      expect(JSON.stringify(UTD.UniformDataType.OCTET_STREAM)).assertEqual(JSON.stringify("general.octet-stream"));
      expect(JSON.stringify(UTD.UniformDataType.CONTENT_FORM)).assertEqual(JSON.stringify("general.content-form"));
      expect(JSON.stringify(UTD.UniformDataType.MARKDOWN)).assertEqual(JSON.stringify("general.markdown"));
      expect(JSON.stringify(UTD.UniformDataType.JFX_FAX)).assertEqual(JSON.stringify("com.j2.jfx-fax"));
      expect(JSON.stringify(UTD.UniformDataType.FAX)).assertEqual(JSON.stringify("general.fax"));
      expect(JSON.stringify(UTD.UniformDataType.EFX_FAX)).assertEqual(JSON.stringify("com.js.efx-fax"));
      expect(JSON.stringify(UTD.UniformDataType.XBITMAP_IMAGE)).assertEqual(JSON.stringify("general.xbitmap-image"));
      expect(JSON.stringify(UTD.UniformDataType.TGA_IMAGE)).assertEqual(JSON.stringify("com.truevision.tga-image"));
      expect(JSON.stringify(UTD.UniformDataType.SGI_IMAGE)).assertEqual(JSON.stringify("com.sgi.sgi-image"));
      expect(JSON.stringify(UTD.UniformDataType.OPENEXR_IMAGE)).assertEqual(JSON.stringify("com.ilm.openexr-image"));
      expect(JSON.stringify(UTD.UniformDataType.FLASHPIX_IMAGE)).assertEqual(JSON.stringify("com.kodak.flashpix.image"));
      expect(JSON.stringify(UTD.UniformDataType.REALMEDIA)).assertEqual(JSON.stringify("com.real.realmedia"));
      expect(JSON.stringify(UTD.UniformDataType.AU_AUDIO)).assertEqual(JSON.stringify("general.au-audio"));
      expect(JSON.stringify(UTD.UniformDataType.AIFC_AUDIO)).assertEqual(JSON.stringify("general.aifc-audio"));
      expect(JSON.stringify(UTD.UniformDataType.SD2_AUDIO)).assertEqual(JSON.stringify("com.digidesign.sd2-audio"));
      expect(JSON.stringify(UTD.UniformDataType.REALAUDIO)).assertEqual(JSON.stringify("com.real.realaudio"));
      expect(JSON.stringify(UTD.UniformDataType.OPENXML)).assertEqual(JSON.stringify("org.openxmlformats.openxml"));
      expect(JSON.stringify(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT)).assertEqual(JSON.stringify("org.openxmlformats.wordprocessingml.document"));
      expect(JSON.stringify(UTD.UniformDataType.OPENDOCUMENT)).assertEqual(JSON.stringify("org.oasis.opendocument"));
      expect(JSON.stringify(UTD.UniformDataType.SPREADSHEETML_SHEET)).assertEqual(JSON.stringify("org.openxmlformats.spreadsheetml.sheet"));
      expect(JSON.stringify(UTD.UniformDataType.PRESENTATIONML_PRESENTATION)).assertEqual(JSON.stringify("org.openxmlformats.presentationml.presentation"));
      expect(JSON.stringify(UTD.UniformDataType.OPENDOCUMENT_TEXT)).assertEqual(JSON.stringify("org.oasis.opendocument.text"));
      expect(JSON.stringify(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET)).assertEqual(JSON.stringify("org.oasis.opendocument.spreadsheet"));
      expect(JSON.stringify(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION)).assertEqual(JSON.stringify("org.oasis.opendocument.presentation"));
      expect(JSON.stringify(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS)).assertEqual(JSON.stringify("org.oasis.opendocument.graphics"));
      expect(JSON.stringify(UTD.UniformDataType.OPENDOCUMENT_FORMULA)).assertEqual(JSON.stringify("org.oasis.opendocument.formula"));
      expect(JSON.stringify(UTD.UniformDataType.STUFFIT_ARCHIVE)).assertEqual(JSON.stringify("com.allume.stuffit-archive"));
      expect(JSON.stringify(UTD.UniformDataType.VCS)).assertEqual(JSON.stringify("general.vcs"));
      expect(JSON.stringify(UTD.UniformDataType.ICS)).assertEqual(JSON.stringify("general.ics"));
      expect(JSON.stringify(UTD.UniformDataType.EXECUTABLE)).assertEqual(JSON.stringify("general.executable"));
      expect(JSON.stringify(UTD.UniformDataType.PORTABLE_EXECUTABLE)).assertEqual(JSON.stringify("com.microsoft.portable-executable"));
      expect(JSON.stringify(UTD.UniformDataType.SUN_JAVA_CLASS)).assertEqual(JSON.stringify("com.sun.java-class"));
      expect(JSON.stringify(UTD.UniformDataType.FONT)).assertEqual(JSON.stringify("general.font"));
      expect(JSON.stringify(UTD.UniformDataType.TRUETYPE_FONT)).assertEqual(JSON.stringify("general.truetype-font"));
      expect(JSON.stringify(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT)).assertEqual(JSON.stringify("general.truetype-collection-font"));
      expect(JSON.stringify(UTD.UniformDataType.OPENTYPE_FONT)).assertEqual(JSON.stringify("general.opentype-font"));
      expect(JSON.stringify(UTD.UniformDataType.POSTSCRIPT_FONT)).assertEqual(JSON.stringify("com.adobe.postscript-font"));
      expect(JSON.stringify(UTD.UniformDataType.POSTSCRIPT_PFB_FONT)).assertEqual(JSON.stringify("com.adobe.postscript-pfb-font"));
      expect(JSON.stringify(UTD.UniformDataType.POSTSCRIPT_PFA_FONT)).assertEqual(JSON.stringify("com.adobe.postscript-pfa-font"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_HDOC)).assertEqual(JSON.stringify("openharmony.hdoc"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_HINOTE)).assertEqual(JSON.stringify("openharmony.hinote"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_STYLED_STRING)).assertEqual(JSON.stringify("openharmony.styled-string"));
      expect(JSON.stringify(UTD.UniformDataType.OPENHARMONY_WANT)).assertEqual(JSON.stringify("openharmony.want"));
      expect(JSON.stringify(UTD.UniformDataType.FILE_URI)).assertEqual(JSON.stringify("general.file-uri"));
      let summary: unifiedDataChannel.Summary = {};
      hilog.info(domain, tag, '%{public}s', summary.summary);
      hilog.info(domain, tag, '%{public}s', summary.totalSize);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6400 end");
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0400';

        const textType = 'general.text';
        const htmlType = 'general.html';
        const plaintextType = 'general.plain-text';

        try {
          hilog.info(domain, tag, `${TAG} >> start`);

          const text = new unifiedDataChannel.Text();
          const unifiedData = new unifiedDataChannel.UnifiedData(text);

          hilog.info(domain, tag, `${TAG}[02] hasType(text)=${unifiedData.hasType(textType)}`);
          expect(unifiedData.hasType(textType)).assertEqual(true);

          const types1 = unifiedData.getTypes();
          hilog.info(domain, tag, `${TAG}[03] getTypes.len=${types1.length}, [0]=${types1[0]}`);
          expect(types1.length).assertEqual(1);
          expect(types1[0]).assertEqual(textType);

          const html = new unifiedDataChannel.HTML();
          unifiedData.addRecord(html);

          hilog.info(domain, tag, `${TAG}[05] hasType(text)=${unifiedData.hasType(textType)}`);
          expect(unifiedData.hasType(textType)).assertEqual(true);

          hilog.info(domain, tag, `${TAG}[06] hasType(html)=${unifiedData.hasType(htmlType)}`);
          expect(unifiedData.hasType(htmlType)).assertEqual(true);

          const plain = new unifiedDataChannel.PlainText();
          unifiedData.addRecord(plain);

          hilog.info(domain, tag, `${TAG}[07] hasType(text)=${unifiedData.hasType(textType)}`);
          expect(unifiedData.hasType(textType)).assertEqual(true);

          hilog.info(domain, tag, `${TAG}[08] hasType(html)=${unifiedData.hasType(htmlType)}`);
          expect(unifiedData.hasType(htmlType)).assertEqual(true);

          hilog.info(domain, tag, `${TAG}[09] hasType(plain)=${unifiedData.hasType(plaintextType)}`);
          expect(unifiedData.hasType(plaintextType)).assertEqual(true);

          const types3 = unifiedData.getTypes();
          hilog.info(domain, tag, `${TAG}[10] getTypes.len=${types3.length}`);
          hilog.info(domain, tag, `${TAG}[11] types[0]=${types3[0]}`);
          hilog.info(domain, tag, `${TAG}[12] types[1]=${types3[1]}`);
          hilog.info(domain, tag, `${TAG}[13] types[2]=${types3[2]}`);
          expect(types3.length).assertEqual(3);
          expect(types3[0]).assertEqual(textType);
          expect(types3[1]).assertEqual(htmlType);
          expect(types3[2]).assertEqual(plaintextType);

          hilog.info(domain, tag, `${TAG} >> All passed!`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${TAG} >> catch: code=${error.code}, msg=${error.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, TAG + ' end ');
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200
     * @tc.desc   Test UDMF creating a unifieddata with a systemdefinedappitem record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1200';
        hilog.info(domain, tag, TAG + ' start ');
        let systemDefinedAppItem: unifiedDataChannel.SystemDefinedAppItem =
          new unifiedDataChannel.SystemDefinedAppItem();
        systemDefinedAppItem.appId = 'appId';
        systemDefinedAppItem.appName = 'appName';
        systemDefinedAppItem.appIconId = 'appIconId';
        systemDefinedAppItem.appLabelId = 'appLabelId';
        systemDefinedAppItem.bundleName = 'bundleName';
        systemDefinedAppItem.abilityName = 'abilityName';

        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedAppItem);
        let records = unifiedData.getRecords();
        let record: unifiedDataChannel.SystemDefinedAppItem = (records[0]) as unifiedDataChannel.SystemDefinedAppItem;
        expect(records.length).assertEqual(1);
        hilog.info(domain, tag, TAG + ' records.length: ' + JSON.stringify(records.length));

        expect(record.appId).assertEqual('appId');
        hilog.info(domain, tag, TAG + ' records.appId: ' + `appId=${record.appId}`);

        expect(record.appName).assertEqual('appName');
        hilog.info(domain, tag, TAG + ' records.appName: ' + `appName=${record.appName}`);

        expect(record.appIconId).assertEqual(systemDefinedAppItem.appIconId);
        hilog.info(domain, tag, TAG + ' records.appIconId: ' + `appIconId=${record.appIconId}`);

        expect(record.appLabelId).assertEqual(systemDefinedAppItem.appLabelId);
        hilog.info(domain, tag, TAG + ' records.appLabelId: ' + `appLabelId=${record.appLabelId}`);

        expect(record.bundleName).assertEqual('bundleName');
        hilog.info(domain, tag, TAG + ' records.bundleName: ' + `bundleName=${record.bundleName}`);

        expect(record.abilityName).assertEqual('abilityName');
        hilog.info(domain, tag, TAG + ' records.abilityName: ' + `abilityName=${record.abilityName}`);

        hilog.info(domain, tag, TAG + ' end ');
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7300
     * @tc.desc   unifiedDataChannel updateData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7300';
        hilog.info(domain, tag, `${TAG} start`);

        const options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        const plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = 'hello world!';
        const unifiedData = new unifiedDataChannel.UnifiedData(plainText);
        try {
          unifiedDataChannel.insertData(options, unifiedData, (err, key) => {
            hilog.info(domain, tag, `${TAG} insertData success, key=${key}`);
            expect(typeof key === 'string').assertTrue();

            unifiedDataChannel.updateData(
              { intention: unifiedDataChannel.Intention.DATA_HUB, key },
              unifiedData,
              (e2, ret) => {
                hilog.info(domain, tag, TAG + ' updateData success');
                expect(ret === undefined).assertTrue();
                done();
              }
            );
          });
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error !== null).assertFail();
          done();
        }
        hilog.info(domain, tag, TAG + ' end ');
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7400
     * @tc.desc   unifiedDataChannel updateData promise interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7400';
        hilog.info(domain, tag, `${TAG} start`);

        const options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        const plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = 'hello world!';
        const unifiedData = new unifiedDataChannel.UnifiedData(plainText);
        try {
          unifiedDataChannel.insertData(options, unifiedData, (err, key) => {
            hilog.info(domain, tag, TAG + `insertData success, key=${key}`);
            unifiedDataChannel.updateData({ intention: options.intention, key }, unifiedData)
              .then(() => {
                hilog.info(domain, tag, TAG + `updateData success`);
                let successStep = 1;
                expect(successStep).assertEqual(1);
                done();
              })
              .catch((updateErr) => {
                const error = updateErr as BusinessError;
                hilog.error(domain, tag, TAG + `updateData fail: ${error}`);
                hilog.info(domain, tag, TAG + ` updateErr.code: ${error.code} , updateErr.message: ${error.message}`);
                expect().assertFail();
                done();
              });
          });
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error !== null).assertFail();
          done();
        }
        hilog.info(domain, tag, TAG + ' end ');
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6800';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {};
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
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          const error = e as BusinessError;
          hilog.info(domain, tag, TAG + ' insertData: ' + data);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          expect(error.code).assertEqual(401);
          done()
          })
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7600
     * @tc.desc   unifiedDataChannel updateData promise interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7600';
        hilog.info(domain, tag, `${TAG} start`);

        const options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.SYSTEM_SHARE,
          visibility:unifiedDataChannel.Visibility.ALL
        };
        const plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = 'hello world!';
        const unifiedData = new unifiedDataChannel.UnifiedData(plainText);

        try {
          const key = await unifiedDataChannel.insertData(options, unifiedData);
          hilog.info(domain, tag, `${TAG} insertData success; key=${key}`);

          const ret = await unifiedDataChannel.updateData({ intention: options.intention, key }, unifiedData);
          hilog.info(domain, tag, `${TAG} updateData success; ret=${ret}`);
          expect(ret !== null).assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${TAG} error.code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        }
        hilog.info(domain, tag, `${TAG} end`);
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0300
     * @tc.desc   setAppShareOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {

        try {
          unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DATA_HUB,
            unifiedDataChannel.ShareOptions.CROSS_APP);
          console.info(TAG, `setAppShareOptions is successed`);
          expect().assertFail();
          done()
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700
     * @tc.desc   removeAppShareOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700';
        hilog.info(domain, tag, TAG + ' start ');
        try {
          unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DATA_HUB);
          expect().assertFail();
          done()
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7800
     * @tc.desc   unifiedDataChannel updateData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7800';
        hilog.info(domain, tag, `${TAG} start`);
        const options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DRAG
        };
        const unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(
          new unifiedDataChannel.UnifiedRecord('general.plain-text', "")
        );
        unifiedDataChannel.insertData(options, unifiedData, (e1, key) => {
          hilog.info(domain, tag, `${TAG} insert success, key=${key}`);
          const updOpt: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DRAG,
            key
          };
          try {
            unifiedDataChannel.updateData(updOpt, unifiedData, (e2, ret) => {
              if (e2) {
                hilog.info(domain, tag, `${TAG} updateData success; data = ${ret},update catch → code=${e2.code}`);
                expect(e2.code).assertEqual(401);
              } else {
                hilog.info(domain, tag, `${TAG} update success`);
                expect().assertFail();
              }
              done();
            });
          } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${TAG} update throw → code=${error.code}`);
            expect(error.code).assertEqual(401);
            done();
          }
        });

        hilog.info(domain, tag, `${TAG} end`);
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500
     * @tc.desc   Verify the properties of the contentForm type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UDMFEntryTest_0500';
        hilog.info(domain, tag, TAG + ' start');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        const fileUriDetails: Record<string, int | long | double | string | Uint8Array> = {
          'width': 320,
          'height': 240,
          'desc': 'value2'
        };
        let fileUri: uniformDataStruct.FileUri = {
          uniformDataType: 'general.file-uri',
          oriUri: 'file://data/image/1.png',
          fileType: 'general.image',
          details: fileUriDetails,
        }
        const formDetails: Record<string, int | long | double | string | Uint8Array> = {
          'formWidth': 320,
          'formHeight': 240,
          'desc': 'this is a form'
        };
        let formData: uniformDataStruct.Form = {
          uniformDataType: 'openharmony.form',
          formId: 1,
          formName: 'form',
          bundleName: 'com.xx.app',
          abilityName: 'ability',
          module: 'module',
          details: formDetails,
        }
        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord();
        record.addEntry(UTD.UniformDataType.FILE_URI, fileUri);
        record.addEntry(UTD.UniformDataType.OPENHARMONY_FORM, formData);
        try {
          record.addEntry("", formData);
          expect().assertFail();
          done()
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done()
        }
        hilog.info(domain, tag, TAG + " end");
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7100';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DRAG,
          key: 'key'
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
          unifiedDataChannel.deleteData(options).then((data) => {
            hilog.info(domain, tag, TAG + data);
            expect().assertFail();
            done()
          }).catch((err: Error) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, TAG + err.code + err.message);
            expect(error.code).assertEqual(401);
            done()
          });
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7200';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DRAG,
          key: 'key'
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
        try {
          unifiedDataChannel.deleteData(options, (data, ret) => {
            hilog.info(domain, tag, TAG + ' error: ' + data);
            const error = data as BusinessError;
            expect(error.code).assertEqual(401);
            done();
          })
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6900';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DRAG,
          key: 'key'
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
        try {
          unifiedDataChannel.queryData(options).then((data) => {
            hilog.info(domain, tag, TAG + data);
            expect().assertFail();
          }).catch((err: Error) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, TAG + error.code + error.message);
            expect(error.code).assertEqual(401);
            done()
          });
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_7000';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DRAG,
          key: 'key'
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
        try {
          unifiedDataChannel.queryData(options, (data, ret) => {
            hilog.info(domain, tag, TAG + data);
            const error = data as BusinessError;
            expect(error.code).assertEqual(401);
            done();
          })
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6700';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: undefined,
          visibility:undefined
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
        try {
          unifiedDataChannel.insertData(options, unifiedData).then((data) => {
            hilog.info(domain, tag, TAG + data);
            expect().assertFail();
            done();
          }).catch((err: Error) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, TAG + error.code + error.message);
            expect(error.code).assertEqual(401);
            done();
          });
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6410
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6410
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6410',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6410';
        hilog.info(domain, tag, `${TAG} start`);
        let plainTextDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        const plainText: uniformDataStruct.PlainText = {
          uniformDataType: 'general.plain-text',
          textContent: 'This is plainText textContent example',
          textAbstract: 'this is abstract',
          details: plainTextDetails,
        };
        const unifiedData = new unifiedDataChannel.UnifiedData();
        unifiedData.addRecord(new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText));

        try {
          const key = await unifiedDataChannel.insertData(
            { intention: unifiedDataChannel.Intention.DATA_HUB, visibility:unifiedDataChannel.Visibility.ALL }, unifiedData);
          hilog.info(domain, tag, `${TAG} insertData success, key=${key}`);

          const ret = await unifiedDataChannel.queryData(
            { intention: unifiedDataChannel.Intention.DATA_HUB, key: key });
          hilog.info(domain, tag, `${TAG} queryData 返回数组长度=${ret.length}`);

          let size = ret.length;
          hilog.info(domain, tag, `${TAG} data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              if (records[j].getType() == (UTD.UniformDataType.PLAIN_TEXT).toString()) {
                let text: unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                hilog.info(domain, tag, `${TAG} queryData.result = ${i + 1}.${text.textContent}`);
              }
            }
          }
          expect(size).assertEqual(1);
          hilog.info(domain, tag, `${TAG} size = ${size}`);

          const rets = await unifiedDataChannel.deleteData(
            { intention: unifiedDataChannel.Intention.DATA_HUB, key: key });
          hilog.info(domain, tag, `${TAG} deleteData 返回数组长度=${rets.length}`);
          hilog.info(domain, tag, `${TAG} deleteData 成功`);
        } catch (err) {
          hilog.error(domain, tag, `${TAG} catch 异常: ${JSON.stringify(err)}`);
          expect().assertFail();
        }

        hilog.info(domain, tag, `${TAG} end`);
        done();
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6420
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6420
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_6420';
        hilog.info(domain, tag, `${TAG} start`);

        try {
          const plainText: unifiedDataChannel.PlainText = {
            textContent: 'This is plainText textContent example',
            textAbstract: 'this is abstract',
          };

          const unifiedData = new unifiedDataChannel.UnifiedData();
          unifiedData.addRecord(new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText));

          const key = await unifiedDataChannel.insertData(
            { intention: unifiedDataChannel.Intention.DATA_HUB, visibility:unifiedDataChannel.Visibility.OWN_PROCESS }, unifiedData);
          hilog.info(domain, tag, `${TAG} insertData success, key=${key}`);

          const ret = await unifiedDataChannel.queryData(
            { intention: unifiedDataChannel.Intention.DATA_HUB, key: key });
          hilog.info(domain, tag, `${TAG} queryData 返回数组长度=${ret.length}`);
          expect(typeof key === 'string' && key.length > 0).assertTrue();

          if (ret && ret.length > 0) {
            try {
              const deleteRet = await unifiedDataChannel.deleteData(
                { intention: unifiedDataChannel.Intention.DATA_HUB, key: key });
              hilog.info(domain, tag, `${TAG} deleteData 返回数组长度=${deleteRet.length}`);
              hilog.info(domain, tag, `${TAG} deleteData 成功`);
            } catch (deleteErr) {
              const deleteError = deleteErr as BusinessError;
              hilog.warn(domain, tag, `${TAG} deleteData 异常(可接受): ${JSON.stringify(deleteError)}`);
            }
            const afterDel = await unifiedDataChannel.queryData(
              { intention: unifiedDataChannel.Intention.DATA_HUB, key });
            hilog.info(domain, tag, `${TAG} 删除后再查，返回数组长度=${afterDel.length}`);
            expect(afterDel.length === 0).assertTrue();
          } else {
            hilog.info(domain, tag, `${TAG} 无数据需要清理`);
          }
        } catch (err) {
          const errorObj = err as BusinessError;
          hilog.error(domain, tag, `${TAG} catch 异常: ${JSON.stringify(errorObj)}`);
        }

        hilog.info(domain, tag, `${TAG} end`);
        done();
      });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1600
     * @tc.desc   unifiedDataChannel deleteData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_1600';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB
        };
        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = "hello world!";
        let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
        try {
          hilog.info(domain, tag, TAG + ' flag:: ' + JSON.stringify(unifiedData));
          unifiedDataChannel.insertData(options, unifiedData, (err, data) => {
            hilog.info(domain, tag, TAG + ` insertData0100 success; data = ${data}, options = ${options}`);
            options.key = data;
            hilog.info(domain, tag, TAG + ` options = ${JSON.stringify(options)}`);
            unifiedDataChannel.queryData(options, (error, ret) => {
              hilog.info(domain, tag, TAG + ` options = ${JSON.stringify(options)}`);
              hilog.info(domain, tag, TAG + ` queryData size`);
              unifiedDataChannel.deleteData(options, (e, row) => {
                hilog.info(domain, tag, TAG + ` options = ${JSON.stringify(options)}`);
                hilog.info(domain, tag, TAG + ` deleteData` + JSON.stringify(e));
                if (e) {
                  let size = row!.length;
                  hilog.info(domain, tag, TAG + ` deleteData size = ${size}`);
                  for (let i = 0; i < size; i++) {
                    let records = row![i].getRecords();
                    let size = records.length;
                    for (let j = 0; j < size; j++) {
                      if (records[j].getType() == (UTD.UniformDataType.PLAIN_TEXT).toString()) {
                        let text: unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                        hilog.info(domain, tag, TAG + ` deleteData.result = ${i + 1}.${text.textContent}`);
                      }
                    }
                  }
                  expect(size).assertEqual(1);
                  done();
                } else {
                  expect().assertFail();
                  done();
                }
              });
            });
          });
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error !== null).assertFail();
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9000';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          visibility:unifiedDataChannel.Visibility.ALL
        };
        let plainTextDetails: Record<string, string> = {
          'attr1': 'value1',
          'attr2': 'value2',
        }
        let plainText: uniformDataStruct.PlainText = {
          uniformDataType: 'general.plain-text',
          textContent: 'This is plainText textContent example',
          textAbstract: 'this is textAbstract',
          details: plainTextDetails,
        }
        let unifiedData = new unifiedDataChannel.UnifiedData();
        let record = new unifiedDataChannel.UnifiedRecord('general.plain-text', plainText);
        unifiedData.addRecord(record);
        try {
          const data = await unifiedDataChannel.insertData(options, unifiedData)
          hilog.info(domain, tag, TAG + ` data = ` + data);
          let options1: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          };
          const ret = await unifiedDataChannel.queryData(options1)
          let size = ret.length;
          hilog.info(domain, tag, `${TAG} data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              if (records[j].getType() == (UTD.UniformDataType.PLAIN_TEXT).toString()) {
                const text = records[j].getValue() as uniformDataStruct.PlainText;
                expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(text.textContent).assertEqual(plainText.textContent);
                expect(text.textAbstract).assertEqual(plainText.textAbstract);
                expect(text.details != null).assertTrue();
                hilog.info(domain, tag, TAG + ` text.details raw = ` + JSON.stringify(text.details));
                hilog.info(domain, tag, TAG + ` plainText.details raw = ` + JSON.stringify(plainText.details));
                hilog.info(domain, tag, `${TAG} queryData.result = ${i + 1}.${text.textContent}`);
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
          done()
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect().assertFail();
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })
    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_9200';
        hilog.info(domain, tag, TAG + ' start ');
        let options: unifiedDataChannel.Options = {
          intention: unifiedDataChannel.Intention.DATA_HUB,
          visibility:unifiedDataChannel.Visibility.OWN_PROCESS
        };
        let plainTextDetails: Record<string, string> = {
          'attr1': 'value1',
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
        try {
          const data = await unifiedDataChannel.insertData(options, unifiedData)
          hilog.info(domain, tag, TAG + ` data = ` + data);
          let options1: unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          };
          const ret = await unifiedDataChannel.queryData(options1)
          let size = ret.length;
          hilog.info(domain, tag, `${TAG} data.size = ${size}`);
          for (let i = 0; i < size; i++) {
            let records = ret[i].getRecords();
            let size = records.length;
            for (let j = 0; j < size; j++) {
              if (records[j].getType() == (UTD.UniformDataType.PLAIN_TEXT).toString()) {
                const text = records[j].getValue() as uniformDataStruct.PlainText;
                expect(text.uniformDataType).assertEqual(plainText.uniformDataType);
                expect(text.textContent).assertEqual(plainText.textContent);
                expect(text.textAbstract).assertEqual(plainText.textAbstract);
                expect(text.details != null).assertTrue();
                hilog.info(domain, tag, TAG + ` text.details raw = ` + JSON.stringify(text.details));
                hilog.info(domain, tag, TAG + ` plainText.details raw = ` + JSON.stringify(plainText.details));
                expect(JSON.stringify(text.details)).assertEqual(JSON.stringify(plainText.details));
                hilog.info(domain, tag, `${TAG} queryData.result = ${i + 1}.${text.textContent}`);
              }
            }
          }
          await unifiedDataChannel.deleteData(options1);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8800';
      hilog.info(domain, tag, TAG + ' start ');
      const progressInfo: unifiedDataChannel.ProgressInfo = {
        progress: 10,
        status: unifiedDataChannel.ListenerStatus.INVALID_PARAMETERS
      }
      let progressListener = (progressInfo: unifiedDataChannel.ProgressInfo, data: unifiedDataChannel.UnifiedData | null) => {
        resProgressInfo = progressInfo;
      };

      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        recordCount: 0
      }
      try {
        hilog.info(domain, tag, TAG + ' GetDataParamsc start ');
        const getDataParams: unifiedDataChannel.GetDataParams = {
          progressIndicator: unifiedDataChannel.ProgressIndicator.NONE,
          dataProgressListener: progressListener,
          destUri: "/data/files",
          fileConflictOptions: unifiedDataChannel.FileConflictOptions.SKIP,
          acceptableInfo:dataLoadInfo
        }
        let obj = getDataParams;
        progressListener(progressInfo, null);
        expect(obj.progressIndicator).assertEqual(getDataParams.progressIndicator);

        expect(obj.destUri).assertEqual(getDataParams.destUri);

        expect(obj.fileConflictOptions).assertEqual(getDataParams.fileConflictOptions);
        expect(obj.acceptableInfo).assertEqual(getDataParams.acceptableInfo);

        expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
        expect(resProgressInfo!.status).assertEqual(progressInfo.status);
        hilog.info(domain, tag, TAG + ' end ');
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect(error.code).assertEqual(201);
        done()
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300
     * @tc.desc   setAppShareOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0300';
        hilog.info(domain, tag, TAG + ' start ');
        try {
          unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
          console.info(TAG, `removeAppShareOptions is successed`);
          expect().assertFail();
          done()
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done()
        }
        hilog.info(domain, tag, TAG + ' end ');
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100
     * @tc.desc   setAppShareOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'SUB_DistributedData_UDMF_SDK_DragWithOutPermission_0100';
        hilog.info(domain, tag, TAG + ' start ');
        try {
          unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
          unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG,
            unifiedDataChannel.ShareOptions.IN_APP);
          console.info(TAG, `removeAppShareOptions is successed`);
          expect().assertFail();
          done()
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
          hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done()
        }
      })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0300
     * @tc.desc   unifiedDataChannel properties test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      TAG = 'SUB_DistributedData_UDMF_SDK_UDMFSupportClipboardApiTest_0300';
      hilog.info(domain, tag, TAG + ' start ');
      let bb5: Record<String, RecordData> = {
        "bb1": "111",
      }
      try {
        let property: unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
        property.extras = bb5;
        hilog.info(domain, tag, TAG + " property.extras:" + property.extras);
        expect(property.extras != null).assertTrue();
        property.tag = "property tag value";
        hilog.info(domain, tag, TAG + " property.tag:" + property.tag);
        expect(property.tag).assertEqual('property tag value');
        property.shareOptions = unifiedDataChannel.ShareOptions.CROSS_APP;
        hilog.info(domain, tag, TAG + " property.shareOptions:" + property.shareOptions);
        expect(property.shareOptions).assertEqual(1);
        property.getDelayData = func;
        property.getDelayData!('inputTest');
        let data: unifiedDataChannel.UnifiedData = new unifiedDataChannel.UnifiedData();
        data.properties = property;
        hilog.info(domain, tag, TAG + " data.properties.timestamp:" + data.properties.timestamp);
        expect(data.properties.timestamp != null).assertTrue();
        done()
      } catch (err) {
        const error = err as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        hilog.info(domain, tag, TAG + ' error: ' + JSON.stringify(error));
        expect().assertFail();
        done()
      }
      hilog.info(domain, tag, TAG + ' end ');
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8100
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8100 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8300 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
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
      expect(resProgressInfo!.progress).assertEqual(progressInfo.progress);
      expect(resProgressInfo!.status).assertEqual(progressInfo.status);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8400 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600 start');
      let plainText = new unifiedDataChannel.PlainText();
      let plainTextDetails: Record<string, string> = {
        'title': '标题',
        'content': '内容'
      };
      plainText.details = plainTextDetails;
      plainText.textContent = "textContent";
      plainText.textAbstract = "textAbstract";
      const stringSet = new Set<string>();
      stringSet.add("general.plain-text");
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        types: stringSet,
        recordCount: 0
      }
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      let dataLoadHandler = (dataLoadInfo?: unifiedDataChannel.DataLoadInfo): unifiedDataChannel.UnifiedData | null => {
        return unifiedData;
      };
      const dataLoadParams :unifiedDataChannel.DataLoadParams = {
        loadHandler: dataLoadHandler,
        dataLoadInfo:dataLoadInfo
      }
      let obj = dataLoadParams;
      let reunifiedData = dataLoadHandler(dataLoadInfo);
      if (!reunifiedData) {
        return;
      }
      let records = reunifiedData.getRecords();
      let record:unifiedDataChannel.PlainText = (records[0]) as unifiedDataChannel.PlainText;
      expect(records.length).assertEqual(1);
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      if (detailsGet != undefined){
        expect(detailsGet['title']).assertEqual('标题');
        expect(detailsGet['content']).assertEqual('内容');
      }
      expect(record.textContent).assertEqual('textContent');
      expect(record.textAbstract).assertEqual('textAbstract');
      expect(obj.loadHandler).assertEqual(dataLoadParams.loadHandler);
      expect(obj.dataLoadInfo).assertEqual(dataLoadParams.dataLoadInfo);
      console.info("SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8600 end");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900
     * @tc.desc   Test UDMF creating a unifieddata with a text record.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_8900 start');
      const stringSet = new Set<string>();
      stringSet.add("hello");
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        types: stringSet,
        recordCount: 0
      }
      let dataLoadHandler = () => {
        return null;
      };

      const dataLoadParams: unifiedDataChannel.DataLoadParams = {
        loadHandler: dataLoadHandler,
        dataLoadInfo: dataLoadInfo
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
     * @tc.name   DelayedDataLoadHandlerTest01
     * @tc.number SUB_DistributedData_UDMF_SDK_DelayedDataLoadHandler_0100
     * @tc.desc   Test DelayedDataLoadHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DelayedDataLoadHandlerTest01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TAG = 'DelayedDataLoadHandlerTest01';
      hilog.info(domain, tag, `${TAG} start`);

      let plainText = new unifiedDataChannel.PlainText();
      let plainTextDetails: Record<string, string> = {
        'title': '标题',
        'content': '内容'
      };
      plainText.details = plainTextDetails;
      plainText.textContent = "textContent";
      plainText.textAbstract = "textAbstract";
      const stringSet = new Set<string>();
      stringSet.add('general.plain-text');
      let dataLoadInfo: unifiedDataChannel.DataLoadInfo = {
        types: stringSet,
        recordCount: 0
      };
      const unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      const loadHandler: unifiedDataChannel.DataLoadHandler = (info?: unifiedDataChannel.DataLoadInfo) => unifiedData;
      const loadHandlerAsync: unifiedDataChannel.DelayedDataLoadHandler =
        (info?: unifiedDataChannel.DataLoadInfo): Promise<unifiedDataChannel.UnifiedData | null> =>
          Promise.resolve(unifiedData);
      const dataLoadParams: unifiedDataChannel.DataLoadParams = {
        loadHandler,
        dataLoadInfo,
        delayedDataLoadHandler: loadHandlerAsync
      };
      const data = await dataLoadParams.delayedDataLoadHandler!(dataLoadInfo);
      if (!data) {
        return;
      }
      const records = data.getRecords();
      expect(records.length).assertEqual(1);
      const record = records[0] as unifiedDataChannel.PlainText;
      let detailsGet: Record<string, string> = record.details as Record<string, string>;
      expect(detailsGet['title']).assertEqual('标题');
      expect(detailsGet['content']).assertEqual('内容');
      expect(record.textContent).assertEqual('textContent');
      expect(record.textAbstract).assertEqual('textAbstract');
      hilog.info(domain, tag, `${TAG} end`);
      done();
    });

    /**
     * @tc.name   SummaryOverviewTest01
     * @tc.number SUB_DistributedData_UDMF_SDK_SummaryOverview_0100
     * @tc.desc   Test SummaryOverview
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SummaryOverviewTest01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TAG = 'SummaryOverviewTest01';
      hilog.info(domain, tag, TAG + ' start ');
      let summary: unifiedDataChannel.Summary = new unifiedDataChannel.Summary;
      let test: Record<String, Long> = {
        "bb1": 123,
      }
      summary.summary = test;
      hilog.info(domain, tag, TAG + summary.summary);
      hilog.info(domain, tag, TAG + summary.overview);
      expect(summary.summary != null).assertTrue();
      expect(JSON.stringify(summary.summary)).assertEqual(JSON.stringify(test));
      expect(JSON.stringify(summary.overview)).assertEqual(JSON.stringify(test));
      hilog.info(domain, tag, TAG + ' end ');
      done();
    })

    hilog.info(domain, tag, '%{public}s', 'UDMFApiTest end');
  });
}

