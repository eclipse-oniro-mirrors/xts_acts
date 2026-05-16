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
import connection from '@ohos.net.connection';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
 import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function CloudFileVersionTest(): void {
  describe("cloud_file_version_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'cloud_file_version_test start');

    /**
     * @tc.name   test_cloudSync_FileVersion_static_001
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0100
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);
      let limit: int = 10;

      try {
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>): void => {
          for(let i = 0, len = versionList.length; i < len; i++) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_001 get history versionId: " + versionList[i].versionId);
            expect(versionList[i].versionId !== undefined).assertTrue(); // 验证versionId不为undefined
          }
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_001 get history version failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_cloudSync_FileVersion_static_002
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0200
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList with uri is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "";
      let uri: string = fileUri.getUriFromPath(path);
      let limit: int = 10;

      try {
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>): void => {
          for(let i = 0, len = versionList.length; i < len; i++) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_002 get history versionId: " + versionList[i].versionId);
          }
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_002 get history version failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   test_cloudSync_FileVersion_static_003
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0300
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList with limit length is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);
      let limit: int = 0;

      try {
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>): void => {
          for(let i = 0, len = versionList.length; i < len; i++) {
            let HistoryVersion: cloudSync.HistoryVersion = versionList[i];
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_003 get history versionId: " + HistoryVersion.versionId);
            expect(HistoryVersion.editedTime == 0).assertTrue();
            expect(HistoryVersion.fileSize == 0).assertTrue();
            expect(HistoryVersion.versionId == '').assertTrue();
            expect(HistoryVersion.originalFileName == '').assertTrue();
            expect(HistoryVersion.sha256 == '').assertTrue();
            expect(HistoryVersion.autoResolved == false).assertTrue();
          }
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_003 get history version failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code === 13900020).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   test_cloudSync_FileVersion_static_004
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0400
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.downloadHistoryVersion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);
      let versionId: string = '123456';
      let callback: (data: cloudSync.VersionDownloadProgress) => void = (data: cloudSync.VersionDownloadProgress): void => {
        if (data.state == cloudSync.State.RUNNING) {
          hilog.info(domain, tag, '%{public}s', "download progress: " + data.progress);
        } else if (data.state == cloudSync.State.FAILED) {
          hilog.info(domain, tag, '%{public}s', "download failed errType: " + data.errType);
        } else if (data.state == cloudSync.State.COMPLETED) {
          hilog.info(domain, tag, '%{public}s', "download version file success");
        }
      };

      try {
        fileVersion.downloadHistoryVersion(uri, versionId, callback).then((fileUri: string): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_004 success to begin download, downloadFileUri: " + fileUri);
          expect(fileUri !== undefined && fileUri !== '').assertTrue(); // 验证返回的fileUri不为空
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_004 download history version file failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_004 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_cloudSync_FileVersion_static_005
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0500
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.downloadHistoryVersion with versionId is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);
      let versionId: string = '';
      let callback: (VersionDownloadProgress: cloudSync.VersionDownloadProgress) => void = (VersionDownloadProgress: cloudSync.VersionDownloadProgress): void => {
        if (VersionDownloadProgress.state == cloudSync.State.RUNNING) {
          hilog.info(domain, tag, '%{public}s', "download progress: " + VersionDownloadProgress.progress);
          expect(VersionDownloadProgress.progress == 0).assertTrue();
        } else if (VersionDownloadProgress.state == cloudSync.State.FAILED) {
          hilog.info(domain, tag, '%{public}s', "download failed errType: " + VersionDownloadProgress.errType);
          expect(VersionDownloadProgress.errType == cloudSync.DownloadErrorType.UNKNOWN_ERROR).assertTrue();
        } else if (VersionDownloadProgress.state == cloudSync.State.COMPLETED) {
          hilog.info(domain, tag, '%{public}s', "download version file success");
        }
      };

      try {
        fileVersion.downloadHistoryVersion(uri, versionId, callback).then((fileUri: string): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_005 success to begin download, downloadFileUri: " + fileUri);
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_005 download history version file failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code === 13900020).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_005 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   test_cloudSync_FileVersion_static_006
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0600
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.replaceFileWithHistoryVersion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "/data/storage/el2/cloud/test_cloudSync_FileVersion_static_006.txt";
      let uri: string = fileUri.getUriFromPath(path);
      let versionUri: string = uri;
      try {
        fileVersion.replaceFileWithHistoryVersion(uri, versionUri).then((): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_006 replaceFileWithHistoryVersion success");
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_006 replaceFileWithHistoryVersion failed with error: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001).assertTrue();
          done()
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_006 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_cloudSync_FileVersion_static_007
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0700
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.isFileConflict.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);

      try {
        fileVersion.isFileConflict(uri).then((isConflict: boolean): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_007 current file is conflict: " + isConflict);
          expect(typeof isConflict === 'boolean').assertTrue(); // 验证返回的是布尔值类型
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_007 get current file conflict flag failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_007 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_cloudSync_FileVersion_static_008
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0800
     * @tc.desc   function of API, cloudSync_FileVersion, fileVersion.clearFileConflict.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_FileVersion_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fileVersion: cloudSync.FileVersion = new cloudSync.FileVersion();
      let path: string = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);

      try {
        fileVersion.clearFileConflict(uri).then((): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_008 clean file conflict flag success");
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_FileVersion_static_008 clean file conflict flag failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001).assertTrue();
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_FileVersion_static_008 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
        done();
      }
    });

  });
  hilog.info(domain, tag, '%{public}s', 'cloud_file_version_test end');
}