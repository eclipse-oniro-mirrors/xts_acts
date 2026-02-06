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
import request from '@ohos.request';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from  '@ohos.file.fs';
import statistics from '@ohos.net.statistics';
import wantAgent from '@ohos.app.ability.wantAgent';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let baseContext: common.UIAbilityContext | undefined;

export default function requestConfigSavesStaticTest() {
  describe('requestConfigSavesStaticTSTest', (): void => {

    let removeTask = async (task: request.agent.Task): Promise<void> => {
      try {
        await request.agent.remove(task.tid)
        console.info("====>task remove success");
      } catch (err) {
        console.info("====>task remove failed, possibly the task have remove" + JSON.stringify(err));
      }
    }

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll((done: () => void) => {
      try {
        hilog.info(domain, tag, '%{public}s', 'beforeAll start');
        let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        await Utils.msSleep(1000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.newRequestAuthority.static")
        await Utils.msSleep(4000)
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        baseContext = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'baseContext set success');
        done();
      } catch (err) {
        console.info('====>beforeAll catch err:'+JSON.stringify(err))
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0100
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0100
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0100', Level.LEVEL3, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: undefined,
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let path: string = '/data/storage/el2/base/haps/entry/cache/test.hap';
        let ifExitOut: boolean = fs.accessSync(path);
        if (ifExitOut) {
          fs.unlinkSync(path);
          console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 unlinkSync file success");
        }
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              if(ifExit){
                fs.unlinkSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 delete file success");
              }
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
              done();
            }
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0200
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0200
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0200', Level.LEVEL1, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let path: string = '/data/storage/el2/base/haps/entry/cache/test.hap';
        let ifExitOut: boolean = fs.accessSync(path);
        if (ifExitOut) {
          fs.unlinkSync(path);
          console.info("====>SUB_Request_Agent_TaskSaveas_0100 unlinkSync file success");
        }
        request.agent.create(baseContext!, config, async (err, task):void => {
          console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 baseContext: " + JSON.stringify(baseContext!.cacheDir));
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              if(ifExit){
                fs.unlinkSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 delete file success");
              }
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0300
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0300
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0300', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0300 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './request/SUB_Request_Agent_TaskSaveas_Static_0300',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry/cache/' + task?.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 start success: " + JSON.stringify(config.saveas));
            }

          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0400
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0400
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0400', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_TaskSaveas_Static_0400',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry/cache/' + task?.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0400 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0600
     * @tc.number SUB_Request_Agent_TaskSaveas_One_Static_0600
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0600', Level.LEVEL1, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0600 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'SUB_Request_Agent_TaskSaveas_Static_0600',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry/cache/' + task?.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0600 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0700
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0700
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0700', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0700 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'request/SUB_Request_Agent_TaskSaveas_Static_0700',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry/cache/' + task?.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0700 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0800
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0800
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0800', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0800 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'internal://cache/test.hap',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry/cache/test.hap';
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              if(ifExit){
                fs.unlinkSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 delete file success");
              }
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0800 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_0900
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_0900
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_0900', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_0900 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_Static_0900',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              if(task !== undefined){
                task.offCompleted();
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
                let path:string = task.config.saveas!;
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 path: " + path);
                let ifExit: boolean = fs.accessSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 ifExit: " + ifExit);
                expect(ifExit).assertTrue();
              }else{
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 task is null");
                expect().assertFail();
              }
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_0900 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1000
     * @tc.number SUB_Request_Agent_TaskSaveas_One_Static_1000
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1000 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el2/base',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1000 create not err");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1000 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1010
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_1010
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1010 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el2/base',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, (err: BusinessError | null, task: request.agent.Task | undefined):void => {
          try {
            console.info("====>SUB_Request_Agent_TaskSaveas_Static_1010 create callback");
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_Static_1010 err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1010 create err: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1100
     * @tc.number SUB_Request_Agent_TaskSaveas_One_Static_1100
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1100', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/../../data/storage/el1/../el2/base/SUB_Request_Agent_TaskSaveas_Static_1100',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let path: string = '/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_Static_1100';
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1200
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_1200
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/../../el2/base/SUB_Request_Agent_TaskSaveas_Static_1200',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1200 create not err");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1200 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1300
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_1300
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1300', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1300 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'file://com.acts.newRequestAuthority.static/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_Static_1300',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task?.offCompleted();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 completed task.config.saveas: " + JSON.stringify(task?.config.saveas));
              let path: string = '/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_Static_1300';
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 start success: " + JSON.stringify(config.saveas));
            }
          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1400
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_1400
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'file://com.examples.app123/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_1300',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1400 create not err");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1400 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_TaskSaveas_Static_1500
     * @tc.number SUB_Request_Agent_TaskSaveas_Static_1500
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_TaskSaveas_Static_1500', Level.LEVEL2, (done: () => void)=> {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_Static_1500 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el5/base/SUB_Request_Agent_TaskSaveas_Static_1500',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 baseContext: " + JSON.stringify(baseContext!));
        request.agent.create(baseContext!, config, async (err, task):void => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              if(task !== undefined){
                task.offCompleted();
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
                let path = task.config.saveas!;
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 path: " + path);
                let ifExit: boolean = fs.accessSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 ifExit: " + ifExit);
                expect(ifExit).assertTrue();
                done();
              }else{
                console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 task is null");
                expect().assertFail();
              }
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 catch err: " + JSON.stringify(err));
              done();
            }
          }

          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            if(task !== undefined){
              task.onCompleted(on_completedCallback);
              await task.start();
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 start success: " + JSON.stringify(config.saveas));
            }

          } catch (err) {
            if(task !== undefined){
              console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 catch err: " + JSON.stringify(err));
              await request.agent.remove(task.tid);
            }
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_Static_1500 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0100
     * @tc.number SUB_Request_Agent_onResponse_One_Static_0100
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Agent_onResponse_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_onResponse_Static_0100 create success");
        let responseCallback_1 = async (info: request.agent.HttpResponse):void => {
          try {
            task.offResponse();
            await removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_Static_0100 response info: " + JSON.stringify(info));
            expect(info.version).assertEqual('HTTP/1.1');
            expect(info.statusCode).assertEqual(200);
            expect(info.reason).assertEqual('OK');
            expect(typeof(info.headers) === 'object').assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0100 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onResponse(responseCallback_1);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_Static_0100 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_Static_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0200
     * @tc.number SUB_Request_Agent_onResponse_Static_0200
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_onResponse_Static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_Static_0200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984572/test-files/releases/downloads/1.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_Static_0200',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_onResponse_Static_0200 create success");
        let responseCallback_1 = async (info: request.agent.HttpResponse):void => {
          try {
            task.offResponse();
            removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_Static_0200 response info: " + JSON.stringify(info));
            expect(info.statusCode).assertEqual(404);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0200 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onResponse(responseCallback_1);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_Static_0200 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_Static_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0300
     * @tc.number SUB_Request_Agent_onResponse_Static_0300
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Agent_onResponse_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_Static_0300 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_Static_0300',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let flage: boolean = true;
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_onResponse_Static_0300 create success");
        let responseCallback_1 = (info: request.agent.HttpResponse):void => {
          flage = false;
          console.info("====>SUB_Request_Agent_onResponse_Static_0300 response info: " + JSON.stringify(info));
        }
        let completed = (pro: request.agent.Progress):void => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Agent_onResponse_Static_0300 completed pro: " + JSON.stringify(pro));
            expect(flage).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0300 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onResponse(responseCallback_1);
        task.offResponse(responseCallback_1);
        task.onCompleted(completed)
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_Static_0300 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_Static_0300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0400
     * @tc.number SUB_Request_Agent_onResponse_Static_0400
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_onResponse_Static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('====>-----------------------SUB_Request_Agent_onResponse_Static_0400 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_Static_0400.txt',
        network: request.agent.Network.ANY,
        overwrite: true
      };

      let arr1 = [0, 0, 0];
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        let responseCallback_1 = (info1: request.agent.HttpResponse):void => {
          try {
            arr1[0] = 1;
            console.info("====>SUB_Request_Agent_onResponse_Static_0400 info1: " + JSON.stringify(arr1));
            expect(JSON.stringify(arr1) === '[1,0,0]').assertTrue();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0400 info1 catch err: " + JSON.stringify(err));
          }
        }

        let responseCallback_2 = (info2: request.agent.HttpResponse):void => {
          try {
            arr1[1] = 1;
            console.info("====>SUB_Request_Agent_onResponse_Static_0400 info2: " + JSON.stringify(arr1));
            expect(JSON.stringify(arr1) === '[1,1,0]').assertTrue();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0400 info1 catch err: " + JSON.stringify(err));
          }
        }

        let responseCallback_3 = async (info3: request.agent.HttpResponse):void => {
          try {
            task.offResponse()
            await removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_Static_0400 info3: " + JSON.stringify(info3));
            arr1[2] = 1;
            console.info("====>SUB_Request_Agent_onResponse_Static_0400 task3 response on arr: " + JSON.stringify(arr1));
            expect(JSON.stringify(arr1) === '[1,1,1]').assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0400 catch err: " + JSON.stringify(err));
            done();
          }
        }
        task.onResponse(responseCallback_1);
        task.onResponse(responseCallback_2);
        task.onResponse(responseCallback_3);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_Static_0400 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_Static_0400 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0500
     * @tc.number SUB_Request_Agent_onResponse_Static_0500
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_onResponse_Static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_Static_0500 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_Static_0500',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let flage: boolean = true;
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_onResponse_Static_0500 create success");
        let responseCallback_1 = (info1: request.agent.HttpResponse):void => {
          flage = false;
          console.info("====>SUB_Request_Agent_onResponse_Static_0500 response info1: " + JSON.stringify(info1));
        }
        let responseCallback_2 = (info2: request.agent.HttpResponse):void => {
          flage = false;
          console.info("====>SUB_Request_Agent_onResponse_Static_0500 response info2: " + JSON.stringify(info2));
        }
        let completed = (pro: request.agent.Progress):void => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Agent_onResponse_Static_0500 completed pro: " + JSON.stringify(pro));
            expect(flage).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0500 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onResponse(responseCallback_1);
        task.onResponse(responseCallback_2);
        task.offResponse();
        task.onCompleted(completed)
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_Static_0500 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_Static_0500 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0600
     * @tc.number SUB_Request_Agent_onResponse_Static_0600
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Agent_onResponse_Static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_Static_0600 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_Static_0600',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_onResponse_Static_0600 create success");
        let responseCallback_1 = async (info: request.agent.HttpResponse):void => {
          console.info("====>SUB_Request_Agent_onResponse_Static_0600 response info: " + JSON.stringify(info));
        }
        task.offResponse(responseCallback_1);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_Static_0600 task.start");
        await removeTask(task);
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_Static_0600 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_onResponse_Static_0700
     * @tc.number SUB_Request_Agent_onResponse_Static_0700
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_onResponse_Static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_Static_0700 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_Static_0700',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_onResponse_Static_0700 create success");

        let responseCallback_1 = async (info: request.agent.HttpResponse):void => {
          try {
            task.offResponse();
            await removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_Static_0700 response info: " + JSON.stringify(info));
            expect(info.statusCode).assertEqual(206);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0700 responseCallback_1 err: " + JSON.stringify(err));
            done();
          }
        }

        let progressCallback = async (pro: request.agent.Progress):void => {
          try {
            task.offProgress();
            console.info("====>SUB_Request_Agent_onResponse_Static_0700 pro: " + JSON.stringify(pro));
            await task.pause();
            task.onResponse(responseCallback_1);
            await Utils.msSleep(3000);
            await task.resume();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_Static_0700 progressCallback err: " + JSON.stringify(err));
            done();
          }
        }
        task.onProgress(progressCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_Static_0700 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_proxy_Static_0200
     * @tc.number SUB_Request_Agent_proxy_Static_0200
     * @tc.desc   request config saveas validate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_proxy_Static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_proxy_Static_0200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_proxy_Static_0200',
        network: request.agent.Network.ANY,
        overwrite: true,
        proxy: 'https://192.168.249.58:808'
      };
      try {
        console.info("====>SUB_Request_Agent_proxy_Static_0200 create task");
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_proxy_Static_0200 create success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_proxy_Static_0200 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_proxy_Static_0400
     * @tc.number SUB_Request_Agent_proxy_Static_0400
     * @tc.desc   incorrect parameters of the download proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_proxy_Static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('====>-----------------------SUB_Request_Agent_proxy_Static_0400 is starting-----------------------');
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_proxy_Static_0400',
        network: request.agent.Network.ANY,
        overwrite: true,
        proxy: 'https://192.168.249.58:808'
      };
      try {
        console.info('====>SUB_Request_Agent_proxy_Static_0400 create task');
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info('====>SUB_Request_Agent_proxy_Static_0400 create success');
        expect().assertFail();
        done();
      } catch (err) {
        console.info('====>SUB_Request_Agent_proxy_Static_0400 create catch err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_ErrorDetailed_Static_0100
     * @tc.number SUB_Request_Agent_ErrorDetailed_Static_0100
     * @tc.desc   incorrect error of PARAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_ErrorDetailed_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('====>-----------------------SUB_Request_Agent_ErrorDetailed_Static_0100 is starting-----------------------');
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://?PARAM.com',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ErrorDetailed_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        task.onFailed(async (pro: request.agent.Progress):void => {
          try {
            task.offFailed();
            console.info('====>SUB_Request_Agent_ErrorDetailed_Static_0100 failed pro: ' + JSON.stringify(pro));
            let info:request.agent.TaskInfo = await request.agent.show(task.tid);
            console.info('====>SUB_Request_Agent_ErrorDetailed_Static_0100 info: ' + JSON.stringify(info));
            expect(info.faults).assertEqual(48);
            done();
          } catch (err) {
            console.info('====>SUB_Request_Agent_ErrorDetailed_Static_0100 err: ' + JSON.stringify(err));
          }
        })
        await task.start();
        console.info('====>SUB_Request_Agent_ErrorDetailed_Static_0100 create success');
      } catch (err) {
        console.info('====>SUB_Request_Agent_ErrorDetailed_Static_0100 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_ContinueDown_Static_0300
     * @tc.number SUB_Request_Agent_ContinueDown_Static_0300
     * @tc.desc   After the download is completed, resume the breakpoint transmission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_ContinueDown_Static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_ContinueDown_Static_0300 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ContinueDown_Static_0300.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      request.agent.create(baseContext!, config, async (err, task):void => {
        let on_completedCallback = async (pro: request.agent.Progress):void => {
          task?.offCompleted();
          try {
            if(task !== undefined){
              await task.start();
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0300 task.start success ");
              expect().assertFail();
            }
          } catch (err) {
            try {
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0300 start err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
              done();
            } catch (e) {
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0300 code err: " + JSON.stringify(e));
              done();
            }
          }
        }
        try {
          if(err){
            console.info("====>SUB_Request_Agent_ContinueDown_Static_0300 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          if(task !== undefined){
            task.onCompleted(on_completedCallback);
            await task.start();
          }
        } catch (err) {
          if(task !== undefined){
            console.info("====>SUB_Request_Agent_ContinueDown_Static_0300 catch err: " + JSON.stringify(err));
            await removeTask(task);
          }
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_Request_Agent_ContinueDown_Static_0310
     * @tc.number SUB_Request_Agent_ContinueDown_Static_0310
     * @tc.desc   After the download is completed, resume the breakpoint transmission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_ContinueDown_Static_0310', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_ContinueDown_Static_0310 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ContinueDown_Static_0310.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      let task: request.agent.Task = await request.agent.create(baseContext!, config);
      try {
        let on_completedCallback = (pro: request.agent.Progress) => {
          task.offCompleted();
          task.start((err: BusinessError<void>|null): void => {
            try {
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0310 start err: " + JSON.stringify(err));
              expect(err?.code).assertEqual(21900007);
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0310 code err: " + JSON.stringify(err));
              done();
            }
          });
        }
        task.onCompleted(on_completedCallback);
        await task.start();
        } catch (err) {
          console.info("====>SUB_Request_Agent_ContinueDown_Static_0310 catch err: " + JSON.stringify(err));
          await removeTask(task);
          done();
        }
    });

    /**
     * @tc.name   SUB_Request_Agent_ContinueDown_Static_0500
     * @tc.number SUB_Request_Agent_ContinueDown_Static_0500
     * @tc.desc   download task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_ContinueDown_Static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_ContinueDown_Static_0500 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ContinueDown_Static_0500.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      request.agent.create(baseContext!, config, async (err, task):void => {
        let on_completedCallback = async (pro: request.agent.Progress):void => {
          task?.offPause();
          try {
            if(task !== undefined){
              await task.start();
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0500 task.start success ");
              expect().assertFail();
            }
          } catch (err) {
            try {
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0500 start err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
              done();
            } catch (e) {
              console.info("====>SUB_Request_Agent_ContinueDown_Static_0500 code err: " + JSON.stringify(e));
              done();
            }
          }
        }
        try {
          if(err){
            console.info("====>SUB_Request_Agent_ContinueDown_Static_0500 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          if(task !== undefined){
            task.onPause(on_completedCallback);
            await task.start();
            await task.pause();
          }
        } catch (err) {
          if(task !== undefined){
            console.info("====>SUB_Request_Agent_ContinueDown_Static_0500 catch err: " + JSON.stringify(err));
            await removeTask(task);
          }
          done();
        }
      });
    });

    /**
     * @tc.name   SUB_Request_Agent_PauseError_callback_Static_0100
     * @tc.number SUB_Request_Agent_PauseError_callback_Static_0100
     * @tc.desc   pause errcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_PauseError_callback_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_PauseError_callback_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_PauseError_callback_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_PauseError_callback_Static_0100 create success");
        task.pause(async (err: BusinessError<void> | null):void => {
          try{
            if (err) {
              console.info("====>SUB_Request_Agent_PauseError_callback_Static_0100 download pause err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
            } else {
              console.info('====>SUB_Request_Agent_PauseError_callback_Static_0100 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info("====>SUB_Request_Agent_PauseError_callback_Static_0100 catch err: " + JSON.stringify(err));
          }
          await removeTask(task);
          console.info("====>SUB_Request_Agent_PauseError_callback_Static_0100 removeTask");
          done();
        })
      } catch (err) {
        console.info("====>SUB_Request_Agent_PauseError_callback_Static_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_PauseError_promise_Static_0100
     * @tc.number SUB_Request_Agent_PauseError_promise_Static_0100
     * @tc.desc   pause errcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_PauseError_promise_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_PauseError_promise_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_PauseError_promise_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_PauseError_promise_Static_0100 create success");
        await task.pause();
        console.info("====>SUB_Request_Agent_PauseError_promise_Static_0100 pause success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_PauseError_promise_Static_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Agent_PauseError_promise_Static_0100 removeTask");
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_ResumeError_callback_Static_0100
     * @tc.number SUB_Request_Agent_ResumeError_callback_Static_0100
     * @tc.desc   resume errcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_ResumeError_callback_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_ResumeError_callback_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ResumeError_callback_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_ResumeError_callback_Static_0100 create success");
        task.resume(async (err: BusinessError<void> | null):void => {
          try{
            if(err){
              console.info("====>SUB_Request_Agent_ResumeError_callback_Static_0100 download pause err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
            } else {
              console.info('====>SUB_Request_Agent_ResumeError_callback_Static_0100 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info("====>SUB_Request_Agent_ResumeError_callback_Static_0100 catch err: " + JSON.stringify(err));
          }
          await removeTask(task);
          console.info("====>SUB_Request_Agent_ResumeError_callback_Static_0100 removeTask");
          done();
        })
      } catch (err) {
        console.info("====>SUB_Request_Agent_ResumeError_callback_Static_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_ResumeError_promise_Static_0100
     * @tc.number SUB_Request_Agent_ResumeError_promise_Static_0100
     * @tc.desc   resume errcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_ResumeError_promise_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_ResumeError_promise_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ResumeError_promise_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_ResumeError_promise_Static_0100 create success");
        await task.resume();
        console.info("====>SUB_Request_Agent_ResumeError_promise_Static_0100 pause success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_ResumeError_promise_Static_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Agent_ResumeError_promise_Static_0100 removeTask");
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_StopError_callback_Static_0100
     * @tc.number SUB_Request_Agent_StopError_callback_Static_0100
     * @tc.desc   stop errcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_StopError_callback_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void>  => {
      console.info("====>-----------------------SUB_Request_Agent_StopError_callback_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_StopError_callback_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_StopError_callback_Static_0100 create success");
        task.stop(async (err: BusinessError<void> | null):void => {
          try{
            if(err){
              console.info("====>SUB_Request_Agent_StopError_callback_Static_0100 download pause err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
            } else {
              console.info('====>SUB_Request_Agent_StopError_callback_Static_0100 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info("====>SUB_Request_Agent_StopError_callback_Static_0100 catch err: " + JSON.stringify(err));
          }
          await removeTask(task);
          console.info("====>SUB_Request_Agent_StopError_callback_Static_0100 removeTask");
          done();
        })
      } catch (err) {
        console.info("====>SUB_Request_Agent_StopError_callback_Static_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_StopError_promise_Static_0100
     * @tc.number SUB_Request_Agent_StopError_promise_Static_0100
     * @tc.desc   stop errcode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Agent_StopError_promise_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_StopError_promise_Static_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_StopError_promise_Static_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_StopError_promise_Static_0100 create success");
        await task.stop();
        console.info("====>SUB_Request_Agent_StopError_promise_Static_0100 pause success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_StopError_promise_Static_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Agent_StopError_promise_Static_0100 removeTask");
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_minSped_Static_0100
     * @tc.number SUB_Request_Download_minSped_Static_0100
     * @tc.desc   speed error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_minSped_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_minSped_Static_0100 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: -1,
        duration: 1,
      }

      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_Static_0100',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_minSped_Static_0100 create success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_Static_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Download_minSped_Static_0100 removeTask");
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_minSped_Static_0200
     * @tc.number SUB_Request_Download_minSped_Static_0200
     * @tc.desc   duration error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_minSped_Static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_minSped_Static_0200 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 1,
        duration: -1,
      }

      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_Static_0200',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_minSped_Static_0200 create success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_Static_0200 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Download_minSped_Static_0200 removeTask");
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_minSped_Static_0400
     * @tc.number SUB_Request_Download_minSped_Static_0400
     * @tc.desc   minSpeed less duration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Download_minSped_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_minSped_Static_0400 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 1024 * 1024 * 1024,
        duration: 5,
      }
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/BigFile.txt',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_Static_0400',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      try {

        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_minSped_Static_0400 create success");
        let faultsCallback = (faults: request.agent.Faults) => {
          try {
            task.offFaultOccur();
            console.info("====>SUB_Request_Download_minSped_Static_0400 faults: " + JSON.stringify(faults));
            expect(faults).assertEqual(request.agent.Faults.LOW_SPEED);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_minSped_Static_0400 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onFaultOccur(faultsCallback)
        await task.start();
        console.info("====>SUB_Request_Download_minSped_Static_0400 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_Static_0400 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_minSped_Static_0900
     * @tc.number SUB_Request_Download_minSped_Static_0900
     * @tc.desc   maxSpeed less than minSpeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_minSped_Static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_minSped_Static_0900 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 16385,
        duration: 60,
      }

      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_Static_0900',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_minSped_Static_0900 create success");
        task.setMaxSpeed(16 * 1024);
        console.info("====>SUB_Request_Download_minSped_Static_0900 setMaxSpeed success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_Static_0900 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Download_minSped_Static_0900 removeTask");
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_minSped_Static_1000
     * @tc.number SUB_Request_Download_minSped_Static_1000
     * @tc.desc   minSpeed right.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Download_minSped_Static_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_minSped_Static_1000 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 1024 * 1024 * 1024,
        duration: 0,
      }
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_Static_1000',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      try {

        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_minSped_Static_1000 create success");
        let completed = (pro: request.agent.Progress) => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Download_minSped_Static_1000 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_minSped_Static_1000 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onCompleted(completed)
        await task.start();
        console.info("====>SUB_Request_Download_minSped_Static_1000 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_Static_1000 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
};