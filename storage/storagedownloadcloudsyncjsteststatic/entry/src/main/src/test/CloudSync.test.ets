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
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function cloudCloudSyncTest() {
  describe("cloud_sync_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'cloud_sync_test start');

    /**
     * @tc.name   test_cloudSync_State_static_001
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0100
     * @tc.desc   function of API, Test FileSync.start, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_001 file sync state： ' + pg.state + "error type:" + pg.error);
        }
        fileSync.onProgress(callback);
        fileSync.start().then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_001 start sync successfully');
          expect(true).assertTrue();
        }).catch((err: Error): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_001 sync failed : " + err.message + ", error code: " + err.code);
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_002
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0200
     * @tc.desc   function of API, Test FileSync.start, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_002 file sync state： ' + pg.state + "error type:" + pg.error);
        }
        fileSync.onProgress(callback);
        fileSync.start((err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_002 sync failed : " + err?.message + ", error code: " + err?.code);
          } else {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_002 start sync successfully");
            expect(true).assertTrue();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_003
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0300
     * @tc.desc   function of API, on_progress, SyncState.UPLOADING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_003 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.UPLOADING == 0).assertTrue();
        }
        fileSync.onProgress(callback);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_004
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0400
     * @tc.desc   function of API, on_progress, SyncState.UPLOAD_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_004 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.UPLOAD_FAILED == 1).assertTrue();
        }
        fileSync.onProgress(callback);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_005
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0500
     * @tc.desc   function of API, on_progress, SyncState.DOWNLOADING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_005 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.DOWNLOADING == 2).assertTrue();
        }
        fileSync.onProgress(callback);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_006
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0600
     * @tc.desc   function of API, on_progress, SyncState.DOWNLOAD_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_006 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.DOWNLOAD_FAILED == 3).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_007
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0700
     * @tc.desc   function of API, on_progress, SyncState.COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_007 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.COMPLETED == 4).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_008
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0800
     * @tc.desc   function of API, on_progress, SyncState.STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_008 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.STOPPED == 5).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_009
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0900
     * @tc.desc   function of API, on_progress, ErrorType.NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_009 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.NO_ERROR == 0).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_010
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1000
     * @tc.desc   function of API, on_progress, ErrorType.NETWORK_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_010 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.NETWORK_UNAVAILABLE == 1).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_011
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1100
     * @tc.desc   function of API, on_progress, ErrorType.WIFI_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_011 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.WIFI_UNAVAILABLE == 2).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_012
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1200
     * @tc.desc   function of API, on_progress, ErrorType.BATTERY_LEVEL_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_012 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.BATTERY_LEVEL_LOW == 3).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_013
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1300
     * @tc.desc   function of API, on_progress, ErrorType.BATTERY_LEVEL_WARNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_013 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.BATTERY_LEVEL_WARNING == 4).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_013 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_014
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1400
     * @tc.desc   function of API, on_progress, ErrorType.CLOUD_STORAGE_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_014 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.CLOUD_STORAGE_FULL == 5).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_014 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_015
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1500
     * @tc.desc   function of API, on_progress, ErrorType.LOCAL_STORAGE_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_015 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.LOCAL_STORAGE_FULL == 6).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_015 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_016
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1600
     * @tc.desc   function of API, on_progress, ErrorType.DEVICE_TEMPERATURE_TOO_HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_016 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.DEVICE_TEMPERATURE_TOO_HIGH == 7).assertTrue();
        }
        fileSync.onProgress(callback);
        fileSync.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_016 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_017
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1700
     * @tc.desc   function of API, fileSync.stop, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        fileSync.stop().then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_017 stop sync successfully');
          expect(true).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_017 sync failed : " + err.message + ", error code: " + err.code);
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_017 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_018
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1800
     * @tc.desc   function of API, fileSync.stop, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        fileSync.stop((err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_018 sync failed : " + err?.message + ", error code: " + err?.code);
          } else {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_018 stop sync successfully");
            expect(true).assertTrue();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_018 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_019
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1900
     * @tc.desc   function of API, getLastSyncTime, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        fileSync.getLastSyncTime().then((timeStamp: long) => {
          let date = new Date(timeStamp);
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_019 get last sync time' + date);
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_019 get last sync time failed : " + err.message + ", error code: " + err.code);
          expect(err.code == 401 && err.message =='The input parameter is invalid').assertTrue();

        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_019 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_020
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2000
     * @tc.desc   function of API, getLastSyncTime, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        fileSync.getLastSyncTime((err: BusinessError | null, timeStamp: long|undefined) => {
          if (err && err.code != 0) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_020 get last sync time failed : " + err?.message + ", error code: " + err?.code);
            expect(err?.code == 401 && err?.message =='The input parameter is invalid').assertTrue();
            done();
          } else {
            if (timeStamp !== undefined) {
                let date = new Date(timeStamp);
                hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_020 stop sync successfully');
            }
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_020 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_021
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2100
     * @tc.desc   function of API, CloudFileCache.on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_021 download state： ' + pg.state);
        }
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_021 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_022
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2200
     * @tc.desc   function of API, CloudFileCache.off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_022 download state： ' + pg.state);
        }
        fileCache.onProgress(callback);
        fileCache.offProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_022 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_023
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2300
     * @tc.desc   function of API, CloudFileCache.start, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_023 download state： ' + pg.state);
        }
        fileCache.onProgress(callback);
        fileCache.start(uri).then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_023 start download successfully');
          expect(true).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_023 start download failed: " + err.message + ", error code: " + err.code);
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_023 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_024
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2400
     * @tc.desc   function of API, CloudFileCache.start, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_024 download state： ' + pg.state);
        }
        fileCache.onProgress(callback);
        fileCache.start(uri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_024 start download failed: " + err?.message + ", error code: " + err?.code);
          } else {
            hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_024 start download successfully');
            expect(true).assertTrue();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_024 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_025
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2500
     * @tc.desc   function of API, CloudFileCache.stop, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stop(uri, true).then(() => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_025 stop download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_025 stop download failed: " + err.message + ", error code: " + err.code);
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_025 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_026
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2600
     * @tc.desc   function of API, CloudFileCache.stop, callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stop(uri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_026 start download failed: " + err?.message + ", error code: " + err?.code);
            expect(err?.code == 13600001 && err?.message =='IPC error').assertTrue();
          } else {
            hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_026 start download successfully');
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_026 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_027
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2700
     * @tc.desc   function of API, CloudFileCache.on, State.RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (DownloadProgress: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_027 download state：" + DownloadProgress.state);
          expect(DownloadProgress.uri == '').assertTrue();
          expect(DownloadProgress.size == 0).assertTrue();
          expect(cloudSync.State.RUNNING == 0).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_027 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_028
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2800
     * @tc.desc   function of API, CloudFileCache.on, State.COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_028 download state：" + pg.state);
          expect(cloudSync.State.COMPLETED == 1).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_028 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_029
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2900
     * @tc.desc   function of API, CloudFileCache.on, State.FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_029 download state：" + pg.state);
          expect(cloudSync.State.FAILED == 2).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_029 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_030
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3000
     * @tc.desc   function of API, CloudFileCache.on, State.STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_030 download state：" + pg.state);
          expect(cloudSync.State.STOPPED == 3).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_030 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_031
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3100
     * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_031 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.NO_ERROR == 0).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_031 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_032
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3200
     * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.UNKNOWN_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_032 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.UNKNOWN_ERROR == 1).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_032 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_033
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3300
     * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.NETWORK_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_033 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.NETWORK_UNAVAILABLE == 2).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_033 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_034
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3400
     * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.LOCAL_STORAGE_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_034 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.LOCAL_STORAGE_FULL == 3).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_034 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_035
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3500
     * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.CONTENT_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_035 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.CONTENT_NOT_FOUND == 4).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_035 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_cloudSync_State_static_036
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3600
     * @tc.desc   function of API, CloudFileCache.on, DownloadErrorType.FREQUENT_USER_REQUESTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_036 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.FREQUENT_USER_REQUESTS == 5).assertTrue();
        };
        fileCache.onProgress(callback);
        expect(true).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_036 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
 	   * @tc.name   test_cloudSync_State_static_037
 	   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3700
 	   * @tc.desc   function of API, CloudFileCache.start, Promise, uri is empty string
 	   * @tc.type   FUNCTION
 	   * @tc.size   MEDIUMTEST
 	   * @tc.level  LEVEL3
 	   */
    it('test_cloudSync_State_static_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let uri: string = "";
        fileCache.start(uri).then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_037 start download successfully');
          expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_037 start download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 14000002 && err.message == 'Invalid uri').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_037 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_038
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3800
      * @tc.desc   function of API, CloudFileCache.start, callback, uri is empty string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let uri: string = "";
        fileCache.start(uri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_038 start download failed: " + err?.message + ", error code: " + err?.code);
            expect(err?.code === 14000002 && err?.message == 'Invalid uri').assertTrue();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_038 start download successfully');
            expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_038 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_039
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3900
      * @tc.desc   function of API, CloudFileCache.stop, callback, uri is empty string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let uri: string = "";
        fileCache.stop(uri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_039 stop download failed: " + err?.message + ", error code: " + err?.code);
            expect(err?.code === 13600001 && err?.message == 'IPC error').assertTrue();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_039 stop download successfully');
            expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_039 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

      /**
      * @tc.name   test_cloudSync_State_static_040
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4000
      * @tc.desc   function of API, CloudFileCache.stop, Promise, uri is empty string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uri: string = "";
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stop(uri).then(() => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_040 stop download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_040 stop download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13600001 && err.message == 'IPC error').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_040 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_041
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4100
      * @tc.desc   function of API, CloudFileCache.stop, Promise, needClean is false
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stop(uri, false).then(() => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_041 stop download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_041 stop download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13600001 && err.message == 'IPC error').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_041 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_042
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4200
      * @tc.desc   function of API, CloudFileCache.onBatchDownload
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_042 batch download state： ' + pg.state);
        }
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_042 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_043
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4300
      * @tc.desc   function of API, CloudFileCache.offBatchDownload
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_043 batch download state： ' + pg.state);
        }
        fileCache.onBatchDownload(callback);
        fileCache.offBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_043 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_044
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4400
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, State.RUNNING
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_044 batch download state：" + pg.state);
          expect(cloudSync.State.RUNNING === 0).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_044 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_045
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4500
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, State.COMPLETED
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
           * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_045 batch download state：" + pg.state);
          expect(cloudSync.State.COMPLETED === 1).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_045 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_046
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4600
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, State.FAILED
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_046 batch download state：" + pg.state);
          expect(cloudSync.State.FAILED === 2).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_046 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_047
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4700
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, State.STOPPED
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_047 batch download state：" + pg.state);
          expect(cloudSync.State.STOPPED === 3).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_047 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_048
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4800
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, DownloadErrorType.NO_ERROR
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_048 batch download error type：" + pg.errType);
          expect(cloudSync.DownloadErrorType.NO_ERROR === 0).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_048 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_049
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_4900
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, DownloadErrorType.UNKNOWN_ERROR
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_049 batch download error type：" + pg.errType);
          expect(cloudSync.DownloadErrorType.UNKNOWN_ERROR === 1).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_049 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_050
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5000
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, DownloadErrorType.NETWORK_UNAVAILABLE
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_050 batch download error type：" + pg.errType);
          expect(cloudSync.DownloadErrorType.NETWORK_UNAVAILABLE === 2).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_050 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_051
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5100
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, DownloadErrorType.LOCAL_STORAGE_FULL
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_051 batch download error type：" + pg.errType);
          expect(cloudSync.DownloadErrorType.LOCAL_STORAGE_FULL === 3).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_051 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_052
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5200
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, DownloadErrorType.CONTENT_NOT_FOUND
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_052 batch download error type：" + pg.errType);
          expect(cloudSync.DownloadErrorType.CONTENT_NOT_FOUND === 4).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_052 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_053
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5300
      * @tc.desc   function of API, CloudFileCache.onBatchDownload, DownloadErrorType.FREQUENT_USER_REQUESTS
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_053 batch download error type：" + pg.errType);
          expect(cloudSync.DownloadErrorType.FREQUENT_USER_REQUESTS === 5).assertTrue();
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_053 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_054
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5400
      * @tc.desc   function of API, MultiDownloadProgress.getFailedFiles
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_054 batch download state：" + pg.state);
          if (pg.state == cloudSync.State.FAILED) {
            let failedFiles = pg.getFailedFiles();
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_054 failed files count：" + failedFiles.length);
          }
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_054 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
      * @tc.name   test_cloudSync_State_static_055
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5500
      * @tc.desc   function of API, MultiDownloadProgress.getSuccessfulFiles
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.MultiDownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_055 batch download state：" + pg.state);
          if (pg.state == cloudSync.State.COMPLETED) {
            let successfulFiles = pg.getSuccessfulFiles();
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_055 successful files count：" + successfulFiles.length);
          }
        };
        fileCache.onBatchDownload(callback);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_055 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });


    /**
      * @tc.name   test_cloudSync_State_static_057
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5700
      * @tc.desc   function of API, CloudFileCache.startBatch, Promise, default fileType
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let uriList: Array<string> = [uri];
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.startBatch(uriList).then((downloadId: long): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_057 start batch download successfully, taskId: " + downloadId);
          expect(downloadId >= 0).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_057 start batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400005).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_057 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_058
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5800
      * @tc.desc   function of API, CloudFileCache.startBatch, Promise, fileType CONTENT
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let uriList: Array<string> = [uri];
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.startBatch(uriList, cloudSync.DownloadFileType.CONTENT).then((downloadId: long): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_058 start batch download successfully, taskId: " + downloadId);
          expect(downloadId >= 0).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_058 start batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400005).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_058 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_059
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_5900
      * @tc.desc   function of API, CloudFileCache.startBatch, Promise, fileType THUMBNAIL
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let uriList: Array<string> = [uri];
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.startBatch(uriList, cloudSync.DownloadFileType.THUMBNAIL).then((downloadId: long): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_059 start batch download successfully, taskId: " + downloadId);
          expect(downloadId >= 0).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_059 start batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400005).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_059 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_060
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6000
      * @tc.desc   function of API, CloudFileCache.startBatch, Promise, fileType LCD
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let uriList: Array<string> = [uri];
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.startBatch(uriList, cloudSync.DownloadFileType.LCD).then((downloadId: long): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_060 start batch download successfully, taskId: " + downloadId);
          expect(downloadId >= 0).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_060 start batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400005).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_060 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_061
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6100
      * @tc.desc   function of API, CloudFileCache.startBatch, Promise, empty uri array
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uriList: Array<string> = [];
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.startBatch(uriList).then((downloadId: long): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_061 start batch download successfully, taskId: " + downloadId);
          expect(downloadId >= 0).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_061 start batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 401 && err.message == 'The input parameter is invalid').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_061 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_062
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6200
      * @tc.desc   function of API, CloudFileCache.startBatch, Promise, exceed 400 uris
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      let uriList: Array<string> = [];
      for (let i = 0; i < 401; i++) {
        uriList.push(uri);
      }
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.startBatch(uriList).then((downloadId: long): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_062 start batch download successfully, taskId: " + downloadId);
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_062 start batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400004 && err.message == 'Exceed the maximum limit').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_062 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_063
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6300
      * @tc.desc   function of API, CloudFileCache.startBatch, Promise, invalid uri
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uriList: Array<string> = ["invalid_uri"];
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.startBatch(uriList).then((downloadId: long): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_063 start batch download successfully, taskId: " + downloadId);
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_063 start batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 14000002 && err.message == 'Invalid uri').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_063 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_064
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6400
      * @tc.desc   function of API, CloudFileCache.cleanFileCache
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.cleanFileCache(uri);
        hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_064 clean file cache successfully");
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_064 has failed for' + e.message + ', code: ' + e.code);
        expect((e as BusinessError).code === 401 && (e as BusinessError).message == 'The input parameter is invalid').assertTrue();
        done();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_065
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6500
      * @tc.desc   function of API, CloudFileCache.cleanFileCache, invalid uri
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uri: string = "invalid_uri";
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.cleanFileCache(uri);
        hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_065 clean file cache successfully");
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_065 has failed for' + e.message + ', code: ' + e.code);
        expect((e as BusinessError).code === 14000002 && (e as BusinessError).message == 'Invalid uri').assertTrue();
        done();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_066
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6600
      * @tc.desc   function of API, CloudFileCache.cleanFileCache, empty string uri
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uri: string = "";
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.cleanFileCache(uri);
        hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_066 clean file cache successfully");
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_066 has failed for' + e.message + ', code: ' + e.code);
        expect((e as BusinessError).code === 14000002 && (e as BusinessError).message == 'Invalid uri').assertTrue();
        done();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_067
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6700
      * @tc.desc   function of API, CloudFileCache.stopBatch, Promise, default needClean
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let downloadId: long = 1;
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stopBatch(downloadId).then<void>((): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_067 stop batch download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_067 stop batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_067 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_068
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6800
      * @tc.desc   function of API, CloudFileCache.stopBatch, Promise, needClean is false
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let downloadId: long = 1;
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stopBatch(downloadId, false).then<void>((): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_068 stop batch download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_068 stop batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_068 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_069
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_6900
      * @tc.desc   function of API, CloudFileCache.stopBatch, Promise, needClean is true
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let downloadId: long = 1;
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stopBatch(downloadId, true).then<void>((): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_069 stop batch download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_069 stop batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_069 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_070
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_7000
      * @tc.desc   function of API, CloudFileCache.stopBatch, Promise, invalid downloadId
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let downloadId: long = -1;
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stopBatch(downloadId).then<void>((): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_070 stop batch download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_070 stop batch download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_070 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_071
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_7100
      * @tc.desc   function of API, cloudSync.getCoreFileSyncState
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);
      try {
        let fileState: cloudSync.FileState = cloudSync.getCoreFileSyncState(uri);
        hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_071 get core file sync state: " + fileState);
        expect(cloudSync.SyncState.UPLOAD_FAILED === 1).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_071 has failed for' + e.message + ', code: ' + e.code);
        expect((e as BusinessError).code === 14000002 && (e as BusinessError).message == 'Invalid uri').assertTrue();
      }
      done();
    });


    /**
      * @tc.name   test_cloudSync_State_static_076
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_7600
      * @tc.desc   function of API, cloudSync.getCoreFileSyncState, invalid uri
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uri: string = "invalid_uri";
      try {
        let fileState: cloudSync.FileState = cloudSync.getCoreFileSyncState(uri);
        hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_076 get core file sync state: " + fileState);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_076 has failed for' + e.message + ', code: ' + e.code);
        expect((e as BusinessError).code === 14000002 && (e as BusinessError).message == 'Invalid uri').assertTrue();
        done();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_077
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_7700
      * @tc.desc   function of API, cloudSync.getCoreFileSyncState, empty string uri
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uri: string = "";
      try {
        let fileState: cloudSync.FileState = cloudSync.getCoreFileSyncState(uri);
        hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_077 get core file sync state: " + fileState);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_077 has failed for' + e.message + ', code: ' + e.code);
        expect((e as BusinessError).code === 14000002 && (e as BusinessError).message == 'Invalid uri').assertTrue();
        done();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_078
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_7800
      * @tc.desc   function of API, cloudSync.isFileConflict
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri: string = fileUri.getUriFromPath(path);
      let fileVersion = new cloudSync.FileVersion();
      try {
        fileVersion.isFileConflict(uri).then((isConflict: boolean) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_078 is file conflict: " + isConflict);
          expect(false).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_078 check file conflict failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001 && err.message == 'Cloud status not ready').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_078 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_079
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_7900
      * @tc.desc   function of API, cloudSync.isFileConflict, invalid uri
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uri: string = "invalid_uri";
      let fileVersion = new cloudSync.FileVersion();
      try {
        fileVersion.isFileConflict(uri).then((isConflict: boolean) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_079 is file conflict: " + isConflict);
          expect(false).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_079 check file conflict failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 22400001 && err.message == 'Cloud status not ready').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_079 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
      * @tc.name   test_cloudSync_State_static_080
      * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_8000
      * @tc.desc   function of API, cloudSync.isFileConflict, empty string uri
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_cloudSync_State_static_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let uri: string = "";
      let fileVersion = new cloudSync.FileVersion();
      try {
        fileVersion.isFileConflict(uri).then((isConflict: boolean) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_080 is file conflict: " + isConflict);
          expect(false).assertTrue();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_080 check file conflict failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_080 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_cloudSync_State_static_081
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_8100
     * @tc.desc   function of API, on_progress, ErrorType.REMOTE_SERVER_ABNORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
     
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_081 file sync state：" + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.REMOTE_SERVER_ABNORMAL == 8).assertTrue();
        }
      fileSync.onProgress(callback);
      fileSync.offProgress(callback);
     } catch (err) {
       hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_081 has failed for' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
     * @tc.name   test_cloudSync_State_static_082
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_8200
     * @tc.desc   function of API, CloudFileCache.stop, Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_cloudSync_State_static_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stop("", true).then(() => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_082 stop download successfully");
        }).catch((err: Error): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_082 stop download failed: " + err.message + ", error code: " + err.code);
          expect(err.code === 13600001).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_082 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });
  })
  hilog.info(domain, tag, '%{public}s', 'cloud_sync_test end');

}