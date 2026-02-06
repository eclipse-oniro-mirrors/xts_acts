/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll,beforeEach,afterEach,afterAll,it,expect, Level } from '@ohos/hypium';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';


export default function CloudFileTest(){
describe('cloud_file_test', () => {
   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0100
   * @tc.name Test_CloudFile_State_001
   * @tc.desc function of API, CloudFileCache.on
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_001', Level.LEVEL3, async (done: Function) => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info("batchDownload state：" + pg.state);
      };
      fileCache.on('batchDownload', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('Test_CloudFile_State_001 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0200
   * @tc.name Test_CloudFile_State_002
   * @tc.desc function of API, CloudFileCache.off
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_002', Level.LEVEL3, async (done: Function) => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info("batchDownload state：" + pg.state);
      };
      fileCache.on('batchDownload', callback);
      fileCache.off('batchDownload', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('Test_CloudFile_State_002 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0300
   * @tc.name Test_CloudFile_State_003
   * @tc.desc function of API, CloudFileCache.startBatch, Promise
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_003', Level.LEVEL3, async (done: Function) => {
    let path1 = "/data/storage/el2/cloud/1.txt";
    let path2 = "/data/storage/el2/cloud/2.txt";
    let uris = [fileUri.getUriFromPath(path1), fileUri.getUriFromPath(path2)];
    let fileType = cloudSync.DownloadFileType.CONTENT;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info("batchDownload state：" + pg.state);
      };
      fileCache.on('batchDownload', callback);
      fileCache.startBatch(uris, fileType).then(() => {
        console.info("startBatch Download successfully");
      }).catch((err: BusinessError) => {
        console.error("Test_CloudFile_State_003 startBatch download failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 22400005).assertTrue();
        done();
      });
     } catch (err) {
       console.log('Test_CloudFile_State_003 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0400
   * @tc.name Test_CloudFile_State_004
   * @tc.desc function of API, CloudFileCache.stopBatch, Promise
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_004', Level.LEVEL3, async (done: Function) => {
    let downloadId = 1;
    let needClean = true;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info("batchDownload state：" + pg.state);
      };
      fileCache.on('batchDownload', callback);
      fileCache.stopBatch(downloadId, needClean).then(() => {
        console.info("stopBatch Download successfully");
      }).catch((err: BusinessError) => {
        console.error("Test_CloudFile_State_004 stopBatch download failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 201 && err.message =='Permission verification failed').assertTrue();
        done();
      });
     } catch (err) {
       console.log('Test_CloudFile_State_004 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0500
   * @tc.name Test_CloudFile_State_005
   * @tc.desc function of API, MultiDownloadProgress
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_005', Level.LEVEL3, async (done: Function) => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (MultiDownloadProgress: cloudSync.MultiDownloadProgress) => {
        console.info("batchDownload state：" + MultiDownloadProgress.state);
        expect(MultiDownloadProgress.taskId == 0).assertTrue();
        expect(MultiDownloadProgress.successfulCount == 0).assertTrue();
        expect(MultiDownloadProgress.failedCount == 0).assertTrue();
        expect(MultiDownloadProgress.totalCount == 0).assertTrue();
        expect(MultiDownloadProgress.downloadedSize == 0).assertTrue();
        expect(MultiDownloadProgress.totalSize == 0).assertTrue();
        expect(MultiDownloadProgress.errType == cloudSync.DownloadErrorType.NO_ERROR).assertTrue();
        let FailedFileInfo = MultiDownloadProgress.getFailedFiles();
        let SuccessFileInfo = MultiDownloadProgress.getSuccessfulFiles();
        console.info("Test_CloudFile_State_005 FailedFileInfo " + FailedFileInfo);
        console.info("Test_CloudFile_State_005 SuccessFileInfo " + SuccessFileInfo);
      };
      fileCache.on('batchDownload', callback);
      fileCache.off('batchDownload', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('Test_CloudFile_State_005 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0600
   * @tc.name Test_CloudFile_State_006
   * @tc.desc function of API, FailedFileInfo
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_006', Level.LEVEL3, async (done: Function) => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (MultiDownloadProgress: cloudSync.MultiDownloadProgress) => {
        console.info("batchDownload state：" + MultiDownloadProgress.state);
        let failedList: Array<cloudSync.FailedFileInfo> = MultiDownloadProgress.getFailedFiles();
        for (let FailedFileInfo of failedList) {
          expect(FailedFileInfo.uri == '').assertTrue();
          expect(FailedFileInfo.error == cloudSync.DownloadErrorType.NO_ERROR).assertTrue();
        }
      };
      fileCache.on('batchDownload', callback);
      fileCache.off('batchDownload', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('Test_CloudFile_State_006 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0700
   * @tc.name Test_CloudFile_State_007
   * @tc.desc function of API, DownloadFileType
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_007', Level.LEVEL3, async (done: Function) => {
    let path1 = "/data/storage/el2/cloud/1.txt";
    let path2 = "/data/storage/el2/cloud/2.txt";
    let uris = [fileUri.getUriFromPath(path1), fileUri.getUriFromPath(path2)];
    let fileType = cloudSync.DownloadFileType.CONTENT;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress) => {
        console.info("batchDownload state：" + pg.state);
      };
      fileCache.on('batchDownload', callback);
      fileCache.startBatch(uris, fileType).then(() => {
        console.info("startBatch Download successfully");
        expect(cloudSync.DownloadFileType.CONTENT == 0).assertTrue();
        expect(cloudSync.DownloadFileType.THUMBNAIL == 1).assertTrue();
        expect(cloudSync.DownloadFileType.LCD == 2).assertTrue();
      }).catch((err: BusinessError) => {
        console.error("Test_CloudFile_State_007 startBatch download failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 22400005).assertTrue();
        done();
      });
     } catch (err) {
       console.log('Test_CloudFile_State_007 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0800
   * @tc.name Test_CloudFile_State_008
   * @tc.desc function of API, cleanFileCache
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_008', Level.LEVEL3, async (done: Function) => {
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     try {
      let fileCache = new cloudSync.CloudFileCache();
      fileCache.cleanFileCache(uri);
      expect(true).assertTrue();
     } catch (err) {
       console.log('Test_CloudFile_State_008 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code == 401 && err.message == 'The input parameter is invalid').assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0900
   * @tc.name Test_CloudFile_State_009
   * @tc.desc function of API, getCoreFileSyncState
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('Test_CloudFile_State_009', Level.LEVEL3, async (done: Function) => {
    let path = "/data/storage/el2/cloud/Test_CloudFile_State_009.txt";
    let uri = fileUri.getUriFromPath(path);
    console.info("Test_CloudFile_State_009 uri: " + uri);
    try {
      cloudSync.getCoreFileSyncState(uri);
      expect(cloudSync.FileState.INITIAL_AFTER_DOWNLOAD  == 0).assertTrue();
      expect(cloudSync.FileState.UPLOADING == 1).assertTrue();
      expect(cloudSync.FileState.STOPPED  == 2).assertTrue();
      expect(cloudSync.FileState.TO_BE_UPLOADED  == 3).assertTrue();
      expect(cloudSync.FileState.UPLOAD_SUCCESS  == 4).assertTrue();
      expect(cloudSync.FileState.UPLOAD_FAILURE  == 5).assertTrue();
    } catch (e) {
      console.log('Test_CloudFile_State_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 14000002 && e.message == 'Invalid uri').assertTrue();
    }
    done();
  });

  });
}