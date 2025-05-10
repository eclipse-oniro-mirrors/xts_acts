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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { ChildProcessArgs } from '@ohos.app.ability.ChildProcessArgs';
import XTSArkProcess from '../xts/XTSArkProcess';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { ChildProcessOptions } from '@ohos.app.ability.ChildProcessOptions';

export default function arkProcessTest() {
  describe('StartArkChildProcessTest', () => {
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    let arkProcessPath = 'entry/./ets/xts/XTSArkProcess.ets';
    let pid = 0;
    let mpEnable: Boolean = false;

    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model') === 'true';
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = false;
      }
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      if (pid > 0) {
        console.log(`afterEach() kill pid: ${pid}`)
        await abilityDelegator.executeShellCommand(`kill -9 ${pid}`);
        await sleep(500);
      }
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_StartArkChildProcess_0100
     * @tc.name   : Call startArkChildProcess to create a child process,give param correct srcEntry and args
     * @tc.desc   : Expect: 1.Return child pid 2.ChildProcess onStart called 3.args passed correctly
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartArkChildProcess_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `StartArkChildProcess_0100`;
      console.log(`${tag} it begin`);
      let path = abilityDelegator.getAppContext().filesDir + "/test1.txt";
      let fileContent = 'test';
      writeFile(path, fileContent);
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      try {
        let args: ChildProcessArgs = {
          entryParams: 'entryParams',
          fds: {
            'fd1': file.fd
          }
        };
        let options: ChildProcessOptions = {
          isolationMode: false
        };
        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: [XTSArkProcess.EVENT]
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`${tag} Receive event failed, code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch (e) {
              console.error(`${tag} Receive event assert failed, code is ${e.code}, message is ${e.message}`);
            }
            done();
          } else {
            console.info(`${tag} Receive event success, param:${JSON.stringify(data.parameters)}`);
            if (data.event == XTSArkProcess.EVENT) {
              let eventEntryParams: string = data.parameters?.entryParams;
              let readText: string = data.parameters?.readText;
              try {
                expect(eventEntryParams).assertEqual(args.entryParams);
                expect(readText).assertEqual(fileContent);
              } catch (e) {
                console.error(`${tag} Receive event assert failed, code is ${e.code}, message is ${e.message}`);
              }
              fs.closeSync(file.fd);
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);

        await sleep(500);
        XTSArkProcess.toString();
        pid = await childProcessManager.startArkChildProcess(arkProcessPath, args, options);
        console.log(`${tag} startArkChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();

        await sleep(15000);
        console.log(`${tag} wait ${XTSArkProcess.EVENT} timeout, child pid: ${pid}`);
        fs.closeSync(file.fd);
        expect().assertFail();
      } catch (err) {
        console.error(`${tag} startArkChildProcess error, errorCode: ${err.code}`);
        if (!mpEnable && err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_StartArkChildProcess_0200
     * @tc.name   : Call startArkChildProcess to create a child process,give param correct srcEntry and empty args
     * @tc.desc   : Expect: 1.Return child pid 2.ChildProcess onStart called 3.no args received in child process
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_StartArkChildProcess_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `StartArkChildProcess_0200`;
      console.log(`${tag} it begin`);
      if (!mpEnable) {
        done();
      }

      try {
        let args: ChildProcessArgs = {};
        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: [XTSArkProcess.EVENT]
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`${tag} Receive event failed, code is ${err.code}, message is ${err.message}`);
            try {
              expect().assertFail();
            } catch (e) {
              console.error(`${tag} Receive event assert failed, code is ${e.code}, message is ${e.message}`);
            }
            done();
          } else {
            console.info(`${tag} Receive event success, param:${JSON.stringify(data.parameters)}`);
            if (data.event == XTSArkProcess.EVENT) {
              let eventEntryParams: string = data.parameters?.entryParams;
              let readText: string = data.parameters?.readText;
              try {
                expect(eventEntryParams).assertEqual("");
                expect(readText).assertEqual("");
              } catch (e) {
                console.error(`${tag} Receive event assert failed, code is ${e.code}, message is ${e.message}`);
              }
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);

        await sleep(500);
        XTSArkProcess.toString();
        pid = await childProcessManager.startArkChildProcess(arkProcessPath, args);
        console.log(`${tag} startArkChildProcess success, pid: ${pid}`);
        expect(pid > 0).assertTrue();

        await sleep(15000);
        console.log(`${tag} wait ${XTSArkProcess.EVENT} timeout, child pid: ${pid}`);
        expect().assertFail();
      } catch (err) {
        console.error(`${tag} startArkChildProcess error, errorCode: ${err.code}`);
        expect().assertFail();
        done();
      }
    });

  });

}

function writeFile(path: string, text: string) {
  let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  fs.writeSync(file.fd, text);
  fs.closeSync(file);
}

function unSubscribe(subscriber: CommonEventManager.CommonEventSubscriber, callback: Function) {
  let unSubscribeCB = (err: BusinessError) => {
    if (err) {
      console.error(`Unsubscribe failed, code is ${err.code}, message is ${err.message}`);
    } else {
      console.info("Unsubscribe success");
    }
    callback();
  };
  CommonEventManager.unsubscribe(subscriber, unSubscribeCB);
}

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time);
  });
}