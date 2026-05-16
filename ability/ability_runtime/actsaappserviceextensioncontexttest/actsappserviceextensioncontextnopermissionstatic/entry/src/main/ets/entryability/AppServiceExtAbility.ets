/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import AppServiceExtensionAbility from '@ohos.app.ability.AppServiceExtensionAbility';
import rpc from '@ohos.rpc';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError, RecordData } from '@ohos.base';
import Want from '@ohos.app.ability.Want';

const BUNDLE_NAME: string = 'com.acts.context.appserviceextensionnopermission.static';
const TEST_CASE_KEY: string = 'caseTag';
const SUCCESS_CODE: int = 200;

let testCaseName: string = '';
const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

class StubTest extends rpc.RemoteObject {
  public constructor(des: string) {
    super(des);
  }

  public onConnect(code: int, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
  }
}


function publishEvent(eventName: string, code: int) {
  let commonEventData: commonEventManager.CommonEventPublishData = {
    parameters: {
      'result': code
    } as Record<string, RecordData>
  } as commonEventManager.CommonEventPublishData;
  commonEventManager.publish(eventName, commonEventData, (err) => {
    if (!err || err?.code === 0) {
      hilog.info(DOMAIN, TAG, `${testCaseName} publish success`);
    } else {
      hilog.info(DOMAIN, TAG, `${testCaseName} publish failed`);
    }
  });
}


export default class AppServiceExtAbility extends AppServiceExtensionAbility {
  onCreate(want: Want) {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility onCreate`);
  }
  onRequest(want: Want, startId: int) {
    hilog.info(DOMAIN, TAG, `AppServiceExtAbility onRequest`);

    if (want?.parameters?.[TEST_CASE_KEY]) {
      testCaseName = want?.parameters?.[TEST_CASE_KEY] as string;
      hilog.info(DOMAIN, TAG, `AppServiceExtAbility testCaseName: ${testCaseName}`);
    } else {
      hilog.info(DOMAIN, TAG, `AppServiceExtAbility onRequest without testCaseName`);
    }

    if(testCaseName === ('SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1900')) {
      hilog.info(DOMAIN, TAG, `${testCaseName} AppServiceExtAbility Begin`);
      let wantInfo: Want = {
        bundleName: BUNDLE_NAME,
        action: 'EntryAbility'
      };
      try {
        this.context.startAbility(wantInfo).then(() => {
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility success`);
          publishEvent(testCaseName, SUCCESS_CODE);
        }).catch((error: Error) => {
          let code: int = (error as BusinessError).code;
          hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
          publishEvent(testCaseName, code);
        });
      } catch (error) {
        let code: int = (error as BusinessError).code;  
        hilog.info(DOMAIN, TAG, `${testCaseName} startAbility failed: ${code}`);
        publishEvent(testCaseName, code);
      }
    }
  }

  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(DOMAIN, TAG, `AppServiceExtensionAbility onConnect`);
    return new StubTest('test');
  }

  onDisconnect(want: Want) {
    hilog.info(DOMAIN, TAG, `AppServiceExtensionAbility onDisconnect`);
  }

  onDestroy() {
    hilog.info(DOMAIN, TAG, `AppServiceExtensionAbility onDestroy`);
  }
};