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

import { describe, beforeAll,beforeEach,afterEach,afterAll,it,expect } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import featureAbility from '@ohos.ability.featureAbility';
import fs from '@ohos.file.fs';

export default function cloudFileDownloadTest(){
    let uri_ ="file://media/image/7";
    let cloudSyncDownload;
    let isConnect:Boolean;
    let gallerySync;

describe('cloud_file_download_test',async function(){
  async function getNetId(){
    let netId = 0;
    try {
      let netHandle = await
      connection.getDefaultNet();
      if(netHandle){
        console.log('getNetId info :${JSON.stringify(netHandle)}');
        netId = netHandle.netId
      }
    }catch (error){
      console.error('getNetId Error : ${JSON.stringify(error)}');
    }
    return netId;
}
beforeAll(async function(){
  console.info("beforeAllcase uri:" + uri_);
    try {
        let netId = await getNetId();
        if (netId >= 100){
            isConnect = false;
        }
        console.info('网络状态：${isConnect}');
        cloudSyncDownload =new cloudSync.Download();
        gallerySync = new cloudSync.GallerySync();
    }catch (err){
      console.error("beforeAll case err :" + err);
    }
});

beforeEach(async function ()
{
  console.info("beforeEachcase");
});
afterAll(function (){
  console.info("afterAll case");
});

function errHandle(err,tag){
  console.error('${tag}err.code :${err.code} err.message :${err.message} isConnect : ${isConnect}');
    if (err.code != undefined) {
      switch (err.code){
        case 13600001://IPC error
        console.error('${tag} ICP error');
        expect(true).assertTrue();
        break;
        case 22400002:// Network unavailable
        expect(true).assertTrue();
        break;
        case 401: //The inputparameter is invalid
        console.error('${tag} The input parameter is invalid');
        expect(true).assertTrue();
        break;
      }
    }else{
      console.error('${tag} catch failed.err = $ {JSON.stringify(err)}');
      expect(false).assertTrue();
    }
  };

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0100
   * @tc.name test_Download_State_001
   * @tc.desc function of API, Test State RUNNING
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Download_State_001', 3,function (done){
     let TAG = "test_Download_State_001::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state);
           if (pg.state.RUNNING == 0) {
             console.info("state:pg.state.RUNNING==0-云文件正在下载中");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0200
   * @tc.name test_Download_State_002
   * @tc.desc function of API, Test State FAILED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Download_State_002', 3,function (done){
     let TAG = "test_Download_State_002::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state);
           if (pg.state.FAILED == 2) {
             console.info("state:pg.state.RUNNING==2-云文件下载失败");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_UPLOADING_STATE_TEST_0300
   * @tc.name test_Uploading_State_003
   * @tc.desc function of API, Test State Uploading
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Uploading_State_003', 3,function (done){
     let TAG = "test_Uploading_State_003::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state.SyncState);
           if (pg.state.SyncState == 0) {
             console.info("state:pg.state.SyncState==0-上行同步中");
             expect(true).assertTrue();
           }
         }
       });
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0400
   * @tc.name test_Uploading_Failed_State_004
   * @tc.desc function of API, Test State Uploading_Failed
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Uploading_Failed_State_004', 3,function (done){
     let TAG = "test_Uploading_Failed_State_004::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state.SyncState);
           if (pg.state.SyncState == 1) {
             console.info("state:pg.state.SyncState==1-上行同步失败");
             expect(true).assertTrue();
           }
         }
       });
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

  /**
   * @tc.number SUB_STORAGE_GALLERYSYNC_STATE_TEST_0500
   * @tc.name test_CloudSync_SyncState_005
   * @tc.desc function of API, Test State DOWNLOAD_FAILED
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_SyncState_005', 3,function (done){
    let TAG = "test_CloudSync_SyncState_005::";
    try {
      gallerySync.on("progress",(pg)=>{
        console.info("gallerySync_on:callback succeed.");
        if(pg != undefined){
          console.info("on:callback succeed. pg.state = " + pg.state);
          if (pg.state.DOWNLOAD_FAILED == 3) {
            console.info("state:pg.state.DOWNLOAD_FAILED ==3-云文件下行同步失败");
            expect(true).assertTrue();
          }
        }
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });

   /**
   * @tc.number SUB_STORAGE_DOWNLOADING_STATE_TEST_0600
   * @tc.name test_Downloading_State_006
   * @tc.desc function of API, Test State Downloading
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Downloading_State_006', 3,function (done){
     let TAG = "test_Downloading_State_006::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
          console.info("download_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state.SyncState);
           if (pg.state.SyncState == 2) {
             console.info("state:pg.state.SyncState==2-下行同步中");
             expect(true).assertTrue();
           }
         }
       });
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_PROCESSED_TEST_0100
   * @tc.name test_Download_Processed_001
   * @tc.desc function of API, Test State processed
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Download_Processed_001', 3,function (done){
     let TAG = "test_Download_Processed_001::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state);
           if (pg.state.FAILED == 2) {
             console.info("on:callback succeed. pg.processed = " + pg.processed);
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0100
   * @tc.name test_Download_Error_001
   * @tc.desc function of API, Test DownloadErrorType NO_ERROR
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Download_Error_001', 3,function (done){
     let TAG = "test_Download_Error_001::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
         if (pg.state.NO_ERROR == 0) {
           console.info("error: pg.error.NO_ERROR==0-没有错误");
           expect(true).assertTrue();
         }
       }
       });
    expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0200
   * @tc.name test_Download_Error_002
   * @tc.desc function of API, Test DownloadErrorType UNKNOWN_ERROR
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Download_Error_002', 3,function (done){
     let TAG = "test_Download_Error_002::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.state.UNKNOWN_ERROR == 1) {
             console.info("error: pg.error.UNKNOWN_ERROR==1-未知错误");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0300
   * @tc.name test_Download_Error_003
   * @tc.desc function of API, Test DownloadErrorType NETWORK_UNAVAILABLE
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Download_Error_003', 3,function (done){
     let TAG = "test_Download_Error_003::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.state.NETWORK_UNAVAILABLE == 2) {
             console.info("error: pg.error.NETWORK_UNAVAILABLE==2-网络不可用");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0400
   * @tc.name test_Download_Error_004
   * @tc.desc function of API, Test DownloadErrorType LOCAL_STORAGE_FULL
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('test_Download_Error_004', 3,function (done){
     let TAG = "test_Download_Error_004::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.error.LOCAL_STORAGE_FULL == 3) {
             console.info("error: pg.error.LOCAL_STORAGE_FULL==3-本地空间不足");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

    /**
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0500
    * @tc.name test_Download_Error_005
    * @tc.desc function of API, Test DownloadErrorType CONTENT_NOT_FOUND
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 3
    * @tc.require
    */
   it('test_Download_Error_005', 3,function (done){
     let TAG = "test_Download_Error_005::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error.CONTENT_NOT_FOUND);
           if (pg.error.CONTENT_NOT_FOUND == 4) {
             console.info("error: pg.error.CONTENT_NOT_FOUND==4-云端空间未找到对应文件");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

    /**
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0600
    * @tc.name test_Download_Error_006
    * @tc.desc function of API, Test DownloadErrorType FREQUENT_USER_REQUESTS
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 3
    * @tc.require
    */
   it('test_Download_Error_006', 3,function (done){
     let TAG = "test_Download_Error_006::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error.FREQUENT_USER_REQUESTS);
           if (pg.error.FREQUENT_USER_REQUESTS == 5) {
             console.info("error: pg.error.CONTENT_NOT_FOUND==5-用户请求过于频繁");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0700
    * @tc.name test_Download_Error_007
    * @tc.desc function of API, Test Test_error on() interfaces.
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 3
    * @tc.require
    */
   it('test_Download_Error_007', 3,function (done){
     let TAG = "test_Download_Error_007::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           expect(true).assertTrue();
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

  /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0800
   * @tc.name test_CloudSync_ErrorType_008
   * @tc.desc function of API, Test ErrorType WIFI_UNAVAILABLE
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_ErrorType_008', 3,function (done){
    let TAG = "test_CloudSync_ErrorType_008::";
    try {
      gallerySync.on("progress",(pg)=>{
        console.info("gallerySync_on: callback succeed.");
        if(pg != undefined){
          console.info("on:callback succeed. pg.error = " + pg.error);
          if (pg.error.WIFI_UNAVAILABLE == 2) {
            console.info("error: pg.error.WIFI_UNAVAILABLE == 2-WIFI不可用");
            expect(true).assertTrue();
          }
        }
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });

  /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0900
   * @tc.name test_CloudSync_ErrorType_009
   * @tc.desc function of API, Test ErrorType BATTERY_LEVEL_LOW
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_ErrorType_009', 3,function (done){
    let TAG = "test_CloudSync_ErrorType_009::";
    try {
      gallerySync.on("progress",(pg)=>{
        console.info("gallerySync_on: callback succeed.");
        if(pg != undefined){
          console.info("on:callback succeed. pg.error = " + pg.error);
          if (pg.error.BATTERY_LEVEL_LOW == 3) {
            console.info("error: pg.error.BATTERY_LEVEL_LOW == 3-低电量（低于15%）");
            expect(true).assertTrue();
          }
        }
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });


  /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1000
   * @tc.name test_CloudSync_ErrorType_010
   * @tc.desc function of API, Test ErrorType BATTERY_LEVEL_WARNING
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_ErrorType_010', 3,function (done){
    let TAG = "test_CloudSync_ErrorType_010::";
    try {
      gallerySync.on("progress",(pg)=>{
        console.info("gallerySync_on: callback succeed.");
        if(pg != undefined){
          console.info("on:callback succeed. pg.error = " + pg.error);
          if (pg.error.BATTERY_LEVEL_WARNING == 4) {
            console.info("error: pg.error.BATTERY_LEVEL_WARNING == 4-告警电量（低于10%）");
            expect(true).assertTrue();
          }
        }
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });


  /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1100
   * @tc.name test_CloudSync_ErrorType_011
   * @tc.desc function of API, Test ErrorType CLOUD_STORAGE_FULL
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_ErrorType_011', 3,function (done){
    let TAG = "test_CloudSync_ErrorType_011::";
    try {
      gallerySync.on("progress",(pg)=>{
        console.info("gallerySync_on: callback succeed.");
        if(pg != undefined){
          console.info("on:callback succeed. pg.error = " + pg.error);
          if (pg.error.CLOUD_STORAGE_FULL == 5) {
            console.info("error: pg.error.CLOUD_STORAGE_FULL == 5-云端空间不足");
            expect(true).assertTrue();
          }
        }
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });


  /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_1200
   * @tc.name test_CloudSync_ErrorType_012
   * @tc.desc function of API, Test ErrorType DEVICE_TEMPERATURE_TOO_HIGH
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_ErrorType_012', 3,function (done){
    let TAG = "test_CloudSync_ErrorType_012::";
    try {
      gallerySync.on("progress",(pg)=>{
        console.info("gallerySync_on: callback succeed.");
        if(pg != undefined){
          console.info("on:callback succeed. pg.error = " + pg.error);
          if (pg.error.DEVICE_TEMPERATURE_TOO_HIGH == 7) {
            console.info("error: pg.error.DEVICE_TEMPERATURE_TOO_HIGH == 7-设备温度过高");
            expect(true).assertTrue();
          }
        }
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });

  /**
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0100
   * @tc.name test_CloudSync_NotifyType_001
   * @tc.desc function of API, Test  NotifyType NOTIFY_ADDED.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_NotifyType_001', 3,function (done){
    console.info('--------------test_CloudSync_NotifyType_001 begin-------------------')
    try{
      let value1 = cloudSync.NotifyType.NOTIFY_ADDED;
      expect(value1).assertEqual(0);
      done();
    }catch(e){
      console.info("test_CloudSync_NotifyType_001 has failed for " + e.message + ",code:"+e.code);
      expect(false).assertTrue();
    }
  });


  /**
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0200
   * @tc.name test_CloudSync_NotifyType_002
   * @tc.desc function of API, Test  NotifyType NOTIFY_MODIFIED.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_NotifyType_002', 3,function (done){
    console.info('--------------test_CloudSync_NotifyType_002 begin-------------------')
    try{
      let value1 = cloudSync.NotifyType.NOTIFY_MODIFIED;
      expect(value1).assertEqual(1);
      done();
    }catch(e){
      console.info("test_CloudSync_NotifyType_002 has failed for " + e.message + ",code:"+e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0300
   * @tc.name test_CloudSync_NotifyType_003
   * @tc.desc function of API, Test  NotifyType NOTIFY_MODIFIED.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_NotifyType_003', 3,function (done){
    console.info('--------------test_CloudSync_NotifyType_003 begin-------------------')
    try{
      let value1 = cloudSync.NotifyType.NOTIFY_DELETED;
      expect(value1).assertEqual(2);
      done();
    }catch(e){
      console.info("test_CloudSync_NotifyType_002 has failed for " + e.message + ",code:"+e.code);
      expect(false).assertTrue();
    }
  });


  /**
   * @tc.number SUB_STORAGE_ NOTIFYTYPE_TEST_0400
   * @tc.name test_CloudSync_NotifyType_004
   * @tc.desc function of API, Test  NotifyType NOTIFY_RENAMED.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_CloudSync_NotifyType_004', 3,function (done){
    console.info('--------------test_CloudSync_NotifyType_004 begin-------------------')
    try{
      let value1 = cloudSync.NotifyType.NOTIFY_RENAMED;
      expect(value1).assertEqual(3);
      done();
    }catch(e){
      console.info("test_CloudSync_NotifyType_002 has failed for " + e.message + ",code:"+e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_GETLASTAYNCTIME_TEST_0100
   * @tc.name test_Getlastsynctime_001
   * @tc.desc function of API, Test getLastsynctime interfaces.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_Getlastsynctime_001', 3,function (done){
    let TAG = "test_Getlastsynctime_001::";
    let fileSync = new cloudSync.FileSync();
    try {
      fileSync.getLastSyncTime().then((timeStamp) => {
        let date = new Date(timeStamp);
        console.info("test_Getlastsynctime_001 get last sync time successfully:"+ date);
      }).catch((err) => {
        console.error("test_Getlastsynctime_001 get last sync time failed: " + err.message + ", error code: " + err.code);
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });

  /**
   * @tc.number SUB_STORAGE_GETLASTAYNCTIME_TEST_0200
   * @tc.name test_Getlastsynctime_002
   * @tc.desc function of API, Test getLastsynctime interfaces.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_Getlastsynctime_002', 3,function (done){
    let TAG = "test_Getlastsynctime_002::";
    let fileSync = new cloudSync.FileSync();
    try {
      fileSync.getLastSyncTime((err, timeStamp) => {
        if (err) {
          console.error("test_Getlastsynctime_002 get last sync time failed: " + err.message + ", error code: " + err.code);
        } else {
          let date = new Date(timeStamp);
          console.info("test_Getlastsynctime_002 get last sync time successfully:"+ date);
        }
      });
      expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
    done();
  });
  });
}