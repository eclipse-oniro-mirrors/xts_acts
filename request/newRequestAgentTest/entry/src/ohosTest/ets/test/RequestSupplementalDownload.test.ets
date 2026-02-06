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

import { describe, it, expect, beforeAll, beforeEach, Level } from '@ohos/hypium';
import request from '@ohos.request';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from  '@ohos.file.fs';

export default function requestSupplementalDownTest() {
  describe('requestSupplementalDownJSTest', () => {
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
    beforeAll(async (done: Function) => {
      try {
        // let context: common.Context | undefined = AppStorage.get('context');
        let context: common.Context | undefined = getContext();
        await sleep(2000);
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

    /**
     * @tc.name   SUB_Request_download_Supplemental_0100
     * @tc.number SUB_Request_download_Supplemental_0100
     * @tc.desc   callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0100 is starting-----------------------");
      try{
        request.downloadFile(undefined, undefined, async (err, downloadTask)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0100 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0100 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0200
     * @tc.number SUB_Request_download_Supplemental_0200
     * @tc.desc   callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0200 is starting-----------------------");
      try{
        request.downloadFile(null, null, async (err, downloadTask)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0200 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0200 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0300
     * @tc.number SUB_Request_download_Supplemental_0300
     * @tc.desc   promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0300 is starting-----------------------");
      try{
        await request.downloadFile(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_0300 downloadFile success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0400
     * @tc.number SUB_Request_download_Supplemental_0400
     * @tc.desc   promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0400 is starting-----------------------");
      try{
        await request.downloadFile(null, null);
        console.info("====>SUB_Request_download_Supplemental_0400 downloadFile success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0500
     * @tc.number SUB_Request_download_Supplemental_0500
     * @tc.desc   setMaxSpeed param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0500 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_0500',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        await task.setMaxSpeed(undefined);
        console.info("====>SUB_Request_download_Supplemental_0500 setMaxSpeed success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0600
     * @tc.number SUB_Request_download_Supplemental_0600
     * @tc.desc   setMaxSpeed param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0600 is starting-----------------------");
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test001.hap',
        saveas: 'SUB_Request_download_Supplemental_0600',
        overwrite: true,
      };
      try{
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        await task.setMaxSpeed(null);
        console.info("====>SUB_Request_download_Supplemental_0600 setMaxSpeed success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0700
     * @tc.number SUB_Request_download_Supplemental_0700
     * @tc.desc   create callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0700 is starting-----------------------");
      try{
        request.agent.create(undefined, undefined, async (err, task)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0700 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0700 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0800
     * @tc.number SUB_Request_download_Supplemental_0800
     * @tc.desc   create callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0800 is starting-----------------------");
      try{
        request.agent.create(null, null, async (err, task)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_0800 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_0800 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0800 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_0900
     * @tc.number SUB_Request_download_Supplemental_0900
     * @tc.desc   create promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_0900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_0900 is starting-----------------------");
      try{
        await request.agent.create(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_0900 create success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_0900 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1000
     * @tc.number SUB_Request_download_Supplemental_1000
     * @tc.desc   create promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1000 is starting-----------------------");
      try{
        await request.agent.create(null, null);
        console.info("====>SUB_Request_download_Supplemental_1000 create success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1000 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1100
     * @tc.number SUB_Request_download_Supplemental_1100
     * @tc.desc   getTask param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1100 is starting-----------------------");
      try{
        await request.agent.getTask(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_1100 getTask success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1200
     * @tc.number SUB_Request_download_Supplemental_1200
     * @tc.desc   getTask param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1200 is starting-----------------------");
      try{
        await request.agent.getTask(null, null);
        console.info("====>SUB_Request_download_Supplemental_1200 getTask success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1300
     * @tc.number SUB_Request_download_Supplemental_1300
     * @tc.desc   remove promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1300 is starting-----------------------");
      try{
        await request.agent.remove(null);
        console.info("====>SUB_Request_download_Supplemental_1300 remove success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1400
     * @tc.number SUB_Request_download_Supplemental_1400
     * @tc.desc   remove callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1400 is starting-----------------------");
      try{
        request.agent.remove(null, async (err)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_1400 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_1400 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1500
     * @tc.number SUB_Request_download_Supplemental_1500
     * @tc.desc   remove promise param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1500 is starting-----------------------");
      try{
        await request.agent.remove('');
        console.info("====>SUB_Request_download_Supplemental_1500 remove success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1600
     * @tc.number SUB_Request_download_Supplemental_1600
     * @tc.desc   remove callback param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1600 is starting-----------------------");
      try{
        request.agent.remove('', async (err)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_1600 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_1600 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1700
     * @tc.number SUB_Request_download_Supplemental_1700
     * @tc.desc   show promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1700 is starting-----------------------");
      try{
        await request.agent.show(null);
        console.info("====>SUB_Request_download_Supplemental_1700 show success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1800
     * @tc.number SUB_Request_download_Supplemental_1800
     * @tc.desc   show callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1800 is starting-----------------------");
      try{
        request.agent.show(null, async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_1800 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_1800 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1800 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_1900
     * @tc.number SUB_Request_download_Supplemental_1900
     * @tc.desc   show promise param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_1900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_1900 is starting-----------------------");
      try{
        await request.agent.show('');
        console.info("====>SUB_Request_download_Supplemental_1900 show success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_1900 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2000
     * @tc.number SUB_Request_download_Supplemental_2000
     * @tc.desc   show callback param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2000 is starting-----------------------");
      try{
        request.agent.show('', async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2000 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2000 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2000 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2100
     * @tc.number SUB_Request_download_Supplemental_2100
     * @tc.desc   touch callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2100 is starting-----------------------");
      try{
        request.agent.touch(undefined, undefined, async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2100 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2100 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2200
     * @tc.number SUB_Request_download_Supplemental_2200
     * @tc.desc   touch callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2200 is starting-----------------------");
      try{
        request.agent.touch(null, null, async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2200 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2200 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2300
     * @tc.number SUB_Request_download_Supplemental_2300
     * @tc.desc   touch promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2300 is starting-----------------------");
      try{
        await request.agent.touch(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_2300 touch success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2400
     * @tc.number SUB_Request_download_Supplemental_2400
     * @tc.desc   touch promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2400 is starting-----------------------");
      try{
        await request.agent.touch(null, null);
        console.info("====>SUB_Request_download_Supplemental_2400 touch success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2500
     * @tc.number SUB_Request_download_Supplemental_2500
     * @tc.desc   touch promise param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2500 is starting-----------------------");
      try{
        await request.agent.touch('', '');
        console.info("====>SUB_Request_download_Supplemental_2500 touch success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2600
     * @tc.number SUB_Request_download_Supplemental_2600
     * @tc.desc   touch callback param is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2600 is starting-----------------------");
      try{
        request.agent.touch('', '', async (err, taskInfo)=>{
          try{
            console.info("====>SUB_Request_download_Supplemental_2600 into callback");
            expect().assertFail();
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2600 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2700
     * @tc.number SUB_Request_download_Supplemental_2700
     * @tc.desc   search callback param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2700 is starting-----------------------");
      try{
        request.agent.search(undefined, async (err, taskId)=>{
          try{
            if(err) {
              console.info("====>SUB_Request_download_Supplemental_2700 search error");
              expect().assertFail();
              done();
            }
            expect(typeof taskId === 'object').assertTrue();
            console.info("====>SUB_Request_download_Supplemental_2700 search empty");
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2700 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2700 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2800
     * @tc.number SUB_Request_download_Supplemental_2800
     * @tc.desc   search callback param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2800 is starting-----------------------");
      try{
        request.agent.search(null, async (err, taskId)=>{
          try{
            if(err) {
              console.info("====>SUB_Request_download_Supplemental_2800 search error");
              expect().assertFail();
              done();
            }
            expect(typeof taskId === 'object').assertTrue();
            console.info("====>SUB_Request_download_Supplemental_2800 search empty");
            done();
          } catch (err){
            console.info(`====>SUB_Request_download_Supplemental_2800 err: ${JSON.stringify(err)}`);
            done();
          }
        })
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2800 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_2900
     * @tc.number SUB_Request_download_Supplemental_2900
     * @tc.desc   search promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_2900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_2900 is starting-----------------------");
      try{
        let taskId = await request.agent.search(undefined);
        console.info("====>SUB_Request_download_Supplemental_2900 search success: " + typeof taskId);
        expect(typeof taskId === 'object').assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_2900 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3000
     * @tc.number SUB_Request_download_Supplemental_3000
     * @tc.desc   search promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3000 is starting-----------------------");
      try{
        let taskId = await request.agent.search(null);
        console.info("====>SUB_Request_download_Supplemental_3000 search success: " + typeof taskId);
        expect(typeof taskId === 'object').assertTrue();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3000 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3100
     * @tc.number SUB_Request_download_Supplemental_3100
     * @tc.desc   createGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3100 is starting-----------------------");
      try{
        await request.agent.createGroup(undefined);
        console.info("====>SUB_Request_download_Supplemental_3100 createGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3100 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3200
     * @tc.number SUB_Request_download_Supplemental_3200
     * @tc.desc   createGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3200 is starting-----------------------");
      try{
        await request.agent.createGroup(null);
        console.info("====>SUB_Request_download_Supplemental_3200 createGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3200 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3300
     * @tc.number SUB_Request_download_Supplemental_3300
     * @tc.desc   attachGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3300 is starting-----------------------");
      try{
        await request.agent.attachGroup(undefined, undefined);
        console.info("====>SUB_Request_download_Supplemental_3300 attachGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3300 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3400
     * @tc.number SUB_Request_download_Supplemental_3400
     * @tc.desc   attachGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3400 is starting-----------------------");
      try{
        await request.agent.attachGroup(null, null);
        console.info("====>SUB_Request_download_Supplemental_3400 attachGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3400 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3500
     * @tc.number SUB_Request_download_Supplemental_3500
     * @tc.desc   attachGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3500 is starting-----------------------");
      try{
        await request.agent.attachGroup('', []);
        console.info("====>SUB_Request_download_Supplemental_3500 attachGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3500 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3600
     * @tc.number SUB_Request_download_Supplemental_3600
     * @tc.desc   deleteGroup promise param is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3600 is starting-----------------------");
      try{
        await request.agent.deleteGroup(undefined);
        console.info("====>SUB_Request_download_Supplemental_3600 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3700
     * @tc.number SUB_Request_download_Supplemental_3700
     * @tc.desc   deleteGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3700 is starting-----------------------");
      try{
        await request.agent.deleteGroup(null);
        console.info("====>SUB_Request_download_Supplemental_3700 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_download_Supplemental_3800
     * @tc.number SUB_Request_download_Supplemental_3800
     * @tc.desc   deleteGroup promise param is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_download_Supplemental_3800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_download_Supplemental_3800 is starting-----------------------");
      try{
        await request.agent.deleteGroup('');
        console.info("====>SUB_Request_download_Supplemental_3800 deleteGroup success");
        expect().assertFail();
        done();
      } catch (err){
        console.info(`====>SUB_Request_download_Supplemental_3800 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

  });
};