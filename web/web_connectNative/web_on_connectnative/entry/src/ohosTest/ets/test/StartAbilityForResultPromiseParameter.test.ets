import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, afterEach, Level, it, expect } from '@ohos/hypium';
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
import { commonEventManager } from '@kit.BasicServicesKit';
import testNapi from 'libentry.so'
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import fs from '@ohos.file.fs';

let context: common.UIAbilityContext;

let sub: commonEventManager.CommonEventSubscriber;

let pipeRead: testNapi.PipeResult = { readFd: -1, writeFd: -1 };
let pipeWrite: testNapi.PipeResult = { readFd: -1, writeFd: -1 };

let connId: number = 0;

// Error code for "Capability not supported"
const CAPABILITY_NOT_SUPPORTED_ERROR = 801;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

async function SendCommand(command: string, fd: number) {
  try {
    let writeLen = await fs.write(fd, command);
    if (writeLen <= 0) {
      hilog.error(0x0000, 'testTag', `SendCommand writeLen <= 0`);
      return;
    }
    hilog.info(0x0000, 'testTag', `SendCommand command ${command} ok`);
  } catch (error) {
    hilog.error(0x0000, 'testTag', `SendCommand failed, errorCode: ${error.code}, message: ${error.message}`);
  }
}

function closePipe(pipe: testNapi.PipeResult) {
  if (pipe.readFd != -1) {
    fs.close(pipe.readFd)
    pipe.readFd = -1;
  }
  if (pipe.writeFd != -1) {
    fs.close(pipe.writeFd)
    pipe.writeFd = -1;
  }
}

/**
 * Test suite for WebNativeMessagingExtensionContext.startAbilityForResult Promise parameter coverage.
 * Covers: Promise-based call pattern - verify the API returns a Promise and handles .then()/.catch() correctly.
 */
export default function startAbilityForResultPromiseParameterTest() {
  describe('StartAbilityForResultPromiseParameterTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'StartAbilityForResultPromiseParameterTest beforeAll start');
    })

    afterEach(async () => {
      closePipe(pipeRead);
      closePipe(pipeWrite);
      try {
        commonEventManager.unsubscribe(sub);
      } catch (e) {
      }
      if (connId != 0) {
        webNativeMessagingExtensionManager.disconnectNative(connId).then(() => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id : ${connId} succeed`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id : ${connId} error: ${JSON.stringify(err)}`);
        });
        connId = 0;
      }
      await sleep(1000);
    })

    /**
     * @tc.name   SUB_WEB_StartAbilityForResult_Promise_0100
     * @tc.number SUB_WEB_StartAbilityForResult_Promise_0100
     * @tc.desc   startAbilityForResult call coverage test - verify Promise.then() chain works correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_StartAbilityForResult_Promise_0100', Level.LEVEL0, async (done: Function) => {
      const tcNumber = 'SUB_WEB_StartAbilityForResult_Promise_0100';
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
        return;
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbilityForResult_promise_001']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(200);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters: {
          "ohos.arkweb.extensionOrigin": "testOrigin",
          "ohos.arkweb.messageReadPipe": { 'type': 'FD', 'value': pipeWrite.readFd },
          "ohos.arkweb.messageWritePipe": { 'type': 'FD', 'value': pipeRead.writeFd }
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          SendCommand("startAbilityForResult_promiseThen", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          connId = 0;
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          connId = 0;
          if (String(code) === '801') {
            let flag = true;
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            expect(flag).assertEqual(true);
            flag = false;
            done();
            return;
          }
          expect(code).assertEqual(801);
          done();
        }
      };

      try {
        connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect or disconnect failed: ${JSON.stringify(err)}`);
        connId = 0;
        if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
          let flag1 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(flag1).assertEqual(true);
          flag1 = false;
          done();
          return;
        }
        expect(Number(err.code)).assertEqual(801);
        done();
      }
    })

    /**
     * @tc.name   SUB_WEB_StartAbilityForResult_Promise_0200
     * @tc.number SUB_WEB_StartAbilityForResult_Promise_0200
     * @tc.desc   startAbilityForResult call coverage test - verify async/await pattern works correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_StartAbilityForResult_Promise_0200', Level.LEVEL0, async (done: Function) => {
      const tcNumber = 'SUB_WEB_StartAbilityForResult_Promise_0200';
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
        return;
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbilityForResult_promise_002']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(200);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters: {
          "ohos.arkweb.extensionOrigin": "testOrigin",
          "ohos.arkweb.messageReadPipe": { 'type': 'FD', 'value': pipeWrite.readFd },
          "ohos.arkweb.messageWritePipe": { 'type': 'FD', 'value': pipeRead.writeFd }
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          SendCommand("startAbilityForResult_promiseAsyncAwait", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          connId = 0;
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          connId = 0;
          if (String(code) === '801') {
            let flag2 = true;
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            expect(flag2).assertEqual(true);
            flag2 = false;
            done();
            return;
          }
          expect(code).assertEqual(801);
          done();
        }
      };

      try {
        connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect or disconnect failed: ${JSON.stringify(err)}`);
        connId = 0;
        if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
          let flag3 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(flag3).assertEqual(true);
          flag3 = false;
          done();
          return;
        }
        expect(Number(err.code)).assertEqual(801);
        done();
      }
    })

    /**
     * @tc.name   SUB_WEB_StartAbilityForResult_Promise_0300
     * @tc.number SUB_WEB_StartAbilityForResult_Promise_0300
     * @tc.desc   startAbilityForResult call coverage test - verify Promise.catch() handles errors correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_StartAbilityForResult_Promise_0300', Level.LEVEL0, async (done: Function) => {
      const tcNumber = 'SUB_WEB_StartAbilityForResult_Promise_0300';
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
        return;
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbilityForResult_promise_003']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          // Verify the error was caught via catch (error code should be present)
          expect(commonEventData.parameters?.hasError).assertEqual(true);
          expect(commonEventData.parameters?.result).assertEqual(200);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters: {
          "ohos.arkweb.extensionOrigin": "testOrigin",
          "ohos.arkweb.messageReadPipe": { 'type': 'FD', 'value': pipeWrite.readFd },
          "ohos.arkweb.messageWritePipe": { 'type': 'FD', 'value': pipeRead.writeFd }
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          SendCommand("startAbilityForResult_promiseCatch", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag',
            `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          connId = 0;
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          connId = 0;
          if (String(code) === '801') {
            let flag4 = true;
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            expect(flag4).assertEqual(true);
            flag4 = false;
            done();
            return;
          }
          expect(code).assertEqual(801);
          done();
        }
      };

      try {
        connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect or disconnect failed: ${JSON.stringify(err)}`);
        connId = 0;
        if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
          let flag5 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(flag5).assertEqual(true);
          flag5 = false;
          done();
          return;
        }
        expect(Number(err.code)).assertEqual(801);
        done();
      }
    })
  })
}
