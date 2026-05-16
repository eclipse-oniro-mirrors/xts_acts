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
 	 
 	 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
 	 import cloudSync from '@ohos.file.cloudSync';
 	 import fileUri from '@ohos.file.fileuri';
 	 import { BusinessError } from '@kit.BasicServicesKit';
 	 
 	 export default function cloudSyncBoundaryTest() {
 	   describe('cloud_sync_boundary_test', () => {
 	     /**
 	      * @tc.name   test_FileSync_on_null_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0100
 	      * @tc.desc   function of API, Test FileSync.on with null as event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_FileSync_on_null_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_FileSync_on_null_event::";
 	       let fileSync = new cloudSync.FileSync();
 	       let callback = (pg: cloudSync.SyncProgress) => {
 	         console.info("sync progress state：" + pg.state + " error type:" + pg.error);
 	       };
 	       
 	       try {
 	         fileSync.on(null, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null event parameter: " + err.code);
 	         expect(err.code === 401).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_FileSync_on_undefined_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0200
 	      * @tc.desc   function of API, Test FileSync.on with undefined as event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_FileSync_on_undefined_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_FileSync_on_undefined_event::";
 	       let fileSync = new cloudSync.FileSync();
 	       let callback = (pg: cloudSync.SyncProgress) => {
 	         console.info("sync progress state：" + pg.state + " error type:" + pg.error);
 	       };
 	       
 	       try {
 	         fileSync.on(undefined, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined event parameter: " + err.code);
 	         expect(err.code === 401).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_FileSync_off_null_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0300
 	      * @tc.desc   function of API, Test FileSync.off with null as event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_FileSync_off_null_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_FileSync_off_null_event::";
 	       let fileSync = new cloudSync.FileSync();
 	       let callback = (pg: cloudSync.SyncProgress) => {
 	         console.info("sync progress state：" + pg.state + " error type:" + pg.error);
 	       };
 	       
 	       try {
 	         fileSync.on('progress', callback);
 	         fileSync.off(null, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null event parameter: " + err.code);
 	         expect(err.code === 401).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_FileSync_off_undefined_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0400
 	      * @tc.desc   function of API, Test FileSync.off with undefined as event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_FileSync_off_undefined_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_FileSync_off_undefined_event::";
 	       let fileSync = new cloudSync.FileSync();
 	       let callback = (pg: cloudSync.SyncProgress) => {
 	         console.info("sync progress state：" + pg.state + " error type:" + pg.error);
 	       };
 	       
 	       try {
 	         fileSync.on('progress', callback);
 	         fileSync.off(undefined, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined event parameter: " + err.code);
 	         expect(err.code === 401).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_on_progress_null_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0500
 	      * @tc.desc   function of API, Test CloudFileCache.on with null as progress event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_on_progress_null_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_on_progress_null_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.DownloadProgress) => {
 	         console.info("download progress state：" + pg.state + " uri: " + pg.uri);
 	       };
 	       
 	       try {
 	         fileCache.on(null, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null event parameter: " + err.code);
 	         expect(err.code === 13900020).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_on_progress_undefined_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0600
 	      * @tc.desc   function of API, Test CloudFileCache.on with undefined as progress event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_on_progress_undefined_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_on_progress_undefined_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.DownloadProgress) => {
 	         console.info("download progress state：" + pg.state + " uri: " + pg.uri);
 	       };
 	       
 	       try {
 	         fileCache.on(undefined, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined event parameter: " + err.code);
 	         expect(err.code === 13900020).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_on_batchDownload_null_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0700
 	      * @tc.desc   function of API, Test CloudFileCache.on with null as batchDownload event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_on_batchDownload_null_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_on_batchDownload_null_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.MultiDownloadProgress) => {
 	         console.info("batch download state：" + pg.state + " task id: " + pg.taskId);
 	       };
 	       
 	       try {
 	         fileCache.on(null, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null event parameter: " + err.code);
 	         expect(err.code === 13900020).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_on_batchDownload_undefined_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0800
 	      * @tc.desc   function of API, Test CloudFileCache.on with undefined as batchDownload event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_on_batchDownload_undefined_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_on_batchDownload_undefined_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.MultiDownloadProgress) => {
 	         console.info("batch download state：" + pg.state + " task id: " + pg.taskId);
 	       };
 	       
 	       try {
 	         fileCache.on(undefined, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined event parameter: " + err.code);
 	         expect(err.code === 13900020).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_off_progress_null_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_0900
 	      * @tc.desc   function of API, Test CloudFileCache.off with null as progress event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_off_progress_null_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_off_progress_null_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.DownloadProgress) => {
 	         console.info("download progress state：" + pg.state + " uri: " + pg.uri);
 	       };
 	       
 	       try {
 	         fileCache.on('progress', callback);
 	         fileCache.off(null, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null event parameter: " + err.code);
 	         expect(err.code === 13900020).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_off_progress_undefined_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1000
 	      * @tc.desc   function of API, Test CloudFileCache.off with undefined as progress event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_off_progress_undefined_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_off_progress_undefined_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.DownloadProgress) => {
 	         console.info("download progress state：" + pg.state + " uri: " + pg.uri);
 	       };
 	       
 	       try {
 	         fileCache.on('progress', callback);
 	         fileCache.off(undefined, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined event parameter: " + err.code);
 	         expect(err.code === 13900020).assertTrue(); // 401 - The input parameter is invalid
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_off_batchDownload_null_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1100
 	      * @tc.desc   function of API, Test CloudFileCache.off with null as batchDownload event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_off_batchDownload_null_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_off_batchDownload_null_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.MultiDownloadProgress) => {
 	         console.info("batch download state：" + pg.state + " task id: " + pg.taskId);
 	       };
 	       
 	       try {
 	         fileCache.on('batchDownload', callback);
 	         fileCache.off(null, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null event parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // 401 or 13900020 - Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_off_batchDownload_undefined_event
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1200
 	      * @tc.desc   function of API, Test CloudFileCache.off with undefined as batchDownload event parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_off_batchDownload_undefined_event', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_off_batchDownload_undefined_event::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let callback = (pg: cloudSync.MultiDownloadProgress) => {
 	         console.info("batch download state：" + pg.state + " task id: " + pg.taskId);
 	       };
 	       
 	       try {
 	         fileCache.on('batchDownload', callback);
 	         fileCache.off(undefined, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined event parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // 401 or 13900020 - Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_start_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1300
 	      * @tc.desc   function of API, Test CloudFileCache.start with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_start_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_start_empty_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.start("");
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_start_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1400
 	      * @tc.desc   function of API, Test CloudFileCache.start with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_start_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_start_null_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.start(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_start_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1500
 	      * @tc.desc   function of API, Test CloudFileCache.start with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_start_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_start_undefined_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.start(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_start_callback_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1600
 	      * @tc.desc   function of API, Test CloudFileCache.start with empty string as uri parameter using callback
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_start_callback_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_start_callback_empty_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.start("", (err: BusinessError) => {
 	           expect(err !== undefined).assertTrue();
 	           expect(err.code === 401 || err.code === 14000002).assertTrue();
 	           done();
 	         });
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	         done();
 	       }
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_start_callback_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1700
 	      * @tc.desc   function of API, Test CloudFileCache.start with null as uri parameter using callback
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_start_callback_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_start_callback_null_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.start(null, (err: BusinessError) => {
 	           expect(err !== undefined).assertTrue();
 	           expect(err.code === 401 || err.code === 14000002).assertTrue();
 	           done();
 	         });
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	         done();
 	       }
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_start_callback_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1800
 	      * @tc.desc   function of API, Test CloudFileCache.start with undefined as uri parameter using callback
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_start_callback_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_start_callback_undefined_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.start(undefined, (err: BusinessError) => {
 	           expect(err !== undefined).assertTrue();
 	           expect(err.code === 401 || err.code === 14000002).assertTrue();
 	           done();
 	         });
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	         done();
 	       }
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_startBatch_null_uris
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_1900
 	      * @tc.desc   function of API, Test CloudFileCache.startBatch with null as uris parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_startBatch_null_uris', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_startBatch_null_uris::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.startBatch(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uris parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // 401 or 13900020 - Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_startBatch_undefined_uris
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2000
 	      * @tc.desc   function of API, Test CloudFileCache.startBatch with undefined as uris parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_startBatch_undefined_uris', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_startBatch_undefined_uris::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.startBatch(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uris parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // 401 or 13900020 - Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_startBatch_empty_array
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2100
 	      * @tc.desc   function of API, Test CloudFileCache.startBatch with empty array as uris parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_startBatch_empty_array', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_startBatch_empty_array::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.startBatch([]);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty array parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // 401 or 13900020 - Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_startBatch_thumbnail
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2200
 	      * @tc.desc   function of API, Test CloudFileCache.startBatch with THUMBNAIL as fileType parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_startBatch_thumbnail', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_startBatch_thumbnail::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let uris = ["file://media/image/1", "file://media/image/2"];
 	       
 	       try {
			fileCache.startBatch(uris, cloudSync.DownloadFileType.THUMBNAIL).then(() => {
				console.info("startBatch THUMBNAI successfully");
			}).catch((err: BusinessError) => {
				console.error(TAG + "startBatch download failed: " + err.message + ", error code: " + err.code);
				expect(err.code == 22400005).assertTrue();
			});
 	       } catch (err) {
 	         console.log(TAG + " threw error for THUMBNAIL fileType: " + err.code);
 	         expect(false).assertTrue(); // Should not reach here for valid operation
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_startBatch_lcd
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2300
 	      * @tc.desc   function of API, Test CloudFileCache.startBatch with LCD as fileType parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_startBatch_lcd', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_startBatch_lcd::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let uris = ["file://media/image/1", "file://media/image/2"];
 	       
 	       try {
			fileCache.startBatch(uris, cloudSync.DownloadFileType.LCD).then(() => {
				console.info("startBatch LCD successfully");
			}).catch((err: BusinessError) => {
				console.error(TAG + "startBatch download failed: " + err.message + ", error code: " + err.code);
				expect(err.code == 22400005).assertTrue();
			});
 	       } catch (err) {
 	         console.log(TAG + " threw error for LCD fileType: " + err.code);
 	         expect(false).assertTrue(); // Should not reach here for valid operation
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stop_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2400
 	      * @tc.desc   function of API, Test CloudFileCache.stop with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stop_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stop_empty_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stop("");
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stop_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2500
 	      * @tc.desc   function of API, Test CloudFileCache.stop with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stop_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stop_null_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stop(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stop_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2600
 	      * @tc.desc   function of API, Test CloudFileCache.stop with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stop_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stop_undefined_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stop(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stop_false_needClean
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2700
 	      * @tc.desc   function of API, Test CloudFileCache.stop with false as needClean parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stop_false_needClean', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stop_false_needClean::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       let path = "/data/storage/el2/cloud/1.txt";
 	       let uri = fileUri.getUriFromPath(path);
 	       
 	       try {
 	         fileCache.stop(uri, false);
 	       } catch (err) {
 	         console.log(TAG + " threw error for false needClean parameter: " + err.code);
 	         expect(err.code === 13600001).assertTrue(); // 13600001 - IPC error
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stop_callback_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2800
 	      * @tc.desc   function of API, Test CloudFileCache.stop with empty string as uri parameter using callback
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stop_callback_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stop_callback_empty_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stop("", (err: BusinessError) => {
 	           expect(err !== undefined).assertTrue();
 	           expect(err.code === 401 || err.code === 14000002).assertTrue();
 	           done();
 	         });
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	         done();
 	       }
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stop_callback_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_2900
 	      * @tc.desc   function of API, Test CloudFileCache.stop with null as uri parameter using callback
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stop_callback_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stop_callback_null_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stop(null, (err: BusinessError) => {
 	           expect(err !== undefined).assertTrue();
 	           expect(err.code === 401 || err.code === 14000002).assertTrue();
 	           done();
 	         });
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	         done();
 	       }
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stop_callback_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3000
 	      * @tc.desc   function of API, Test CloudFileCache.stop with undefined as uri parameter using callback
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stop_callback_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stop_callback_undefined_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stop(undefined, (err: BusinessError) => {
 	           expect(err !== undefined).assertTrue();
 	           expect(err.code === 401 || err.code === 14000002).assertTrue();
 	           done();
 	         });
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // 401 or 14000002 - Invalid argument or URI
 	         done();
 	       }
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stopBatch_null_downloadId
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3100
 	      * @tc.desc   function of API, Test CloudFileCache.stopBatch with null as downloadId parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stopBatch_null_downloadId', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stopBatch_null_downloadId::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stopBatch(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null downloadId parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // 401 or 13900020 - Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stopBatch_undefined_downloadId
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3200
 	      * @tc.desc   function of API, Test CloudFileCache.stopBatch with undefined as downloadId parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stopBatch_undefined_downloadId', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stopBatch_undefined_downloadId::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stopBatch(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined downloadId parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // 401 or 13900020 - Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_stopBatch_false_needClean
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3300
 	      * @tc.desc   function of API, Test CloudFileCache.stopBatch with false as needClean parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_stopBatch_false_needClean', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_stopBatch_false_needClean::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.stopBatch(1, false);
 	       } catch (err) {
 	         console.log(TAG + " threw error for false needClean parameter: " + err.code);
 	         expect(err.code === 13600001 || err.code === 13900020).assertTrue(); // 13600001 or 13900020
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_cleanFileCache_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3400
 	      * @tc.desc   function of API, Test CloudFileCache.cleanFileCache with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_cleanFileCache_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_cleanFileCache_empty_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.cleanFileCache("");
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_cleanFileCache_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3500
 	      * @tc.desc   function of API, Test CloudFileCache.cleanFileCache with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_cleanFileCache_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_cleanFileCache_null_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.cleanFileCache(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_CloudFileCache_cleanFileCache_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3600
 	      * @tc.desc   function of API, Test CloudFileCache.cleanFileCache with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_CloudFileCache_cleanFileCache_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_CloudFileCache_cleanFileCache_undefined_uri::";
 	       let fileCache = new cloudSync.CloudFileCache();
 	       
 	       try {
 	         fileCache.cleanFileCache(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getCoreFileSyncState_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3700
 	      * @tc.desc   function of API, Test cloudSync.getCoreFileSyncState with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getCoreFileSyncState_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getCoreFileSyncState_empty_uri::";
 	       
 	       try {
 	         cloudSync.getCoreFileSyncState("");
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getCoreFileSyncState_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3800
 	      * @tc.desc   function of API, Test cloudSync.getCoreFileSyncState with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getCoreFileSyncState_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getCoreFileSyncState_null_uri::";
 	       
 	       try {
 	         cloudSync.getCoreFileSyncState(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getCoreFileSyncState_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_3900
 	      * @tc.desc   function of API, Test cloudSync.getCoreFileSyncState with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getCoreFileSyncState_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getCoreFileSyncState_undefined_uri::";
 	       
 	       try {
 	         cloudSync.getCoreFileSyncState(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_registerChange_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4000
 	      * @tc.desc   function of API, Test cloudSync.registerChange with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_registerChange_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_registerChange_empty_uri::";
 	       let callback = (changeData: cloudSync.ChangeData) => {
 	         console.info("file change type：" + changeData.type);
 	       };
 	       
 	       try {
 	         cloudSync.registerChange("", true, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_registerChange_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4100
 	      * @tc.desc   function of API, Test cloudSync.registerChange with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_registerChange_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_registerChange_null_uri::";
 	       let callback = (changeData: cloudSync.ChangeData) => {
 	         console.info("file change type：" + changeData.type);
 	       };
 	       
 	       try {
 	         cloudSync.registerChange(null, true, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_registerChange_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4200
 	      * @tc.desc   function of API, Test cloudSync.registerChange with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_registerChange_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_registerChange_undefined_uri::";
 	       let callback = (changeData: cloudSync.ChangeData) => {
 	         console.info("file change type：" + changeData.type);
 	       };
 	       
 	       try {
 	         cloudSync.registerChange(undefined, true, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_registerChange_true_recursion
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4300
 	      * @tc.desc   function of API, Test cloudSync.registerChange with true as recursion parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_registerChange_true_recursion', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_registerChange_true_recursion::";
 	       let path = "/data/storage/el2/cloud/";
 	       let uri = fileUri.getUriFromPath(path);
 	       let callback = (changeData: cloudSync.ChangeData) => {
 	         console.info("file change type：" + changeData.type);
 	       };
 	       
 	       try {
 	         cloudSync.registerChange(uri, true, callback);
 	       } catch (err) {
 	         console.log(TAG + " threw error for true recursion parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue();
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_unregisterChange_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4400
 	      * @tc.desc   function of API, Test cloudSync.unregisterChange with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_unregisterChange_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_unregisterChange_empty_uri::";
 	       
 	       try {
 	         cloudSync.unregisterChange("");
             console.log(TAG + " test_cloudSync_unregisterChange_empty_uri res");
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.message + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_unregisterChange_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4500
 	      * @tc.desc   function of API, Test cloudSync.unregisterChange with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_unregisterChange_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_unregisterChange_null_uri::";
 	       
 	       try {
 	         cloudSync.unregisterChange(null);
 	         console.log(TAG + " test_cloudSync_unregisterChange_null_uri res");
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_unregisterChange_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4600
 	      * @tc.desc   function of API, Test cloudSync.unregisterChange with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_unregisterChange_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_unregisterChange_undefined_uri::";
 	       
 	       try {
 	         cloudSync.unregisterChange(undefined);
 	         console.log(TAG + " test_cloudSync_unregisterChange_undefined_uri res");
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 14000002).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getHistoryVersionList_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4700
 	      * @tc.desc   function of API, Test cloudSync.getHistoryVersionList with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getHistoryVersionList_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getHistoryVersionList_empty_uri::";
 	       
 	       try {
             let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.getHistoryVersionList("", 1);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getHistoryVersionList_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4800
 	      * @tc.desc   function of API, Test cloudSync.getHistoryVersionList with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getHistoryVersionList_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getHistoryVersionList_null_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.getHistoryVersionList(null, 1);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getHistoryVersionList_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_4900
 	      * @tc.desc   function of API, Test cloudSync.getHistoryVersionList with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getHistoryVersionList_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getHistoryVersionList_undefined_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.getHistoryVersionList(undefined, 1);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getHistoryVersionList_null_versionNumLimit
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5000
 	      * @tc.desc   function of API, Test cloudSync.getHistoryVersionList with null as versionNumLimit parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getHistoryVersionList_null_versionNumLimit', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getHistoryVersionList_null_versionNumLimit::";
 	       let path = "/data/storage/el2/cloud/1.txt";
 	       let uri = fileUri.getUriFromPath(path);
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.getHistoryVersionList(uri, null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null versionNumLimit parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_getHistoryVersionList_undefined_versionNumLimit
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5100
 	      * @tc.desc   function of API, Test cloudSync.getHistoryVersionList with undefined as versionNumLimit parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_getHistoryVersionList_undefined_versionNumLimit', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_getHistoryVersionList_undefined_versionNumLimit::";
 	       let path = "/data/storage/el2/cloud/1.txt";
 	       let uri = fileUri.getUriFromPath(path);
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.getHistoryVersionList(uri, undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined versionNumLimit parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_downloadHistoryVersion_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5200
 	      * @tc.desc   function of API, Test cloudSync.downloadHistoryVersion with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_downloadHistoryVersion_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_downloadHistoryVersion_empty_uri::";
 	       let callback = (progress: cloudSync.VersionDownloadProgress) => {
 	         console.info("download progress: " + progress.progress);
 	       };
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.downloadHistoryVersion("", "version1", callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_downloadHistoryVersion_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5300
 	      * @tc.desc   function of API, Test cloudSync.downloadHistoryVersion with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_downloadHistoryVersion_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_downloadHistoryVersion_null_uri::";
 	       let callback = (progress: cloudSync.VersionDownloadProgress) => {
 	         console.info("download progress: " + progress.progress);
 	       };
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.downloadHistoryVersion(null, "version1", callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_downloadHistoryVersion_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5400
 	      * @tc.desc   function of API, Test cloudSync.downloadHistoryVersion with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_downloadHistoryVersion_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_downloadHistoryVersion_undefined_uri::";
 	       let callback = (progress: cloudSync.VersionDownloadProgress) => {
 	         console.info("download progress: " + progress.progress);
 	       };
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.downloadHistoryVersion(undefined, "version1", callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_downloadHistoryVersion_empty_versionId
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5500
 	      * @tc.desc   function of API, Test cloudSync.downloadHistoryVersion with empty string as versionId parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_downloadHistoryVersion_empty_versionId', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_downloadHistoryVersion_empty_versionId::";
 	       let path = "/data/storage/el2/cloud/1.txt";
 	       let uri = fileUri.getUriFromPath(path);
 	       let callback = (progress: cloudSync.VersionDownloadProgress) => {
 	         console.info("download progress: " + progress.progress);
 	       };
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.downloadHistoryVersion(uri, "", callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty versionId parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_downloadHistoryVersion_null_versionId
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5600
 	      * @tc.desc   function of API, Test cloudSync.downloadHistoryVersion with null as versionId parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_downloadHistoryVersion_null_versionId', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_downloadHistoryVersion_null_versionId::";
 	       let path = "/data/storage/el2/cloud/1.txt";
 	       let uri = fileUri.getUriFromPath(path);
 	       let callback = (progress: cloudSync.VersionDownloadProgress) => {
 	         console.info("download progress: " + progress.progress);
 	       };
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.downloadHistoryVersion(uri, null, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null versionId parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_downloadHistoryVersion_undefined_versionId
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5700
 	      * @tc.desc   function of API, Test cloudSync.downloadHistoryVersion with undefined as versionId parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_downloadHistoryVersion_undefined_versionId', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_downloadHistoryVersion_undefined_versionId::";
 	       let path = "/data/storage/el2/cloud/1.txt";
 	       let uri = fileUri.getUriFromPath(path);
 	       let callback = (progress: cloudSync.VersionDownloadProgress) => {
 	         console.info("download progress: " + progress.progress);
 	       };
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.downloadHistoryVersion(uri, undefined, callback);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined versionId parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_replaceFileWithHistoryVersion_empty_originalUri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5800
 	      * @tc.desc   function of API, Test cloudSync.replaceFileWithHistoryVersion with empty string as originalUri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_replaceFileWithHistoryVersion_empty_originalUri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_replaceFileWithHistoryVersion_empty_originalUri::";
 	       let versionUri = "file://media/image/version";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.replaceFileWithHistoryVersion("", versionUri);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty originalUri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_replaceFileWithHistoryVersion_null_originalUri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_5900
 	      * @tc.desc   function of API, Test cloudSync.replaceFileWithHistoryVersion with null as originalUri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_replaceFileWithHistoryVersion_null_originalUri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_replaceFileWithHistoryVersion_null_originalUri::";
 	       let versionUri = "file://media/image/version";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.replaceFileWithHistoryVersion(null, versionUri);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null originalUri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_replaceFileWithHistoryVersion_undefined_originalUri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6000
 	      * @tc.desc   function of API, Test cloudSync.replaceFileWithHistoryVersion with undefined as originalUri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_replaceFileWithHistoryVersion_undefined_originalUri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_replaceFileWithHistoryVersion_undefined_originalUri::";
 	       let versionUri = "file://media/image/version";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.replaceFileWithHistoryVersion(undefined, versionUri);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined originalUri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_replaceFileWithHistoryVersion_empty_versionUri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6100
 	      * @tc.desc   function of API, Test cloudSync.replaceFileWithHistoryVersion with empty string as versionUri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_replaceFileWithHistoryVersion_empty_versionUri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_replaceFileWithHistoryVersion_empty_versionUri::";
 	       let originalUri = "file://media/image/original";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.replaceFileWithHistoryVersion(originalUri, "");
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty versionUri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_replaceFileWithHistoryVersion_null_versionUri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6200
 	      * @tc.desc   function of API, Test cloudSync.replaceFileWithHistoryVersion with null as versionUri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_replaceFileWithHistoryVersion_null_versionUri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_replaceFileWithHistoryVersion_null_versionUri::";
 	       let originalUri = "file://media/image/original";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.replaceFileWithHistoryVersion(originalUri, null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null versionUri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_replaceFileWithHistoryVersion_undefined_versionUri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6300
 	      * @tc.desc   function of API, Test cloudSync.replaceFileWithHistoryVersion with undefined as versionUri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_replaceFileWithHistoryVersion_undefined_versionUri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_replaceFileWithHistoryVersion_undefined_versionUri::";
 	       let originalUri = "file://media/image/original";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.replaceFileWithHistoryVersion(originalUri, undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined versionUri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_isFileConflict_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6400
 	      * @tc.desc   function of API, Test cloudSync.isFileConflict with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_isFileConflict_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_isFileConflict_empty_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.isFileConflict("");
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_isFileConflict_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6500
 	      * @tc.desc   function of API, Test cloudSync.isFileConflict with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_isFileConflict_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_isFileConflict_null_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.isFileConflict(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_isFileConflict_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6600
 	      * @tc.desc   function of API, Test cloudSync.isFileConflict with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_isFileConflict_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_isFileConflict_undefined_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.isFileConflict(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_clearFileConflict_empty_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6700
 	      * @tc.desc   function of API, Test cloudSync.clearFileConflict with empty string as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_clearFileConflict_empty_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_clearFileConflict_empty_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.clearFileConflict("");
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for empty uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_clearFileConflict_null_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6800
 	      * @tc.desc   function of API, Test cloudSync.clearFileConflict with null as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_clearFileConflict_null_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_clearFileConflict_null_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.clearFileConflict(null);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for null uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	 
 	     /**
 	      * @tc.name   test_cloudSync_clearFileConflict_undefined_uri
 	      * @tc.number SUB_STORAGE_CLOUDSYNC_BOUNDARY_TEST_6900
 	      * @tc.desc   function of API, Test cloudSync.clearFileConflict with undefined as uri parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL3
 	      */
 	     it('test_cloudSync_clearFileConflict_undefined_uri', Level.LEVEL3, async (done: Function) => {
 	       let TAG = "test_cloudSync_clearFileConflict_undefined_uri::";
 	       
 	       try {
 	         let fileVersion = new cloudSync.FileVersion();
 	         fileVersion.clearFileConflict(undefined);
 	         expect(false).assertTrue(); // Should not reach here
 	       } catch (err) {
 	         console.log(TAG + " correctly threw error for undefined uri parameter: " + err.code);
 	         expect(err.code === 401 || err.code === 13900020).assertTrue(); // Invalid argument or URI
 	       }
 	       done();
 	     });
 	   });
 	 }