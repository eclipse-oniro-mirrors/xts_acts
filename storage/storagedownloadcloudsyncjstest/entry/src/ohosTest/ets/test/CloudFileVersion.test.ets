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
import connection from '@ohos.net.connection';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@kit.BasicServicesKit';

export default function CloudFileVersionTest(){
  describe('cloud_file_version_test', () => {

    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0100
     * @tc.name test_cloudSync_FileVersion_001
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_001', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let limit = 10;

      try {
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>) => {
          for(let i = 0, len = versionList.length; i < len; i++) {
            console.info("test_cloudSync_FileVersion_001 get history versionId: " + versionList[i].versionId);
            expect(true).assertTrue();
          }
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_001 get history version failed with error message: " + err.message + ", error code: " + err.code);
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_001 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0200
     * @tc.name test_cloudSync_FileVersion_002
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList with uri is null.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_002', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "";
      let uri = fileUri.getUriFromPath(path);
      let limit = 10;

      try {
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>) => {
          for(let i = 0, len = versionList.length; i < len; i++) {
            console.info("test_cloudSync_FileVersion_002 get history versionId: " + versionList[i].versionId);
          }
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_002 get history version failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code == 13900020 && err.message == 'Parameter error').assertTrue();
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_002 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      done();
    });


    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0300
     * @tc.name test_cloudSync_FileVersion_003
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.getHistoryVersionList with limit length is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_003', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let limit = 0;

      try {
        fileVersion.getHistoryVersionList(uri, limit).then((versionList: Array<cloudSync.HistoryVersion>) => {
          for(let i = 0, len = versionList.length; i < len; i++) {
            let HistoryVersion = versionList[i];
            console.info("test_cloudSync_FileVersion_003 get history versionId: " + HistoryVersion.versionId);
            expect(HistoryVersion.editedTime == 0).assertTrue();
            expect(HistoryVersion.fileSize == 0).assertTrue();
            expect(HistoryVersion.versionId == '').assertTrue();
            expect(HistoryVersion.originalFileName == '').assertTrue();
            expect(HistoryVersion.sha256 == '').assertTrue();
            expect(HistoryVersion.autoResolved == false).assertTrue();
          }
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_003 get history version failed with error message: " + err.message + ", error code: " + err.code);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_003 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      }
      done();
    });


    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0400
     * @tc.name test_cloudSync_FileVersion_004
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.downloadHistoryVersion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_004', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let versionId = '123456';
      let callback = (data: cloudSync.VersionDownloadProgress) => {
        if (data.state == cloudSync.State.RUNNING) {
          console.info("download progress: " + data.progress);
        } else if (data.state == cloudSync.State.FAILED) {
          console.info("download failed errType: " + data.errType);
        } else if (data.state == cloudSync.State.COMPLETED) {
          console.info("download version file success");
        }
      };

      try {
        fileVersion.downloadHistoryVersion(uri, versionId, callback).then((fileUri: string) => {
          console.info("test_cloudSync_FileVersion_004 success to begin download, downloadFileUri: " + fileUri);
          expect(true).assertTrue();
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_004 download history version file failed with error message: " + err.message + ", error code: " + err.code);
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_004 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0500
     * @tc.name test_cloudSync_FileVersion_005
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.downloadHistoryVersion with versionId is null.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_005', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let versionId = '';
      let callback = (VersionDownloadProgress: cloudSync.VersionDownloadProgress) => {
        if (VersionDownloadProgress.state == cloudSync.State.RUNNING) {
          console.info("download progress: " + VersionDownloadProgress.progress);
          expect(VersionDownloadProgress.progress == 0).assertTrue();
        } else if (VersionDownloadProgress.state == cloudSync.State.FAILED) {
          console.info("download failed errType: " + VersionDownloadProgress.errType);
          expect(VersionDownloadProgress.errType == cloudSync.DownloadErrorType.UNKNOWN_ERROR).assertTrue();
        } else if (VersionDownloadProgress.state == cloudSync.State.COMPLETED) {
          console.info("download version file success");
        }
      };

      try {
        fileVersion.downloadHistoryVersion(uri, versionId, callback).then((fileUri: string) => {
          console.info("test_cloudSync_FileVersion_005 success to begin download, downloadFileUri: " + fileUri);
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_005 download history version file failed with error message: " + err.message + ", error code: " + err.code);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_005 has failed for ' + err.message + ', code: ' + err.code);
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      }
      done();
    });


    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0600
     * @tc.name test_cloudSync_FileVersion_006
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.replaceFileWithHistoryVersion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_006', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/test_cloudSync_FileVersion_006.txt";
      let uri = fileUri.getUriFromPath(path);
      let versionUri = uri;
      try {
        fileVersion.replaceFileWithHistoryVersion(uri, versionUri).then(() => {
          console.info("test_cloudSync_FileVersion_006 replaceFileWithHistoryVersion success");
          expect(true).assertTrue();
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_006 replaceFileWithHistoryVersion failed with error: " + err.message + ", error code: " + err.code);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_006 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0700
     * @tc.name test_cloudSync_FileVersion_007
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.isFileConflict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_007', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);

      try {
        fileVersion.isFileConflict(uri).then((isConflict) => {
          console.info("test_cloudSync_FileVersion_007 current file is conflict: " + isConflict);
          expect(true).assertTrue();
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_007 get current file conflict flag failed with error message: " + err.message + ", error code: " + err.code);
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_007 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_FILE_VERSION_CLOUDSYNC_TEST_0800
     * @tc.name test_cloudSync_FileVersion_008
     * @tc.desc function of API, cloudSync_FileVersion, fileVersion.clearFileConflict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_FileVersion_008', Level.LEVEL3, async (done: Function) => {
      let fileVersion = new cloudSync.FileVersion();
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);

      try {
        fileVersion.clearFileConflict(uri).then(() => {
          console.info("test_cloudSync_FileVersion_008 clean file conflict flag success");
          expect(true).assertTrue();
        }).catch((err: BusinessError) => {
          console.error("test_cloudSync_FileVersion_008 clean file conflict flag failed with error message: " + err.message + ", error code: " + err.code);
        });
      } catch (err) {
        console.log('test_cloudSync_FileVersion_008 has failed for ' + err.message + ', code: ' + err.code);
        expect(false).assertTrue();
      }
      done();
    });

  });
}