/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

export default function requestDownloadTwoUnitTest() {
  describe('requestDownloadTwoJSUnit', () => {
    console.info('====>################################request download Test start');
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
          console.info('====>beforeAll requestDownloadTwoJSUnit baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll requestDownloadTwoJSUnit baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll requestDownloadTwoJSUnit catch err:'+JSON.stringify(err))
        done();
      }
    });
    
    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Progress_0030
     * @tc.name    SUB_Misc_REQUEST_On_Download_Progress_0030
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Progress_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Progress_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Progress_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let flag = true
          let flag1 = true
          let on_progressCallback = async (pro: request.agent.Progress) => {
            flag = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 pro.state: " + pro.state);
          }
          let on_progressCallback1 = async (pro: request.agent.Progress) => {
            flag1 = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 task has complete: " + JSON.stringify(task.tid));
            }
            expect(!flag && !flag1).assertTrue();
            task.off('progress', on_progressCallback);
            task.off('progress', on_progressCallback1);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.on('progress', on_progressCallback1);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Progress_0030
     * @tc.name    SUB_Misc_REQUEST_Off_Download_Progress_0030
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Progress_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Progress_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Progress_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(baseContext, config, async (err, task) => {
          let on_progressCallback = (pro: request.agent.Progress) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro: request.agent.Progress) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.on('progress', on_progressCallback1);
            task.off('progress');
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag && flag1).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 offProgress success flag: " + flag);
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 offProgress success flag1: " + flag1);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Progress_0020
     * @tc.name    SUB_Misc_REQUEST_Off_Download_Progress_0020
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Progress_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Progress_0020 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Progress_0020.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(baseContext, config, async (err, task) => {
          let on_progressCallback = (pro: request.agent.Progress) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro: request.agent.Progress) => {
            task.off('progress');
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 on_progressCallback1 flag1: " + flag1);
            expect(true).assertTrue();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.on('progress', on_progressCallback1);
            task.off('progress',on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag ).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 offProgress success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Completed_0030
     * @tc.name    SUB_Misc_REQUEST_On_Download_Completed_0030
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Completed_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Completed_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Completed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let flag = true
          let flag1 = true
          let on_progressCallback = async (pro: request.agent.Progress) => {
            flag = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 pro.state: " + pro.state);
          }
          let on_progressCallback1 = async (pro: request.agent.Progress) => {
            flag1 = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 task has complete: " + JSON.stringify(task.tid));
            }
            expect(!flag && !flag1).assertTrue();
            task.off('completed', on_progressCallback);
            task.off('completed', on_progressCallback1);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_progressCallback);
            task.on('completed', on_progressCallback1);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Completed_0030
     * @tc.name    SUB_Misc_REQUEST_Off_Download_Completed_0030
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Completed_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Completed_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Completed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(baseContext, config, async (err, task) => {
          let on_progressCallback = (pro: request.agent.Progress) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro: request.agent.Progress) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_progressCallback);
            task.on('completed', on_progressCallback1);
            task.off('completed');
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag && flag1).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 offProgress success flag: " + flag);
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 offProgress success flag1: " + flag1);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Completed_0020
     * @tc.name    SUB_Misc_REQUEST_Off_Download_Completed_0020
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Completed_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Completed_0020 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Completed_0020.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(baseContext, config, async (err, task) => {
          let on_progressCallback = (pro: request.agent.Progress) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro: request.agent.Progress) => {
            task.off('completed');
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 on_progressCallback1 flag1: " + flag1);
            expect(true).assertTrue();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_progressCallback);
            task.on('completed', on_progressCallback1);
            task.off('completed',on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag ).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 offProgress success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Failed_0030
     * @tc.name    SUB_Misc_REQUEST_On_Download_Failed_0030
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Failed_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Failed_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/xxxxxxx/download/v1.0/test.apk',
        headers: {"Content-Type": "application/json"},
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Failed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
        extras: {}
      };

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let flag = true
          let flag1 = true
          let on_progressCallback = async (pro: request.agent.Progress) => {
            flag = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 pro.state: " + pro.state);
          }
          let on_progressCallback1 = async (pro: request.agent.Progress) => {
            flag1 = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 task has complete: " + JSON.stringify(task.tid));
            }
            expect(!flag && !flag1).assertTrue();
            task.off('failed', on_progressCallback);
            task.off('failed', on_progressCallback1);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_progressCallback);
            task.on('failed', on_progressCallback1);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Failed_0030
     * @tc.name    SUB_Misc_REQUEST_Off_Download_Failed_0030
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Failed_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Failed_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Failed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(baseContext, config, async (err, task) => {
          let on_progressCallback = (pro: request.agent.Progress) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro: request.agent.Progress) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_progressCallback);
            task.on('failed', on_progressCallback1);
            task.off('failed');
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag && flag1).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 offProgress success flag: " + flag);
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 offProgress success flag1: " + flag1);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Failed_0020
     * @tc.name    SUB_Misc_REQUEST_Off_Download_Failed_0020
     * @tc.desc      download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Failed_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Failed_0020 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Failed_0020.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(baseContext, config, async (err, task) => {
          let on_progressCallback = (pro: request.agent.Progress) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro: request.agent.Progress) => {
            task.off('failed');
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 on_progressCallback1 flag1: " + flag1);
            expect(true).assertTrue();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_progressCallback);
            task.on('failed', on_progressCallback1);
            task.off('failed',on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                expect(flag ).assertTrue();
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 offProgress success flag: " + flag);
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Promise_0070
     * @tc.name    SUB_Misc_REQUEST_Search_Promise_0070
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Promise_0070', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Promise_0070 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0070.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0070 onCompletedCallback start');
        let filter: request.agent.Filter = {
          action: request.agent.Action.DOWNLOAD,
        };
        request.agent.search(filter).then((data) => {
          let a = data.includes(task.tid);
          console.info(`${task.tid} ${a} Succeeded in searching a download task. data: ${data}`);
          expect(a).assertEqual(true);
          done();
        }).catch((err: BusinessError) => {
          console.info('====>SUB_Misc_REQUEST_Search_Promise_0070 search throw_err:' + JSON.stringify(err));
          done();
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0070 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Promise_0071
     * @tc.name    SUB_Misc_REQUEST_Search_Promise_0071
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Promise_0071', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Promise_0071 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0071.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;
      let onCompletedCallback = async (progress: request.agent.Progress) =>{
        try {
          task.off('completed', onCompletedCallback);
          console.info('====>SUB_Misc_REQUEST_Search_Promise_0071 onCompletedCallback start');
          let data:Array<string> = await request.agent.search();
          let ifIncludes = data.includes(task.tid);
          console.info(`${task.tid} ${ifIncludes} Succeeded in searching a download task. data: ${data}`);
          expect(ifIncludes).assertEqual(true);
          done();
        }catch (err) {
          console.info('====>SUB_Misc_REQUEST_Search_Promise_0071 tid not includes: ' + JSON.stringify(err));
          done();
        }
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0071 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0080
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0080
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0080', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0080 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0080.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0080 onCompletedCallback start');
        let filter: request.agent.Filter = {
          mode:request.agent.Mode.FOREGROUND,
        }
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0080 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            };
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0080 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0080 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Promise_0080
     * @tc.name    SUB_Misc_REQUEST_Search_Promise_0080
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Promise_0080', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Promise_0080 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0080.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0080 onCompletedCallback start');
        let filter: request.agent.Filter = {
          action: request.agent.Action.DOWNLOAD,
          mode: request.agent.Mode.FOREGROUND,
        }
        request.agent.search(filter).then((data) => {
          expect(data.includes(task.tid)).assertEqual(true);
          done();
        }).catch((err: BusinessError) => {
          console.info('====>SUB_Misc_REQUEST_Search_Promise_0080 search throw_err:' + JSON.stringify(err));
          done();
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0080 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0090
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0090
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0090', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0090 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/1test.apk',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0090.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onFailedCallback = (progress: request.agent.Progress) => {
        task.off('failed', onFailedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0090 onCompletedCallback start');
        let filter: request.agent.Filter = {
          mode: request.agent.Mode.FOREGROUND,
          state:request.agent.State.FAILED,
        };
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0090 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            };
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0090 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('failed', onFailedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0090 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Promise_0090
     * @tc.name    SUB_Misc_REQUEST_Search_Promise_0090
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Promise_0090', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Promise_0090 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0090.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0090 onCompletedCallback start');
        let filter: request.agent.Filter = {
          action: request.agent.Action.DOWNLOAD,
          mode: request.agent.Mode.FOREGROUND,
          state:request.agent.State.COMPLETED,
        };
        request.agent.search(filter).then((data) => {
          expect(data.includes(task.tid)).assertEqual(true);
          done();
        }).catch((err: BusinessError) => {
          console.info('====>SUB_Misc_REQUEST_Search_Promise_0090 search throw_err:' + JSON.stringify(err));
          done();
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0090 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Show_Callback_0010
     * @tc.name    SUB_Misc_REQUEST_Show_Callback_0010
     * @tc.desc      show the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_Misc_REQUEST_Show_Callback_0010', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Show_Callback_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Show_Callback_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
        priority:0,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Show_Callback_0010 onCompletedCallback start');
        request.agent.show(task.tid, (err, taskInfo)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Show_Callback_0010 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(taskInfo.uid).assertEqual(undefined);
            expect(taskInfo.bundle).assertEqual(undefined);
            expect(taskInfo.url).assertEqual(config.url);
            expect(taskInfo.data).assertEqual("");

            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.saveas: ' + taskInfo.saveas);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.tid: ' + typeof taskInfo.tid);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.description: ' + taskInfo.description);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.action: ' + taskInfo.action);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.mode: ' + taskInfo.mode);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.gauge: ' + taskInfo.gauge);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.mtime: ' + taskInfo.mtime);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.extras: ' + taskInfo.extras);
            console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.priority: ' + taskInfo.priority);

            expect(typeof(taskInfo.saveas) === 'string').assertTrue();
            expect(typeof(taskInfo.tid) === 'string').assertTrue();
            expect(taskInfo.description).assertEqual("");
            expect(taskInfo.action).assertEqual(0);
            expect(taskInfo.mode).assertEqual(1);
            expect(taskInfo.gauge === false).assertTrue();
            expect(typeof(taskInfo.mtime) === 'number').assertTrue();
            expect(typeof(taskInfo.extras) === 'object').assertTrue();
            expect(typeof(taskInfo.priority) === 'number').assertTrue();
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Show_Callback_0010 show throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Show_Callback_0010 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Show_Promise_0010
     * @tc.name    SUB_Misc_REQUEST_Show_Promise_0010
     * @tc.desc      show the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_Misc_REQUEST_Show_Promise_0010', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Show_Promise_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Show_Promise_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = async (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 onCompletedCallback start');
        try{
          let taskInfo = await request.agent.show(task.tid);
          expect(taskInfo.uid).assertEqual(undefined);
          expect(taskInfo.bundle).assertEqual(undefined);
          expect(taskInfo.title).assertEqual(config.title);

          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.mimeType: ' + taskInfo.mimeType);
          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.progress: ' + taskInfo.progress);
          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.ctime: ' + taskInfo.ctime);
          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.tries: ' + taskInfo.tries);
          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.faults: ' + taskInfo.faults);
          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.reason: ' + taskInfo.reason);
          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 taskInfo.retry: ' + taskInfo.retry);
          expect(taskInfo.mimeType).assertEqual('');
          expect(typeof(taskInfo.progress) === 'object').assertTrue();
          expect(typeof(taskInfo.ctime) === 'number').assertTrue();
          expect(taskInfo.tries).assertLargerOrEqual(0);
          expect(taskInfo.faults).assertEqual(null);
          expect(taskInfo.reason).assertContain('Task successful');
          expect(typeof(taskInfo.retry) === 'boolean').assertTrue();
          done();
        }catch(err){
          console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 show throw_err:' + JSON.stringify(err));
          done();
        };
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Show_Promise_0010 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };

    });

    /**
     * @tc.number    SUB_Misc_REQUEST_ShowErrorCode_Callback_0010
     * @tc.name    SUB_Misc_REQUEST_ShowErrorCode_Callback_0010
     * @tc.desc      show the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_ShowErrorCode_Callback_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_ShowErrorCode_Callback_0010 is starting-----------------------");
      try {
        request.agent.show(undefined, (err, taskInfo)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Callback_0010 err:' + JSON.stringify(err));
              expect().assertFail();
            }
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Callback_0010 show throw_err:' + JSON.stringify(err));
            done();
          };
        });
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Callback_0010 catch err:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_ShowErrorCode_Promise_0010
     * @tc.name    SUB_Misc_REQUEST_ShowErrorCode_Promise_0010
     * @tc.desc      show the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_ShowErrorCode_Promise_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_ShowErrorCode_Promise_0010 is starting-----------------------");
      try {
        await request.agent.show(undefined);
        console.info("====>SUB_Misc_REQUEST_ShowErrorCode_Promise_0010 show success");
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Promise_0010 catch err:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_ShowErrorCode_Callback_0020
     * @tc.name    SUB_Misc_REQUEST_ShowErrorCode_Callback_0020
     * @tc.desc      show the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_ShowErrorCode_Callback_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_ShowErrorCode_Callback_0020 is starting-----------------------");
      try {
        request.agent.show("undefined", (err, taskInfo)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Callback_0020 err:' + JSON.stringify(err));
              expect(err.code).assertEqual(21900006);
              done();
            }else{
              console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Callback_0020 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Callback_0020 show throw_err:' + JSON.stringify(err));
            done();
          };
        });
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Callback_0020 catch err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_ShowErrorCode_Promise_0020
     * @tc.name    SUB_Misc_REQUEST_ShowErrorCode_Promise_0020
     * @tc.desc      show the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_ShowErrorCode_Promise_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_ShowErrorCode_Promise_0020 is starting-----------------------");
      try {
        await request.agent.show("undefined");
        console.info("====>SUB_Misc_REQUEST_ShowErrorCode_Promise_0020 show success");
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_ShowErrorCode_Promise_0020 catch err:' + JSON.stringify(err));
        expect(err.code).assertEqual(21900006);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0010
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0010
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0010 onCompletedCallback start');
        let filter: request.agent.Filter = { };
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0010 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0010 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0010 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0011
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0011
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0011', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0011 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0011.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0011 onCompletedCallback start');
        request.agent.search((err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0011 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0011 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0011 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Promise_0020
     * @tc.name    SUB_Misc_REQUEST_Search_Promise_0020
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Promise_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Promise_0020 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0020.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0020 onCompletedCallback start');
        let filter: request.agent.Filter = {
          bundle:undefined,
          state: undefined,
          before: undefined,
          after: undefined,
          action: undefined,
          mode: undefined,
        };
        request.agent.search(filter).then((data) => {
          expect(data.includes(task.tid)).assertEqual(true);
          done();
        }).catch((err: BusinessError) => {
          console.info('====>SUB_Misc_REQUEST_Search_Promise_0020 search throw_err:' + JSON.stringify(err));
          done();
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0020 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0030
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0030
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0030', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0030 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0030 onCompletedCallback start');
        let filter: request.agent.Filter = {
          bundle:"com.acts.newRequestAuthority.test",
        }
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0030 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            };
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0030 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0030 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0060
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0060
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0060', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0060 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0060.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0060 onCompletedCallback start');
        let time = new Date().getTime();
        let filter: request.agent.Filter = {
          after:time-60000,
        };
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0060 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0060 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0060 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Promise_0060
     * @tc.name    SUB_Misc_REQUEST_Search_Promise_0060
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Promise_0060', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Promise_0060 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0060.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0060 onCompletedCallback start');
        let time = new Date().getTime();
        let filter: request.agent.Filter = {
          before:time-4000,
        };
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Promise_0060 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Promise_0060 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        await sleep(5000);
        task.on('completed', onCompletedCallback);
        await task.start()
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0060 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0070
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0070
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0070', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0070 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0070.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onProgressCallback = (progress: request.agent.Progress) => {
        task.off('progress', onProgressCallback)
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0070 onCompletedCallback start');
        let filter: request.agent.Filter = {
          state:request.agent.State.RUNNING
        };
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0070 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            };
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0070 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        task.on('progress', onProgressCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0070 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0100
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0100
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0100 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Callback_0100.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
      };
      let task:request.agent.Task;

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed', onCompletedCallback);
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0100 onCompletedCallback start');
        let time = new Date().getTime();
        let filter: request.agent.Filter = {
          action: request.agent.Action.DOWNLOAD,
          before:time-1000,
          after:time-16000
        };
        request.agent.search(filter, (err, data)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Search_Callback_0100 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            };
            expect(data.includes(task.tid)).assertEqual(true);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Search_Callback_0100 search throw_err:' + JSON.stringify(err));
            done();
          };
        });
      };

      try {
        task = await request.agent.create(baseContext, config);
        await sleep(1000);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Callback_0100 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Promise_0110
     * @tc.name    SUB_Misc_REQUEST_Search_Promise_0110
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Promise_0110', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Promise_0110 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0110.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.BACKGROUND,
      };
      let task:request.agent.Task;

      try {
        task = await request.agent.create(baseContext, config);
        await task.start()
        task.pause(() => {
          let filter: request.agent.Filter = {
            state:request.agent.State.PAUSED,
          };
          request.agent.search(filter, (err, data)=>{
            try{
              if(err){
                console.info('====>SUB_Misc_REQUEST_Search_Promise_0110 err:' + JSON.stringify(err));
                expect().assertFail();
                done();
              }
              console.info(`Succeeded in searching a download task. data: ${data}`);
              expect(data.includes(task.tid)).assertEqual(true);
              done();
            }catch(err){
              console.info('====>SUB_Misc_REQUEST_Search_Promise_0110 search throw_err:' + JSON.stringify(err));
              done();
            };
          });
        }
        )
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Search_Promise_0110 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Search_Callback_0110
     * @tc.name    SUB_Misc_REQUEST_Search_Callback_0110
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Search_Callback_0110', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Search_Callback_0110 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Search_Promise_0090.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.BACKGROUND,
      };
      let task = await request.agent.create(baseContext, config);
      try {
        let filter: request.agent.Filter = {
          state:request.agent.State.INITIALIZED,
        };
        let data0 = await request.agent.search(filter);
        expect(data0.includes(task.tid)).assertEqual(true);
        request.agent.remove(task.tid, (err) => {
          if (err) {
            console.error(`Failed to removing a download task, Code: ${err.code}, message: ${err.message}`);
            return;
          };
          let filter: request.agent.Filter = {
            state:request.agent.State.REMOVED
          };
          request.agent.search(filter, (err, data) => {
            try {
              if (err) {
                console.error(`Failed to search a download task, Code: ${err.code}, message: ${err.message}`);
                return;
              };
              console.info(`Succeeded in searching a download task. data: ${data}`);
              expect(data.includes(task.tid)).assertEqual(true);
              done();
            } catch (err) {
              console.error(`Failed to search a remove task, Code: ${err.code}, message: ${err.message}`);
              done();
            }
          });
        });
      } catch (error) {
        console.info("====>SUB_Misc_REQUEST_Search_Callback_0110 catch error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Touch_Callback_0010
     * @tc.name    SUB_Misc_REQUEST_Touch_Callback_0010
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_Misc_REQUEST_Touch_Callback_0010', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Touch_Callback_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Touch_Callback_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
        token: '1234567890'
      };
      let task:request.agent.Task

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed');
        console.info('====>SUB_Misc_REQUEST_Touch_Callback_0010 onCompletedCallback start');
        request.agent.touch(task.tid, config.token,(err, taskInfo)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_Touch_Callback_0010 err:' + JSON.stringify(err));
              expect().assertFail();
              done();
            }
            expect(taskInfo.url).assertEqual(config.url);
            expect(taskInfo.data).assertEqual("");
            expect(taskInfo.title).assertEqual(config.title);
            done();
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_Touch_Callback_0010 touch throw_err:' + JSON.stringify(err));
            done();
          }
        })
      }

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Touch_Callback_0010 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Touch_Promise_0010
     * @tc.name    SUB_Misc_REQUEST_Touch_Promise_0010
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_Misc_REQUEST_Touch_Promise_0010', Level.LEVEL1, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Touch_Promise_0010 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Touch_Promise_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
        token: '1234567890'
      };
      let task:request.agent.Task
      task = await request.agent.create(baseContext, config);
      let id: string = task.tid;
      let token: string;
      let tk: string | undefined = config.token;
      if (tk !== undefined) {
        token = tk;
        console.info('====>SUB_Misc_REQUEST_Touch_Promise_0010 token is: ' + JSON.stringify(token));
      } else {
        console.info('====>SUB_Misc_REQUEST_Touch_Promise_0010 token is undefined');
      }
      let onCompletedCallback = async (progress: request.agent.Progress) =>{
        task.off('completed');
        console.info('====>SUB_Misc_REQUEST_Touch_Promise_0010 onCompletedCallback start');
        try{
          let taskInfo = await request.agent.touch(id, token);
          expect(taskInfo.title).assertEqual(config.title);
          done();
        }catch(err){
          console.info('====>SUB_Misc_REQUEST_Touch_Promise_0010 touch throw_err:' + JSON.stringify(err));
          done();
        }
      }

      try {
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Touch_Promise_0010 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    SUB_Misc_REQUEST_Touch_Callback_0040
     * @tc.name    SUB_Misc_REQUEST_Touch_Callback_0040
     * @tc.desc      search the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Touch_Callback_0040', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_Touch_Callback_0040 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        saveas: './SUB_Misc_REQUEST_Touch_Callback_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND,
        token: '1234567890'
      };
      let task:request.agent.Task

      let onCompletedCallback = (progress: request.agent.Progress) =>{
        task.off('completed');
        console.info('====>SUB_Misc_REQUEST_Touch_Callback_0040 onCompletedCallback start');
        try{
          request.agent.touch(task.tid, config.token+'1',(err, taskInfo)=>{
            console.info('====>SUB_Misc_REQUEST_Touch_Callback_0040 touch err:' + JSON.stringify(err));
            expect(err.code).assertEqual(21900006);
            done();
          })
        }catch(err){
          console.info('====>SUB_Misc_REQUEST_Touch_Callback_0040 touch throw_err:' + JSON.stringify(err));
          done();
        }
      }

      try {
        task = await request.agent.create(baseContext, config);
        task.on('completed', onCompletedCallback);
        await task.start();
      }catch(err){
        console.info('====>SUB_Misc_REQUEST_Touch_Callback_0040 create throw_err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    SUB_Misc_REQUEST_TouchErrorCode_Callback_0010
     * @tc.name    SUB_Misc_REQUEST_TouchErrorCode_Callback_0010
     * @tc.desc      touch the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_TouchErrorCode_Callback_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_TouchErrorCode_Callback_0010 is starting-----------------------");
      try {
        request.agent.touch(undefined, '', (err, taskInfo)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Callback_0010 err:' + JSON.stringify(err));
              expect().assertFail();
            }
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Callback_0010 touch throw_err:' + JSON.stringify(err));
            done();
          };
        });
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Callback_0010 catch err:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_TouchErrorCode_Promise_0010
     * @tc.name    SUB_Misc_REQUEST_TouchErrorCode_Promise_0010
     * @tc.desc      touch the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_TouchErrorCode_Promise_0010', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_TouchErrorCode_Promise_0010 is starting-----------------------");
      try {
        await request.agent.touch(undefined, '');
        console.info("====>SUB_Misc_REQUEST_TouchErrorCode_Promise_0010 touch success");
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Promise_0010 catch err:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_TouchErrorCode_Callback_0020
     * @tc.name    SUB_Misc_REQUEST_TouchErrorCode_Callback_0020
     * @tc.desc      touch the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_TouchErrorCode_Callback_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_TouchErrorCode_Callback_0020 is starting-----------------------");
      try {
        request.agent.touch('123', 'downloadTest', async (err, taskInfo)=>{
          try{
            if(err){
              console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Callback_0020 err:' + JSON.stringify(err));
              expect(err.code).assertEqual(21900006);
              done();
            }else{
              console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Callback_0020 failed');
              expect().assertFail();
            }
          }catch(err){
            console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Callback_0020 touch throw_err:' + JSON.stringify(err));
            done();
          };
        });
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Callback_0020 catch err:' + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_TouchErrorCode_Promise_0020
     * @tc.name    SUB_Misc_REQUEST_TouchErrorCode_Promise_0020
     * @tc.desc      touch the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_TouchErrorCode_Promise_0020', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_Misc_REQUEST_TouchErrorCode_Promise_0020 is starting-----------------------");
      try {
        await request.agent.touch('123', 'downloadTest');
        console.info("====>SUB_Misc_REQUEST_TouchErrorCode_Promise_0020 touch success");
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Misc_REQUEST_TouchErrorCode_Promise_0020 catch err:' + JSON.stringify(err));
        expect(err.code).assertEqual(21900006);
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_On_Download_Progress_0500
     * @tc.name SUB_REQUEST_On_Download_Progress_0500
     * @tc.desc download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Download_Progress_0500', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_On_Download_Progress_0500 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_On_Download_Progress_0500.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let on_progressCallback = async (pro: request.agent.Progress) => {
            task.off('progress', on_progressCallback);
            console.info(`====>SUB_REQUEST_On_Download_Progress_0500 size: ${pro.processed}/${pro.sizes}`);
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info('====>SUB_REQUEST_On_Download_Progress_0500 task not remove: ' + JSON.stringify(task.tid));
            }
            expect(true).assertTrue();
            console.info('====>SUB_REQUEST_On_Download_Progress_0500 background onProgress success');
            done();
          }
          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Download_Progress_0500 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            await task.start();
            console.info('====>SUB_REQUEST_On_Download_Progress_0500 task.start success');
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Download_Progress_0500 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Download_Progress_0500 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Download_Progress_0600
     * @tc.name SUB_REQUEST_Off_Download_Progress_0600
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Download_Progress_0600', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_Off_Download_Progress_0600 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_Off_Download_Progress_0600.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Download_Progress_0600 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1: request.agent.Progress) => {
            task.off('progress', pro1)
            console.info("====>SUB_REQUEST_Off_Download_Progress_0600 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2: request.agent.Progress) => {
            task.off('progress', pro2)
            console.info("====>SUB_REQUEST_Off_Download_Progress_0600 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3: request.agent.Progress) => {
            try {
              task.off('progress', pro3)
              console.info("====>SUB_REQUEST_Off_Download_Progress_0600 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Download_Progress_0600 task3 progress on arr: " + JSON.stringify(arr));
              expect(arr.join()).assertEqual(arr1.join());
              try {
                await request.agent.remove(task.tid);
              } catch (err) {
                console.info('====>SUB_REQUEST_Off_Download_Progress_0600 task not remove: ' + JSON.stringify(task.tid));
              }
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Download_Progress_0600 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('progress', pro1);
          task.on('progress', pro2);
          task.on('progress', pro3);
          await task.start();
          console.info("====>SUB_REQUEST_Off_Download_Progress_0600 task.start");

        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Download_Progress_0600 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Download_Progress_0700
     * @tc.name SUB_REQUEST_Off_Download_Progress_0700
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Download_Progress_0700', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_Off_Download_Progress_0700 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_Off_Download_Progress_0700.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Download_Progress_0700 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1: request.agent.Progress) => {
            console.info("====>SUB_REQUEST_Off_Download_Progress_0700 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2: request.agent.Progress) => {
            console.info("====>SUB_REQUEST_Off_Download_Progress_0700 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3: request.agent.Progress) => {
            try {
              task.off('progress', pro3)
              console.info("====>SUB_REQUEST_Off_Download_Progress_0700 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Download_Progress_0700 task3 progress on arr: " + JSON.stringify(arr));
              expect(arr[0]).assertEqual(2);
              try {
                await request.agent.remove(task.tid);
              } catch (err) {
                console.info('====>SUB_REQUEST_Off_Download_Progress_0700 task not remove: ' + JSON.stringify(task.tid));
              }
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Download_Progress_0700 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('progress', pro1);
          task.on('progress', pro2);
          task.off('progress');
          task.on('progress', pro3);
          await task.start();
          console.info("====>SUB_REQUEST_Off_Download_Progress_0700 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Download_Progress_0700 create catch err: " + JSON.stringify(err));
        done();
      }
    });


    /**
     * @tc.number SUB_REQUEST_On_Download_Completed_0500
     * @tc.name SUB_REQUEST_On_Download_Completed_0500
     * @tc.desc download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Download_Completed_0500', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_On_Download_Completed_0500 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_On_Download_Completed_0500.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let on_completedCallback = async (pro: request.agent.Progress) => {
            task.off('completed', on_completedCallback);
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info('====>SUB_REQUEST_On_Download_Completed_0500 task not remove: ' + JSON.stringify(task.tid));
            }
            expect(true).assertTrue();
            console.info('====>SUB_REQUEST_On_Download_Completed_0500 background onCompleted success');
            done();
          }
          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Download_Completed_0500 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            console.info('====>SUB_REQUEST_On_Download_Completed_0500 task.start success');
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Download_Completed_0500 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Download_Completed_0500 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Download_Completed_0500
     * @tc.name SUB_REQUEST_Off_Download_Completed_0500
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Download_Completed_0500', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_Off_Download_Completed_0500 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_Off_Download_Completed_0500.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Download_Completed_0500 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1: request.agent.Progress) => {
            task.off('completed', pro1)
            console.info("====>SUB_REQUEST_Off_Download_Completed_0500 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2: request.agent.Progress) => {
            task.off('completed', pro2)
            console.info("====>SUB_REQUEST_Off_Download_Completed_0500 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3: request.agent.Progress) => {
            try {
              task.off('completed', pro3)
              console.info("====>SUB_REQUEST_Off_Download_Completed_0500 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Download_Completed_0500 task3 completed on arr: " + JSON.stringify(arr));
              expect(arr.join()).assertEqual(arr1.join());
              try {
                await request.agent.remove(task.tid);
              } catch (err) {
                console.info('====>SUB_REQUEST_Off_Download_Completed_0500 task not remove: ' + JSON.stringify(task.tid));
              }
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Download_Completed_0500 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('completed', pro1);
          task.on('completed', pro2);
          task.on('completed', pro3);
          await task.start();
          console.info("====>SUB_REQUEST_Off_Download_Completed_0500 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Download_Completed_0500 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Download_Completed_0600
     * @tc.name SUB_REQUEST_Off_Download_Completed_0600
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Download_Completed_0600', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_Download_backgroundOnCompleted_0500 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_Off_Download_Completed_0600.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Download_Completed_0600 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1: request.agent.Progress) => {
            console.info("====>SUB_REQUEST_Off_Download_Completed_0600 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2: request.agent.Progress) => {
            console.info("====>SUB_REQUEST_Off_Download_Completed_0600 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3: request.agent.Progress) => {
            try {
              task.off('completed', pro3)
              console.info("====>SUB_REQUEST_Off_Download_Completed_0600 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Download_Completed_0600 task3 completed on arr: " + JSON.stringify(arr));
              expect(arr[0]).assertEqual(2);
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Download_Completed_0600 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('completed', pro1);
          task.on('completed', pro2);
          task.off('completed');
          task.on('completed', pro3);
          await task.start();
          console.info("====>SUB_REQUEST_Off_Download_Completed_0600 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Download_Completed_0600 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_On_Download_Resume_0100
     * @tc.name SUB_REQUEST_On_Download_Resume_0100
     * @tc.desc download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_On_Download_Resume_0100', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_On_Download_Resume_0100 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_On_Download_Resume_0100.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          let on_resumeCallback = async (pro: request.agent.Progress) => {
            task.off('resume', on_resumeCallback);
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info('====>SUB_REQUEST_On_Download_Resume_0100 task not remove: ' + JSON.stringify(task.tid));
            }
            console.info('====>SUB_REQUEST_On_Download_Resume_0100 on_resumeCallback');
            expect(true).assertTrue();
            done();
          }

          try {
            if (err) {
              console.info('====>SUB_REQUEST_On_Download_Resume_0100 create err: ' + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('resume', on_resumeCallback);
            task.start(async (err) => {
              try {
                if (err) {
                  console.info('====>SUB_REQUEST_On_Download_Resume_0100 task.start err' + JSON.stringify(err));
                  expect().assertFail();
                }
                await task.pause();
                await task.resume();
                console.info('====>SUB_REQUEST_On_Download_Resume_0100 task.start success');
              } catch (err) {
                console.info('====>SUB_REQUEST_On_Download_Resume_0100 task start failed: ' + JSON.stringify(err));
              }
            });
          } catch (err) {
            console.info('====>SUB_REQUEST_On_Download_Resume_0100 catch err: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_REQUEST_On_Download_Resume_0100 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Download_Resume_0100
     * @tc.name SUB_REQUEST_Off_Download_Resume_0100
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Download_Resume_0100', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_Off_Download_Resume_0100 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_Off_Download_Resume_0100.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Download_Resume_0100 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1: request.agent.Progress) => {
            task.off('resume', pro1)
            console.info("====>SUB_REQUEST_Off_Download_Resume_0100 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2: request.agent.Progress) => {
            task.off('resume', pro2)
            console.info("====>SUB_REQUEST_Off_Download_Resume_0100 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3: request.agent.Progress) => {
            try {
              task.off('resume', pro3)
              console.info("====>SUB_REQUEST_Off_Download_Resume_0100 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Download_Resume_0100 resume pause on arr: " + JSON.stringify(arr));
              expect(arr.join()).assertEqual(arr1.join());
              try {
                await request.agent.remove(task.tid);
              } catch (err) {
                console.info('====>SUB_REQUEST_On_Download_Resume_0200 task not remove: ' + JSON.stringify(task.tid));
              }
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Download_Resume_0100 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('resume', pro1);
          task.on('resume', pro2);
          task.on('resume', pro3);
          task.start(async (err) => {
            try {
              if (err) {
                console.info('====>SUB_REQUEST_Off_Download_Resume_0100 task.start err' + JSON.stringify(err));
                expect().assertFail();
              }
              await task.pause();
              await task.resume();
              console.info('====>SUB_REQUEST_Off_Download_Resume_0100 task.start success');
            } catch (err) {
              console.info('====>SUB_REQUEST_Off_Download_Resume_0100 task start failed: ' + JSON.stringify(err));
            }
          });
          console.info("====>SUB_REQUEST_Off_Download_Resume_0100 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Download_Resume_0100 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Off_Download_Resume_0200
     * @tc.name SUB_REQUEST_Off_Download_Resume_0200
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Off_Download_Resume_0200', Level.LEVEL2, async (done: Function) => {
      console.info('====>-----------------------SUB_REQUEST_Download_backgroundOnPause_0500 is starting-----------------------');
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_REQUEST_Off_Download_Resume_0200.txt',
        network: request.agent.Network.ANY,
        overwrite: true,
        mode: request.agent.Mode.BACKGROUND
      };

      let arr: Array<number> = new Array();
      try {
        request.agent.create(baseContext, config, async (err, task) => {
          if (err) {
            console.info("====>SUB_REQUEST_Off_Download_Resume_0200 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          let pro1 = (task1: request.agent.Progress) => {
            console.info("====>SUB_REQUEST_Off_Download_Resume_0200 pro1: " + JSON.stringify(task1));
            arr.push(0);
          }

          let pro2 = (task2: request.agent.Progress) => {
            console.info("====>SUB_REQUEST_Off_Download_Resume_0200 pro2: " + JSON.stringify(task2));
            arr.push(1);
          }

          let pro3 = async (task3: request.agent.Progress) => {
            try {
              task.off('resume', pro3)
              console.info("====>SUB_REQUEST_Off_Download_Resume_0200 pro3: " + JSON.stringify(task3));
              arr.push(2);
              console.info("====>SUB_REQUEST_Off_Download_Resume_0200 task3 resume on arr: " + JSON.stringify(arr));
              expect(arr[0]).assertEqual(2);
              try {
                await request.agent.remove(task.tid);
              } catch (err) {
                console.info('====>SUB_REQUEST_Off_Download_Resume_0200 task not remove: ' + JSON.stringify(task.tid));
              }
              done();
            } catch (err) {
              console.info("====>SUB_REQUEST_Off_Download_Resume_0200 catch err: " + JSON.stringify(err));
              done();
            }
          }
          task.on('resume', pro1);
          task.on('resume', pro2);
          task.off('resume');
          task.on('resume', pro3);
          task.start(async (err) => {
            try {
              if (err) {
                console.info('====>SUB_REQUEST_Off_Download_Resume_0200 task.start err' + JSON.stringify(err));
                expect().assertFail();
              }
              await task.pause();
              await task.resume();
              console.info('====>SUB_REQUEST_Off_Download_Resume_0200 task.start success');
            } catch (err) {
              console.info('====>SUB_REQUEST_Off_Download_Resume_0200 task start failed: ' + JSON.stringify(err));
            }
          });
          console.info("====>SUB_REQUEST_Off_Download_Resume_0200 task.start");
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Off_Download_Resume_0200 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Download_broadcastEvent_0100
     * @tc.name SUB_REQUEST_Download_broadcastEvent_0100
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Download_broadcastEvent_0100', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Download_broadcastEvent_0100 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/murphy1984/download/releases/download/V1/test.hap',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: './SUB_REQUEST_Download_broadcastEvent_0100.txt',
        network: request.agent.Network.ANY,
      };

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        try {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 subscriberCallback data:"
            + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 data.code: " + data.code);
          expect(data.code).assertEqual(64);
          done();
        } catch (err) {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 subscriberCallback error: " + JSON.stringify(err));
          done();
        }
      }
      let commonEventSubscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [ request.agent.BroadcastEvent.COMPLETE ]
      }
      let subscriber: ESObject;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 subscriber data:" + data);
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 subscriber finish");
      })

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            await task.start();
            console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 task start");
          } catch (err) {
            console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 catch err: " + JSON.stringify(err));
          }
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0100 create catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
    });

  });
}
