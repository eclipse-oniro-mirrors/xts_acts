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


// Error code for "Capability not supported"
const CAPABILITY_NOT_SUPPORTED_ERROR = 801;

// Helper function to check if error is capability not supported
function isCapabilityNotSupported(error: BusinessError): boolean {
  return error.code === CAPABILITY_NOT_SUPPORTED_ERROR;
}

// Helper function to check if NmErrorCode is capability not supported (handles enum type)
function isCapabilityNotSupportedCode(code: number): boolean {
  // Convert to string for comparison to avoid type mismatch with NmErrorCode enum
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

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsAbilityTest beforeAll start');
      hilog.warn(0x0000, 'testTag',
        'WebNativeMessagingExtension: Tests will be skipped on non-2-in-1 devices using error code 801 detection.');
    })

    // 等待回收资源
    afterEach(async () => {
      closePipe(pipeRead);
      closePipe(pipeWrite);
      try {
        commonEventManager.unsubscribe(sub);
      } catch (e) {

      }
      // Attempt disconnect if connId is valid
      if (connId != 0) {
        webNativeMessagingExtensionManager.disconnectNative(connId).then(() => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id : ${connId} succeed`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `afterEach disconnectNative id : ${connId} error: ${JSON.stringify(err)}`);
        });
        connId = 0;
      }
    })
    // 拉起webNativeExtension
    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_0100
     * @tc.desc   SUB_WEB_WebNativeMessagingExtension_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtension_0100', Level.LEVEL0, async (done: Function) => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch(err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters:{
          "ohos.arkweb.extensionOrigin":"testOrigin",
          "ohos.arkweb.messageReadPipe":{'type':'FD', 'value':pipeWrite.readFd},
          "ohos.arkweb.messageWritePipe":{'type':'FD', 'value':pipeRead.writeFd}
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          console.log('pbbextensionPid' + connection.extensionPid);
          console.log('pbbextensionOrigin' + connection.extensionOrigin);
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)}`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          connId = 0;
          done();
        },
        onFailed(code, errMsg) {
          console.log('testtag1' + webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY );
          console.log('testtag1' + webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR);
          console.log('testtag1' + webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR);
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          connId = 0;
          console.log('pbbb' + code)
          // Check if error is capability not supported (use helper function for enum compatibility)
          if (isCapabilityNotSupportedCode(code)) {
            let flag = true;
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            expect(flag).assertEqual(true);  // Mark as passed (skipped)
            flag = false
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
        await sleep(2000);
        webNativeMessagingExtensionManager.disconnectNative(connId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative succeed`);
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative error: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
        connId = 0;
      } catch (err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} connect or disconnect failed: ${JSON.stringify(err)}`);
        connId = 0;
        // Check if error is capability not supported
        if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
          let flag1 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(flag1).assertEqual(true);  // Mark as passed (skipped)
          flag1 = false;
          done();
          return;
        }
        expect(err.code).assertEqual("801");
        done();
      }
    })

    // 拉起webNativeExtension后发送命令让其拉起他的主页面，并通过commonEvent来确认拉起结果
    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_0200
     * @tc.desc   SUB_WEB_WebNativeMessagingExtension_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtension_0200', Level.LEVEL0, async (done: Function) => {
      // 我没找到方法让每个任务间隔几秒，来保证上一次的环境已经断开销毁。。
      await sleep(3000);
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch(err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }

      //先注册监听事件
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['webNativeMessaging1_startAbility_200']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag',
            `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(200);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters:{
          "ohos.arkweb.extensionOrigin":"testOrigin",
          "ohos.arkweb.messageReadPipe":{'type':'FD', 'value':pipeWrite.readFd},
          "ohos.arkweb.messageWritePipe":{'type':'FD', 'value':pipeRead.writeFd}
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)} ${pipeWrite.writeFd} bundleName:${connection.bundleName}  `);
          SendCommand("startAbility", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          // Check if error is capability not supported (use helper function for enum compatibility)
          if (isCapabilityNotSupportedCode(code)) {
            let flag2 = true;
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            expect(flag2).assertEqual(true);  // Mark as passed (skipped)
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
        // Check if error is capability not supported
        if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
          let flag3 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(flag3).assertEqual(true);  // Mark as passed (skipped)
          flag3 = false;
          done();
          return;
        }
        expect(err.code).assertEqual("801");
        done();
      }
    })

    // 拉起webNativeExtension后发送命令让其拉起他的主页面，并通过commonEvent来确认拉起结果
    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_0300
     * @tc.desc   SUB_WEB_WebNativeMessagingExtension_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtension_0300', Level.LEVEL0, async (done: Function) => {
      // 我没找到方法让每个任务间隔几秒，来保证上一次的环境已经断开销毁。。
      await sleep(3000);
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch(err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters:{
          "ohos.arkweb.extensionOrigin":"testOrigin",
          "ohos.arkweb.messageReadPipe":{'type':'FD', 'value':pipeWrite.readFd},
          "ohos.arkweb.messageWritePipe":{'type':'FD', 'value':pipeRead.writeFd}
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)} ${pipeWrite.writeFd} bundleName:${connection.bundleName} `);
          SendCommand("terminateSelf", pipeWrite.writeFd);
        },
        onDisconnect(connection) {
          let flag4 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
          expect(flag4).assertEqual(true);
          flag4 = false;
          done();

        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          // Check if error is capability not supported (use helper function for enum compatibility)
          if (isCapabilityNotSupportedCode(code)) {
            let flag5 = true;
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            expect(flag5).assertEqual(true);  // Mark as passed (skipped)
            flag5 = false;
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
        // Check if error is capability not supported
        if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
          let flag6 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(flag6).assertEqual(true);  // Mark as passed (skipped)
          flag6 = false;
          done();
          return;
        }
        expect(err.code).assertEqual("801");
        done();
      }
    })


    // 拉起webNativeExtension后发送命令让其拉起他的主页面，并通过commonEvent来确认拉起结果
    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtension_0400
     * @tc.desc   SUB_WEB_WebNativeMessagingExtension_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtension_0400', Level.LEVEL0, async (done: Function) => {
      // 我没找到方法让每个任务间隔几秒，来保证上一次的环境已经断开销毁。。
      await sleep(3000);
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_0400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      try {
        pipeRead = testNapi.createPipe();
        pipeWrite = testNapi.createPipe();
      } catch(err) {
        hilog.info(0x0000, 'testTag', `${tcNumber} create pipe error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }

      //先注册监听事件
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['webNativeMessaging1_startAbility_400']
      };
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
        sub = subscriber;
        hilog.info(0x0000, 'testTag', `${tcNumber} createSubscriber succeed`);
        commonEventManager.subscribe(sub, (err, commonEventData) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} subscribe callback result: ${JSON.stringify(err)}`);
          hilog.info(0x0000, 'testTag',
            `${tcNumber} subscribe callback commonEventData: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.parameters?.result).assertEqual(200);
          done();
        });
      });

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters:{
          "ohos.arkweb.extensionOrigin":"testOrigin",
          "ohos.arkweb.messageReadPipe":{'type':'FD', 'value':pipeWrite.readFd},
          "ohos.arkweb.messageWritePipe":{'type':'FD', 'value':pipeRead.writeFd}
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect connectionId: ${JSON.stringify(connection.connectionId)} ${pipeWrite.writeFd} bundleName:${connection.bundleName}  `);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect connectionId: ${JSON.stringify(connection.connectionId)}`);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          // Check if error is capability not supported (use helper function for enum compatibility)
          if (isCapabilityNotSupportedCode(code)) {
            let flag7 = true;
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            expect(flag7).assertEqual(true);  // Mark as passed (skipped)
            flag7 = false;
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
        // Check if error is capability not supported
        if (err.code === CAPABILITY_NOT_SUPPORTED_ERROR) {
          let flag8 = true;
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(flag8).assertEqual(true);  // Mark as passed (skipped)
          flag8 = false;
          done();
          return;
        }
        expect(err.code).assertEqual("801");
        done();
      }
    })
  })
}