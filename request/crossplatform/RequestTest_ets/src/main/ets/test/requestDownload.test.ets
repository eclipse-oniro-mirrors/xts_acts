/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import request from "@ohos.request";
import fileIo from "@ohos.file.fs";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

const removeFile = (filePath: string): void => {
  if (fileIo.accessSync(filePath)) fileIo.unlinkSync(filePath);
};

export default function requestCrossplatformDownloadJSUnit() {
  describe("requestCrossplatformDownloadTest", function () {
    console.info("====>################################request download Test start");

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info("====>beforeAll: Prerequisites are executed.");
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info("====>beforeEach: Prerequisites is executed.");
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info("====>afterEach: Test case-level clearance conditions is executed.");
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info("====>afterAll: Test suite-level cleanup condition is executed");
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001", 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
        } catch (e) {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001 except error: " + e);
        }
        await downloadTask.delete();
        removeFile(downloadFilePath);
        console.info("-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001 end-----------------------");
        done();
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002
     * @tc.desc      Starts a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002", 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: true,
        enableRoaming: true,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: true,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
        } catch (e) {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002 except error: " + e);
        }
        await downloadTask.delete();
        removeFile(downloadFilePath);
        console.info("-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0002 end-----------------------");
        done();
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001", 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      try {
        request
          .downloadFile(globalThis.abilityContext, downloadFileConfig)
          .then(async (downloadTask) => {
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001 downloadTask: " + downloadTask);
            expect(downloadTask != undefined).assertEqual(true);
            await downloadTask.delete();
          })
          .catch((err) => {
            console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001 error: " + err);
          })
          .finally(() => {
            removeFile(downloadFilePath);
            done();
          });
      } catch (err) {
        console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001 catch error: " + err);
        done();
      }
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001
     * @tc.desc      Delete the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_delete_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.delete(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001 Failed to delete the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001 Download task delete success.");
              expect(typeof data == "boolean").assertTrue();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001 delete throw error" + err);
            } finally {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });
        } catch (error) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0001 delete catch error" + error);
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002
     * @tc.desc      Delete the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask
            .delete()
            .then(async (data) => {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002 Download task delete success.");
              expect(data).assertEqual(true);
              console.info("====>-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002 end-----------------------");
            })
            .catch(async (err) => {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_DELETE_0002 Failed to delete the download task.");
              expect().assertFail();
            })
            .finally(async () => {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
        } catch (error) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 delete catch error");
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001
     * @tc.desc      Suspend the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.suspend(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001 Failed to suspend the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001 Download task suspend success.");
              expect(data == true).assertTrue();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001 throw_error: " + JSON.stringify(err));
            }
            await downloadTask.delete();
            removeFile(downloadFilePath);
            done();
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0001 suspend catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002
     * @tc.desc      Suspend the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          try {
            let data = await downloadTask.suspend();
            expect(data == true).assertTrue();
          } catch (err) {
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002 throw_err:" + JSON.stringify(err));
          }
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_SUSPEND_0002 suspend catch error" + JSON.stringify(err));
        } finally {
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001
     * @tc.desc      Restore the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.restore(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001 Failed to restore the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001 Download  restore success.");
              expect(data == true).assertTrue();
            } catch (err) {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001 throw_err:" + JSON.stringify(err));
            }
            await downloadTask.delete();
            removeFile(downloadFilePath);
            done();
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0001 restore catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002
     * @tc.desc      Restore the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask
            .restore()
            .then(async (data) => {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002 Download task restore.");
              expect(data == true).assertTrue();
            })
            .catch(async (err) => {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_RESTORE_0002 Failed to restore the download task.");
            })
            .finally(async () => {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 restore catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001
     * @tc.desc      Get the download task info
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001", 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001 Failed to getTaskInfo the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001 Download getTaskInfo success.");
              expect(typeof data == "object").assertTrue();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001 throw_error" + JSON.stringify(err));
            }
            await downloadTask.delete();
            removeFile(downloadFilePath);
            done();
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0001 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002
     * *@tc.name     subRequestDownloadApiGetTaskInfo0002
     * @tc.desc      Get the download task info
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask
            .getTaskInfo()
            .then(async (data) => {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002 Download task getTaskInfo success.");
              expect(typeof data == "object").assertTrue();
            })
            .catch(async (err) => {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002 Failed to getTaskInfo the download task.");
            })
            .finally(async () => {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKINFO_0002 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001
     * @tc.desc      Get mimetype of the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001", 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001.txt`);

      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskMimeType(async (err, data) => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001 getTaskMimeType enter");
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001 getTaskMimeType err: " + err);
              expect(data != null).assertEqual(true);
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001 callback error: " + JSON.stringify(err));
            } finally {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_GETTASKMINETYPE_0001 error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002
     * @tc.desc      Get mimetype of the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002 downloadTask: " + downloadTask);
        try {
          let data = await downloadTask.getTaskMimeType();
          expect(data != undefined).assertEqual(true);
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNLOAD_API_GETTASKMINETYPE_0002 throw_error: " + JSON.stringify(err));
        } finally {
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001
     * *@tc.name     subRequestDownloadApiTaskInfo0001
     * @tc.desc      Get the download task info, and test the field of TaskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001", 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("complete", async () => {
            downloadTask.getTaskInfo(async (err, data) => {
              try {
                if (err) {
                  console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001 Failed to getTaskInfo the download task.");
                  expect().assertFail();
                  done();
                }
                console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001 Download getTaskInfo success.");
                expect(typeof data == "object").assertTrue();

                console.info('SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001 data:' + JSON.stringify(data));
                expect(data.description).assertEqual('XTS download test!');
                expect(data.downloadedBytes).assertEqual(1042003);
                expect(typeof data.downloadId == "number").assertTrue();
                expect(data.failedReason).assertEqual(0);
                expect(data.fileName).assertEqual('SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001.txt');
                expect(data.filePath).assertEqual(`${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001.txt`);
                expect(data.pausedReason).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.targetURI).assertEqual('https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk');
                expect(data.downloadTitle).assertEqual('XTS download test!');
                expect(data.downloadTotalBytes).assertEqual(1042003);
              } catch (err) {
                console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001 throw_error" + JSON.stringify(err));
              }
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0001 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002
     * @tc.desc      Get the error download task info, and test the field of TaskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002", 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test_not_exists.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('fail', err => {
            downloadTask.getTaskInfo(async (err, data) => {
              try {
                if (err) {
                  console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002 Failed to getTaskInfo the download task.");
                  expect().assertFail();
                  done();
                }
                console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002 Download getTaskInfo success.");
                expect(typeof data == "object").assertTrue();

                console.info('SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002 data:' + JSON.stringify(data));
                expect(data.description).assertEqual('XTS download test!');
                expect(data.downloadedBytes).assertEqual(0);
                expect(data.failedReason).assertEqual(8);
                expect(typeof data.downloadId == "number").assertTrue();
                expect(data.fileName).assertEqual('SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002.txt');
                expect(data.filePath).assertEqual(`${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002.txt`);
                expect(data.pausedReason).assertEqual(0);
                expect(data.status).assertEqual(4);
                expect(data.targetURI).assertEqual('https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test_not_exists.apk');
                expect(data.downloadTitle).assertEqual('XTS download test!');
                expect(data.downloadTotalBytes).assertEqual(-1);
              } catch (err) {
                console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002 throw_error" + JSON.stringify(err));
              }
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
          })

        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0002 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003
     * @tc.desc      Get the download task info, and test the field of TaskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003", 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        background: true,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("complete", async () => {
            downloadTask.getTaskInfo(async (err, data) => {
              try {
                if (err) {
                  console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003 Failed to getTaskInfo the download task.");
                  expect().assertFail();
                  done();
                }
                console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003 Download getTaskInfo success.");
                expect(typeof data == "object").assertTrue();

                console.info('SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003 data:' + JSON.stringify(data));

                expect(data.description).assertEqual('XTS download test!');
                expect(data.downloadedBytes).assertEqual(1042003);
                expect(typeof data.downloadId == "number").assertTrue();
                expect(data.failedReason).assertEqual(0);
                expect(data.fileName).assertEqual('test.apk');
                expect(data.filePath).assertEqual(`${globalThis.abilityContext.cacheDir}/test.apk`);
                expect(data.pausedReason).assertEqual(0);
                expect(data.status).assertEqual(0);
                expect(data.targetURI).assertEqual('https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk');
                expect(data.downloadTitle).assertEqual('download');
                expect(data.downloadTotalBytes).assertEqual(1042003);
              } catch (err) {
                console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003 throw_error" + JSON.stringify(err));
              }
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_TASKINFO_0003 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001_bk.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001_bk.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          downloadTask.on("progress", async (receivedSize: number, totalSize: number) => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001 downloadTask in progress");
              expect(receivedSize != null).assertTrue();
              expect(totalSize != null).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001 on api throw_error: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0001 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002_bk.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002_bk.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("complete", async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002 complete in callback");
              expect(true).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002 complete api throw_error: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0002 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/not-exist.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("fail", async () => {
            try {
              expect(true).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003 throw_error: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0003 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004
     * @tc.desc      Start download task, and test the event 'off progress' of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      let count = 0;
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          downloadTask.on("progress", () => {
            downloadTask.off("progress");
            count++;
          });

          downloadTask.on("complete", async () => {
            try {
              console.log("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004 count: " + count);
              expect(count).assertEqual(1);
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004 throw_error in complete: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });

        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0004 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005
     * @tc.desc      Start download task, and test the event 'off complete' of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      let result = true;
      let onFailedCallback = function() {
        result = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005 onFailedCallback");
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("complete", onFailedCallback);
          downloadTask.off("complete", onFailedCallback);

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005 in setTimeout");
              clearTimeout(t);
              expect(result).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);

        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0005 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006
     * @tc.desc      Start download task, and test the event 'off error' of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/not-exist.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      let result = true;
      let onFailedCallback = function() {
        result = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006 onFailedCallback");
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("fail", onFailedCallback);
          downloadTask.off("fail", onFailedCallback);

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006 in setTimeout");
              clearTimeout(t);
              expect(result).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0006 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007
     * @tc.desc      Start download task, and test the event 'off complete' of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      let result1 = true;
      let result2 = true;
      let onFailedCallback = function() {
        result1 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007 onFailedCallback");
      }
      let onFailedCallback2 = function() {
        result2 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007 onFailedCallback");
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("complete", onFailedCallback)
          downloadTask.on("complete", onFailedCallback2)

          downloadTask.off("complete", onFailedCallback);

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2).assertFalse();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);

        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0007 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008
     * @tc.desc      Start download task, and test the event 'off error' of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/not-exist.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      let result1 = true;
      let result2 = true;
      let onFailedCallback = function() {
        result1 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008 onFailedCallback");
      }
      let onFailedCallback2 = function() {
        result2 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008 onFailedCallback");
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("fail", onFailedCallback);
          downloadTask.on("fail", onFailedCallback2);
          downloadTask.off("fail", onFailedCallback);

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2).assertFalse();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0008 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          downloadTask.on("pause", async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009 downloadTask in pause");
              expect(true).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009 on api throw_error: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });
          await downloadTask.suspend();
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0009 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          downloadTask.on("remove", async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010 downloadTask in remove");
              expect(true).assertTrue();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010 on api throw_error: " + JSON.stringify(err));
              removeFile(downloadFilePath);
              done();
            }
          });

          await downloadTask.delete();
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0010 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011
     * @tc.desc      Start download task, and test the event 'off complete' of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      let result1 = true;
      let result2 = true;
      let onFailedCallback = function() {
        result1 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011 onFailedCallback");
      }
      let onFailedCallback2 = function() {
        result2 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011 onFailedCallback");
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("complete", onFailedCallback)
          downloadTask.on("complete", onFailedCallback2)

          downloadTask.off("complete");

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);

        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0011 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012
     * @tc.desc      Start download task, and test the event 'off error' of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/not-exist.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      let result1 = true;
      let result2 = true;
      let onFailedCallback = function() {
        result1 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012 onFailedCallback");
      }
      let onFailedCallback2 = function() {
        result2 = false;
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012 onFailedCallback");
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        try {
          console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012 downloadTask: " + downloadTask);
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on("fail", onFailedCallback);
          downloadTask.on("fail", onFailedCallback2);
          downloadTask.off("fail");

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0012 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          let result1 = true;
          let result2 = true;
          let onFailedCallback = function() {
            result1 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013 onFailedCallback");
          }
          let onFailedCallback2 = function() {
            result2 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013 onFailedCallback");
          }

          downloadTask.on("pause", onFailedCallback);
          downloadTask.on("pause", onFailedCallback2);
          downloadTask.off("pause", onFailedCallback);

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2 == false).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);

          await downloadTask.suspend();
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0013 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          let result1 = true;
          let result2 = true;
          let onFailedCallback = function() {
            result1 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014 onFailedCallback");
          }
          let onFailedCallback2 = function() {
            result2 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014 onFailedCallback");
          }

          downloadTask.on("pause", onFailedCallback);
          downloadTask.on("pause", onFailedCallback2);
          downloadTask.off("pause");

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2).assertTrue();
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014 throw_error in setTimeout: " + JSON.stringify(err));
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          }, 5000);

          await downloadTask.suspend();
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0014 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          let result1 = true;
          let result2 = true;
          let onFailedCallback = function() {
            result1 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015 onFailedCallback");
          }
          let onFailedCallback2 = function() {
            result2 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015 onFailedCallback");
          }

          downloadTask.on("remove", onFailedCallback);
          downloadTask.on("remove", onFailedCallback2);
          downloadTask.off("remove", onFailedCallback);

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2 == false).assertTrue();

              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015 throw_error in setTimeout: " + JSON.stringify(err));

              removeFile(downloadFilePath);
              done();
            }
          }, 5000);

          await downloadTask.delete();
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0015 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016
     * *@tc.name     SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016
     * @tc.desc      Start download task, and test the event of it.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016 downloadTask: " + downloadTask);
        expect(downloadTask != undefined).assertEqual(true);
        try {
          let result1 = true;
          let result2 = true;
          let onFailedCallback = function() {
            result1 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016 onFailedCallback");
          }
          let onFailedCallback2 = function() {
            result2 = false;
            console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016 onFailedCallback");
          }

          downloadTask.on("remove", onFailedCallback);
          downloadTask.on("remove", onFailedCallback2);
          downloadTask.off("remove");

          const t = setTimeout(async () => {
            try {
              console.info("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016 in setTimeout");
              clearTimeout(t);
              expect(result1).assertTrue();
              expect(result2).assertTrue();

              removeFile(downloadFilePath);
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016 throw_error in setTimeout: " + JSON.stringify(err));

              removeFile(downloadFilePath);
              done();
            }
          }, 5000);

          await downloadTask.delete();
        } catch (err) {
          console.error("====>SUB_REQUEST_CROSSPLATFORM_DOWNDLOAD_API_EVENT_0016 throw_error: " + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

  });
}
