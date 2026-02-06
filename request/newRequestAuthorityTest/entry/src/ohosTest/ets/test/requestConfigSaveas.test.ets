/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import request from '@ohos.request';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from  '@ohos.file.fs';
import statistics from '@ohos.net.statistics';

export default function requestConfigSavesTest() {
  describe('requestConfigSavesTest', () => {
    let removeTask = async (task: request.agent.Task): Promise<void> => {
      try {
        await request.agent.remove(task.tid)
        console.info("====>task remove success");
      } catch (err) {
        console.info("====>task remove failed, possibly the task have remove" + JSON.stringify(err));
      }
    }

    let sleep = (timeout: number): Promise<null> => {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    let baseContext: common.Context;
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll((done: Function) => {
      try {
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll catch err:'+JSON.stringify(err))
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0100
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Agent_TaskSaveas_0100', Level.LEVEL1, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: undefined,
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let path: string = '/data/storage/el2/base/haps/entry_test/cache/test.hap';
        let ifExitOut: boolean = fs.accessSync(path);
        if (ifExitOut) {
          fs.unlinkSync(path);
          console.info("====>SUB_Request_Agent_TaskSaveas_0100 unlinkSync file success");
        }
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0100 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0100 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              if(ifExit){
                fs.unlinkSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_0100 delete file success");
              }
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0100 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0100 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0100 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0100 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0200
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Agent_TaskSaveas_0200', Level.LEVEL1, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let path: string = '/data/storage/el2/base/haps/entry_test/cache/test.hap';
        let ifExitOut: boolean = fs.accessSync(path);
        if (ifExitOut) {
          fs.unlinkSync(path);
          console.info("====>SUB_Request_Agent_TaskSaveas_0100 unlinkSync file success");
        }
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          console.info("====>SUB_Request_Agent_TaskSaveas_0200 baseContext: " + JSON.stringify(baseContext.cacheDir));
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0200 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0200 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              if(ifExit){
                fs.unlinkSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_0200 delete file success");
              }
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0200 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0200 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0200 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0200 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0300
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_0300', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0300 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './request/SUB_Request_Agent_TaskSaveas_0300',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0300 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry_test/cache/' + task.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_0300 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0300 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0300 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0300 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0300 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0300 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0400
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_0400', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_TaskSaveas_0400',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0400 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry_test/cache/' + task.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_0400 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0400 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0400 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0400 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0400 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0400 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0400 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0500
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_0500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/ request/SUB_Request_Agent_TaskSaveas_0500',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_TaskSaveas_0500 create not err");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0500 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0600
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Agent_TaskSaveas_0600', Level.LEVEL1, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0600 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'SUB_Request_Agent_TaskSaveas_0600',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0600 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry_test/cache/' + task.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_0600 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0600 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0600 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0600 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0600 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0600 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0600 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0700
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_0700', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0700 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'request/SUB_Request_Agent_TaskSaveas_0700',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0700 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry_test/cache/' + task.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_0700 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0700 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0700 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0700 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0700 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0700 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0700 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0800
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_0800', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0800 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'internal://cache/test.hap',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0800 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path: string = '/data/storage/el2/base/haps/entry_test/cache/test.hap';
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0800 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              if(ifExit){
                fs.unlinkSync(path);
                console.info("====>SUB_Request_Agent_TaskSaveas_0800 delete file success");
              }
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0800 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0800 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0800 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0800 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0800 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0900
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_0900', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_0900 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_0900',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_0900 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path = task.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_0900 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_0900 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_0900 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_0900 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_0900 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_0900 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_0900 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_1000
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_1000', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_1000 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el2/base',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_TaskSaveas_1000 create not err");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_1000 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_1010
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_1010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_1010 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el2/base',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, (err: BusinessError, task: request.agent.Task) => {
          try {
            console.info("====>SUB_Request_Agent_TaskSaveas_1010 create callback");
            expect().assertFail();
            done();
          }catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_1010 err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_1010 create err: " + JSON.stringify(err));
        expect(err.code).assertEqual(13400001);
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_1100
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_1100', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_1100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/../../data/storage/el1/../el2/base/SUB_Request_Agent_TaskSaveas_1100',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_1100 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path: string = '/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_1100';
              console.info("====>SUB_Request_Agent_TaskSaveas_1100 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_1100 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_1100 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_1100 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_1100 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_1100 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_1100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_1200
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_1200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_1200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/../../el2/base/SUB_Request_Agent_TaskSaveas_1200',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_TaskSaveas_1200 create not err");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_1200 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_1300
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_1300', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_1300 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'file://com.acts.newRequestAuthority.test/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_1300',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_1300 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path: string = '/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_1300';
              console.info("====>SUB_Request_Agent_TaskSaveas_1300 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_1300 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_1300 catch err: " + JSON.stringify(err));
              done();
            }
          }
          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_1300 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_1300 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_1300 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_1300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_1400
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_1400', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_1400 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: 'file://com.examples.app123/data/storage/el2/base/SUB_Request_Agent_TaskSaveas_1300',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_TaskSaveas_1400 create not err");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_1400 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TaskSaveas_0900
     * @tc.name: different saveas of config
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TaskSaveas_1500', Level.LEVEL2, (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_TaskSaveas_1500 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: '/data/storage/el5/base/SUB_Request_Agent_TaskSaveas_1500',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        console.info("====>SUB_Request_Agent_TaskSaveas_1500 baseContext: " + JSON.stringify(baseContext));
        request.agent.create(baseContext, config, async (err: BusinessError, task: request.agent.Task) => {
          let on_completedCallback = (pro: request.agent.Progress) => {
            try {
              task.off('completed', on_completedCallback);
              console.info("====>SUB_Request_Agent_TaskSaveas_1500 completed task.config.saveas: " + JSON.stringify(task.config.saveas));
              let path = task.config.saveas;
              console.info("====>SUB_Request_Agent_TaskSaveas_1500 path: " + path);
              let ifExit: boolean = fs.accessSync(path);
              console.info("====>SUB_Request_Agent_TaskSaveas_1500 ifExit: " + ifExit);
              expect(ifExit).assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_Request_Agent_TaskSaveas_1500 catch err: " + JSON.stringify(err));
              done();
            }
          }

          try {
            if(err){
              console.info("====>SUB_Request_Agent_TaskSaveas_1500 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info("====>SUB_Request_Agent_TaskSaveas_1500 start success: " + JSON.stringify(config.saveas));
          } catch (err) {
            console.info("====>SUB_Request_Agent_TaskSaveas_1500 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Request_Agent_TaskSaveas_1500 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_onResponse_0100
     * @tc.name: supports the response header of the listening task.
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Agent_onResponse_0100', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_onResponse_0100 create success");
        let responseCallback_1 = async (info: request.agent.HttpResponse) => {
          try {
            task.off('response');
            await removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_0100 response info: " + JSON.stringify(info));
            expect(info.version).assertEqual('HTTP/1.1');
            expect(info.statusCode).assertEqual(200);
            expect(info.reason).assertEqual('OK');
            expect(typeof(info.headers) === 'object').assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_0100 err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('response', responseCallback_1);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_0100 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_onResponse_0200
     * @tc.name: supports the response header of the listening task.
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_onResponse_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_0200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984572/test-files/releases/downloads/1.1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_0200',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_onResponse_0200 create success");
        let responseCallback_1 = async (info: request.agent.HttpResponse) => {
          try {
            task.off('response');
            removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_0200 response info: " + JSON.stringify(info));
            expect(info.statusCode).assertEqual(404);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_0200 err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('response', responseCallback_1);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_0200 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_onResponse_0300
     * @tc.name: supports the response header of the listening task.
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Agent_onResponse_0300', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_0300 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_0300',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let flage: boolean = true;
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_onResponse_0300 create success");
        let responseCallback_1 = (info: request.agent.HttpResponse) => {
          flage = false;
          console.info("====>SUB_Request_Agent_onResponse_0300 response info: " + JSON.stringify(info));
        }
        let completed = (pro: request.agent.Progress) => {
          try {
            task.off('completed');
            console.info("====>SUB_Request_Agent_onResponse_0300 completed pro: " + JSON.stringify(pro));
            expect(flage).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_0300 err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('response', responseCallback_1);
        task.off('response', responseCallback_1);
        task.on('completed', completed)
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_0300 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_0300 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_onResponse_0400
     * @tc.name: supports the response header of the listening task.
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_onResponse_0400', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_Request_Agent_onResponse_0400 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_0400.txt',
        network: request.agent.Network.ANY,
        overwrite: true
      };

      let arr: Array<number> = new Array();
      let arr1 = [0, 1, 2];
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        let responseCallback_1 = (info1: request.agent.HttpResponse) => {
          task.off('response', responseCallback_1)
          console.info("====>SUB_Request_Agent_onResponse_0400 info1: " + JSON.stringify(info1));
          arr.push(0);
        }

        let responseCallback_2 = (info2: request.agent.HttpResponse) => {
          task.off('response', responseCallback_2)
          console.info("====>SUB_Request_Agent_onResponse_0400 info2: " + JSON.stringify(info2));
          arr.push(1);
        }

        let responseCallback_3 = async (info3: request.agent.HttpResponse) => {
          try {
            task.off('response', responseCallback_3)
            await removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_0400 info3: " + JSON.stringify(info3));
            arr.push(2);
            console.info("====>SUB_Request_Agent_onResponse_0400 task3 response on arr: " + JSON.stringify(arr));
            expect(arr.join()).assertEqual(arr1.join());
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_0400 catch err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('response', responseCallback_1);
        task.on('response', responseCallback_2);
        task.on('response', responseCallback_3);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_0400 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_0400 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_onResponse_0500
     * @tc.name: supports the response header of the listening task.
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_onResponse_0500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_0500 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_0500',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let flage: boolean = true;
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_onResponse_0500 create success");
        let responseCallback_1 = (info1: request.agent.HttpResponse) => {
          flage = false;
          console.info("====>SUB_Request_Agent_onResponse_0500 response info1: " + JSON.stringify(info1));
        }
        let responseCallback_2 = (info2: request.agent.HttpResponse) => {
          flage = false;
          console.info("====>SUB_Request_Agent_onResponse_0500 response info2: " + JSON.stringify(info2));
        }
        let completed = (pro: request.agent.Progress) => {
          try {
            task.off('completed');
            console.info("====>SUB_Request_Agent_onResponse_0500 completed pro: " + JSON.stringify(pro));
            expect(flage).assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_0500 err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('response', responseCallback_1);
        task.on('response', responseCallback_2);
        task.off('response');
        task.on('completed', completed)
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_0500 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_0500 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_onResponse_0600
     * @tc.name: supports the response header of the listening task.
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Agent_onResponse_0600', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_0600 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_0600',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_onResponse_0600 create success");
        let responseCallback_1 = async (info: request.agent.HttpResponse) => {
          console.info("====>SUB_Request_Agent_onResponse_0600 response info: " + JSON.stringify(info));
        }
        task.off('response', responseCallback_1);
        await task.start();
        console.info("====>SUB_Request_Agent_onResponse_0600 task.start");
        await removeTask(task);
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_0600 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_onResponse_0700
     * @tc.name: supports the response header of the listening task.
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_onResponse_0700', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_onResponse_0700 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_onResponse_0700',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_onResponse_0700 create success");

        let responseCallback_1 = async (info: request.agent.HttpResponse) => {
          try {
            task.off('response');
            await removeTask(task);
            console.info("====>SUB_Request_Agent_onResponse_0700 response info: " + JSON.stringify(info));
            expect(info.statusCode).assertEqual(206);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_0700 responseCallback_1 err: " + JSON.stringify(err));
            done();
          }
        }

        let progressCallback = async (pro: request.agent.Progress) => {
          try {
            task.off('progress');
            console.info("====>SUB_Request_Agent_onResponse_0700 pro: " + JSON.stringify(pro));
            await task.pause();
            task.on('response', responseCallback_1);
            let t = setTimeout(async () => {
              clearTimeout(t);
              console.info("====>SUB_Request_Agent_onResponse_0700 task.resume");
              await task.resume();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Request_Agent_onResponse_0700 progressCallback err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('progress', progressCallback);
        await task.start();
      } catch (err) {
        console.info("====>SUB_Request_Agent_onResponse_0700 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_proxy_0200
     * @tc.name: incorrect parameters of the upload proxy
     * @tc.desc: request config saveas validate
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_proxy_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_proxy_0200 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.UPLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_proxy_0200',
        network: request.agent.Network.ANY,
        overwrite: true,
        proxy: 'https://192.168.249.58:808'
      };
      try {
        console.info("====>SUB_Request_Agent_proxy_0200 create task");
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_proxy_0200 create success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Agent_proxy_0200 create catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
    * @tc.number: SUB_Request_Agent_proxy_0400
    * @tc.name: SUB_Request_Agent_proxy_0400
    * @tc.desc: incorrect parameters of the download proxy
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 2
    */
    it('SUB_Request_Agent_proxy_0400', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_Request_Agent_proxy_0400 is starting-----------------------');
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_proxy_0400',
        network: request.agent.Network.ANY,
        overwrite: true,
        proxy: 'https://192.168.249.58:808'
      };
      try {
        console.info('====>SUB_Request_Agent_proxy_0400 create task');
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info('====>SUB_Request_Agent_proxy_0400 create success');
        expect().assertFail();
        done();
      } catch (err) {
        console.info('====>SUB_Request_Agent_proxy_0400 create catch err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_ErrorDetailed_0100
     * @tc.name: SUB_Request_Agent_ErrorDetailed_0100
     * @tc.desc: incorrect error of PARAM
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_ErrorDetailed_0100', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_Request_Agent_ErrorDetailed_0100 is starting-----------------------');
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://?PARAM.com',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ErrorDetailed_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('failed', async (pro: request.agent.Progress) => {
          try {
            task.off('failed');
            console.info('====>SUB_Request_Agent_ErrorDetailed_0100 failed pro: ' + JSON.stringify(pro));
            let info:request.agent.TaskInfo = await request.agent.show(task.tid);
            console.info('====>SUB_Request_Agent_ErrorDetailed_0100 info: ' + JSON.stringify(info));
            expect(info.faults).assertEqual(48);
            done();
          } catch (err) {
            console.info('====>SUB_Request_Agent_ErrorDetailed_0100 err: ' + JSON.stringify(err));
          }
        })
        await task.start();
        console.info('====>SUB_Request_Agent_ErrorDetailed_0100 create success');
      } catch (err) {
        console.info('====>> create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_TrafficStatistics_0200
     * @tc.name: SUB_Request_Agent_TrafficStatistics_0200
     * @tc.desc: incorrect error of PARAM
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_TrafficStatistics_0200', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_Request_Agent_TrafficStatistics_0200 is starting-----------------------');
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://cidownload.openharmony.cn/version/Master_Version/OpenHarmony_5.0.2.45/20240924_092847/version-Master_Version-OpenHarmony_5.0.2.45-20240924_092847-hispark_taurus_Linux_weekly.tar.gz',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_TrafficStatistics_0200',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info('====>SUB_Request_Agent_TrafficStatistics_0200 create success');
        try {
          let times = 0;
          let rx1: number;
          let tx1: number;
          let rx2: number;
          let tx2: number;
          let t = setInterval(async () => {
            console.info('====>SUB_Request_Agent_TrafficStatistics_0200 for: ' + times + ' times');
            times += 1;
            try {
              if( times % 2 !== 0) {
                rx1 = await statistics.getUidRxBytes(getContext().applicationInfo.uid);
                tx1 = await statistics.getUidTxBytes(getContext().applicationInfo.uid);
                console.info('====>SUB_Request_Agent_TrafficStatistics_0200 rx1: ' + rx1 +' tx1: ' + tx1);
              } else {
                rx2 = await statistics.getUidRxBytes(getContext().applicationInfo.uid)
                tx2 = await statistics.getUidTxBytes(getContext().applicationInfo.uid)
                console.info('====>SUB_Request_Agent_TrafficStatistics_0200 rx2: ' + rx2 +' tx2: ' + tx2);
              }
              if(times !== 1){
                expect(rx1 !== rx2).assertTrue();
                expect(tx1 !== tx2).assertTrue();
              }
              if(times === 4){
                clearInterval(t);
                await removeTask(task);
                console.info('====>SUB_Request_Agent_TrafficStatistics_0200 statistics complete');
                done();
              }
            } catch (err) {
              clearInterval(t)
              await removeTask(task);
              console.info('====>SUB_Request_Agent_TrafficStatistics_0200 expect err: ' + JSON.stringify(err));
              done();
            }
          }, 1500)
        } catch (err) {
          console.info('====>SUB_Request_Agent_TrafficStatistics_0200 err: ' + JSON.stringify(err));
          done();
        }
        await task.start();
        console.info('====>SUB_Request_Agent_TrafficStatistics_0200 task.start');
      } catch (err) {
        console.info('====>SUB_Request_Agent_TrafficStatistics_0200 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_Request_Agent_ContinueDown_0300
     * @tc.name SUB_Request_Agent_ContinueDown_0300
     * @tc.desc  After the download is completed, resume the breakpoint transmission
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_ContinueDown_0300', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_ContinueDown_0300 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ContinueDown_0300.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      request.agent.create(baseContext, config, async (err, task) => {
        let on_completedCallback = async (pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          try {
            await task.start();
            console.info("====>SUB_Request_Agent_ContinueDown_0300 task.start success ");
            expect().assertFail();
          } catch (err) {
            try {
              console.info("====>SUB_Request_Agent_ContinueDown_0300 start err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
              done();
            } catch (e) {
              console.info("====>SUB_Request_Agent_ContinueDown_0300 code err: " + JSON.stringify(e));
              done();
            }
          }
        }
        try {
          if(err){
            console.info("====>SUB_Request_Agent_ContinueDown_0300 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on('completed', on_completedCallback);
          await task.start();
        } catch (err) {
          console.info("====>SUB_Request_Agent_ContinueDown_0300 catch err: " + JSON.stringify(err));
          await removeTask(task);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_Request_Agent_ContinueDown_0310
     * @tc.name SUB_Request_Agent_ContinueDown_0310
     * @tc.desc  After the download is completed, resume the breakpoint transmission
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_ContinueDown_0310', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_ContinueDown_0310 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ContinueDown_0310.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      request.agent.create(baseContext, config, async (err, task) => {
        let on_completedCallback = async (pro: request.agent.Progress) => {
          task.off('completed', on_completedCallback);
          task.start(async (err: BusinessError) => {
            try {
              console.info("====>SUB_Request_Agent_ContinueDown_0310 start err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
              done();
            }catch (err) {
              console.info("====>SUB_Request_Agent_ContinueDown_0310 code err: " + JSON.stringify(err));
              done();
            }
          });
        }
        try {
          if(err){
            console.info("====>SUB_Request_Agent_ContinueDown_0310 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on('completed', on_completedCallback);
          await task.start();
        } catch (err) {
          console.info("====>SUB_Request_Agent_ContinueDown_0310 catch err: " + JSON.stringify(err));
          await removeTask(task);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_Request_Agent_ContinueDown_0500
     * @tc.name SUB_Request_Agent_ContinueDown_0500
     * @tc.desc  download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_Agent_ContinueDown_0500', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_ContinueDown_0500 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ContinueDown_0500.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      request.agent.create(baseContext, config, async (err, task) => {
        let on_completedCallback = async (pro: request.agent.Progress) => {
          task.off('pause', on_completedCallback);
          try {
            await task.start();
            console.info("====>SUB_Request_Agent_ContinueDown_0500 task.start success ");
            expect().assertFail();
          } catch (err) {
            try {
              console.info("====>SUB_Request_Agent_ContinueDown_0500 start err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
              done();
            } catch (e) {
              console.info("====>SUB_Request_Agent_ContinueDown_0500 code err: " + JSON.stringify(e));
              done();
            }
          }
        }
        try {
          if(err){
            console.info("====>SUB_Request_Agent_ContinueDown_0500 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          task.on('pause', on_completedCallback);
          await task.start();
          await task.pause();
        } catch (err) {
          console.info("====>SUB_Request_Agent_ContinueDown_0500 catch err: " + JSON.stringify(err));
          await removeTask(task);
          done();
        }
      });
    });

    /*
     * @tc.number: SUB_Request_Agent_PauseError_callback_0100
     * @tc.name: SUB_Request_Agent_PauseError_callback_0100
     * @tc.desc: pause errcode.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_PauseError_callback_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_PauseError_callback_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_PauseError_callback_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_PauseError_callback_0100 create success");
        task.pause(async (err: BusinessError) => {
          try{
            if (err) {
              console.info("====>SUB_Request_Agent_PauseError_callback_0100 download pause err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
            } else {
              console.info('====>SUB_Request_Agent_PauseError_callback_0100 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info("====>SUB_Request_Agent_PauseError_callback_0100 catch err: " + JSON.stringify(err));
          }
          await removeTask(task);
          console.info("====>SUB_Request_Agent_PauseError_callback_0100 removeTask");
          done();
        })
      } catch (err) {
        console.info("====>SUB_Request_Agent_PauseError_callback_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_PauseError_promise_0100
     * @tc.name: SUB_Request_Agent_PauseError_promise_0100
     * @tc.desc: pause errcode.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_PauseError_promise_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_PauseError_promise_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_PauseError_promise_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_PauseError_promise_0100 create success");
        await task.pause();
        console.info("====>SUB_Request_Agent_PauseError_promise_0100 pause success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_PauseError_promise_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Agent_PauseError_promise_0100 removeTask");
        }
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_ResumeError_callback_0100
     * @tc.name: SUB_Request_Agent_ResumeError_callback_0100
     * @tc.desc: resume errcode.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_ResumeError_callback_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_ResumeError_callback_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ResumeError_callback_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_ResumeError_callback_0100 create success");
        task.resume(async (err: BusinessError) => {
          try{
            if(err){
              console.info("====>SUB_Request_Agent_ResumeError_callback_0100 download pause err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
            } else {
              console.info('====>SUB_Request_Agent_ResumeError_callback_0100 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info("====>SUB_Request_Agent_ResumeError_callback_0100 catch err: " + JSON.stringify(err));
          }
          await removeTask(task);
          console.info("====>SUB_Request_Agent_ResumeError_callback_0100 removeTask");
          done();
        })
      } catch (err) {
        console.info("====>SUB_Request_Agent_ResumeError_callback_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_ResumeError_promise_0100
     * @tc.name: SUB_Request_Agent_ResumeError_promise_0100
     * @tc.desc: resume errcode.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_ResumeError_promise_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_ResumeError_promise_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ResumeError_promise_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_ResumeError_promise_0100 create success");
        await task.resume();
        console.info("====>SUB_Request_Agent_ResumeError_promise_0100 pause success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_ResumeError_promise_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Agent_ResumeError_promise_0100 removeTask");
        }
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_StopError_callback_0100
     * @tc.name: SUB_Request_Agent_StopError_callback_0100
     * @tc.desc: stop errcode.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_StopError_callback_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_StopError_callback_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_StopError_callback_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_StopError_callback_0100 create success");
        task.stop(async (err: BusinessError) => {
          try{
            if(err){
              console.info("====>SUB_Request_Agent_StopError_callback_0100 download pause err: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
            } else {
              console.info('====>SUB_Request_Agent_StopError_callback_0100 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info("====>SUB_Request_Agent_StopError_callback_0100 catch err: " + JSON.stringify(err));
          }
          await removeTask(task);
          console.info("====>SUB_Request_Agent_StopError_callback_0100 removeTask");
          done();
        })
      } catch (err) {
        console.info("====>SUB_Request_Agent_StopError_callback_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_StopError_promise_0100
     * @tc.name: SUB_Request_Agent_StopError_promise_0100
     * @tc.desc: stop errcode.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_StopError_promise_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Agent_StopError_promise_0100 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ResumeError_promise_0100',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Agent_StopError_promise_0100 create success");
        await task.stop();
        console.info("====>SUB_Request_Agent_StopError_promise_0100 pause success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Agent_StopError_promise_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900007);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Agent_StopError_promise_0100 removeTask");
        }
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Download_minSped_0100
     * @tc.name: SUB_Request_Download_minSped_0100
     * @tc.desc: speed error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Download_minSped_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_minSped_0100 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: -1,
        duration: 1,
      }

      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_0100',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_minSped_0100 create success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_0100 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Download_minSped_0100 removeTask");
        }
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Download_minSped_0200
     * @tc.name: SUB_Request_Download_minSped_0200
     * @tc.desc: duration error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Download_minSped_0200', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_minSped_0200 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 1,
        duration: -1,
      }

      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_0200',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_minSped_0200 create success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_0200 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Download_minSped_0200 removeTask");
        }
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Download_minSped_0400
     * @tc.name: SUB_Request_Download_minSped_0400
     * @tc.desc: minSpeed less duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Download_minSped_0400', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_minSped_0400 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 1024 * 1024 * 1024,
        duration: 5,
      }
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/BigFile.txt',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_0400',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      try {

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_minSped_0400 create success");
        let faultsCallback = (faults: request.agent.Faults) => {
          try {
            task.off('faultOccur', faultsCallback);
            console.info("====>SUB_Request_Download_minSped_0400 faults: " + JSON.stringify(faults));
            expect(faults).assertEqual(request.agent.Faults.LOW_SPEED);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_minSped_0400 err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('faultOccur', faultsCallback)
        await task.start();
        console.info("====>SUB_Request_Download_minSped_0400 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_0400 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Download_minSped_0900
     * @tc.name: SUB_Request_Download_minSped_0900
     * @tc.desc: maxSpeed less than minSpeed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Download_minSped_0900', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_minSped_0900 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 16385,
        duration: 60,
      }

      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_0900',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      let task: request.agent.Task | null = null;
      try {
        task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_minSped_0900 create success");
        task.setMaxSpeed(16 * 1024);
        console.info("====>SUB_Request_Download_minSped_0900 setMaxSpeed success");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_0900 catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        if (task !== null){
          await removeTask(task);
          console.info("====>SUB_Request_Download_minSped_0900 removeTask");
        }
        done();
      }
    });

    /*
     * @tc.number: SUB_Request_Download_minSped_1000
     * @tc.name: SUB_Request_Download_minSped_1000
     * @tc.desc: minSpeed right.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Download_minSped_1000', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_minSped_1000 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 1024 * 1024 * 1024,
        duration: 0,
      }
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_1000',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      try {

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_minSped_1000 create success");
        let completed = (pro: request.agent.Progress) => {
          try {
            task.off('completed');
            console.info("====>SUB_Request_Download_minSped_1000 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_minSped_1000 err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('completed', completed)
        await task.start();
        console.info("====>SUB_Request_Download_minSped_1000 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_1000 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /*
     * @tc.number: SUB_Request_Download_minSped_1100
     * @tc.name: SUB_Request_Download_minSped_1100
     * @tc.desc: minSpeed right.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_Request_Download_minSped_1100', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_Download_minSped_1100 is starting-----------------------");
      let minSpeed: request.agent.MinSpeed = {
        speed: 0,
        duration: 1,
      }
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_minSped_1100',
        network: request.agent.Network.ANY,
        minSpeed: minSpeed,
        overwrite: true
      };
      try {

        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_minSped_1100 create success");
        let completed = (pro: request.agent.Progress) => {
          try {
            task.off('completed');
            console.info("====>SUB_Request_Download_minSped_1100 completed pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(64);
            done();
          } catch (err) {
            console.info("====>SUB_Request_Download_minSped_1100 err: " + JSON.stringify(err));
            done();
          }
        }
        task.on('completed', completed)
        await task.start();
        console.info("====>SUB_Request_Download_minSped_1100 task.start");
      } catch (err) {
        console.info("====>SUB_Request_Download_minSped_1100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number  SUB_Request_Download_off_faultOccur_0100
     * @tc.name    SUB_Request_Download_off_faultOccur_0100
     * @tc.desc    on faultOccur.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_off_faultOccur_0100', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_off_faultOccur_0100 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/V1.0/test1.txt',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_off_faultOccur_0100.txt',
        network: request.agent.Network.ANY,
        mode:request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      let arr1 = [2, 3];
      let faultOccurCallBack1 = (faults: request.agent.Faults) => {
        console.info("====>SUB_Request_Download_off_faultOccur_0100 faultOccurCallBack1 faults: " + faults);
        arr.push(1);
      }
      let faultOccurCallBack2 = (faults: request.agent.Faults) => {
        console.info("====>SUB_Request_Download_off_faultOccur_0100 faultOccurCallBack2 faults: " + faults);
        arr.push(2);
      }
      let faultOccurCallBack3 = (faults: request.agent.Faults) => {
        try {
          task.off('faultOccur')
          console.info("====>SUB_Request_Download_off_faultOccur_0100 faultOccurCallBack3 faults: " + faults);
          arr.push(3);
          console.info("====>SUB_Request_Download_off_faultOccur_0100 task3 progress on arr: " + JSON.stringify(arr));
          expect(arr.join()).assertEqual(arr1.join());
          expect(faults).assertEqual(request.agent.Faults.PROTOCOL);
          done();
        } catch (err) {
          console.info("====>SUB_Request_Download_off_faultOccur_0100 catch err: " + JSON.stringify(err));
          done();
        }
      }
      let task: request.agent.Task = await request.agent.create(baseContext, config);
      console.info("====>SUB_Request_Download_off_faultOccur_0100 create task success");
      task.on('faultOccur', faultOccurCallBack1);
      task.off('faultOccur', faultOccurCallBack1);
      task.on('faultOccur', faultOccurCallBack2);
      task.on('faultOccur', faultOccurCallBack3);
      await task.start();
    });

    /**
     * @tc.number  SUB_Request_Download_off_faultOccur_0200
     * @tc.name    SUB_Request_Download_off_faultOccur_0200
     * @tc.desc    on faultOccur.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_off_faultOccur_0200', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_off_faultOccur_0200 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/V1.0/test1.txt',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_off_faultOccur_0200.txt',
        network: request.agent.Network.ANY,
        mode:request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      let faultOccurCallBack1 = (faults: request.agent.Faults) => {
        console.info("====>SUB_Request_Download_off_faultOccur_0200 faultOccurCallBack1 faults: " + faults);
        arr.push(1);
      }
      let faultOccurCallBack2 = (faults: request.agent.Faults) => {
        console.info("====>SUB_Request_Download_off_faultOccur_0200 faultOccurCallBack2 faults: " + faults);
        arr.push(2);
      }
      let faultOccurCallBack3 = (faults: request.agent.Faults) => {
        console.info("====>SUB_Request_Download_off_faultOccur_0200 faultOccurCallBack3 faults: " + faults);
        arr.push(3);
      }

      let task: request.agent.Task = await request.agent.create(baseContext, config);
      console.info("====>SUB_Request_Download_off_faultOccur_0200 create task success");
      task.on('faultOccur', faultOccurCallBack1);
      task.on('faultOccur', faultOccurCallBack2);
      task.on('faultOccur', faultOccurCallBack3);
      task.off('faultOccur');
      await task.start();
      let t = setTimeout(() => {
        clearTimeout(t);
        console.info("====>SUB_Request_Download_off_faultOccur_0200 create task success");
        try {
          console.info("====>SUB_Request_Download_off_faultOccur_0200 task3 progress on arr: " + JSON.stringify(arr));
          expect(arr.join()).assertEqual('');
          done();
        } catch (err) {
          console.info("====>SUB_Request_Download_off_faultOccur_0200 catch err: " + JSON.stringify(err));
          done();
        }
      }, 1000)
    });

    /**
     * @tc.number  SUB_Request_Download_on_faultOccur_0300
     * @tc.name    SUB_Request_Download_on_faultOccur_0300
     * @tc.desc    on faultOccur.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_on_faultOccur_0300', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_on_faultOccur_0300 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https:////',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_on_faultOccur_0300.txt',
        network: request.agent.Network.ANY,
        mode:request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      let arr1 = [1, 2, 3];
      let faultOccurCallBack1 = (faults: request.agent.Faults) => {
        console.info("====>SUB_Request_Download_on_faultOccur_0300 faultOccurCallBack1 faults: " + faults);
        arr.push(1);
      }
      let faultOccurCallBack2 = (faults: request.agent.Faults) => {
        console.info("====>SUB_Request_Download_on_faultOccur_0300 faultOccurCallBack2 faults: " + faults);
        arr.push(2);
      }
      let faultOccurCallBack3 = (faults: request.agent.Faults) => {
        try {
          task.off('faultOccur')
          console.info("====>SUB_Request_Download_on_faultOccur_0300 faultOccurCallBack3 faults: " + faults);
          arr.push(3);
          console.info("====>SUB_Request_Download_on_faultOccur_0300 task3 progress on arr: " + JSON.stringify(arr));
          expect(arr.join()).assertEqual(arr1.join());
          expect(faults).assertEqual(request.agent.Faults.PARAM);
          done();
        } catch (err) {
          console.info("====>SUB_Request_Download_on_faultOccur_0300 catch err: " + JSON.stringify(err));
          done();
        }
      }
      let task: request.agent.Task = await request.agent.create(baseContext, config);
      console.info("====>SUB_Request_Download_on_faultOccur_0300 create task success");
      task.on('faultOccur', faultOccurCallBack1);
      task.on('faultOccur', faultOccurCallBack2);
      task.on('faultOccur', faultOccurCallBack3);
      await task.start();
    });

    /**
     * @tc.number  SUB_Request_Download_timeOut_0200
     * @tc.name    SUB_Request_Download_timeOut_0200
     * @tc.desc    connectionTimeout error.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_timeOut_0200', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_timeOut_0200 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        connectionTimeout: 0,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_0200.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_timeOut_0200 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_0200 faultOccurCallBack err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number  SUB_Request_Download_timeOut_0300
     * @tc.name    SUB_Request_Download_timeOut_0300
     * @tc.desc    totalTimeout error.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_timeOut_0300', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_timeOut_0300 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        totalTimeout: 0,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_0300.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_timeOut_0300 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_0300 faultOccurCallBack err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number  SUB_Request_Download_timeOut_0400
     * @tc.name    SUB_Request_Download_timeOut_0400
     * @tc.desc    totalTimeout error.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_timeOut_0400', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_timeOut_0400 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        totalTimeout: 604801,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_0400.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_timeOut_0400 create task success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_0400 faultOccurCallBack err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number  SUB_Request_Download_timeOut_0500
     * @tc.name    SUB_Request_Download_timeOut_0500
     * @tc.desc    totalTimeout error.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_timeOut_0500', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_timeOut_0500 is starting-----------------------");
      let timeOut: request.agent.Timeout = {
        totalTimeout: 604800,
      }
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'http://222.111.222.111',
        title: 'reeateTest',
        overwrite: true,
        description: 'XTS download test!',
        saveas: './SUB_Request_Download_timeOut_0500.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        console.info("====>SUB_Request_Download_timeOut_0500 create task success");
        expect(task !== null).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_Download_timeOut_0500 faultOccurCallBack err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number  SUB_Request_Download_timeOut_0600
     * @tc.name    SUB_Request_Download_timeOut_0600
     * @tc.desc    totalTimeout error.
     * @tc.size    MEDIUMTEST
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it('SUB_Request_Download_timeOut_0600', Level.LEVEL2, async (done: Function) => {
      console.info("-----------------------SUB_Request_Download_timeOut_0600 is starting-----------------------");
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
        saveas: './SUB_Request_Download_timeOut_0600.txt',
        network: request.agent.Network.ANY,
        timeout: timeOut,
        mode:request.agent.Mode.BACKGROUND
      };

      let faultsCallBack = (faults: request.agent.Faults) => {
        try {
          task.off('faultOccur', faultsCallBack);
          console.info("====>SUB_Request_Download_on_faultOccur_0700 faults: " + faults);
          expect(faults).assertEqual(request.agent.Faults.TIMEOUT);
          done();
        } catch (err) {
          console.info("====>SUB_Request_Download_on_faultOccur_0700 faultOccurCallBack err: " + JSON.stringify(err));
          done();
        }
      };
      let task: request.agent.Task = await request.agent.create(baseContext, config);
      console.info("====>SUB_Request_Download_timeOut_0600 create task success");
      task.on('faultOccur', faultsCallBack);
      task.start();
    });

  });
};