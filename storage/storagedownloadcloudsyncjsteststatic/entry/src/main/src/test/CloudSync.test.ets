import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function cloudCloudSyncTest() {
  describe("cloud_sync_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'cloud_sync_test start');

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0100
     * @tc.name test_cloudSync_State_static_001
     * @tc.desc function of API, Test FileSync.start, Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_001 file sync state： ' + pg.state + "error type:" + pg.error);
        }
        fileSync.on('progress', callback);
        fileSync.start().then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_001 start sync successfully');
          expect(true).assertTrue();
        }).catch((err: BusinessError): Promise<void> => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_001 sync failed : " + err.message + ", error code: " + err.code);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0200
     * @tc.name test_cloudSync_State_static_002
     * @tc.desc function of API, Test FileSync.start, callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_002 file sync state： ' + pg.state + "error type:" + pg.error);
        }
        fileSync.on('progress', callback);
        fileSync.start((err: BusinessError<void> | null) => {
          if(err?.code != 0){
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_002 sync failed : " + err?.message + ", error code: " + err?.code);
          } else {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_002 start sync successfully");
            expect(true).assertTrue();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0300
     * @tc.name test_cloudSync_State_static_003
     * @tc.desc function of API, on_progress, SyncState.UPLOADING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_003 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.UPLOADING == 0).assertTrue();
        }
        fileSync.on('progress', callback);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0400
     * @tc.name test_cloudSync_State_static_004
     * @tc.desc function of API, on_progress, SyncState.UPLOAD_FAILED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_004 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.UPLOAD_FAILED == 1).assertTrue();
        }
        fileSync.on('progress', callback);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0500
     * @tc.name test_cloudSync_State_static_005
     * @tc.desc function of API, on_progress, SyncState.DOWNLOADING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_005 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.DOWNLOADING == 2).assertTrue();
        }
        fileSync.on('progress', callback);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0600
     * @tc.name test_cloudSync_State_static_006
     * @tc.desc function of API, on_progress, SyncState.DOWNLOAD_FAILED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_006 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.DOWNLOAD_FAILED == 3).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0700
     * @tc.name test_cloudSync_State_static_007
     * @tc.desc function of API, on_progress, SyncState.COMPLETED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_007 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.COMPLETED == 4).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0800
     * @tc.name test_cloudSync_State_static_008
     * @tc.desc function of API, on_progress, SyncState.STOPPED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_008 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.SyncState.STOPPED == 5).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_0900
     * @tc.name test_cloudSync_State_static_009
     * @tc.desc function of API, on_progress, ErrorType.NO_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_009 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.NO_ERROR == 0).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_009 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1000
     * @tc.name test_cloudSync_State_static_010
     * @tc.desc function of API, on_progress, ErrorType.NETWORK_UNAVAILABLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_010 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.NETWORK_UNAVAILABLE == 1).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1100
     * @tc.name test_cloudSync_State_static_011
     * @tc.desc function of API, on_progress, ErrorType.WIFI_UNAVAILABLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_011 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.WIFI_UNAVAILABLE == 2).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1200
     * @tc.name test_cloudSync_State_static_012
     * @tc.desc function of API, on_progress, ErrorType.BATTERY_LEVEL_LOW
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_012 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.BATTERY_LEVEL_LOW == 3).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1300
     * @tc.name test_cloudSync_State_static_013
     * @tc.desc function of API, on_progress, ErrorType.BATTERY_LEVEL_WARNING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_013 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.BATTERY_LEVEL_WARNING == 4).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_013 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1400
     * @tc.name test_cloudSync_State_static_014
     * @tc.desc function of API, on_progress, ErrorType.CLOUD_STORAGE_FULL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_014 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.CLOUD_STORAGE_FULL == 5).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_014 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1500
     * @tc.name test_cloudSync_State_static_015
     * @tc.desc function of API, on_progress, ErrorType.LOCAL_STORAGE_FULL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_015 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.LOCAL_STORAGE_FULL == 6).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_015 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1600
     * @tc.name test_cloudSync_State_static_016
     * @tc.desc function of API, on_progress, ErrorType.DEVICE_TEMPERATURE_TOO_HIGH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        let callback = (pg: cloudSync.SyncProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_016 file sync state： ' + pg.state + "error type:" + pg.error);
          expect(cloudSync.ErrorType.DEVICE_TEMPERATURE_TOO_HIGH == 7).assertTrue();
        }
        fileSync.on('progress', callback);
        fileSync.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_016 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1700
     * @tc.name test_cloudSync_State_static_017
     * @tc.desc function of API, fileSync.stop, Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        fileSync.stop().then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_017 stop sync successfully');
          expect(true).assertTrue();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_017 sync failed : " + err.message + ", error code: " + err.code);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_017 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1800
     * @tc.name test_cloudSync_State_static_018
     * @tc.desc function of API, fileSync.stop, callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_018 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_1900
     * @tc.name test_cloudSync_State_static_019
     * @tc.desc function of API, getLastSyncTime, Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        fileSync.getLastSyncTime().then((timeStamp: number) => {
          let date = new Date(timeStamp);
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_019 get last sync time' + date);
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_019 get last sync time failed : " + err.message + ", error code: " + err.code);
          expect(err.code == 401 && err.message =='The input parameter is invalid').assertTrue();

        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_019 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2000
     * @tc.name test_cloudSync_State_static_020
     * @tc.desc function of API, getLastSyncTime, callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileSync = new cloudSync.FileSync();
        fileSync.getLastSyncTime((err: BusinessError | null, timeStamp: number | undefined) => {
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_020 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2100
     * @tc.name test_cloudSync_State_static_021
     * @tc.desc function of API, CloudFileCache.on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_021 download state： ' + pg.state);
        }
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_021 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2200
     * @tc.name test_cloudSync_State_static_022
     * @tc.desc function of API, CloudFileCache.off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_022 download state： ' + pg.state);
        }
        fileCache.on('progress', callback);
        fileCache.off('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_022 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2300
     * @tc.name test_cloudSync_State_static_023
     * @tc.desc function of API, CloudFileCache.start, Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_023 download state： ' + pg.state);
        }
        fileCache.on('progress', callback);
        fileCache.start(uri).then(() => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_023 start download successfully');
          expect(true).assertTrue();
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_023 start download failed: " + err.message + ", error code: " + err.code);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_023 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2400
     * @tc.name test_cloudSync_State_static_024
     * @tc.desc function of API, CloudFileCache.start, callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_024 download state： ' + pg.state);
        }
        fileCache.on('progress', callback);
        fileCache.start(uri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_024 start download failed: " + err?.message + ", error code: " + err?.code);
          } else {
            hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_024 start download successfully');
            expect(true).assertTrue();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_024 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2500
     * @tc.name test_cloudSync_State_static_025
     * @tc.desc function of API, CloudFileCache.stop, Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let path = "/data/storage/el2/cloud/1.txt";
      let uri = fileUri.getUriFromPath(path);
      try {
        let fileCache = new cloudSync.CloudFileCache();
        fileCache.stop(uri, true).then(() => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_025 stop download successfully");
        }).catch((err: BusinessError): void => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_025 stop download failed: " + err.message + ", error code: " + err.code);
          expect(err.code == 13600001 && err.message =='IPC error').assertTrue();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_025 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2600
     * @tc.name test_cloudSync_State_static_026
     * @tc.desc function of API, CloudFileCache.stop, callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_026 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2700
     * @tc.name test_cloudSync_State_static_027
     * @tc.desc function of API, CloudFileCache.on, State.RUNNING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
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
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_027 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2800
     * @tc.name test_cloudSync_State_static_028
     * @tc.desc function of API, CloudFileCache.on, State.COMPLETED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_028 download state：" + pg.state);
          expect(cloudSync.State.COMPLETED == 1).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_028 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_2900
     * @tc.name test_cloudSync_State_static_029
     * @tc.desc function of API, CloudFileCache.on, State.FAILED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_029 download state：" + pg.state);
          expect(cloudSync.State.FAILED == 2).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_029 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3000
     * @tc.name test_cloudSync_State_static_030
     * @tc.desc function of API, CloudFileCache.on, State.STOPPED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_030 download state：" + pg.state);
          expect(cloudSync.State.STOPPED == 3).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_030 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3100
     * @tc.name test_cloudSync_State_static_031
     * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.NO_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_031 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.NO_ERROR == 0).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_031 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3200
     * @tc.name test_cloudSync_State_static_032
     * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.UNKNOWN_ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_032 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.UNKNOWN_ERROR == 1).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_032 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3300
     * @tc.name test_cloudSync_State_static_033
     * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.NETWORK_UNAVAILABLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_033 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.NETWORK_UNAVAILABLE == 2).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_033 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3400
     * @tc.name test_cloudSync_State_static_034
     * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.LOCAL_STORAGE_FULL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_034 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.LOCAL_STORAGE_FULL == 3).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_034 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3500
     * @tc.name test_cloudSync_State_static_035
     * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.CONTENT_NOT_FOUND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_035 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.CONTENT_NOT_FOUND == 4).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_035 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_STORAGE_CLOUDSYNC_TEST_3600
     * @tc.name test_cloudSync_State_static_036
     * @tc.desc function of API, CloudFileCache.on, DownloadErrorType.FREQUENT_USER_REQUESTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('test_cloudSync_State_static_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      try {
        let fileCache = new cloudSync.CloudFileCache();
        let callback = (pg: cloudSync.DownloadProgress) => {
          hilog.info(domain, tag, '%{public}s', "test_cloudSync_State_static_036 download state：" + pg.error);
          expect(cloudSync.DownloadErrorType.FREQUENT_USER_REQUESTS == 5).assertTrue();
        };
        fileCache.on('progress', callback);
        expect(true).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'test_cloudSync_State_static_036 has failed for' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
      done();
    });

  })
  hilog.info(domain, tag, '%{public}s', 'cloud_sync_test end');

}