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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let res: int = 0;

export default function CloudFileTest(): void {
  describe("cloud_file_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'cloud_file_test start');
   /**
    * @tc.name   Test_CloudFile_State_static_001
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0100
    * @tc.desc   function of API, CloudFileCache.on
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress): void => {
        hilog.info(domain, tag, '%{public}s', "batchDownload state：" + pg.state);
      };
      fileCache.onBatchDownload(callback);
      expect(res == 0).assertTrue();
      done();
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_001 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_002
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0200
    * @tc.desc   function of API, CloudFileCache.off
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress): void => {
        hilog.info(domain, tag, '%{public}s', "batchDownload state：" + pg.state);
      };
      fileCache.onBatchDownload(callback);
      fileCache.offBatchDownload(callback);
      expect(res == 0).assertTrue();
      done();
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_002 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_003
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0300
    * @tc.desc   function of API, CloudFileCache.startBatch, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
    let path1: string = "/data/storage/el2/cloud/1.txt";
    let path2: string = "/data/storage/el2/cloud/2.txt";
    let uris: string[] = [fileUri.getUriFromPath(path1), fileUri.getUriFromPath(path2)];
    let fileType: cloudSync.DownloadFileType = cloudSync.DownloadFileType.CONTENT;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress): void => {
        hilog.info(domain, tag, '%{public}s', "batchDownload state：" + pg.state);
      };
      fileCache.onBatchDownload(callback);
      fileCache.startBatch(uris, fileType).then((): void => {
        hilog.info(domain, tag, '%{public}s', "startBatch Download successfully");
      }).catch((err: Error) => {
        hilog.info(domain, tag, '%{public}s', "Test_CloudFile_State_static_003 startBatch download failed: " + err.message + ", error code: " + err.code);
        expect(err.code === 22400005).assertTrue();
        done();
      });
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_003 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_004
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0400
    * @tc.desc   function of API, CloudFileCache.stopBatch, Promise
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
    let downloadId: long = 1;
    let needClean: boolean = true;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress): void => {
        hilog.info(domain, tag, '%{public}s', "batchDownload state：" + pg.state);
      };
      fileCache.onBatchDownload(callback);
      fileCache.stopBatch(downloadId, needClean).then((): void => {
        hilog.info(domain, tag, '%{public}s', "stopBatch Download successfully");
      }).catch((err: Error) => {
        hilog.info(domain, tag, '%{public}s', "Test_CloudFile_State_static_004 stopBatch download failed: " + err.message + ", error code: " + err.code);
        expect(err.code === 13600001).assertTrue();
        done();
      });
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_004 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_005
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0500
    * @tc.desc   function of API, MultiDownloadProgress
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (MultiDownloadProgress: cloudSync.MultiDownloadProgress): void => {
        hilog.info(domain, tag, '%{public}s', "batchDownload state：" + MultiDownloadProgress.state);
        expect(MultiDownloadProgress.taskId == 0).assertTrue();
        expect(MultiDownloadProgress.successfulCount == 0).assertTrue();
        expect(MultiDownloadProgress.failedCount == 0).assertTrue();
        expect(MultiDownloadProgress.totalCount == 0).assertTrue();
        expect(MultiDownloadProgress.downloadedSize == 0).assertTrue();
        expect(MultiDownloadProgress.totalSize == 0).assertTrue();
        expect(MultiDownloadProgress.errType == cloudSync.DownloadErrorType.NO_ERROR).assertTrue();
        MultiDownloadProgress.getSuccessfulFiles();
       };
       fileCache.onBatchDownload(callback);
       fileCache.offBatchDownload(callback);
       done();
      } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_005 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_006
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0600
    * @tc.desc   function of API, FailedFileInfo
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (MultiDownloadProgress: cloudSync.MultiDownloadProgress): void => {
        hilog.info(domain, tag, '%{public}s', "batchDownload state：" + MultiDownloadProgress.state);
        let failedList: Array<cloudSync.FailedFileInfo> = MultiDownloadProgress.getFailedFiles();
        for (let FailedFileInfo of failedList) {
          expect(FailedFileInfo.uri == '').assertTrue();
          expect(FailedFileInfo.error == cloudSync.DownloadErrorType.NO_ERROR).assertTrue();
        }
      };
      fileCache.onBatchDownload(callback);
      fileCache.offBatchDownload(callback);
      done();
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_006 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_007
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0700
    * @tc.desc   function of API, DownloadFileType
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
    let path1: string = "/data/storage/el2/cloud/1.txt";
    let path2: string = "/data/storage/el2/cloud/2.txt";
    let uris: string[] = [fileUri.getUriFromPath(path1), fileUri.getUriFromPath(path2)];
    let fileType: cloudSync.DownloadFileType = cloudSync.DownloadFileType.CONTENT;
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.MultiDownloadProgress): void => {
        hilog.info(domain, tag, '%{public}s', "batchDownload state：" + pg.state);
      };
      fileCache.onBatchDownload(callback);
      fileCache.startBatch(uris, fileType).then((): void => {
        hilog.info(domain, tag, '%{public}s', "startBatch Download successfully");
        expect(cloudSync.DownloadFileType.CONTENT == 0).assertTrue();
        expect(cloudSync.DownloadFileType.THUMBNAIL == 1).assertTrue();
        expect(cloudSync.DownloadFileType.LCD == 2).assertTrue();
      }).catch((err: Error) => {
        hilog.info(domain, tag, '%{public}s', "Test_CloudFile_State_static_007 startBatch download failed: " + err.message + ", error code: " + err.code);
        expect(err.code === 22400005).assertTrue();
        done();
      });
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_007 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_008
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0800
    * @tc.desc   function of API, cleanFileCache
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
    let path: string = "/data/storage/el2/cloud/1.txt";
    let uri: string = fileUri.getUriFromPath(path);
     try {
      let fileCache = new cloudSync.CloudFileCache();
      fileCache.cleanFileCache(uri);
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_008 has failed for ' + err.message + ', code: ' + err.code);
       expect(err.code === 401 && err.message == 'The input parameter is invalid').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   Test_CloudFile_State_static_009
    * @tc.number SUB_STORAGE_CLOUDFILE_TEST_0900
    * @tc.desc   function of API, getCoreFileSyncState
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL3
    */
   it('Test_CloudFile_State_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
    let path: string = "/data/storage/el2/cloud/Test_CloudFile_State_static_009.txt";
    let uri: string = fileUri.getUriFromPath(path);
    hilog.info(domain, tag, '%{public}s', "Test_CloudFile_State_static_009 uri: " + uri);
    try {
      cloudSync.getCoreFileSyncState(uri);
      expect(cloudSync.FileState.INITIAL_AFTER_DOWNLOAD  == 0).assertTrue();
      expect(cloudSync.FileState.UPLOADING == 1).assertTrue();
      expect(cloudSync.FileState.STOPPED  == 2).assertTrue();
      expect(cloudSync.FileState.TO_BE_UPLOADED  == 3).assertTrue();
      expect(cloudSync.FileState.UPLOAD_SUCCESS  == 4).assertTrue();
      expect(cloudSync.FileState.UPLOAD_FAILURE  == 5).assertTrue();
    } catch (e) {
      hilog.info(domain, tag, '%{public}s', 'Test_CloudFile_State_static_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 14000002 && e.message == 'Invalid uri').assertTrue();
      done();
    }
  });
  });
  hilog.info(domain, tag, '%{public}s', 'cloud_file_test end');
}