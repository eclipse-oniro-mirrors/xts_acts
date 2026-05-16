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
import commonEventManager from '@ohos.commonEventManager';
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
    beforeAll(async (done: () => void): Promise<void> => {
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

    /**
     * @tc.name   SUB_Request_Download_minSped_Static_1100
     * @tc.number SUB_Request_Download_minSped_Static_1100
     * @tc.desc   minSpeed right.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Request_Download_minSped_Static_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_minSped_Static_1100 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 0,
        duration: 1,
      }
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_Static_1100',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      try {

        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_minSped_Static_1100 create success");
        let completed = (pro: request.agent.Progress) => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Download_minSped_Static_1100 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_minSped_Static_1100 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onCompleted(completed)
        await task.start();
        console.info("====>SUB_Request_Download_minSped_Static_1100 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_Static_1100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_off_faultOccur_Static_0100
     * @tc.number SUB_Request_Download_off_faultOccur_Static_0100
     * @tc.desc   on faultOccur.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_off_faultOccur_Static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_off_faultOccur_Static_0100 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/V1.0/test1.txt',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_off_faultOccur_Static_0100.txt',
        network: request.agent.Network.ANY,
        mode:request.agent.Mode.BACKGROUND
      };

      let task: request.agent.Task = await request.agent.create(baseContext!, config);
      console.info("====>SUB_Request_Download_off_faultOccur_Static_0100 create task success");
      let arr1 = [0, 0, 0];
      let faultOccurCallBack1 = (faults: request.agent.Faults) => {
        arr1[0] = 1;
        console.info("====>SUB_Request_Download_off_faultOccur_Static_0100 faultOccurCallBack1 faults: " + JSON.stringify(arr1));
      }
      let faultOccurCallBack2 = (faults: request.agent.Faults) => {
        arr1[1] = 1;
        console.info("====>SUB_Request_Download_off_faultOccur_Static_0100 faultOccurCallBack2 faults: " + JSON.stringify(arr1));
      }
      let faultOccurCallBack3 = (faults: request.agent.Faults) => {
        try {
          task.offFaultOccur();
          console.info("====>SUB_Request_Download_off_faultOccur_Static_0100 faultOccurCallBack3 faults: " + JSON.stringify(faults));
          arr1[2] = 1;
          console.info("====>SUB_Request_Download_off_faultOccur_Static_0100 task3 progress on arr: " + JSON.stringify(arr1));
          expect(JSON.stringify(arr1) === '[0,1,1]').assertTrue();
          expect(faults).assertEqual(request.agent.Faults.PROTOCOL);
          done();
        } catch (err) {
          console.info("====>SUB_Request_Download_off_faultOccur_Static_0100 catch err: " + JSON.stringify(err));
          done();
        }
      }
      task.onFaultOccur(faultOccurCallBack1);
      task.offFaultOccur(faultOccurCallBack1);
      task.onFaultOccur(faultOccurCallBack2);
      task.onFaultOccur(faultOccurCallBack3);
      await task.start();
    });

    /**
     * @tc.name   SUB_Request_Download_off_faultOccur_Static_0200
     * @tc.number SUB_Request_Download_off_faultOccur_Static_0200
     * @tc.desc   on faultOccur.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_off_faultOccur_Static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_off_faultOccur_Static_0200 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/V1.0/test1.txt',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_off_faultOccur_Static_0200.txt',
        network: request.agent.Network.ANY,
        mode:request.agent.Mode.BACKGROUND
      };

      let task: request.agent.Task = await request.agent.create(baseContext!, config);
      console.info("====>SUB_Request_Download_off_faultOccur_Static_0200 create task success");
      let arr1 = [0, 0, 0]
      let faultOccurCallBack1 = (faults: request.agent.Faults) => {
        arr1[0] = 1;
        console.info("====>SUB_Request_Download_off_faultOccur_Static_0200 faultOccurCallBack1 faults: " + JSON.stringify(arr1));
      }
      let faultOccurCallBack2 = (faults: request.agent.Faults) => {
        arr1[1] = 1;
        console.info("====>SUB_Request_Download_off_faultOccur_Static_0200 faultOccurCallBack2 faults: " + JSON.stringify(arr1));
      }
      let faultOccurCallBack3 = (faults: request.agent.Faults) => {
        arr1[2] = 1;
        console.info("====>SUB_Request_Download_off_faultOccur_Static_0200 faultOccurCallBack3 faults: " + JSON.stringify(arr1));
      }
      task.onFaultOccur(faultOccurCallBack1);
      task.onFaultOccur(faultOccurCallBack2);
      task.onFaultOccur(faultOccurCallBack3);
      task.offFaultOccur();;
      await task.start();
      await Utils.msSleep(1000);
      console.info("====>SUB_Request_Download_off_faultOccur_Static_0200 task3 progress on arr: " + JSON.stringify(arr1));
      expect(arr1.join()).assertEqual('0,0,0');
      done();
    });

    /**
     * @tc.name   SUB_Request_Download_on_faultOccur_Static_0300
     * @tc.number SUB_Request_Download_on_faultOccur_Static_0300
     * @tc.desc   on faultOccur.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_on_faultOccur_Static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_on_faultOccur_Static_0300 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https:////',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_on_faultOccur_Static_0300.txt',
        network: request.agent.Network.ANY,
        mode:request.agent.Mode.BACKGROUND
      };

      let task: request.agent.Task = await request.agent.create(baseContext!, config);
      console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 create task success");
      let arr1 = [0, 0, 0];
      let faultOccurCallBack1 = (faults: request.agent.Faults) => {
        try {
          arr1[0] = 1;
          console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 info1: " + JSON.stringify(arr1));
          expect(JSON.stringify(arr1) === '[1,0,0]').assertTrue();
        } catch (err) {
          console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 info1 catch err: " + JSON.stringify(err));
        }
      }
      let faultOccurCallBack2 = (faults: request.agent.Faults) => {
        try {
          arr1[1] = 1;
          console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 info2: " + JSON.stringify(arr1));
          expect(JSON.stringify(arr1) === '[1,1,0]').assertTrue();
        } catch (err) {
          console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 info2 catch err: " + JSON.stringify(err));
        }
      }
      let faultOccurCallBack3 = (faults: request.agent.Faults) => {
        try {
          task.offFaultOccur();
          console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 faultOccurCallBack3 faults: " + faults);
          arr1[2] = 1;
          console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 task3 progress on arr: " + JSON.stringify(arr1));
          expect(JSON.stringify(arr1) === '[1,1,1]').assertTrue();
          expect(faults).assertEqual(request.agent.Faults.PARAM);
          done();
        } catch (err) {
          console.info("====>SUB_Request_Download_on_faultOccur_Static_0300 catch err: " + JSON.stringify(err));
          done();
        }
      }
      task.onFaultOccur(faultOccurCallBack1);
      task.onFaultOccur(faultOccurCallBack2);
      task.onFaultOccur(faultOccurCallBack3);
      await task.start();
    });

    /**
     * @tc.name   SUB_Request_Download_timeOut_Static_0200
     * @tc.number SUB_Request_Download_timeOut_Static_0200
     * @tc.desc   connectionTimeout error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_timeOut_Static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_timeOut_Static_0200 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        connectionTimeout: 0,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_Static_0200.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_timeOut_Static_0200 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_Static_0200 faultOccurCallBack err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_timeOut_Static_0300
     * @tc.number SUB_Request_Download_timeOut_Static_0300
     * @tc.desc   totalTimeout error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_timeOut_Static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_timeOut_Static_0300 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        totalTimeout: 0,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_Static_0300.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_timeOut_Static_0300 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_Static_0300 faultOccurCallBack err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_timeOut_Static_0400
     * @tc.number SUB_Request_Download_timeOut_Static_0400
     * @tc.desc   totalTimeout error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_timeOut_Static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_timeOut_Static_0400 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        totalTimeout: 604801,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_Static_0400.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_timeOut_Static_0400 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_Static_0400 faultOccurCallBack err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_timeOut_Static_0500
     * @tc.number SUB_Request_Download_timeOut_Static_0500
     * @tc.desc   totalTimeout error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_timeOut_Static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_timeOut_Static_0500 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        totalTimeout: 604800,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_Static_0500.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_timeOut_Static_0500 create task success");
        expect(task !== null).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_Static_0500 faultOccurCallBack err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_timeOut_Static_0600
     * @tc.number SUB_Request_Download_timeOut_Static_0600
     * @tc.desc   totalTimeout error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_timeOut_Static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_Download_timeOut_Static_0600 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        connectionTimeout: 15,
        totalTimeout: 2
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/BigFile.txt',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_Static_0600.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };

      let task: request.agent.Task = await request.agent.create(baseContext!, config);
      console.info("====>SUB_Request_Download_timeOut_Static_0600 create task success");
      let faultsCallBack = (faults: request.agent.Faults) => {
        try {
          task.offFaultOccur();
          console.info("====>SUB_Request_Download_timeOut_Static_0600 faults: " + faults);
          expect(faults).assertEqual(request.agent.Faults.TIMEOUT);
          done();
        } catch (err) {
          console.info("====>SUB_Request_Download_timeOut_Static_0600 faultOccurCallBack err: " + JSON.stringify(err));
          done();
        }
      };
      task.onFaultOccur(faultsCallBack);
      task.start();
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1200
     * @tc.number SUB_Request_Download_visibility_Static_1200
     * @tc.desc   visibility is three
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1200 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: request.agent.VISIBILITY_COMPLETION | request.agent.VISIBILITY_PROGRESS
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_1200.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        console.info("====>SUB_Request_Download_visibility_Static_1200 notification: " + JSON.stringify(notification));
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_1200 create task success");
        expect(task !== null).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1200 err: " + JSON.stringify(err));
        console.info("====>SUB_Request_Download_visibility_Static_1200 err: " + err);
        expect().assertFail();
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1300
     * @tc.number SUB_Request_Download_visibility_Static_1300
     * @tc.desc   visibility is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1300 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: undefined
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_1300.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        console.info("====>SUB_Request_Download_visibility_Static_1300 notification: " + JSON.stringify(notification));
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_1300 create task success");
        expect(task !== null).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1300 err: " + JSON.stringify(err));
        expect().assertFail();
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1400
     * @tc.number SUB_Request_Download_visibility_Static_1400
     * @tc.desc   visibility is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1400 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: 0
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_1400.txt',
        network: request.agent.Network.ANY,
      };
      try {
        console.info("====>SUB_Request_Download_visibility_Static_1400 notification: " + JSON.stringify(notification));
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_1400 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1400 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1500
     * @tc.number SUB_Request_Download_visibility_Static_1500
     * @tc.desc   request group visibility is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1500 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: request.agent.VISIBILITY_COMPLETION | request.agent.VISIBILITY_PROGRESS
      }
      let groupConfig: request.agent.GroupConfig = {
        notification: notification
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_1500.txt',
        network: request.agent.Network.ANY,
      };

      try {
        let task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_1500 config: " + JSON.stringify(config));
        let onCompletedCallback = (pro: request.agent.Progress) => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Download_visibility_Static_1500 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_visibility_Static_1500 completed err: " + JSON.stringify(err));
            done();
          }
        }
        let gid: string = await request.agent.createGroup(groupConfig);
        console.info("====>SUB_Request_Download_visibility_Static_1500 createGroup success"+ JSON.stringify(groupConfig));
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        await request.agent.attachGroup(gid, [task.tid]);
        console.info("====>SUB_Request_Download_visibility_Static_1500 attachGroup success");
        task.onCompleted(onCompletedCallback)
        await task.start();
        console.info("====>SUB_Request_Download_visibility_Static_1500 start success");
        await request.agent.deleteGroup(gid);
        console.info("====>SUB_Request_Download_visibility_Static_1500 deleteGroup success");
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1500 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1600
     * @tc.number SUB_Request_Download_visibility_Static_1600
     * @tc.desc   request group visibility is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1600 is starting-----------------------");
      try {
        let notification: request.agent.Notification = {
          visibility: undefined
        }
        let groupConfig: request.agent.GroupConfig = {
          notification: notification
        }
        console.info("====>SUB_Request_Download_visibility_Static_1600 notification: " + JSON.stringify(notification));
        let gid: string = await request.agent.createGroup(groupConfig);
        console.info("====>SUB_Request_Download_visibility_Static_1600 createGroup success");
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1600 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1700
     * @tc.number SUB_Request_Download_visibility_Static_1700
     * @tc.desc   request group visibility is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1700 is starting-----------------------");
      try {
        let notification: request.agent.Notification = {
          visibility: 0
        }
        let groupConfig: request.agent.GroupConfig = {
          notification: notification
        }
        console.info("====>SUB_Request_Download_visibility_Static_1700 notification: " + JSON.stringify(notification));
        await request.agent.createGroup(groupConfig);
        console.info("====>SUB_Request_Download_visibility_Static_1700 createGroup success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1700 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1800
     * @tc.number SUB_Request_Download_visibility_Static_1800
     * @tc.desc   visibility is one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1800 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: request.agent.VISIBILITY_COMPLETION
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_1800.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        console.info("====>SUB_Request_Download_visibility_Static_1800 notification: " + JSON.stringify(notification));
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_1800 create task success");
        expect(task !== null).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1800 err: " + JSON.stringify(err));
        expect().assertFail();
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_1900
     * @tc.number SUB_Request_Download_visibility_Static_1900
     * @tc.desc   visibility is two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_1900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_1900 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: request.agent.VISIBILITY_PROGRESS
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_1900.txt',
        network: request.agent.Network.ANY,
      };
      let task: request.agent.Task | null = null;
      try {
        console.info("====>SUB_Request_Download_visibility_Static_1900 notification: " + JSON.stringify(notification));
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_1900 create task success");
        expect(task !== null).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_1900 err: " + JSON.stringify(err));
        expect().assertFail();
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_2000
     * @tc.number SUB_Request_Download_visibility_Static_2000
     * @tc.desc   request group visibility is one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_2000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_2000 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: request.agent.VISIBILITY_COMPLETION
      }
      let groupConfig: request.agent.GroupConfig = {
        notification: notification
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_2000.txt',
        network: request.agent.Network.ANY,
      };

      try {
        let task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_2000 config: " + JSON.stringify(config));
        let onCompletedCallback = (pro: request.agent.Progress) => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Download_visibility_Static_2000 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_visibility_Static_2000 completed err: " + JSON.stringify(err));
            done();
          }
        }

        let gid: string = await request.agent.createGroup(groupConfig);
        console.info("====>SUB_Request_Download_visibility_Static_2000 createGroup success"+ JSON.stringify(groupConfig));
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        await request.agent.attachGroup(gid, [task.tid]);
        console.info("====>SUB_Request_Download_visibility_Static_2000 attachGroup success");
        task.onCompleted(onCompletedCallback)
        await task.start();
        console.info("====>SUB_Request_Download_visibility_Static_2000 start success");
        await request.agent.deleteGroup(gid);
        console.info("====>SUB_Request_Download_visibility_Static_2000 deleteGroup success");
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_2000 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Download_visibility_Static_2100
     * @tc.number SUB_Request_Download_visibility_Static_2100
     * @tc.desc   request group visibility is two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Request_Download_visibility_Static_2100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Download_visibility_Static_2100 is starting-----------------------");
      let notification: request.agent.Notification = {
        visibility: request.agent.VISIBILITY_PROGRESS
      }
      let groupConfig: request.agent.GroupConfig = {
        notification: notification
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_visibility_Static_2100.txt',
        network: request.agent.Network.ANY,
      };

      try {
        let task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Download_visibility_Static_2100 config: " + JSON.stringify(config));
        let onCompletedCallback = (pro: request.agent.Progress) => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Download_visibility_Static_2100 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_visibility_Static_2100 completed err: " + JSON.stringify(err));
            done();
          }
        }

        let gid: string = await request.agent.createGroup(groupConfig);
        console.info("====>SUB_Request_Download_visibility_Static_2100 createGroup success"+ JSON.stringify(groupConfig));
        expect(gid !== '').assertTrue();
        expect(typeof gid === 'string').assertTrue();
        await request.agent.attachGroup(gid, [task.tid]);
        console.info("====>SUB_Request_Download_visibility_Static_2100 attachGroup success");
        task.onCompleted(onCompletedCallback)
        await task.start();
        console.info("====>SUB_Request_Download_visibility_Static_2100 start success");
        await request.agent.deleteGroup(gid);
        console.info("====>SUB_Request_Download_visibility_Static_2100 deleteGroup success");
      } catch (err) {
        console.info("====>SUB_Request_Download_visibility_Static_2100 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_NotificationrJumping_0800
     * @tc.number SUB_Request_Agent_NotificationrJumping_0800
     * @tc.desc   wantAgent test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_Agent_NotificationrJumping_0800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_NotificationrJumping_0800 is starting-----------------------");
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.acts.newRequestAuthority.static',
            abilityName: 'EntryAbility',
            action: '',
            entities: [],
            uri: '',
            parameters: {}
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        actionFlags:[wantAgent.WantAgentFlags.CONSTANT_FLAG]
      };
      let notification: request.agent.Notification = {
        wantAgent: await wantAgent.getWantAgent(wantAgentInfo)
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_NotificationrJumping_0800.txt',
        network: request.agent.Network.ANY,
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_NotificationrJumping_0800 create success");
        let completed = (pro: request.agent.Progress) => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Agent_NotificationrJumping_0800 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_NotificationrJumping_0800 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onCompleted(completed)
        await task.start();
        console.info("====>SUB_Request_Agent_NotificationrJumping_0800 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_NotificationrJumping_0800 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_Agent_NotificationrJumping_Static_0900
     * @tc.number SUB_Request_Agent_NotificationrJumping_Static_0900
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_Agent_NotificationrJumping_Static_0900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_Agent_NotificationrJumping_Static_0900 is starting-----------------------");
      let notification: request.agent.Notification = {
        wantAgent: undefined
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_NotificationrJumping_Static_0900.txt',
        network: request.agent.Network.ANY,
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_Agent_NotificationrJumping_Static_0900 create success");
        let completed = (pro: request.agent.Progress) => {
          try {
            task.offCompleted();
            console.info("====>SUB_Request_Agent_NotificationrJumping_Static_0900 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_NotificationrJumping_Static_0900 err: " + JSON.stringify(err));
            done();
          }
        }
        task.onCompleted(completed)
        await task.start();
        console.info("====>SUB_Request_Agent_NotificationrJumping_Static_0900 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_NotificationrJumping_Static_0900 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0100
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0100
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0100 is starting-----------------------");
      let notification: request.agent.Notification = {
        title: '',
        text:''
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        notification: notification,
        description: 'XTS download test!',
        saveas: './SUB_Request_downloadConfigSaves_Supplemental_0100.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        headers: {'Accept': '*/*'},
        priority: 0,
        extras:{'Accept': '*/*'},
        multipart: false
      };
      try {
        let time = new Date().getTime();
        let filter: request.agent.Filter = {
          before: time - 500,
          after: time - 1000,
          state: request.agent.State.REMOVED,
          action: request.agent.Action.DOWNLOAD,
          mode: request.agent.Mode.BACKGROUND,
        };
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        let taskInfo = await request.agent.show(task!.tid);
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_0100 ttaskInfo: ${JSON.stringify(taskInfo)}`);
        let tasksData:Array<string>  = await request.agent.search(filter);
        expect(taskInfo.saveas !== undefined).assertTrue();
        expect(taskInfo.url !== undefined).assertTrue();
        expect(taskInfo.data !== undefined).assertTrue();
        expect(taskInfo.tid !== undefined).assertTrue();
        expect(taskInfo.title !== undefined).assertTrue();
        expect(taskInfo.description !== undefined).assertTrue();
        expect(taskInfo.action !== undefined).assertTrue();
        expect(taskInfo.mode !== undefined).assertTrue();
        expect(taskInfo.priority !== undefined).assertTrue();
        expect(taskInfo.mimeType !== undefined).assertTrue();
        expect(taskInfo.progress !== undefined).assertTrue();
        expect(taskInfo.gauge !== undefined).assertTrue();
        expect(taskInfo.ctime !== undefined).assertTrue();
        expect(taskInfo.mtime !== undefined).assertTrue();
        expect(taskInfo.retry !== undefined).assertTrue();
        expect(taskInfo.tries !== undefined).assertTrue();
        expect(taskInfo.reason !== undefined).assertTrue();
        expect(taskInfo.extras !== undefined).assertTrue();
        expect(taskInfo.faults !== undefined).assertTrue();
        done();
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0100 create success");
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0300
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0300
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0300 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        description: 'XTS download test!',
        saveas: './SUB_Request_downloadConfigSaves_Supplemental_0300.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        multipart: false
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        let createOnCallback = (progress: request.agent.Progress) => {
          console.info('upload task progress.');
        };

        let responseCallback = (response: request.agent.HttpResponse) => {
          console.info('upload task response.');
        };

        let waitOnCallback = (reason: request.agent.WaitingReason) => {
          console.info('upload task waiting.');
        };

        let faultOnCallback = (faults: request.agent.Faults) => {
          console.info('upload task failed.');
        };

        task.onProgress(createOnCallback);
        task.offProgress(createOnCallback);
        task.offProgress();

        task.onFailed(createOnCallback);
        task.offFailed(createOnCallback);
        task.offFailed();

        task.onCompleted(createOnCallback);
        task.offCompleted(createOnCallback);
        task.offCompleted();

        task.onPause(createOnCallback);
        task.offPause(createOnCallback);
        task.offPause();

        task.onResume(createOnCallback);
        task.offResume(createOnCallback);
        task.offResume();

        task.onRemove(createOnCallback);
        task.offRemove(createOnCallback);
        task.offRemove();

        task.onResponse(responseCallback);
        task.offResponse(responseCallback);
        task.offResponse();

        task.onFaultOccur(faultOnCallback);
        task.offFaultOccur(faultOnCallback);
        task.offFaultOccur();

        task.onWait(waitOnCallback);
        task.offWait(waitOnCallback);
        task.offWait();

        expect(task !== undefined).assertTrue();
        done();
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0300 create success");
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0400
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0400
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0400 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        description: 'XTS download test!',
        saveas: './SUB_Request_downloadConfigSaves_Supplemental_0400.txt',
        network: request.agent.Network.CELLULAR,
        overwrite: true,
        token: 'tokenSession',
        multipart: false
      };
      try {

        let task: request.agent.Task = await request.agent.create(baseContext!, config);
        task.onProgress((pro: request.agent.Progress) => {
          expect(pro.extras === undefined).assertTrue();
        })

        task.onResponse((response: request.agent.HttpResponse) => {
          expect(response.version !== undefined).assertTrue();
          expect(response.statusCode !== undefined).assertTrue();
          expect(response.reason !== undefined).assertTrue();
          expect(response.headers !== undefined).assertTrue();
          console.info('====>download task response.');
        })

        task.onFaultOccur((faults: request.agent.Faults) => {
          expect(faults.OTHERS !== undefined).assertTrue();
          expect(faults.DISCONNECTED !== undefined).assertTrue();
          expect(faults.TIMEOUT !== undefined).assertTrue();
          expect(faults.PROTOCOL !== undefined).assertTrue();
          expect(faults.PARAM !== undefined).assertTrue();
          expect(faults.FSIO !== undefined).assertTrue();
          expect(faults.DNS !== undefined).assertTrue();
          expect(faults.TCP !== undefined).assertTrue();
          expect(faults.SSL !== undefined).assertTrue();
          expect(faults.REDIRECT !== undefined).assertTrue();
          expect(faults.LOW_SPEED !== undefined).assertTrue();
          console.info('====>download task failed.');
        })

        task.onWait((reason: request.agent.WaitingReason) => {
          expect(reason.TASK_QUEUE_FULL !== undefined).assertTrue();
          expect(reason.NETWORK_NOT_MATCH !== undefined).assertTrue();
          expect(reason.APP_BACKGROUND !== undefined).assertTrue();
          expect(reason.USER_INACTIVATED !== undefined).assertTrue();
          console.info('====>download task waiting.');
        })

        expect(task.tid !== undefined).assertTrue();
        expect(task.config.action !== undefined).assertTrue();

        let taskInfo1  = await request.agent.getTask(baseContext!, task!.tid);
        expect(taskInfo1 === undefined).assertTrue();
        let taskInfo2  = await request.agent.getTask(baseContext!, task!.tid, 'tokenSession');
        expect(taskInfo2.tid !== undefined).assertTrue();
        expect(taskInfo2.config !== undefined).assertTrue();
        expect(taskInfo2.config.action !== undefined).assertTrue();
        expect(taskInfo2.config.url !== undefined).assertTrue();
        expect(taskInfo2.config.title !== undefined).assertTrue();
        expect(taskInfo2.config.description !== undefined).assertTrue();
        expect(taskInfo2.config.mode !== undefined).assertTrue();
        expect(taskInfo2.config.overwrite !== undefined).assertTrue();
        expect(taskInfo2.config.method !== undefined).assertTrue();
        expect(taskInfo2.config.headers !== undefined).assertTrue();
        expect(taskInfo2.config.data !== undefined).assertTrue();
        expect(taskInfo2.config.saveas !== undefined).assertTrue();
        expect(taskInfo2.config.network !== undefined).assertTrue();
        expect(taskInfo2.config.metered !== undefined).assertTrue();
        expect(taskInfo2.config.roaming !== undefined).assertTrue();
        expect(taskInfo2.config.retry !== undefined).assertTrue();
        expect(taskInfo2.config.redirect !== undefined).assertTrue();
        expect(taskInfo2.config.proxy !== undefined).assertTrue();
        expect(taskInfo2.config.index !== undefined).assertTrue();
        expect(taskInfo2.config.begins !== undefined).assertTrue();
        expect(taskInfo2.config.ends !== undefined).assertTrue();
        expect(taskInfo2.config.gauge !== undefined).assertTrue();
        expect(taskInfo2.config.precise !== undefined).assertTrue();
        expect(taskInfo2.config.token !== undefined).assertTrue();
        expect(taskInfo2.config.priority !== undefined).assertTrue();
        expect(taskInfo2.config.extras !== undefined).assertTrue();
        expect(taskInfo2.config.multipart !== undefined).assertTrue();
        expect(taskInfo2.config.notification !== undefined).assertTrue();
        expect(taskInfo2.config.minSpeed !== undefined).assertTrue();
        expect(taskInfo2.config.timeout !== undefined).assertTrue();

        let notification1: request.agent.Notification = {
          title: 'test',
          text: 'text'
        }
        let notification2: request.agent.Notification = {
          title: '',
          text: ''
        }
        let groupConfig1: request.agent.GroupConfig = {
          gauge: false,
          notification:notification1
        }
        let groupConfig2: request.agent.GroupConfig = {
          gauge: true,
          notification:notification2
        }
        let gid1: string = await request.agent.createGroup(groupConfig1);
        expect(gid1 !== undefined).assertTrue();
        let gid2: string = await request.agent.createGroup(groupConfig2);
        expect(gid2 !== undefined).assertTrue();
        done();
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0400 create end");
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0400 create catch err: " + JSON.stringify(err.code));
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0500
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0500
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0500 is starting-----------------------");
      let attachments: Array<request.agent.FormItem> = [{
        name: "uploadTest",
        value: {
          path: "base/test.txt",
          filename: "test.txt",
          contentType: 'length',
          extras:{'Accept': '*/*'},
        }
      }];
      let config: request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'http://127.0.0.1:8080',
        title: 'reeateTest',
        mode: request.agent.Mode.BACKGROUND,
        description: 'XTS download test!',
        network: request.agent.Network.CELLULAR,
        data: attachments,
        multipart: true
      };
      try {
        let task = await request.agent.create(baseContext!, config);

        request.agent.create(baseContext!, config, (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0500 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(task!.tid !== undefined).assertTrue();
            expect(task!.config !== undefined).assertTrue();
            expect(task!.config.action !== undefined).assertTrue();
            expect(task!.config.url !== undefined).assertTrue();
            expect(task!.config.title !== undefined).assertTrue();
            expect(task!.config.description !== undefined).assertTrue();
            expect(task!.config.mode !== undefined).assertTrue();
            expect(task!.config.overwrite !== undefined).assertTrue();
            expect(task!.config.method !== undefined).assertTrue();
            expect(task!.config.headers !== undefined).assertTrue();
            expect(task!.config.data !== undefined).assertTrue();
            expect(task!.config.saveas !== undefined).assertTrue();
            expect(task!.config.network !== undefined).assertTrue();
            expect(task!.config.metered !== undefined).assertTrue();
            expect(task!.config.roaming !== undefined).assertTrue();
            expect(task!.config.retry !== undefined).assertTrue();
            expect(task!.config.redirect !== undefined).assertTrue();
            expect(task!.config.proxy !== undefined).assertTrue();
            expect(task!.config.index !== undefined).assertTrue();
            expect(task!.config.begins !== undefined).assertTrue();
            expect(task!.config.ends !== undefined).assertTrue();
            expect(task!.config.gauge !== undefined).assertTrue();
            expect(task!.config.precise !== undefined).assertTrue();
            expect(task!.config.token !== undefined).assertTrue();
            expect(task!.config.priority !== undefined).assertTrue();
            expect(task!.config.extras !== undefined).assertTrue();
            expect(task!.config.multipart !== undefined).assertTrue();
            expect(task!.config.notification !== undefined).assertTrue();
            expect(task!.config.minSpeed !== undefined).assertTrue();
            expect(task!.config.timeout !== undefined).assertTrue();
          } catch (err) {
            console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0500 catch err: " + JSON.stringify(err));
          }
        });

        request.agent.show(task.tid, (err, taskInfo) => {
          if (err) {
            console.error(`====>Failed to show a upload task err`);
            expect().assertFail();
          }
          expect(taskInfo!.saveas !== undefined).assertTrue();
          expect(taskInfo!.url !== undefined).assertTrue();
          expect(taskInfo!.data !== undefined).assertTrue();
          expect(taskInfo!.tid !== undefined).assertTrue();
          expect(taskInfo!.title !== undefined).assertTrue();
          expect(taskInfo!.description !== undefined).assertTrue();
          expect(taskInfo!.action !== undefined).assertTrue();
          expect(taskInfo!.mode !== undefined).assertTrue();
          expect(taskInfo!.priority !== undefined).assertTrue();
          expect(taskInfo!.mimeType !== undefined).assertTrue();
          expect(taskInfo!.progress !== undefined).assertTrue();
          expect(taskInfo!.gauge !== undefined).assertTrue();
          expect(taskInfo!.ctime !== undefined).assertTrue();
          expect(taskInfo!.mtime !== undefined).assertTrue();
          expect(taskInfo!.retry !== undefined).assertTrue();
          expect(taskInfo!.tries !== undefined).assertTrue();
          expect(taskInfo!.faults !== undefined).assertTrue();
          expect(taskInfo!.reason !== undefined).assertTrue();
          expect(taskInfo!.extras !== undefined).assertTrue();
          console.info(`====>Succeeded in showing a upload task.`);
        });

        request.agent.touch(task.tid, "token", (err, taskInfo) => {
          if (err) {
            console.error(`====>Failed to touch a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          expect(taskInfo!.saveas !== undefined).assertTrue();
          expect(taskInfo!.url !== undefined).assertTrue();
          expect(taskInfo!.data !== undefined).assertTrue();
          expect(taskInfo!.tid !== undefined).assertTrue();
          expect(taskInfo!.title !== undefined).assertTrue();
          expect(taskInfo!.description !== undefined).assertTrue();
          expect(taskInfo!.action !== undefined).assertTrue();
          expect(taskInfo!.mode !== undefined).assertTrue();
          expect(taskInfo!.priority !== undefined).assertTrue();
          expect(taskInfo!.mimeType !== undefined).assertTrue();
          expect(taskInfo!.progress !== undefined).assertTrue();
          expect(taskInfo!.gauge !== undefined).assertTrue();
          expect(taskInfo!.ctime !== undefined).assertTrue();
          expect(taskInfo!.mtime !== undefined).assertTrue();
          expect(taskInfo!.retry !== undefined).assertTrue();
          expect(taskInfo!.tries !== undefined).assertTrue();
          expect(taskInfo!.faults !== undefined).assertTrue();
          expect(taskInfo!.reason !== undefined).assertTrue();
          expect(taskInfo!.extras !== undefined).assertTrue();
          console.info(`====>Succeeded in touching a upload task.`);
        });

        let taskInfo1 = await request.agent.touch(task.tid, "token");
        expect(taskInfo1.saveas !== undefined).assertTrue();
        expect(taskInfo1.url !== undefined).assertTrue();
        expect(taskInfo1.data !== undefined).assertTrue();
        expect(taskInfo1.tid !== undefined).assertTrue();
        expect(taskInfo1.title !== undefined).assertTrue();
        expect(taskInfo1.description !== undefined).assertTrue();
        expect(taskInfo1.action !== undefined).assertTrue();
        expect(taskInfo1.mode !== undefined).assertTrue();
        expect(taskInfo1.priority !== undefined).assertTrue();
        expect(taskInfo1.mimeType !== undefined).assertTrue();
        expect(taskInfo1.progress !== undefined).assertTrue();
        expect(taskInfo1.gauge !== undefined).assertTrue();
        expect(taskInfo1.ctime !== undefined).assertTrue();
        expect(taskInfo1.mtime !== undefined).assertTrue();
        expect(taskInfo1.retry !== undefined).assertTrue();
        expect(taskInfo1.tries !== undefined).assertTrue();
        expect(taskInfo1.faults !== undefined).assertTrue();
        expect(taskInfo1.reason !== undefined).assertTrue();
        expect(taskInfo1.extras !== undefined).assertTrue();
        console.info(`====>Succeeded in promise touching a upload task.`);

        request.agent.search((err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect(data!.length === 0).assertTrue();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length >= 1).assertTrue();
        });

        let time = new Date().getTime();
        let filter1: request.agent.Filter = {
          before: time + 1,
          after: time,
          state: request.agent.State.REMOVED,
        };
        let filter2: request.agent.Filter = {
          before: time + 1000,
          after: time -1000,
        };

        let filter3: request.agent.Filter = {
          state: request.agent.State.INITIALIZED,
        };
        let filter4: request.agent.Filter = {
          state: request.agent.State.WAITING,
        };
        let filter5: request.agent.Filter = {
          state: request.agent.State.RUNNING,
        };
        let filter6: request.agent.Filter = {
          state: request.agent.State.RETRYING,
        };
        let filter7: request.agent.Filter = {
          state: request.agent.State.PAUSED,
        };
        let filter8: request.agent.Filter = {
          state: request.agent.State.STOPPED,
        };
        let filter9: request.agent.Filter = {
          state: request.agent.State.COMPLETED,
        };
        let filter10: request.agent.Filter = {
          state: request.agent.State.FAILED,
        };
        let filter11: request.agent.Filter = {
          state: request.agent.State.REMOVED,
        };

        let tasksData1:Array<string>  = await request.agent.search(filter1);
        expect(tasksData1.length === 0).assertTrue();
        let tasksData2:Array<string>  = await request.agent.search(filter2);
        expect(tasksData2.length >= 1).assertTrue();
        let tasksData3:Array<string>  = await request.agent.search(filter3);
        expect(tasksData3.length !== 0).assertTrue();
        let tasksData4:Array<string>  = await request.agent.search(filter4);
        expect(tasksData4.length !== 0).assertTrue();
        let tasksData5:Array<string>  = await request.agent.search(filter5);
        expect(tasksData5.length !== 0).assertTrue();
        let tasksData6:Array<string>  = await request.agent.search(filter6);
        expect(tasksData6.length !== 0).assertTrue();
        let tasksData7:Array<string>  = await request.agent.search(filter7);
        expect(tasksData7.length !== 0).assertTrue();
        let tasksData8:Array<string>  = await request.agent.search(filter8);
        expect(tasksData8.length !== 0).assertTrue();
        let tasksData9:Array<string>  = await request.agent.search(filter9);
        expect(tasksData9.length !== 0).assertTrue();
        let tasksData10:Array<string>  = await request.agent.search(filter10);
        expect(tasksData10.length !== 0).assertTrue();
        let tasksData11:Array<string>  = await request.agent.search(filter11);
        expect(tasksData11.length !== 0).assertTrue();
        let tasksData12:Array<string>  = await request.agent.search();
        expect(tasksData12.length > 1).assertTrue();

        request.agent.search((err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect(data!.length === 0).assertTrue();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length >= 1).assertTrue();
        });

        request.agent.search(filter3, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter4, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter5, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter6, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter7, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter8, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter9, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter10, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });
        request.agent.search(filter11, (err, data) => {
          if (err) {
            console.error(`====>Failed to search a upload task, Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
          console.info(`====>Succeeded in searching a upload task. `);
          expect(data!.length !== 0).assertTrue();
        });

        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['ohos.request.event.COMPLETE']
        };
        try {
          commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
            if(err) {
              console.info(`====>Succeeded in creating subscriber.`);
            }
            console.error(`====>Failed to create subscriber. Code is ${err!.code}, message is ${err!.message}`);
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(`====>Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
        done();
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0500 create end");
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0500 create catch err: " + JSON.stringify(err.code));
        expect(err.code === 13400001).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0600
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0600
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0600 is starting-----------------------");
      try{
        await request.agent.getTask(baseContext!, '', '');
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0600 getTask success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_0600 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0700
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0700
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0700 is starting-----------------------");
      try{
        await request.agent.remove('');
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0700 remove success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_0700 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0800
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0800
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0800 is starting-----------------------");
      try{
        request.agent.remove('', (err)=>{
          try{
            console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0800 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_0800 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_0800 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_0900
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_0900
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_0900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_0900 is starting-----------------------");
      try{
        await request.agent.show('');
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_0900 show success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_0900 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1000
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1000
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1000 is starting-----------------------");
      try{
        request.agent.show('', (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1000 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_1000 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_1000 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1100
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1100
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1100 is starting-----------------------");
      try{
        await request.agent.touch('', '');
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1100 touch success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_1100 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1200
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1200
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1200 is starting-----------------------");
      try{
        request.agent.touch('', '', (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1200 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_1200 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_1200 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1300
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1300
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1300 is starting-----------------------");
      try{
        await request.agent.attachGroup('', []);
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1300 attachGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_downloadConfigSaves_Supplemental_1300 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1400
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1400
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1400', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1400 is starting-----------------------");
      try{
        await request.agent.deleteGroup('');
        console.info("====>SUB_Request_download_Supplemental_3800 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3800 catch err: ${JSON.stringify(err.code)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1500
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1500
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1500', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1500 is starting-----------------------");
      try {
        await request.agent.getTask(baseContext!, 'task');
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1500 getTask success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1500 catch: " + JSON.stringify(err.code));
        expect(err.code === 21900006);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1600
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1600
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1600 is starting-----------------------");
      try {
        await request.agent.show("12315");
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1600 show success");
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1600 catch err:' + JSON.stringify(err.code));
        expect(err.code).assertEqual(21900006);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1700
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1700
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1700 is starting-----------------------");
      request.agent.show("12315", (err, taskInfo)=>{
        try{
          if(err){
            console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1700 err:' + JSON.stringify(err.code));
            expect(err.code).assertEqual(21900006);
            done();
          }else{
            console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1700 failed');
            expect().assertFail();
          }
        }catch(err){
          console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1700 show throw_err:' + JSON.stringify(err.code));
          done();
        };
      });
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1800
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1800
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1800', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1800 is starting-----------------------");
      try {
        await request.agent.touch('12315', 'downloadTest');
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_1800 touch success");
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1800 catch err:' + JSON.stringify(err.code));
        expect(err.code).assertEqual(21900006);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_1900
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_1900
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_1900', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_1900 is starting-----------------------");
      request.agent.touch('123', 'downloadTest', (err, taskInfo)=>{
        try{
          if(err){
            console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1900 err:' + JSON.stringify(err.code));
            expect(err.code).assertEqual(21900006);
            done();
          }else{
            console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1900 failed');
            expect().assertFail();
          }
        }catch(err){
          console.info('====>SUB_Request_downloadConfigSaves_Supplemental_1900 touch throw_err:' + JSON.stringify(err.code));
          done();
        };
      });
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_2000
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_2000
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_2000', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_2000 is starting-----------------------");
      try {
        await request.agent.attachGroup('123', []);
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2000 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2000 err: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(21900008);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_2100
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_2100
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_2100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_2100 is starting-----------------------");
      try {
        await request.agent.deleteGroup('groupConfig');
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2100 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2100 err: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(21900008);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_2200
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_2200
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_2200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_2200 is starting-----------------------");
      try {
        let notification: request.agent.Notification = {
        }
        let groupConfig: request.agent.GroupConfig = {
          notification: notification
        }
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2200 createGroup success");
        await request.agent.attachGroup(gid, ['123456']);
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2200 attachGroup success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2200 err: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(21900006);
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadConfigSaves_Supplemental_2300
     * @tc.number SUB_Request_downloadConfigSaves_Supplemental_2300
     * @tc.desc   wantAgent is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadConfigSaves_Supplemental_2300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("====>-----------------------SUB_Request_downloadConfigSaves_Supplemental_2300 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test.hap',
        title: 'reeateTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_downloadConfigSaves_Supplemental_2300.txt',
        network: request.agent.Network.ANY,
      };
      let groupConfig: request.agent.GroupConfig = {
        gauge: true,
        notification: {}
      }

      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext!, config);
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2300 create task success");
        let gid: string = await request.agent.createGroup(groupConfig)
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2300 createGroup success");
        await task.start();
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2300 task start success");
        await request.agent.attachGroup(gid, [task.tid]);
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2300 attachGroup success tid: " + task.tid);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_downloadConfigSaves_Supplemental_2300 err: " + JSON.stringify(err.code));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await request.agent.remove(task.tid);
        }
        done();
      }
    });

  });
};