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
import fs from '@ohos.file.fs'
import request from "@ohos.request";
import cacheDownload from "@ohos.request.cacheDownload";
import common from "@ohos.app.ability.common";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let baseContext: common.UIAbilityContext | undefined;

export default function RequestDownloadJSUnitStatic() {

  describe("RequestDownloadJSUnitStatic", (): void => {
  hilog.info(domain, tag, '%{public}s', 'RequestDownloadJSUnitStatic start');

    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          baseContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
          let pathDir: string = baseContext!.cacheDir;
          let filePath = pathDir + `/test.txt`;
          let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let content = ''.padEnd(1 * 1024, 'Hello world');
          fs.writeSync(file.fd, content);
          fs.closeSync(file);
          hilog.info(domain, tag, '%{public}s', '====>beforeAll: text.txt file generate');
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.newNormalRequest.test.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })


    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_Download_Promise_Static_0010
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Download_Promise_Static_0010
     * @tc.desc   create a download task.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_Create_Promise_Download_Promise_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_Create_Promise_Download_Promise_Static_0010 is starting---------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Create_Promise_Download_Promise_Static_0010.txt',
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Promise_Download_Promise_Static_0010 create success: " + task);
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Promise_Download_Promise_Static_0010 catch error: " + err.code + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010
     * @tc.number SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010 is starting---------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        saveas: './SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010.txt',
      };
      try {
        request.agent.create(baseContext!, config, (err : BusinessError | null, task : request.agent.Task | undefined) : void => {
          hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010 downloadTask: " + task);
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', "====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010 create err: " + err?.code + JSON.stringify(err));
            expect(err?.code).assertEqual(201);
            done();
          } else {
            hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010 create success: " + task);
            expect().assertFail();
            done();
          } 
        });
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s',"====>SUB_Misc_REQUEST_Create_Promise_Download_Callback_Static_0010 catch error: " + err.code + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0010
     * @tc.number SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0010
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0010 is starting---------");
      let headers: Record<string, string> = {'Accept': '*/*'};
      let downloadOptions: cacheDownload.CacheDownloadOptions = {
        headers: headers,
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      try {
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0010 download success url: " + url);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0010 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0020
     * @tc.number SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0020
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0020 is starting---------");
      try {
        let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
        let downloadInfo: cacheDownload.DownloadInfo | undefined = cacheDownload.getDownloadInfo(url);
        console.info("====>SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0020 downloadInfo success: " + downloadInfo);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_cacheDownload_Callback_Static_0020 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010
     * @tc.number SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010 is starting---------");
      try {
        let downloadConfig: request.DownloadConfig = {
          url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
          enableMetered: false,
          enableRoaming: false,
          description: 'XTS download test!',
          filePath: "SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010",
          title: 'XTS download test!',
        }
        request.downloadFile(baseContext!, downloadConfig, (err, downloadTask) => {
          if (err) {
            console.info("====>SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010 create err: " + JSON.stringify(err.code));
            expect(err!.code).assertEqual(201);
            done();
          }else {
            console.error("====>SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010 create success without permission");
            expect().assertFail();
            done();
          }

        });
      } catch (err) {
        console.error("====>SUB_Misc_REQUEST_DownloadFile_Callback_Static_0010 create err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_DownloadFile_Promise_Static_0020
     * @tc.number SUB_Misc_REQUEST_DownloadFile_Promise_Static_0020
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_DownloadFile_Promise_Static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_DownloadFile_Promise_Static_0020 is starting---------");
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: "SUB_Misc_REQUEST_DownloadFile_Promise_Static_0020",
        title: 'XTS download test!',
      }
      try {
        await request.downloadFile(baseContext!, downloadFileConfig);
        expect().assertFail();
        console.info("====>SUB_Misc_REQUEST_DownloadFile_Promise_Static_0020 downloadFile success");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_DownloadFile_Promise_Static_0020 error: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_UploadFile_Callback_Static_0010
     * @tc.number SUB_Misc_REQUEST_UploadFile_Callback_Static_0010
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_UploadFile_Callback_Static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_UploadFile_Callback_Static_0010 is starting---------");
      let uploadConfig: request.UploadConfig = {
        url: 'http://127.0.0.1',
        header: {
          'headers': 'http'
        },
        method: 'POST',
        files: [{ filename: 'test', name: 'test', uri: 'internal://cache/test.txt', type: 'txt' }],
        data: [{ name: 'name', value: '123' }]
      };
      try {
        request.uploadFile(baseContext!, uploadConfig, (err, uploadTask)=>{
          if (err) {
            console.info("====>SUB_Misc_REQUEST_UploadFile_Callback_Static_0010 create err: " + JSON.stringify(err!.code));
            expect(err!.code).assertEqual(201);
            done();
          } else {
            console.error("====>SUB_Misc_REQUEST_UploadFile_Callback_Static_0010 create success without permission");
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.error("====>SUB_Misc_REQUEST_UploadFile_Callback_Static_0010 create err: " + JSON.stringify(err.code));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Misc_REQUEST_UploadFile_Promise_Static_0020
     * @tc.number SUB_Misc_REQUEST_UploadFile_Promise_Static_0020
     * @tc.desc   create a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_REQUEST_UploadFile_Promise_Static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "====>------SUB_Misc_REQUEST_UploadFile_Promise_Static_0020 is starting---------");
      let uploadConfig: request.UploadConfig = {
        url: 'http://127.0.0.1',
        header: {
          'headers': 'http'
        },
        method: 'POST',
        files: [{ filename: 'test', name: 'test', uri: 'internal://cache/test.txt', type: 'txt' }],
        data: [{ name: 'name', value: '123' }]
      };
      try {
        await request.uploadFile(baseContext!, uploadConfig);
        expect().assertFail();
        console.info("====>SUB_Misc_REQUEST_UploadFile_Promise_Static_0020 uploadFile success");
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_UploadFile_Promise_Static_0020 create err: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(201);
        done();
      }
    });

  })

}