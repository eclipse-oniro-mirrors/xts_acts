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
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let baseContext: common.UIAbilityContext | undefined;

export default function RequestDownloadJSUnitStatic() {

  describe("RequestDownloadJSUnitStatic", (): void => {
  hilog.info(domain, tag, '%{public}s', 'RequestDownloadJSUnitStatic start');

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          baseContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

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

  })

}