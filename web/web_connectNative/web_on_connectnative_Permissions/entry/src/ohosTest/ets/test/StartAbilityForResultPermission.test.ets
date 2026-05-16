import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, Level, it, expect } from '@ohos/hypium';
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';
import { commonEventManager } from '@kit.BasicServicesKit';
import testNapi from 'libentry.so'
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';
import fs from '@ohos.file.fs';
import util from '@ohos.util';

let context: common.UIAbilityContext;

let sub : commonEventManager.CommonEventSubscriber;

let pipeRead:testNapi.PipeResult = {readFd:-1, writeFd:-1};
let pipeWrite:testNapi.PipeResult = {readFd:-1, writeFd:-1};

let connId:number = 0;


const CAPABILITY_NOT_SUPPORTED_ERROR = 801;

function isCapabilityNotSupported(error: BusinessError): boolean {
  return error.code === CAPABILITY_NOT_SUPPORTED_ERROR;
}

function isCapabilityNotSupportedCode(code: number): boolean {
  return String(code) === '801';
}

function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

async function SendCommand(command:string, fd:number) {
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

function closePipe(pipe:testNapi.PipeResult)
{
  if (pipe.readFd != -1) {
    fs.close(pipe.readFd)
    pipe.readFd = -1;
  }
  if (pipe.writeFd != -1) {
    fs.close(pipe.writeFd)
    pipe.writeFd = -1;
  }
}

export default function startAbilityForResultPermissionTest() {
  describe('ActsStartAbilityForResultPermissionTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsStartAbilityForResultPermissionTest beforeAll start');
      hilog.warn(0x0000, 'testTag',
        'startAbilityForResult permission test: Tests will be skipped on non-2-in-1 devices using error code 801 detection.');
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
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0100
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0100
     * @tc.desc   startAbilityForResult without ohos.permission.WEB_NATIVE_MESSAGING permission, expect error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0100', Level.LEVEL0, async (done: Function) => {
      await sleep(3000);
      const tcNumber = `SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch(err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['webNativeMessaging1_startAbilityForResult_permission_0100']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          let resultCode: number = commonEventData.parameters?.result as number;
          hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult returned error code: ${resultCode}`);
          expect(resultCode).assertEqual(201);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerelypermission',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters:{
          "ohos.arkweb.extensionOrigin":"testOrigin",
          "ohos.arkweb.messageReadPipe":{'type':'FD', 'value':pipeWrite.readFd},
          "ohos.arkweb.messageWritePipe":{'type':'FD', 'value':pipeRead.writeFd},
          "testCommand":"startAbilityForResult_Permission201"
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          SendCommand("startAbilityForResult_Permission201", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          connId = 0;
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          expect(Number(code)).assertEqual(17100203);
          hilog.info(0x0000, 'SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0100','444');
          done();
        }
      };

      try {
        connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect failed: ${JSON.stringify(err)}`);
        expect(Number(err.code)).assertEqual(801);
        done();
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0200
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0200
     * @tc.desc   startAbilityForResult with options but without permission, expect error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0200', Level.LEVEL0, async (done: Function) => {
      await sleep(3000);
      const tcNumber = `SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch(err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['webNativeMessaging1_startAbilityForResult_permission_0200']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          let resultCode: number = commonEventData.parameters?.result as number;
          hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult with options returned error code: ${resultCode}`);
          expect(resultCode).assertEqual(201);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerelypermission',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters:{
          "ohos.arkweb.extensionOrigin":"testOrigin",
          "ohos.arkweb.messageReadPipe":{'type':'FD', 'value':pipeWrite.readFd},
          "ohos.arkweb.messageWritePipe":{'type':'FD', 'value':pipeRead.writeFd},
          "testCommand":"startAbilityForResult_Permission201WithOptions"
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          SendCommand("startAbilityForResult_Permission201WithOptions", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          connId = 0;
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          expect(Number(code)).assertEqual(17100203);
          hilog.info(0x0000, 'SUB_WEB_WebNativeMessagingExtension_0200testTag201','444');
          done();
        }
      };

      try {
        connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect failed: ${JSON.stringify(err)}`);
        expect(Number(err.code)).assertEqual(801);
        hilog.info(0x0000, 'assertEqual801', '777');
        done();
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0300
     * @tc.number SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0300
     * @tc.desc   startAbilityForResult without options and without permission, expect error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0300', Level.LEVEL0, async (done: Function) => {
      await sleep(3000);
      const tcNumber = `SUB_WEB_WebNativeMessagingExtensionContext_StartAbilityForResult__0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch(err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['webNativeMessaging1_startAbilityForResult_permission_0300']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          let resultCode: number = commonEventData.parameters?.result as number;
          hilog.info(0x0000, 'testTag', `${tcNumber} startAbilityForResult no options returned error code: ${resultCode}`);
          expect(resultCode).assertEqual(201);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerelypermission',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters:{
          "ohos.arkweb.extensionOrigin":"testOrigin",
          "ohos.arkweb.messageReadPipe":{'type':'FD', 'value':pipeWrite.readFd},
          "ohos.arkweb.messageWritePipe":{'type':'FD', 'value':pipeRead.writeFd},
          "testCommand":"startAbilityForResult_Permission201NoOptions"
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          SendCommand("startAbilityForResult_Permission201NoOptions", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          connId = 0;
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          expect(Number(code)).assertEqual(17100203);
          hilog.info(0x0000, 'SUB_WEB_WebNativeMessagingExtension_0200testTag201','444');
          done();
        }
      };

      try {
        connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative: ${connId}`);
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect failed: ${JSON.stringify(err)}`);
        expect(Number(err.code)).assertEqual(801);
        hilog.info(0x0000, 'assertEqual801','777');
        done();
      }
    })
  })
}
