/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Want, common, StartOptions } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';
import util from '@ohos.util';
import { hilog } from '@kit.PerformanceAnalysisKit';
import WebNativeMessagingExtensionAbility, { ConnectionInfo } from '@ohos.web.WebNativeMessagingExtensionAbility';
import { BusinessError,commonEventManager } from '@kit.BasicServicesKit';
const TAG: string = 'testTag';



function publishEvent(eventName: string, code: number) {
  let commonEventData: commonEventManager.CommonEventPublishData = {
    parameters: {
      'result': code
    }
  }
  commonEventManager.publish(eventName, commonEventData, (result) => {
    hilog.info(0x0000, 'testTag', `${eventName} publish result:${JSON.stringify(result)}`);
  });
}

export default class WebExtensionAbility1 extends WebNativeMessagingExtensionAbility {
  async waitForCommand(connectId:number, fdRead : number) {
    try {
      let arrayBuffer = new ArrayBuffer(1024);
      let readLen = await fs.read(fdRead, arrayBuffer);
      if (readLen <= 0) {
        hilog.info(0x0000, TAG, `WebExtensionAbility1 readLen <= 0 connectId:${connectId}`);
        return;
      }
      hilog.error(0x0000, TAG, `WebExtensionAbility1 read pipe ok readLen :${readLen}`);
      let decoder = util.TextDecoder.create('utf-8');
      let stringData = decoder.decodeToString(new Uint8Array(arrayBuffer));
      let windowFocused = true;
      let option:StartOptions = {
        windowFocused,
      }
      if (stringData.startsWith("startAbility")) {
        try {
          let want: Want = {
            bundleName: "com.acts.context.webonconnectnativerely",
            abilityName: "EntryAbility"
          }
          hilog.info(0x0000, TAG, `WebExtensionAbility1 startAbility start connectId:${connectId}`);
          this.context.startAbility(want,option);
        } catch (error) {
          hilog.error(0x0000, TAG, `WebExtensionAbility1 startAbility connectId:${connectId}, errorCode: ${error.code}, message: ${error.message}`);
        }
      }  else if(stringData.startsWith("terminateSelf")) {
        this.context.terminateSelf();
      }else {
        hilog.error(0x0000, TAG, `WebExtensionAbility1 readPipe connectId:${connectId}, command unknown :${stringData}`);
      }
    } catch (error) {
      hilog.error(0x0000, TAG, `WebExtensionAbility1 readPipe, errorCode: ${error.code}, message: ${error.message}`);
    }
  }


  onConnectNative(connect: ConnectionInfo): void {
    hilog.info(0x0000, TAG, `WebExtensionAbility1 onConnectNative, connectionId: ${connect.connectionId} fdRead: ${connect.fdRead} fdWrite: ${connect.fdWrite}  bundleName: ${connect.bundleName} extensionOrgin: ${connect.extensionOrigin}`);
    this.waitForCommand(connect.connectionId, connect.fdRead);
    this.context.stopNativeConnection(10000000).catch((err: BusinessError) => {
      console.error(`failed to enable, ${err}`);
      hilog.info(0x0000, 'testTag', `connect or disconnect failed: ${JSON.stringify(err)}`);
      if(err.code == 16000011) {
        publishEvent("webNativeMessaging1_startAbility_400", 200);
      } else {
        publishEvent("webNativeMessaging1_startAbility_400", 100);
      }
    })
  }
  
  onDisconnectNative(connect: ConnectionInfo): void {
    hilog.info(0x0000, TAG, `WebExtensionAbility1 onDisconnectNative, connectionId: ${connect.connectionId}`);
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, `WebExtensionAbility1 onDestory`);
  }
};