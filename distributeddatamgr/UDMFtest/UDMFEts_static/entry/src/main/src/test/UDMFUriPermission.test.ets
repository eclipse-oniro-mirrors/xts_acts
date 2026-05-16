'use static'
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
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';

let tag: string = 'testTag: '

export default function UriPermissionTest():void {
  describe("UriPermissionTest", (): void => {
    /**
    * @tc.name   UDMF_UriPermission_NONE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_NONE_Test_0100
    * @tc.desc   Test UriPermission NONE enum value equals 0.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_NONE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_NONE_Test_0100 start');
      try {
        let nonePermission = unifiedDataChannel.UriPermission.NONE;
        expect(nonePermission).assertEqual(0);
      } catch (e) {
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_NONE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_READ_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_READ_Test_0100
    * @tc.desc   Test UriPermission READ enum value equals 1.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_READ_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_READ_Test_0100 start');
      try {
        let readPermission = unifiedDataChannel.UriPermission.READ;
        expect(readPermission).assertEqual(1);
      } catch (e) {
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_READ_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_WRITE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_WRITE_Test_0100
    * @tc.desc   Test UriPermission WRITE enum value equals 2.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_WRITE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_WRITE_Test_0100 start');
      try {
        let writePermission = unifiedDataChannel.UriPermission.WRITE;
        expect(writePermission).assertEqual(2);
      } catch (e) {       
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_WRITE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PERSIST_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PERSIST_Test_0100
    * @tc.desc   Test UriPermission PERSIST enum value equals 3.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('UDMF_UriPermission_PERSIST_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.log(tag + 'UDMF_UriPermission_PERSIST_Test_0100 start');
      try {
        let persistPermission = unifiedDataChannel.UriPermission.PERSIST;
        expect(persistPermission).assertEqual(3);
      } catch (e) {       
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PERSIST_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_NONE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_NONE_Test_0100
    * @tc.desc   Test setting NONE permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_NONE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_NONE_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.NONE];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies![0]).assertEqual(0);
        }
      } catch (e) {     
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_NONE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_READ_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_READ_Test_0100
    * @tc.desc   Test setting READ permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_READ_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_READ_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.READ];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies![0]).assertEqual(1);
        }
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_READ_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_WRITE_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_WRITE_Test_0100
    * @tc.desc   Test setting WRITE permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_WRITE_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_WRITE_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.WRITE];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies![0]).assertEqual(2);
        }
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_WRITE_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_PERSIST_Test_0100
    * @tc.desc   Test setting PERSIST permission to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.PERSIST];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies![0]).assertEqual(3);
        }
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_PERSIST_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriPermission_PROPERTIES_EmptyArray_Test_0100
    * @tc.desc   Test setting empty array to uriAuthorizationPolicies property.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100 start');
      let text = new unifiedDataChannel.Text();
      let unifiedData = new unifiedDataChannel.UnifiedData(text);
      try {
        unifiedData.properties.uriAuthorizationPolicies = [];
        if (unifiedData.properties.uriAuthorizationPolicies !== undefined) {
          expect(unifiedData.properties.uriAuthorizationPolicies!.length).assertEqual(0);
        }
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_UriPermission_PROPERTIES_EmptyArray_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Html_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_Html_UriAuthorizationPolicies_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on HTML record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Html_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Test_0100 start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.htmlContent = '<div><p>Test</p></div>';
        html.plainContent = 'Test content';
        html.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.READ];
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
        expect(html.plainContent).assertEqual('Test content');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_Html_UriAuthorizationPolicies_Undefined_Test_0100
    * @tc.desc   Test setting undefined to uriAuthorizationPolicies on HTML record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100 start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.htmlContent = '<div><p>Test</p></div>';
        html.uriAuthorizationPolicies = undefined;
        expect(html.htmlContent).assertEqual('<div><p>Test</p></div>');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Html_UriAuthorizationPolicies_Undefined_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_File_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_File_UriAuthorizationPolicies_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on File record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_File_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Test_0100 start');
      try {
        let file = new unifiedDataChannel.File();
        file.details = {
          'name': 'test',
          'type': 'txt'
        };
        file.uri = 'file://test.txt';
        file.uriAuthorizationPolicies = [
          unifiedDataChannel.UriPermission.READ,
          unifiedDataChannel.UriPermission.WRITE
        ];
        expect(file.uri).assertEqual('file://test.txt');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_File_UriAuthorizationPolicies_Empty_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_File_UriAuthorizationPolicies_Empty_Test_0100
    * @tc.desc   Test setting empty array to uriAuthorizationPolicies on File record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_File_UriAuthorizationPolicies_Empty_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Empty_Test_0100 start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = 'file://test.txt';
        file.uriAuthorizationPolicies = [];
        expect(file.uri).assertEqual('file://test.txt');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_File_UriAuthorizationPolicies_Empty_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Image_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Image_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Image record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Image_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Image_UriAuthorizationPolicies_Test_0100 start');
      try {
        let image = new unifiedDataChannel.Image();
        image.imageUri = 'file://test.jpg';
        image.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.READ];
        expect(image.imageUri).assertEqual('file://test.jpg');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Image_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Video_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Video_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Video record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Video_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Video_UriAuthorizationPolicies_Test_0100 start');
      try {
        let video = new unifiedDataChannel.Video();
        video.videoUri = 'file://test.mp4';
        video.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.PERSIST];
        expect(video.videoUri).assertEqual('file://test.mp4');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Video_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Audio_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Audio_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Audio record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Audio_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Audio_UriAuthorizationPolicies_Test_0100 start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.audioUri = 'file://test.mp3';
        audio.uriAuthorizationPolicies = [unifiedDataChannel.UriPermission.NONE];
        expect(audio.audioUri).assertEqual('file://test.mp3');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Audio_UriAuthorizationPolicies_Test_0100 end');
    })

    /**
    * @tc.name   UDMF_Folder_UriAuthorizationPolicies_Test_0100
    * @tc.number SUB_DistributedData_UDMF_SDK_UriAuthorizationPolicies_Folder_Test_0100
    * @tc.desc   Test setting uriAuthorizationPolicies on Folder record.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('UDMF_Folder_UriAuthorizationPolicies_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(tag + 'UDMF_Folder_UriAuthorizationPolicies_Test_0100 start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.folderUri = 'file://testFolder';
        folder.uriAuthorizationPolicies = [
          unifiedDataChannel.UriPermission.READ,
          unifiedDataChannel.UriPermission.WRITE
        ];
        expect(folder.folderUri).assertEqual('file://testFolder');
      } catch (e) {        
        console.log(tag, `Failed. code: ${e.code}, message: ${e.message}`)
        expect().assertFail();
      }
      console.log(tag + 'UDMF_Folder_UriAuthorizationPolicies_Test_0100 end');
    })
  });
}