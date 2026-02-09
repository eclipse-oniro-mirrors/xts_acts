/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

    beforeAll(() => {
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