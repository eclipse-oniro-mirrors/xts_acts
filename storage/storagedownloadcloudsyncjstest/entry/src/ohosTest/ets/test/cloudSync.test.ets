/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import { BusinessError } from '@kit.BasicServicesKit';

export default function cloudCloudSyncTest(){
describe('cloud_sync_test', () => {

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0100
   * @tc.name test_cloudSync_State_001
   * @tc.desc function of API, Test FileSync.start, Promise
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_001', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_001 file sync state： ' + pg.state + "error type:" + pg.error);
      }
      fileSync.on('progress', callback);
      fileSync.start().then(() => {
        console.log("start sync successfully");
      }).catch((err: BusinessError) => {
        console.error("test_cloudSync_State_001 start sync failed : " + err.message + ", error code: " + err.code);
        expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
      });
     } catch (err) {
       console.log('test_cloudSync_State_001 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0200
   * @tc.name test_cloudSync_State_002
   * @tc.desc function of API, Test FileSync.start, callback
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_002', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_002 file sync state： ' + pg.state + "error type:" + pg.error);
      }
      fileSync.on('progress', callback);
      fileSync.start((err: BusinessError) => {
      if (err) {
        console.error("test_cloudSync_State_002 start sync failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
      } else {
        console.info("start sync successfully");
      }
      });
     } catch (err) {
       console.log('test_cloudSync_State_002 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0300
   * @tc.name test_cloudSync_State_003
   * @tc.desc function of API, on_progress, SyncState.UPLOADING
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_003', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_003 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.SyncState.UPLOADING == 0).assertTrue();
      }
      fileSync.on('progress', callback);
     } catch (err) {
       console.log('test_cloudSync_State_003 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0400
   * @tc.name test_cloudSync_State_004
   * @tc.desc function of API, on_progress, SyncState.UPLOAD_FAILED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_004', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_004 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.SyncState.UPLOAD_FAILED == 1).assertTrue();
      }
      fileSync.on('progress', callback);
     } catch (err) {
       console.log('test_cloudSync_State_004 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0500
   * @tc.name test_cloudSync_State_005
   * @tc.desc function of API, on_progress, SyncState.DOWNLOADING
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_005', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_005 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.SyncState.DOWNLOADING == 2).assertTrue();
      }
      fileSync.on('progress', callback);
     } catch (err) {
       console.log('test_cloudSync_State_005 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0600
   * @tc.name test_cloudSync_State_006
   * @tc.desc function of API, on_progress, SyncState.DOWNLOAD_FAILED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_006', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_006 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.SyncState.DOWNLOAD_FAILED == 3).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_006 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0700
   * @tc.name test_cloudSync_State_007
   * @tc.desc function of API, on_progress, SyncState.COMPLETED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_007', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_007 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.SyncState.COMPLETED == 4).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_007 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0800
   * @tc.name test_cloudSync_State_008
   * @tc.desc function of API, on_progress, SyncState.STOPPED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_008', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_008 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.SyncState.STOPPED == 5).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_008 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0900
   * @tc.name test_cloudSync_State_009
   * @tc.desc function of API, on_progress, ErrorType.NO_ERROR
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_009', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_009 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.NO_ERROR == 0).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_009 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1000
   * @tc.name test_cloudSync_State_010
   * @tc.desc function of API, on_progress, ErrorType.NETWORK_UNAVAILABLE
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_010', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_010 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.NETWORK_UNAVAILABLE == 1).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_010 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1100
   * @tc.name test_cloudSync_State_011
   * @tc.desc function of API, on_progress, ErrorType.WIFI_UNAVAILABLE
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_011', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_011 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.WIFI_UNAVAILABLE == 2).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_011 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1200
   * @tc.name test_cloudSync_State_012
   * @tc.desc function of API, on_progress, ErrorType.BATTERY_LEVEL_LOW
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_012', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_012 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.BATTERY_LEVEL_LOW == 3).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_012 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1300
   * @tc.name test_cloudSync_State_013
   * @tc.desc function of API, on_progress, ErrorType.BATTERY_LEVEL_WARNING
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_013', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_013 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.BATTERY_LEVEL_WARNING == 4).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_013 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1400
   * @tc.name test_cloudSync_State_014
   * @tc.desc function of API, on_progress, ErrorType.CLOUD_STORAGE_FULL
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_014', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_014 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.CLOUD_STORAGE_FULL == 5).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_014 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1500
   * @tc.name test_cloudSync_State_015
   * @tc.desc function of API, on_progress, ErrorType.LOCAL_STORAGE_FULL
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_015', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_015 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.LOCAL_STORAGE_FULL == 6).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_015 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1600
   * @tc.name test_cloudSync_State_016
   * @tc.desc function of API, on_progress, ErrorType.DEVICE_TEMPERATURE_TOO_HIGH
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_016', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_016 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.DEVICE_TEMPERATURE_TOO_HIGH == 7).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_016 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1700
   * @tc.name test_cloudSync_State_017
   * @tc.desc function of API, fileSync.stop, Promise
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_017', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      fileSync.stop().then(() => {
        console.info("stop sync successfully");
      }).catch((err: BusinessError) => {
        console.error("test_cloudSync_State_017 stop sync failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
      });
     } catch (err) {
       console.log('test_cloudSync_State_017 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1800
   * @tc.name test_cloudSync_State_018
   * @tc.desc function of API, fileSync.stop, callback
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_018', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      fileSync.stop((err: BusinessError) => {
        if (err) {
          console.error("test_cloudSync_State_018 stop sync failed: " + err.message + ", error code: " + err.code);
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        } else {
          console.info("stop sync successfully");
        }
      });
     } catch (err) {
       console.log('test_cloudSync_State_018 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1900
   * @tc.name test_cloudSync_State_019
   * @tc.desc function of API, getLastSyncTime, Promise
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_019', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      fileSync.getLastSyncTime().then((timeStamp: number) => {
        let date = new Date(timeStamp);
        console.info("get last sync time successfully:"+ date);
      }).catch((err: BusinessError) => {
        console.error("test_cloudSync_State_019 get last sync time failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
      });
     } catch (err) {
       console.log('test_cloudSync_State_019 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2000
   * @tc.name test_cloudSync_State_020
   * @tc.desc function of API, getLastSyncTime, callback
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_020', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      fileSync.getLastSyncTime((err: BusinessError, timeStamp: number) => {
        if (err) {
          console.error("test_cloudSync_State_020 get last sync time: " + err.message + ", error code: " + err.code);
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        } else {
          let date = new Date(timeStamp);
          console.info("get last sync time successfully:"+ date);
        }
      });
     } catch (err) {
       console.log('test_cloudSync_State_020 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2100
   * @tc.name test_cloudSync_State_021
   * @tc.desc function of API, CloudFileCache.on
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_021', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.state);
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_021 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2200
   * @tc.name test_cloudSync_State_022
   * @tc.desc function of API, CloudFileCache.off
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_022', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.state);
      };
      fileCache.on('progress', callback);
      fileCache.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_022 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2300
   * @tc.name test_cloudSync_State_023
   * @tc.desc function of API, CloudFileCache.start, Promise
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_023', Level.LEVEL3, async (done: Function) => {
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.state);
      };
      fileCache.on('progress', callback);
      fileCache.start(uri).then(() => {
        console.info("start download successfully");
      }).catch((err: BusinessError) => {
        console.error("test_cloudSync_State_023 start download failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
      });
     } catch (err) {
       console.log('test_cloudSync_State_023 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2400
   * @tc.name test_cloudSync_State_024
   * @tc.desc function of API, CloudFileCache.start, callback
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_024', Level.LEVEL3, async (done: Function) => {
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.state);
      };
      fileCache.on('progress', callback);
      fileCache.start(uri, (err: BusinessError) => {
        if (err) {
          console.error("test_cloudSync_State_024 start download failed: " + err.message + ", error code: " + err.code);
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        } else {
          console.info("start download successfully");
        }
      });
     } catch (err) {
       console.log('test_cloudSync_State_024 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2500
   * @tc.name test_cloudSync_State_025
   * @tc.desc function of API, CloudFileCache.stop, Promise
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_025', Level.LEVEL3, async (done: Function) => {
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      fileCache.stop(uri, true).then(() => {
        console.info("stop download successfully");
      }).catch((err: BusinessError) => {
        console.error("test_cloudSync_State_025 stop download failed: " + err.message + ", error code: " + err.code);
        expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
      });
     } catch (err) {
       console.log('test_cloudSync_State_025 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2600
   * @tc.name test_cloudSync_State_026
   * @tc.desc function of API, CloudFileCache.stop, callback
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_026', Level.LEVEL3, async (done: Function) => {
    let path = "/data/storage/el2/cloud/1.txt";
    let uri = fileUri.getUriFromPath(path);
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      fileCache.stop(uri, (err: BusinessError) => {
        if (err) {
          console.error("test_cloudSync_State_026 stop download failed: " + err.message + ", error code: " + err.code);
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        } else {
          console.info("stop download successfully");
        }
      });
     } catch (err) {
       console.log('test_cloudSync_State_025 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2700
   * @tc.name test_cloudSync_State_027
   * @tc.desc function of API, CloudFileCache.on, State.RUNNING
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_027', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (DownloadProgress: cloudSync.DownloadProgress) => {
        console.info("download state：" + DownloadProgress.state);
        expect(DownloadProgress.uri == '').assertTrue();
        expect(DownloadProgress.size == 0).assertTrue();
        expect(cloudSync.State.RUNNING == 0).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_027 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2800
   * @tc.name test_cloudSync_State_028
   * @tc.desc function of API, CloudFileCache.on, State.COMPLETED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_028', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.state);
        expect(cloudSync.State.COMPLETED == 1).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_028 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2900
   * @tc.name test_cloudSync_State_029
   * @tc.desc function of API, CloudFileCache.on, State.FAILED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_029', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.state);
        expect(cloudSync.State.FAILED == 2).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_029 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3000
   * @tc.name test_cloudSync_State_030
   * @tc.desc function of API, CloudFileCache.on, State.STOPPED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_030', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.state);
        expect(cloudSync.State.STOPPED == 3).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_030 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3100
   * @tc.name test_cloudSync_State_031
   * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.NO_ERROR
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_031', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.error);
        expect(cloudSync.DownloadErrorType.NO_ERROR == 0).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_031 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3200
   * @tc.name test_cloudSync_State_032
   * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.UNKNOWN_ERROR
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_032', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.error);
        expect(cloudSync.DownloadErrorType.UNKNOWN_ERROR == 1).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_032 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3300
   * @tc.name test_cloudSync_State_033
   * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.NETWORK_UNAVAILABLE
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_033', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.error);
        expect(cloudSync.DownloadErrorType.NETWORK_UNAVAILABLE == 2).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_033 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3400
   * @tc.name test_cloudSync_State_034
   * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.LOCAL_STORAGE_FULL
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_034', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.error);
        expect(cloudSync.DownloadErrorType.LOCAL_STORAGE_FULL == 3).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_034 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3500
   * @tc.name test_cloudSync_State_035
   * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.CONTENT_NOT_FOUND
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_035', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.error);
        expect(cloudSync.DownloadErrorType.CONTENT_NOT_FOUND == 4).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_035 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3600
   * @tc.name test_cloudSync_State_036
   * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.FREQUENT_USER_REQUESTS
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_036', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileCache = new cloudSync.CloudFileCache();
      let callback = (pg: cloudSync.DownloadProgress) => {
        console.info("download state：" + pg.error);
        expect(cloudSync.DownloadErrorType.FREQUENT_USER_REQUESTS == 5).assertTrue();
      };
      fileCache.on('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_036 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });

    /**
   * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3700
   * @tc.name test_cloudSync_State_037
   * @tc.desc function of API, on_progress, ErrorType.REMOTE_SERVER_ABNORMAL
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_cloudSync_State_037', Level.LEVEL3, async (done: Function) => {
     
     try {
      let fileSync = new cloudSync.FileSync();
      let callback = (pg: cloudSync.SyncProgress) => {
        console.log('test_cloudSync_State_037 file sync state： ' + pg.state + "error type:" + pg.error);
        expect(cloudSync.ErrorType.REMOTE_SERVER_ABNORMAL == 8).assertTrue();
      }
      fileSync.on('progress', callback);
      fileSync.off('progress', callback);
      expect(true).assertTrue();
     } catch (err) {
       console.log('test_cloudSync_State_037 has failed for ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
     done();
   });
  });
}