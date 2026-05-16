/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import request from "@ohos.request";
import common from "@ohos.app.ability.common";
import fs from "@ohos.file.fs";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let baseContext: common.UIAbilityContext | undefined;

export default function RequestDownloadStaticTest() {

  describe("RequestDownloadStaticTest", (): void => {
  hilog.info(domain, tag, '%{public}s', 'RequestDownloadStaticTest start');

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          baseContext = abilitys.context;
          let pathDir: string = baseContext!.cacheDir;
          let filePath = pathDir + `/test.txt`;
          let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let content = ''.padEnd(1 * 1024, 'Hello world');
          fs.writeSync(file.fd, content);
          fs.closeSync(file.fd);
          hilog.info(domain, tag, '%{public}s', '====>onAbilityCreate: text.txt file generate success');

        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.newRequestAuthority.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010
     * @tc.number SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
     hilog.info(domain, tag, "====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 is starting-----------------------");
      try {
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.INITIALIZED:" + request.agent.State.INITIALIZED);
        expect(request.agent.State.INITIALIZED + '').assertEqual('0');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.WAITING:" + request.agent.State.WAITING);
        expect(request.agent.State.WAITING + '').assertEqual('16');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.RUNNING:" + request.agent.State.RUNNING);
        expect(request.agent.State.RUNNING + '').assertEqual('32');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.RETRYING:" + request.agent.State.RETRYING);
        expect(request.agent.State.RETRYING + '').assertEqual('33');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.PAUSED:" + request.agent.State.PAUSED);
        expect(request.agent.State.PAUSED + '').assertEqual('48');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.STOPPED:" + request.agent.State.STOPPED);
        expect(request.agent.State.STOPPED + '').assertEqual('49');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.COMPLETED:" + request.agent.State.COMPLETED);
        expect(request.agent.State.COMPLETED + '').assertEqual('64');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.FAILED:" + request.agent.State.FAILED);
        expect(request.agent.State.FAILED + '').assertEqual('65');
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 request.agent.State.REMOVED:" + request.agent.State.REMOVED);
        expect(request.agent.State.REMOVED + '').assertEqual('80');
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 error: " + err);
        expect().assertFail();
      }
      hilog.info(domain, tag, "====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_state_Static_0010 end-----------------------");
      done();
    })

    /**
     * @tc.name   SUB_REQUEST_UPLOAD_API_Static_00001
     * @tc.number SUB_REQUEST_UPLOAD_API_Static_00001
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUEST_UPLOAD_API_Static_00001', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_00001 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_00001 request.NETWORK_MOBILE:" + request.NETWORK_MOBILE);
        expect(request.NETWORK_MOBILE).assertEqual(1);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_00001 request.NETWORK_WIFI:" + request.NETWORK_WIFI);
        expect(request.NETWORK_WIFI).assertEqual(65536);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_00001 request.ERROR_CANNOT_RESUME:" + request.ERROR_CANNOT_RESUME);
        expect(request.ERROR_CANNOT_RESUME).assertEqual(0);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_00001 request.ERROR_DEVICE_NOT_FOUND:" + request.ERROR_DEVICE_NOT_FOUND);
        expect(request.ERROR_DEVICE_NOT_FOUND).assertEqual(1);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_Static_00001 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_00001 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_REQUEST_UPLOAD_API_Static_0002
     * @tc.number SUB_REQUEST_UPLOAD_API_Static_0002
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUEST_UPLOAD_API_Static_0002', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0002 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0002 request.ERROR_FILE_ALREADY_EXISTS:" + request.ERROR_FILE_ALREADY_EXISTS);
        expect(request.ERROR_FILE_ALREADY_EXISTS).assertEqual(2);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0002 request.ERROR_FILE_ERROR:" + request.ERROR_FILE_ERROR);
        expect(request.ERROR_FILE_ERROR).assertEqual(3);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0002 request.ERROR_HTTP_DATA_ERROR:" + request.ERROR_HTTP_DATA_ERROR);
        expect(request.ERROR_HTTP_DATA_ERROR).assertEqual(4);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0002 request.ERROR_INSUFFICIENT_SPACE:" + request.ERROR_INSUFFICIENT_SPACE);
        expect(request.ERROR_INSUFFICIENT_SPACE).assertEqual(5);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_Static_0002 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0002 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_REQUEST_UPLOAD_API_Static_0003
     * @tc.number SUB_REQUEST_UPLOAD_API_Static_0003
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUEST_UPLOAD_API_Static_0003', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0003 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0003 request.ERROR_TOO_MANY_REDIRECTS:" + request.ERROR_TOO_MANY_REDIRECTS);
        expect(request.ERROR_TOO_MANY_REDIRECTS).assertEqual(6);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0003 request.ERROR_UNHANDLED_HTTP_CODE:" + request.ERROR_UNHANDLED_HTTP_CODE);
        expect(request.ERROR_UNHANDLED_HTTP_CODE).assertEqual(7);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0003 request.ERROR_UNKNOWN:" + request.ERROR_UNKNOWN);
        expect(request.ERROR_UNKNOWN).assertEqual(8);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0003 request.PAUSED_QUEUED_FOR_WIFI:" + request.PAUSED_QUEUED_FOR_WIFI);
        expect(request.PAUSED_QUEUED_FOR_WIFI).assertEqual(0);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_Static_0003 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0003 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_REQUEST_UPLOAD_API_Static_0004
     * @tc.number SUB_REQUEST_UPLOAD_API_Static_0004
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUEST_UPLOAD_API_Static_0004', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0004 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0004 request.PAUSED_UNKNOWN:" + request.PAUSED_UNKNOWN);
        expect(request.PAUSED_UNKNOWN).assertEqual(4);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0004 request.PAUSED_WAITING_FOR_NETWORK:" + request.PAUSED_WAITING_FOR_NETWORK);
        expect(request.PAUSED_WAITING_FOR_NETWORK).assertEqual(1);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0004 request.PAUSED_WAITING_TO_RETRY:" + request.PAUSED_WAITING_TO_RETRY);
        expect(request.PAUSED_WAITING_TO_RETRY).assertEqual(2);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0004 request.PAUSED_BY_USER:" + request.PAUSED_BY_USER);
        expect(request.PAUSED_BY_USER).assertEqual(3);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_Static_0004 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0004 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_REQUEST_UPLOAD_API_Static_0005
     * @tc.number SUB_REQUEST_UPLOAD_API_Static_0005
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUEST_UPLOAD_API_Static_0005', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0005 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0005 request.SESSION_FAILED:" + request.SESSION_FAILED);
        expect(request.SESSION_FAILED).assertEqual(4);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0005 request.SESSION_PAUSED:" + request.SESSION_PAUSED);
        expect(request.SESSION_PAUSED).assertEqual(3);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0005 request.SESSION_PENDING:" + request.SESSION_PENDING);
        expect(request.SESSION_PENDING).assertEqual(2);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0005 request.SESSION_RUNNING:" + request.SESSION_RUNNING);
        expect(request.SESSION_RUNNING).assertEqual(1);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0005 request.SESSION_SUCCESSFUL:" + request.SESSION_SUCCESSFUL);
        expect(request.SESSION_SUCCESSFUL).assertEqual(0);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_Static_0005 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0005 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_REQUEST_UPLOAD_API_Static_0006
     * @tc.number SUB_REQUEST_UPLOAD_API_Static_0006
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_REQUEST_UPLOAD_API_Static_0006', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0006 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.EXCEPTION_PERMISSION:" + request.EXCEPTION_PERMISSION);
        expect(request.EXCEPTION_PERMISSION).assertEqual(201);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.EXCEPTION_PARAMCHECK:" + request.EXCEPTION_PARAMCHECK);
        expect(request.EXCEPTION_PARAMCHECK).assertEqual(401);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.EXCEPTION_UNSUPPORTED:" + request.EXCEPTION_UNSUPPORTED);
        expect(request.EXCEPTION_UNSUPPORTED).assertEqual(801);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.EXCEPTION_FILEIO:" + request.EXCEPTION_FILEIO);
        expect(request.EXCEPTION_FILEIO).assertEqual(13400001);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.EXCEPTION_FILEPATH:" + request.EXCEPTION_FILEPATH);
        expect(request.EXCEPTION_FILEPATH).assertEqual(13400002);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.EXCEPTION_SERVICE:" + request.EXCEPTION_SERVICE);
        expect(request.EXCEPTION_SERVICE).assertEqual(13400003);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.EXCEPTION_OTHERS:" + request.EXCEPTION_OTHERS);
        expect(request.EXCEPTION_OTHERS).assertEqual(13499999);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.ERROR_OFFLINE:" + request.ERROR_OFFLINE);
        expect(request.ERROR_OFFLINE).assertEqual(9);
        console.info("====>SUB_REQUEST_UPLOAD_API_Static_0006 request.ERROR_UNSUPPORTED_NETWORK_TYPE:" + request.ERROR_UNSUPPORTED_NETWORK_TYPE);
        expect(request.ERROR_UNSUPPORTED_NETWORK_TYPE).assertEqual(10);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_Static_0006 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_Static_0006 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010
     * @tc.number SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010
     * @tc.desc   Test requestUploadTest API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 is starting-----------------------");
      try {
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.OTHERS: " + request.agent.Faults.OTHERS);
        expect(request.agent.Faults.OTHERS).assertEqual(255);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.DISCONNECTED: " + request.agent.Faults.DISCONNECTED);
        expect(request.agent.Faults.DISCONNECTED).assertEqual(0);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.TIMEOUT: " + request.agent.Faults.TIMEOUT);
        expect(request.agent.Faults.TIMEOUT).assertEqual(16);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.PROTOCOL: " + request.agent.Faults.PROTOCOL);
        expect(request.agent.Faults.PROTOCOL).assertEqual(32);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.FSIO: " + request.agent.Faults.FSIO);
        expect(request.agent.Faults.FSIO).assertEqual(64);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.PARAM: " + request.agent.Faults.PARAM);
        expect(request.agent.Faults.PARAM).assertEqual(48);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.DNS: " + request.agent.Faults.DNS);
        expect(request.agent.Faults.DNS).assertEqual(80);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.TCP: " + request.agent.Faults.TCP);
        expect(request.agent.Faults.TCP).assertEqual(96);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.SSL: " + request.agent.Faults.SSL);
        expect(request.agent.Faults.SSL).assertEqual(112);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.REDIRECT: " + request.agent.Faults.REDIRECT);
        expect(request.agent.Faults.REDIRECT).assertEqual(128);
        console.info("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 request.agent.Faults.LOW_SPEED: " + request.agent.Faults.LOW_SPEED);
        expect(request.agent.Faults.LOW_SPEED).assertEqual(144);
      } catch (err) {
        console.error("====>SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 error: " + err);
        expect().assertFail();
      }
      console.info("====>-----------------------SUB_MISC_REQUEST_DOWNLOAD_faults_Static_0010 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_Request_Download_on_waitingReason_Static_1000
     * @tc.number SUB_Request_Download_on_waitingReason_Static_1000
     * @tc.desc   download task of WaitingReason.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_on_waitingReason_Static_1000', Level.LEVEL2, async (done: () => void) => {
      console.info("====>-----------------------SUB_Request_Download_on_waitingReason_Static_1000 is starting-----------------------");
      try {
        console.info("====>SUB_Request_Download_on_waitingReason_Static_1000 request.agent.WaitingReason.TASK_QUEUE_FULL: " + request.agent.WaitingReason.TASK_QUEUE_FULL);
        expect(request.agent.WaitingReason.TASK_QUEUE_FULL).assertEqual(0);
        console.info("====>SUB_Request_Download_on_waitingReason_Static_1000 request.agent.WaitingReason.NETWORK_NOT_MATCH: " + request.agent.WaitingReason.NETWORK_NOT_MATCH);
        expect(request.agent.WaitingReason.NETWORK_NOT_MATCH).assertEqual(1);
        console.info("====>SUB_Request_Download_on_waitingReason_Static_1000 request.agent.WaitingReason.APP_BACKGROUND: " + request.agent.WaitingReason.APP_BACKGROUND);
        expect(request.agent.WaitingReason.APP_BACKGROUND).assertEqual(2);
        console.info("====>SUB_Request_Download_on_waitingReason_Static_1000 request.agent.WaitingReason.USER_INACTIVATED: " + request.agent.WaitingReason.USER_INACTIVATED);
        expect(request.agent.WaitingReason.USER_INACTIVATED).assertEqual(3);
        console.info("====>-----------------------SUB_Request_Download_on_waitingReason_Static_1000 end-----------------------");
        done();
      } catch (err) {
        console.error("====>SUB_Request_Download_on_waitingReason_Static_1000 error: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Download_Promise_Static_0010
     * @tc.number SUB_Misc_REQUEST_Create_Download_Promise_Static_0010
     * @tc.desc   create a download task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_Create_Download_Promise_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "-----------------------SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Create_Download_Promise_Static_0010.txt',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        expect(task !== undefined).assertEqual(true);
        hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 create success: " + task);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 catch error: " + JSON.stringify(err));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s',"-----------------------SUB_Misc_REQUEST_Create_Download_Promise_Static_0010 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Start_Download_Promise_Static_0010
     * @tc.number SUB_Misc_REQUEST_Start_Download_Promise_Static_0010
     * @tc.desc   Start the download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Start_Download_Promise_Static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Start_Download_Promise_Static_0010.txt',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        await task.start();
        expect(task !== undefined).assertEqual(true);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 download start success: " + task);
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 download start err: " + JSON.stringify(err));
        expect().assertFail();
      }
      hilog.info(domain, tag, "-----------------------SUB_Misc_REQUEST_Start_Download_Promise_Static_0010 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Download_Callback_Static_0010
     * @tc.number SUB_Misc_REQUEST_Create_Download_Callback_Static_0010
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_Create_Download_Callback_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "-----------------------SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Create_Download_Callback_Static_0010.txt',
        data: '',
      };

      request.agent.create(baseContext!, config, (err : BusinessError | null, task : request.agent.Task | undefined) : void => {
        hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 downloadTask: " + task);
        try{
          if (err !== null) {
            hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          expect(task !== undefined).assertEqual(true);
          hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 create success: " + task);
        } catch(error ) {
          hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 create fail: " + JSON.stringify(error));
        }
        hilog.info(domain, tag, '%{public}s', "-----------------------SUB_Misc_REQUEST_Create_Download_Callback_Static_0010 end-----------------------");
        done();
      });
    });


    /**
     * @tc.name   SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010
     * @tc.number SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010
     * @tc.desc   Start the download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 is starting-----------------------");
      let arr: request.agent.FormItem = {
        name: "uploadTest",
        value: {
          path: "./test.txt",
          filename: "test.txt",
        }
      };
      let attachments: Array<request.agent.FormItem> = [arr];
      let config: request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        saveas: './SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010.txt',
        method: "POST",
        data: attachments,
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        await task.start();
        expect(task !== undefined).assertEqual(true);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 download start success: " + task);
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 download start err: " + JSON.stringify(err));
        expect().assertFail();
      }
      hilog.info(domain, tag, "-----------------------SUB_Misc_REQUEST_Start_Upload_Promise_Static_0010 end-----------------------");
      done();
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_On_Download_Completed_Static_0040
     * @tc.number SUB_Misc_REQUEST_On_Download_Completed_Static_0040
     * @tc.desc   download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Misc_REQUEST_On_Download_Completed_Static_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----SUB_Misc_REQUEST_On_Download_Completed_Static_0040 is starting--------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        saveas: './SUB_Misc_REQUEST_On_Download_Completed_Static_0040',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 create success");
        let on_completedCallback = (pro: request.agent.Progress): void => {
          try {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 pro.state: " + pro.state);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 pro.index: " + pro.index);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 pro.processed: " + pro.processed);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 pro.sizes[0]: " + pro.sizes[0]);
            expect(pro.state).assertEqual(64);
            expect(pro.index).assertEqual(0);
            expect(pro.processed).assertEqual(15444);
            expect(pro.sizes[0]).assertEqual(15444);
            done();
          } catch (err) {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onCompleted(on_completedCallback);
        await task.start();
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 task.start");
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Completed_Static_0040 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0100
     * @tc.number SUB_Request_Agent_onResponse_Static_0100
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Agent_onResponse_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-------SUB_Request_Agent_onResponse_Static_0100 is starting-----------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        saveas: './SUB_Request_Agent_onResponse_Static_0100',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, "====>SUB_Request_Agent_onResponse_Static_0100 create success");
        let responseCallback_1 = (info: request.agent.HttpResponse) => {
          try {
            hilog.info(domain, tag, "====>SUB_Request_Agent_onResponse_Static_0100 response info: " + JSON.stringify(info));
            expect(info.version).assertEqual('HTTP/1.1');
            expect(info.statusCode).assertEqual(200);
            expect(info.reason).assertEqual('OK');
            done();
          } catch (err) {
            hilog.info(domain, tag, "====>SUB_Request_Agent_onResponse_Static_0100 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onResponse(responseCallback_1);
        await task.start();
        hilog.info(domain, tag, "====>SUB_Request_Agent_onResponse_Static_0100 task.start");
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Request_Agent_onResponse_Static_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Start_Download_Callback_Static_0010
     * @tc.number SUB_Misc_REQUEST_Start_Download_Callback_Static_0010
     * @tc.desc   Start the download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_Start_Download_Callback_Static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>----------SUB_Misc_REQUEST_Start_Download_Callback_Static_0010 is starting----------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Start_Download_Callback_Static_0010.txt',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        task.start((err: BusinessError | null): void => {
          if (err !== null) {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Download_Callback_Static_0010 create err: " + err?.code + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Download_Callback_Static_0010 create success: " + task);
            expect(err == null).assertTrue();
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Start_Download_Callback_Static_0010 download catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1000
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_1000
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1000 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: '/data/storage/el2/base',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, "====>SUB_Request_Agent_TaskSaveas_Static_1000 create not err");
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "====>SUB_Request_Agent_TaskSaveas_Static_1000 create catch err: " + err.code + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1100
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_1100
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>--------------SUB_Request_Agent_TaskSaveas_Static_1100 is starting-------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: '/data/storage/el2/base',
      };
      try {
        request.agent.create(baseContext!, config, (err : BusinessError | null, task : request.agent.Task | undefined) : void => {
          hilog.info(domain, tag, '%{public}s', "====>SUB_Request_Agent_TaskSaveas_Static_1100 downloadTask: " + task);
          expect().assertFail();
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "====>SUB_Request_Agent_TaskSaveas_Static_1100 create catch err: " + err.code + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      };
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0500
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0500
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0500 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: '/ request/SUB_Request_Agent_TaskSaveas_Static_0500',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, "====>SUB_Request_Agent_TaskSaveas_Static_0500 create not err");
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "====>SUB_Request_Agent_TaskSaveas_Static_0500 create catch err: " + err.code + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0600
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0600
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>--------------SUB_Request_Agent_TaskSaveas_Static_0600 is starting-------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: '/ request/SUB_Request_Agent_TaskSaveas_Static_0600',
      };
      try {
        request.agent.create(baseContext!, config, (err : BusinessError | null, task : request.agent.Task | undefined) : void => {
          hilog.info(domain, tag, "====>SUB_Request_Agent_TaskSaveas_Static_0600 create callback");
          expect().assertFail();
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, "====>SUB_Request_Agent_TaskSaveas_Static_0600 create catch err: " + err.code + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_On_Download_Progress_Static_0040
     * @tc.number SUB_Misc_REQUEST_On_Download_Progress_Static_0040
     * @tc.desc   listening on progress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_On_Download_Progress_Static_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Misc_REQUEST_On_Download_Progress_Static_0040 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        saveas: './SUB_Misc_REQUEST_On_Download_Progress_Static_0040.txt',
      };

      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, '====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 create success');
        let on_progressCallback = async (pro: request.agent.Progress): void => {
          try {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 pro.state: " + pro.state);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 pro.index: " + pro.index);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 pro.processed: " + pro.processed);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 pro.sizes: " + pro.sizes);
            expect(pro != null).assertTrue();
            done();
          } catch (err) {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 catch err: " + JSON.stringify(err));
            done();
          }
        }
        task.onProgress(on_progressCallback);
        await task.start();
        hilog.info(domain, tag, '====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 start success');
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_On_Download_Progress_Static_0030
     * @tc.number SUB_Misc_REQUEST_On_Download_Progress_Static_0030
     * @tc.desc   listening on progress inorder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_REQUEST_On_Download_Progress_Static_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----------------------SUB_Misc_REQUEST_On_Download_Progress_Static_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        saveas: './SUB_Misc_REQUEST_On_Download_Progress_Static_0030.txt',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, '====>SUB_Misc_REQUEST_On_Download_Progress_Static_0030 create success');
        let flag = false
        let flag1 = false
        let on_progressCallback = async (pro: request.agent.Progress): void => {
          flag = true
          hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0030 pro.state: " + pro.state);
        }
        let on_progressCallback1 = async (pro: request.agent.Progress): void => {
          try {
            flag1 = true
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0030 on_progressCallback1");
            expect(flag && flag1).assertTrue();
            done();
          } catch (err) {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0030 catch err: " + JSON.stringify(err));
            done();
          }
        }
        task.onProgress(on_progressCallback);
        task.onProgress(on_progressCallback1);
        await task.start();
        hilog.info(domain, tag, '====>SUB_Misc_REQUEST_On_Download_Progress_Static_0030 start success');
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_On_Download_Progress_Static_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Download_overwrite_Static_0100
     * @tc.number SUB_Misc_REQUEST_Download_overwrite_Static_0100
     * @tc.desc   overwrite is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Misc_REQUEST_Download_overwrite_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----SUB_Misc_REQUEST_Download_overwrite_Static_0100 is starting--------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        saveas: './SUB_Misc_REQUEST_Download_overwrite_Static_0100',
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0100 create success");
        let on_completedCallback = (pro: request.agent.Progress): void => {
          (async () => {
          try {
            let task: request.agent.Task = await request.agent.create(baseContext!, config);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0100 task.start twice");
            await task.start();
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0100 task.start success");
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0100 pro.state: " + pro.state);
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0100 err: " + JSON.stringify(err));
            done();
          }
          })().awaitSync()
        }
        task.onCompleted(on_completedCallback);
        await task.start();
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0100 task.start");
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Download_overwrite_Static_0200
     * @tc.number SUB_Misc_REQUEST_Download_overwrite_Static_0200
     * @tc.desc   start a err status task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Misc_REQUEST_Download_overwrite_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----SUB_Misc_REQUEST_Download_overwrite_Static_0200 is starting--------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        saveas: './SUB_Misc_REQUEST_Download_overwrite_Static_0200',
        overwrite: false
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0200 create success");
        let on_completedCallback = async (pro: request.agent.Progress): void => {
          try {
            let task: request.agent.Task = await request.agent.create(baseContext!, config);
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0200 task.start twice");
            await task.start();
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0200 task start twice success");
            expect().assertFail();
            done();
          } catch (err) {
            err = err as BusinessError;
            try{
              hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0200 second download err: " + JSON.stringify(err));
              expect(err.code).assertEqual(13400001);
              done();
            } catch (err) {
              hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0200 err: " + JSON.stringify(err));
              done();
            }
          }
        }
        task.onCompleted(on_completedCallback);
        await task.start();
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0200 task.start");
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Download_overwrite_Static_0300
     * @tc.number SUB_Misc_REQUEST_Download_overwrite_Static_0300
     * @tc.desc   overwrite is false throw err
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Misc_REQUEST_Download_overwrite_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "====>-----SUB_Misc_REQUEST_Download_overwrite_Static_0300 is starting--------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        saveas: './SUB_Misc_REQUEST_Download_overwrite_Static_0300',
        overwrite: false
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0300 create success");
        let on_completedCallback = async (pro: request.agent.Progress): void => {
          try {
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0300 task.start twice");
            await task.start();
            hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0300 task start twice success");
            expect().assertFail();
            done();
          } catch (err) {
            err = err as BusinessError;
            try{
              hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0300 second download err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
              done();
            } catch (err) {
              hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0300 err: " + JSON.stringify(err));
              done();
            }
          }
        }
        task.onCompleted(on_completedCallback);
        await task.start();
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0300 task.start");
      } catch (err) {
        hilog.info(domain, tag, "====>SUB_Misc_REQUEST_Download_overwrite_Static_0300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


  })

}