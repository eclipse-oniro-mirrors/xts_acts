/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import cloudSync from '@ohos.file.cloudSync';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function cloudFileDownloadTest() {
  describe('cloud_file_download_test', (): void => {

    /**
     * @tc.name   test_Download_State_static_001
     * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0100
     * @tc.desc   function of API, Test State RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_State_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_001 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_001 new download success.');
        let RUNNING = 0;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == RUNNING) {
              hilog.info(domain, tag, '%{public}s', "state:pg.state.RUNNING==0-云文件正在下载中");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_001 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_001 end');
    })

    /**
     * @tc.name   test_Download_State_static_002
     * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0200
     * @tc.desc   function of API, Test State FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_State_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_002 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_002 new download success.');
        let FAILED = 2;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == FAILED) {
              hilog.info(domain, tag, '%{public}s', "state:pg.state.FAILED==2-云文件下载失败");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_002 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_State_static_002 end');
    })

    /**
     * @tc.name   test_Uploading_State_static_003
     * @tc.number SUB_STORAGE_UPLOADING_STATE_TEST_0300
     * @tc.desc   function of API, Test State Uploading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Uploading_State_static_003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Uploading_State_static_003 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Uploading_State_static_003 new download success.');
        let UPLOADING = 0;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == UPLOADING) {
              hilog.info(domain, tag, '%{public}s', "state:pg.state.SyncState==0-上行同步中");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Uploading_State_static_003 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Uploading_State_static_003 end');
    })

    /**
     * @tc.name   test_Uploading_Failed_State_static_004
     * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0400
     * @tc.desc   function of API, Test State Uploading_Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Uploading_Failed_State_static_004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Uploading_Failed_State_static_004 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Uploading_Failed_State_static_004 new download success.');
        let UPLOAD_FAILED = 1;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == UPLOAD_FAILED) {
              hilog.info(domain, tag, '%{public}s', "state:pg.state.SyncState==1-上行同步失败");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Uploading_Failed_State_static_004 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Uploading_Failed_State_static_004 end');
    })

    /**
     * @tc.name   test_CloudSync_SyncState_static_005
     * @tc.number SUB_STORAGE_GALLERYSYNC_STATE_TEST_0500
     * @tc.desc   function of API, Test State DOWNLOAD_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_SyncState_static_005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_SyncState_static_005 start');
      try {
        let gallerySync = new cloudSync.GallerySync();
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_SyncState_static_005 new gallerySync success.');
        let DOWNLOAD_FAILED = 3;
        gallerySync.onProgress((pg: cloudSync.SyncProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'gallerySync_on:callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == DOWNLOAD_FAILED) {
              hilog.info(domain, tag, '%{public}s', "state:pg.state.SyncState==3-云文件下行同步失败");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_SyncState_static_005 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_SyncState_static_005 end');
    })

    /**
     * @tc.name   test_Downloading_State_static_006
     * @tc.number SUB_STORAGE_DOWNLOADING_STATE_TEST_0600
     * @tc.desc   function of API, Test State Downloading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Downloading_State_static_006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Downloading_State_static_006 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Downloading_State_static_006 new download success.');
        let DOWNLOADING = 2;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == DOWNLOADING) {
              hilog.info(domain, tag, '%{public}s', "state:pg.state.SyncState==2-下行同步中");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Downloading_State_static_006 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Downloading_State_static_006 end');
    })

    /**
     * @tc.name   test_Download_Processed_static_001
     * @tc.number SUB_STORAGE_DOWNLOAD_PROCESSED_TEST_0100
     * @tc.desc   function of API, Test State processed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Processed_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Processed_static_001 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Processed_static_001 new download success.');
        let FAILED = 2;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == FAILED) {
              hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.processed = " + pg.processed);
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Processed_static_001 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Processed_static_001 end');
    })

    /**
     * @tc.name   test_Download_Error_static_001
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0100
     * @tc.desc   function of API, Test DownloadErrorType NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Error_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_001 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_001 new download success.');
        let NO_ERROR = 0;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == NO_ERROR) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.NO_ERROR==0-没有错误");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_001 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_001 end');
    })

    /**
     * @tc.name   test_Download_Error_static_002
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0200
     * @tc.desc   function of API, Test DownloadErrorType UNKNOWN_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Error_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_002 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_002 new download success.');
        let UNKNOWN_ERROR = 1;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == UNKNOWN_ERROR) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.UNKNOWN_ERROR==1-未知错误");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_002 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_002 end');
    })

    /**
     * @tc.name   test_Download_Error_static_003
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0300
     * @tc.desc   function of API, Test DownloadErrorType NETWORK_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Error_static_003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_003 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_003 new download success.');
        let NETWORK_UNAVAILABLE = 2;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == NETWORK_UNAVAILABLE) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.NETWORK_UNAVAILABLE==2-网络不可用");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_003 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_003 end');
    })

    /**
     * @tc.name   test_Download_Error_static_004
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0400
     * @tc.desc   function of API, Test DownloadErrorType LOCAL_STORAGE_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Error_static_004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_004 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_004 new download success.');
        let LOCAL_STORAGE_FULL = 3;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == LOCAL_STORAGE_FULL) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.LOCAL_STORAGE_FULL==3-本地空间不足");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_004 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_004 end');
    })

    /**
     * @tc.name   test_Download_Error_static_005
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0500
     * @tc.desc   function of API, Test DownloadErrorType CONTENT_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Error_static_005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_005 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_005 new download success.');
        let CONTENT_NOT_FOUND = 4;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == CONTENT_NOT_FOUND) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.CONTENT_NOT_FOUND==4-云端空间未找到对应文件");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_005 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_005 end');
    })

    /**
     * @tc.name   test_Download_Error_static_006
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0600
     * @tc.desc   function of API, Test DownloadErrorType FREQUENT_USER_REQUESTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Error_static_006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_006 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_006 new download success.');
        let FREQUENT_USER_REQUESTS = 5;
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            if (pg.state == FREQUENT_USER_REQUESTS) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.CONTENT_NOT_FOUND==5-用户请求过于频繁");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_006 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_006 end');
    })

    /**
     * @tc.name   test_Download_Error_static_007
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0700
     * @tc.desc   function of API, Test Test_error on() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Download_Error_static_007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_007 start');
      try {
        let cloudSyncDownload = new cloudSync.Download();
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_007 new download success.');
        cloudSyncDownload.onProgress((pg: cloudSync.DownloadProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.state = " + pg.state);
            expect(true).assertTrue();
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_007 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Download_Error_static_007 end');
    })

    /**
     * @tc.name   test_CloudSync_ErrorType_static_008
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0800
     * @tc.desc   function of API, Test ErrorType WIFI_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_ErrorType_static_008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_008 start');
      try {
        let gallerySync = new cloudSync.GallerySync();
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_008 new gallerySync success.');
        let WIFI_UNAVAILABLE = 2;
        gallerySync.onProgress((pg: cloudSync.SyncProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'gallerySync_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.error = " + pg.error);
            if (pg.state == WIFI_UNAVAILABLE) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.WIFI_UNAVAILABLE == 2-WIFI不可用");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_008 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_008 end');
    })

    /**
     * @tc.name   test_CloudSync_ErrorType_static_009
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0900
     * @tc.desc   function of API, Test ErrorType BATTERY_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_ErrorType_static_009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_009 start');
      try {
        let gallerySync = new cloudSync.GallerySync();
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_009 new gallerySync success.');
        let BATTERY_LEVEL_LOW = 3;
        gallerySync.onProgress((pg: cloudSync.SyncProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.error = " + pg.error);
            if (pg.state == BATTERY_LEVEL_LOW) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.BATTERY_LEVEL_LOW == 3-低电量（低于15%）");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_009 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_009 end');
    })

    /**
     * @tc.name   test_CloudSync_ErrorType_static_010
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1000
     * @tc.desc   function of API, Test ErrorType BATTERY_LEVEL_WARNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_ErrorType_static_010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_010 start');
      try {
        let gallerySync = new cloudSync.GallerySync();
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_010 new gallerySync success.');
        let BATTERY_LEVEL_WARNING = 4;
        gallerySync.onProgress((pg: cloudSync.SyncProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.error = " + pg.error);
            if (pg.state == BATTERY_LEVEL_WARNING) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.BATTERY_LEVEL_WARNING == 4-告警电量（低于10%）");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_010 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_010 end');
    })

    /**
     * @tc.name   test_CloudSync_ErrorType_static_011
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1100
     * @tc.desc   function of API, Test ErrorType CLOUD_STORAGE_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_ErrorType_static_011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_011 start');
      try {
        let gallerySync = new cloudSync.GallerySync();
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_011 new gallerySync success.');
        let CLOUD_STORAGE_FULL = 5;
        gallerySync.onProgress((pg: cloudSync.SyncProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.error = " + pg.error);
            if (pg.state == CLOUD_STORAGE_FULL) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.CLOUD_STORAGE_FULL == 5-云端空间不足");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_011 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_011 end');
    })

    /**
     * @tc.name   test_CloudSync_ErrorType_static_012
     * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1200
     * @tc.desc   function of API, Test ErrorType DEVICE_TEMPERATURE_TOO_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_ErrorType_static_012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_012 start');
      try {
        let gallerySync = new cloudSync.GallerySync();
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_012 new gallerySync success.');
        let DEVICE_TEMPERATURE_TOO_HIGH = 7;
        gallerySync.onProgress((pg: cloudSync.SyncProgress): void => {
          hilog.info(domain, tag, '%{public}s', 'download_on: callback succeed.');
          if(pg != undefined){
            hilog.info(domain, tag, '%{public}s', "on:callback succeed. pg.error = " + pg.error);
            if (pg.state == DEVICE_TEMPERATURE_TOO_HIGH) {
              hilog.info(domain, tag, '%{public}s', "error: pg.error.DEVICE_TEMPERATURE_TOO_HIGH == 7-设备温度过高");
              expect(true).assertTrue();
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_012 failed, err = ' + error.code + ', message = ' + error.message);
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_ErrorType_static_012 end');
    })

    /**
     * @tc.name   test_CloudSync_NotifyType_static_001
     * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0100
     * @tc.desc   function of API, Test  NotifyType NOTIFY_ADDED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_NotifyType_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_001 start');
      try {
        let value1 = cloudSync.NotifyType.NOTIFY_ADDED;
        hilog.info(domain, tag, '%{public}s', 'cloudSync.NotifyType.NOTIFY_ADDED = ' + value1);
        expect(value1).assertEqual(cloudSync.NotifyType.NOTIFY_ADDED);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_001 failed, err = ' + error.code + ', message = ' + error.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_CloudSync_NotifyType_static_002
     * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0200
     * @tc.desc   function of API, Test  NotifyType NOTIFY_MODIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_NotifyType_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_002 start');
      try {
        let value1 = cloudSync.NotifyType.NOTIFY_MODIFIED;
        hilog.info(domain, tag, '%{public}s', 'cloudSync.NotifyType.NOTIFY_MODIFIED = ' + value1);
        expect(value1).assertEqual(cloudSync.NotifyType.NOTIFY_MODIFIED);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_002 failed, err = ' + error.code + ', message = ' + error.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_CloudSync_NotifyType_static_003
     * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0300
     * @tc.desc   function of API, Test  NotifyType NOTIFY_MODIFIED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_NotifyType_static_003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_003 start');
      try {
        let value1 = cloudSync.NotifyType.NOTIFY_DELETED;
        hilog.info(domain, tag, '%{public}s', 'cloudSync.NotifyType.NOTIFY_DELETED = ' + value1);
        expect(value1).assertEqual(cloudSync.NotifyType.NOTIFY_DELETED);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_003 failed, err = ' + error.code + ', message = ' + error.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_CloudSync_NotifyType_static_004
     * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0400
     * @tc.desc   function of API, Test  NotifyType NOTIFY_RENAMED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_CloudSync_NotifyType_static_004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_004 start');
      try {
        let value1 = cloudSync.NotifyType.NOTIFY_RENAMED;
        hilog.info(domain, tag, '%{public}s', 'cloudSync.NotifyType.NOTIFY_RENAMED = ' + value1);
        expect(value1).assertEqual(cloudSync.NotifyType.NOTIFY_RENAMED);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_CloudSync_NotifyType_static_004 failed, err = ' + error.code + ', message = ' + error.message);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   test_Getlastsynctime_static_001
     * @tc.number SUB_STORAGE_GETLASTAYNCTIME_TEST_0100
     * @tc.desc   function of API, Test getLastsynctime interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Getlastsynctime_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_001 start');
      try {
        let fileSync = new cloudSync.FileSync();
        hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_001 new fileSync success.');
        fileSync.getLastSyncTime().then((timeStamp: long): void => {
          let time = new Date(timeStamp);
          hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_001 success, time = ' + time);
        }, (err: Error): void => {
          hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_001 failed, err = ' + err.code + ', message = ' + err.message);
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_001 failed, err = ' + error.code + ', message = ' + error.message);
        expect(false).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_001 end');
    })

    /**
     * @tc.name   test_Getlastsynctime_static_002
     * @tc.number SUB_STORAGE_GETLASTAYNCTIME_TEST_0200
     * @tc.desc   function of API, Test getLastsynctime interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_Getlastsynctime_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_002 start');
      try {
        let fileSync = new cloudSync.FileSync();
        hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_002 new fileSync success.');
        fileSync.getLastSyncTime((err: BusinessError<void> | null, timeStamp: long|undefined) => {
          if (err && err.code) {
            hilog.info(domain, tag, '%{public}s', "test_Getlastsynctime_static_002 get last sync time failed: " + err?.message + ", error code: " + err?.code);
          } else {
            if (timeStamp !== undefined) {
              let date = new Date(timeStamp);
              hilog.info(domain, tag, '%{public}s', "test_Getlastsynctime_static_002 get last sync time successfully:" + date);
            }
          }
        });
        expect(true).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_002 failed, err = ' + error.code + ', message = ' + error.message);
        expect(false).assertTrue();
      }
      done();
      hilog.info(domain, tag, '%{public}s', 'test_Getlastsynctime_static_002 end');
    })
  });
}