/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, TestType, Size, Level, it, expect} from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest'
import notificationManager from '@ohos.notificationManager';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import wantAgent from '@ohos.app.ability.wantAgent';
import image from '@ohos.multimedia.image';

const DOMAIN: number = 0x000;
const TAG: string = 'NotificationActs';
const TS_NAME: string = 'ActsNotificationWantUriTest';
const BUNDLE_NAME: string = 'com.example.notificationwanturi';
const ABILITY_NAME: string = 'EntryAbility';
const TEST_TITLE: string = 'Test_Title';
const TEST_TEXT: string = 'Test_Text';
const TEST_ADDITIONAL_TEXT: string = 'Test_AdditionalText';
const BUTTON_ALLOW_TEXT: string = '允许';
const KEY_URI: string = 'ohos.notificationManager.wantUri';
const WAIT_TIME2000: number = 2000;
const WAIT_TIME4000: number = 4000;
const PARAM_0: number = 0;

let driver: Driver;

async function createWantAgent(uri: string, tcName: string): Promise<WantAgent | undefined> {
  let wantAgentInfo: wantAgent.WantAgentInfo = {
    wants: [
      {
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        action: '',
        uri: uri
      }
    ],
    actionType: wantAgent.OperationType.START_ABILITY,
    requestCode: PARAM_0,
    actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
  };
  let retWantAgent: WantAgent | undefined;
  hilog.info(DOMAIN, TAG, `${TS_NAME}#${tcName} getWantAgent uri: ${uri} .`);
  let agent = await wantAgent.getWantAgent(wantAgentInfo).then((data: WantAgent) => {
	  hilog.info(DOMAIN, TAG, `${TS_NAME}#${tcName} getWantAgent succeeded.`);
    retWantAgent = data;
  }).catch((err: BusinessError) => {
    hilog.error(DOMAIN, TAG, `${TS_NAME}#${tcName} getWantAgent failed, code:${err.code} message:${err.message}`);
    retWantAgent = undefined;
  });    
  return retWantAgent;
}

function createNotificationRequest(wantAgent1: WantAgent, wantAgent2: WantAgent,
  extraInfo?: Record<string, string>): notificationManager.NotificationRequest {
  let actionButton: notificationManager.NotificationActionButton = {
    title: TEST_TITLE,
    wantAgent: wantAgent2 as WantAgent
  };

  let notificationRequest: notificationManager.NotificationRequest = {
    content: {
      notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
      normal: {
        title: TEST_TITLE,
        text: TEST_TEXT,
        additionalText: TEST_ADDITIONAL_TEXT,
      } as notificationManager.NotificationBasicContent,
    } as notificationManager.NotificationContent,
    wantAgent: wantAgent1,
    actionButtons: [actionButton]
  } as notificationManager.NotificationRequest;
  if (extraInfo) {
    notificationRequest.extraInfo = extraInfo;
  }
  return notificationRequest;
}

async function publishAndCheck(request: notificationManager.NotificationRequest, expectUri: string | undefined,
  done: () => void, tcName: string): Promise<void> {
  await notificationManager.publish(request).then(() => {
    hilog.info(DOMAIN, TAG, `${TS_NAME}#${tcName} publish succeeded.`);
  }).catch((err: BusinessError) => {
    hilog.error(DOMAIN, TAG, `${TS_NAME}#${tcName} publish failed, code:${err.code} message:${err.message}`);
    expect().assertFail();
    done();
    return;
  });      
  await notificationManager.getActiveNotifications().then((data: notificationManager.NotificationRequest[]) => {
    hilog.info(DOMAIN, TAG, `${TS_NAME}#${tcName} getActiveNotifications succeeded`);
    hilog.info(DOMAIN, TAG, `${TS_NAME}#${tcName} data.length:${data.length}`);
    expect(data.length).assertLarger(PARAM_0);
    let testUri: Record<string, object> = data[PARAM_0].extraInfo as Record<string, object>;
    hilog.info(DOMAIN, TAG, `${TS_NAME}#${tcName} wantUri:${testUri[KEY_URI]}`);
    if (expectUri === undefined) {
      expect(Object.keys(testUri).includes(KEY_URI)).assertFalse();
      done();
    } else if (typeof testUri[KEY_URI] === 'string') {
      expect(testUri[KEY_URI]).assertEqual(expectUri);
      done();
    } else {
      expect().assertFail();
      done();
    }
  }).catch((err: BusinessError) => {
    hilog.error(DOMAIN, TAG, `${TS_NAME}#${tcName} getActiveNotifications failed, code:${err.code} 
      message:${err.message}`);
    expect().assertFail();
    done();
  });
}

export default function ActsNotificationWantUriTest() {
  describe('ActsNotificationWantUriTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, `${TS_NAME}#beforeAll start`);
      let notificationEnable: Boolean = notificationManager.isNotificationEnabledSync();
      hilog.info(DOMAIN, TAG, `${TS_NAME} isNotificationEnabledSync ${notificationEnable}.`);
      if (!notificationEnable) {
        let context: common.UIAbilityContext = 
          AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        notificationManager.requestEnableNotification(context, (err: BusinessError | null) => {
          if (err === null || err.code === PARAM_0) {
            hilog.info(DOMAIN, TAG, `${TS_NAME}#beforeAll requestEnableNotification succeeded.`);
          } else {
            hilog.error(DOMAIN, TAG, `${TS_NAME}#beforeAll requestEnableNotification failed, code:${err.code}
              message:${err.message}`);
          }
        });
        driver = Driver.create();
        await driver.delayMs(WAIT_TIME4000);
        await driver.assertComponentExist(ON.text(BUTTON_ALLOW_TEXT));
        let button = await driver.findComponent(ON.text(BUTTON_ALLOW_TEXT));
        if (button !== null) {
          await button.click();
          await driver.delayMs(WAIT_TIME4000);
        } else {
          hilog.error(DOMAIN, TAG,`${TS_NAME}#beforeAll button is null`);
        }
        notificationEnable = notificationManager.isNotificationEnabledSync();
        hilog.info(DOMAIN, TAG, `${TS_NAME}#beforeAll isNotificationEnabledSync ${notificationEnable}.`);
      }
      hilog.info(DOMAIN, TAG, `${TS_NAME}#beforeAll end`);
    })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_001
     * @tc.name    Sub_Notification_Ans_GetUri_001
     * @tc.desc    Test publishing a normal notification with a uri via want, then verify the uri can be retrieved
     *             using getActiveNotifications
     * @tc.size    Medium Test
     * @tc.type    Function
     * @tc.level   0
     */
    it('Sub_Notification_Ans_GetUri_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
        const TC_NAME = 'Sub_Notification_Ans_GetUri_001';
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case start`);
        let uri1: string = '_____WantAgent____';
        let uri2: string = '_____WantAgent____2';
        let wantAgent1: WantAgent | undefined = await createWantAgent(uri1, TC_NAME);
        let wantAgent2: WantAgent | undefined = await createWantAgent(uri2, TC_NAME);
        if (wantAgent1 && wantAgent2) {
          let request: notificationManager.NotificationRequest = createNotificationRequest(wantAgent1, wantAgent2);
          await publishAndCheck(request, uri1, done, TC_NAME);
        } else {
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case end`);
      })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_002
     * @tc.name    Sub_Notification_Ans_GetUri_002
     * @tc.desc    Test publishing a normal notification with a empty uri via want, then verify the uri can be
     *             retrieved using getActiveNotifications
     * @tc.size    Medium Test
     * @tc.type    Function
     * @tc.level   2
     */
    it('Sub_Notification_Ans_GetUri_002', Level.LEVEL2, async (done: () => void): Promise<void> => {
        const TC_NAME = 'Sub_Notification_Ans_GetUri_002';
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case start`);
        let uri1: string = '';
        let uri2: string = '_____WantAgent____2';
        let wantAgent1: WantAgent | undefined = await createWantAgent(uri1, TC_NAME);
        let wantAgent2: WantAgent | undefined = await createWantAgent(uri2, TC_NAME);
        if (wantAgent1 && wantAgent2) {
          let notificationRequest = createNotificationRequest(wantAgent1, wantAgent2);
          await publishAndCheck(notificationRequest, undefined, done, TC_NAME);
        } else {
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case end`);
      })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_003
     * @tc.name    Sub_Notification_Ans_GetUri_003
     * @tc.desc    Test publishing a normal notification with a uri with special chars via want, then verify the uri
     *             can be retrieved using getActiveNotifications
     * @tc.size    Medium Test
     * @tc.type    Function
     * @tc.level   2
     */
    it('Sub_Notification_Ans_GetUri_003', Level.LEVEL2, async (done: () => void): Promise<void> => {
        const TC_NAME = 'Sub_Notification_Ans_GetUri_003';
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case start`);
        let uri1: string = '(~！@#￥%……&*（）——+{}：“《》？~!@#$%^&*()_+{}"<>?,./;\'[]-=';
        let uri2: string = '(~！@#￥%……&*（）——+{}：“《》？~!@#$%^&*()_+{}"<>?,./;\'[]-=2';
        let wantAgent1: WantAgent | undefined  = await createWantAgent(uri1, TC_NAME);
        let wantAgent2: WantAgent | undefined  = await createWantAgent(uri2, TC_NAME);
        if (wantAgent1 && wantAgent2) {
          let notificationRequest = createNotificationRequest(wantAgent1, wantAgent2);
          await publishAndCheck(notificationRequest, uri1, done, TC_NAME);
        } else {
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case end`);
      })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_004
     * @tc.name    Sub_Notification_Ans_GetUri_004
     * @tc.desc    Test publishing a normal notification with a uri via want and extraInfo, then verify the uri can be
     *             retrieved using getActiveNotifications
     * @tc.size    Medium Test
     * @tc.type    Function
     * @tc.level   1
     */
    it('Sub_Notification_Ans_GetUri_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
        const TC_NAME = 'Sub_Notification_Ans_GetUri_004';
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case start`);
        let uri1: string = '_____WantAgent____';
        let uri2: string = '_____WantAgent____2';
        let uri3: string = 'aaa';
        let wantAgent1: WantAgent | undefined = await createWantAgent(uri1, TC_NAME);
        let wantAgent2: WantAgent | undefined = await createWantAgent(uri2, TC_NAME);
        if (wantAgent1 && wantAgent2) {
          let notificationRequest = createNotificationRequest(
            wantAgent1,
            wantAgent2,
            { 'ohos.notificationManager.wantUri': uri3 }
          );
          await publishAndCheck(notificationRequest, uri1, done, TC_NAME);
        } else {
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `${TS_NAME}#${TC_NAME} test case end`);
      })
  })
}