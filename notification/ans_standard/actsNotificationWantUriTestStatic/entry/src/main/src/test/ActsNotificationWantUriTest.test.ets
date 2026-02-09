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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index"
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement';
import notificationManager from '@ohos.notificationManager';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import wantAgent from '@ohos.app.ability.wantAgent';
import { RecordData } from '@ohos.base';
import image from '@ohos.multimedia.image';

const DOMAIN: int = 0x000;
const TAG: string = 'NotificationActs';
const TEST_SUITE_NAME: string = 'ActsNotificationWantUriTest';
const BUNDLE_NAME: string = 'com.example.notificationwanturi.static';
const ABILITY_NAME: string = 'EntryAbility';
const TEST_TITLE: string = 'Test_Title';
const TEST_TEXT: string = 'Test_Text';
const TEST_ADDITIONAL_TEXT: string = 'Test_AdditionalText';
const BUTTON_ALLOW_TEXT: string = '允许';
const KEY_URI: string = 'ohos.notificationManager.wantUri';
const WAIT_TIME2000: int = 2000;
const WAIT_TIME4000: int = 4000;
const PARAM_0: int = 0;

function getWantAgentByUri(uri: string): WantAgent | undefined {
  let wantAgentInfo: wantAgent.WantAgentInfo = {
    wants: [
      {
        deviceId: '',
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
        action: '',
        entities: [],
        uri: uri,
        parameters: {}
      }
    ],
    actionType: wantAgent.OperationType.START_ABILITY,
    requestCode: PARAM_0,
    actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG],
  };
  if (uri === null) {
    wantAgentInfo = {
      wants: [
        {
          deviceId: '',
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME,
          action: '',
          entities: [],
          parameters: {}
        }
      ],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: PARAM_0,
      actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG],
    };
  }
  let wantAgent1: WantAgent | undefined;
  wantAgent.getWantAgent(wantAgentInfo, (err: BusinessError | null, data: WantAgent | undefined) => {
    if (err === null || err.code === PARAM_0) {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#getWantAgentByUri getWantAgent succeeded.`);
      wantAgent1 = data;
    } else {
      hilog.error(DOMAIN, TAG,
        `${TEST_SUITE_NAME}#getWantAgentByUri getWantAgent failed, code:${err.code} message:${err.message}`);
    }
  });
  await Utils.msSleep(WAIT_TIME4000);
  return wantAgent1;
}

export default function ActsNotificationWantUriTest() {
  describe('ActsNotificationWantUriTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll start`);
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(WAIT_TIME2000);
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await Utils.msSleep(WAIT_TIME2000);
      let notificationEnable: Boolean = notificationManager.isNotificationEnabledSync();
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll isNotificationEnabledSync ${notificationEnable}.`);
      if (!notificationEnable)
      {
        let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as
          common.UIAbilityContext;
        notificationManager.requestEnableNotification(context, (err: BusinessError | null) => {
          if (err === null || err.code === PARAM_0) {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll requestEnableNotification succeeded.`);
          } else {
            hilog.error(DOMAIN, TAG,
              `${TEST_SUITE_NAME}#beforeAll requestEnableNotification failed, code:${err.code} message:${err.message}`);
          }
        });
        await Utils.msSleep(WAIT_TIME2000);
        let driver = Driver.create();
        await driver.assertComponentExist(ON.text(BUTTON_ALLOW_TEXT));
        let button = await driver.findComponent(ON.text(BUTTON_ALLOW_TEXT));
        if (button !== null) {
          await button.click();
          await Utils.msSleep(WAIT_TIME4000);
        } else {
          hilog.error(DOMAIN, TAG,`${TEST_SUITE_NAME}#beforeAll button is null`);
        }
        notificationEnable = notificationManager.isNotificationEnabledSync();
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll isNotificationEnabledSync ${notificationEnable}.`);
      }
      hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#beforeAll end`);
    })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_001
      * @tc.name    Sub_Notification_Ans_GetUri_static_001
      * @tc.desc    Test publishing a normal notification with a uri via want, then verify the uri can be retrieved
      *             using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_001';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
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
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_002
      * @tc.name    Sub_Notification_Ans_GetUri_static_002
      * @tc.desc    Test publishing a normal notification with a empty uri via want, then verify the uri can be
      *             retrieved using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_002';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {          
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
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
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    expect(Object.keys(testUri).includes(KEY_URI)).assertFalse();
                    done();
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_003
      * @tc.name    Sub_Notification_Ans_GetUri_static_003
      * @tc.desc    Test publishing a normal notification with a uri with special chars via want, then verify the uri
      *             can be retrieved using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_003';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '(~！@#￥%……&*（）——+{}“《》？~!@#$%^&*()_+{}"<>?,./;[]-=';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
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
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
     })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_004
      * @tc.name    Sub_Notification_Ans_GetUri_static_004
      * @tc.desc    Test publishing a normal notification with a uri via want and extraInfo, then verify the uri can be
      *             retrieved using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_WantUri_Static_0400';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
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
            extraInfo: {
              'ohos.notificationManager.wantUri': 'aaa'
            } as Record<string, RecordData>,
            actionButtons: [actionButton]
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
     })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_005
      * @tc.name    Sub_Notification_Ans_GetUri_static_005
      * @tc.desc    Test publishing a long notification with a uri via want, then verify the uri can be retrieved
      *             using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_005';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          let notificationRequest: notificationManager.NotificationRequest = {
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
              longText: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                longText: 'Test_AdditionalText',
                briefText: 'Test_BriefText',
                expandedTitle: 'Test_ExpandedTitle',
              } as notificationManager.NotificationLongTextContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            actionButtons: [actionButton]
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_008
      * @tc.name    Sub_Notification_Ans_GetUri_static_008
      * @tc.desc    Test publishing a long notification with a uri via want and extraInfo, then verify the uri can be
      *             retrieved using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_WantUri_Static_0800';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          let notificationRequest: notificationManager.NotificationRequest = {
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
              longText: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                longText: 'Test_AdditionalText',
                briefText: 'Test_BriefText',
                expandedTitle: 'Test_ExpandedTitle',
              } as notificationManager.NotificationLongTextContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            extraInfo: {
              'ohos.notificationManager.wantUri': 'aaa'
            } as Record<string, RecordData>,
            actionButtons: [actionButton]
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_009
      * @tc.name    Sub_Notification_Ans_GetUri_static_009
      * @tc.desc    Test publishing a multiline notification with a uri via want, then verify the uri can be retrieved
      *             using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_009';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          let notificationRequest: notificationManager.NotificationRequest = {
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
              multiLine: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                lines: ['Line1', 'Line2', 'Line3'],
                briefText: 'Test_BriefText',
                longTitle: 'Test_ExpandedTitle',
              } as notificationManager.NotificationMultiLineContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            actionButtons: [actionButton]
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
      * @tc.number  Sub_Notification_Ans_GetUri_static_012
      * @tc.name    Sub_Notification_Ans_GetUri_static_012
      * @tc.desc    Test publishing a multiline notification with a uri via want and extraInfo, then verify the uri 
      *             can be retrieved using getActiveNotifications
      */
    it('Sub_Notification_Ans_GetUri_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_012';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          let notificationRequest: notificationManager.NotificationRequest = {
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
              multiLine: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                lines: ['Line1', 'Line2', 'Line3'],
                briefText: 'Test_BriefText',
                longTitle: 'Test_ExpandedTitle',
              } as notificationManager.NotificationMultiLineContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            extraInfo: {
              'ohos.notificationManager.wantUri': 'aaa'
            } as Record<string, RecordData>,
            actionButtons: [actionButton]
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_static_013
     * @tc.name    Sub_Notification_Ans_GetUri_static_013
     * @tc.desc    Test publishing a picture notification with a uri via want, then verify the uri can be retrieved
     *             using getActiveNotifications
     */
    it('Sub_Notification_Ans_GetUri_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_013';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          const color = new ArrayBuffer(60000);
          let bufferArr = new Uint8Array(color);
          for (let i = 0; i < bufferArr.byteLength; i++) {
            bufferArr[i++] = 60;
            bufferArr[i++] = 20;
            bufferArr[i++] = 220;
            bufferArr[i] = 100;
          }
          let opts: image.InitializationOptions = {
            editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
              height: 100, width: 150
            }
          };
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}
              get pixelMap info succeeded`);
          }).catch((err: Error): void => {
            hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}
              get pixelMap info failed code:${err.code} message:${err.message}`);
          });
          let notificationRequest: notificationManager.NotificationRequest = {
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                picture: pixelMap,
                briefText: 'Test_BriefText',
                expandedTitle: 'Test_ExpandedTitle',
              } as notificationManager.NotificationPictureContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            actionButtons: [actionButton]
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_static_016
     * @tc.name    Sub_Notification_Ans_GetUri_static_016
     * @tc.desc    Test publishing a picture notification with a uri via want and extraInfo, then verify the uri 
     *             can be retrieved using getActiveNotifications
     */
    it('Sub_Notification_Ans_GetUri_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_016';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          const color = new ArrayBuffer(60000);
          let bufferArr = new Uint8Array(color);
          for (let i = 0; i < bufferArr.byteLength; i++) {
            bufferArr[i++] = 60;
            bufferArr[i++] = 20;
            bufferArr[i++] = 220;
            bufferArr[i] = 100;
          }
          let opts: image.InitializationOptions = {
            editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
              height: 100, width: 150
            }
          };
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}
              get pixelMap info succeeded`);
          }).catch((err: Error): void => {
            hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}
              get pixelMap info failed code:${err.code} message:${err.message}`);
          });
          let notificationRequest: notificationManager.NotificationRequest = {
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
              picture: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                picture: pixelMap,
                briefText: 'Test_BriefText',
                expandedTitle: 'Test_ExpandedTitle',
              } as notificationManager.NotificationPictureContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            extraInfo: {
              'ohos.notificationManager.wantUri': 'aaa'
            } as Record<string, RecordData>,
            actionButtons: [actionButton]
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_static_017
     * @tc.name    Sub_Notification_Ans_GetUri_static_017
     * @tc.desc    Test publishing a liveview notification with a uri via want, then verify the uri can be retrieved
     *             using getActiveNotifications
     */
    it('Sub_Notification_Ans_GetUri_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_017';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          let notificationRequest: notificationManager.NotificationRequest = {
            notificationSlotType: notificationManager.SlotType.LIVE_VIEW,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
              liveView: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                status: notificationManager.LiveViewStatus.LIVE_VIEW_CREATE,
              } as notificationManager.NotificationLiveViewContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            extraInfo: {
              'ohos.notificationManager.wantUri': 'aaa'
            } as Record<string, RecordData>,
            actionButtons: [actionButton],
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.cancelAll().then(() => {
              hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} cancel all notification succeeded.`);
            }).catch((err: Error) : void => {
              hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} cancel all notification failed
              code:${err?.code} message:${err?.message}`);
            });
            await Utils.msSleep(WAIT_TIME2000);
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })

    /**
     * @tc.number  Sub_Notification_Ans_GetUri_static_020
     * @tc.name    Sub_Notification_Ans_GetUri_static_020
     * @tc.desc    Test publishing a liveview notification with a uri via want and extraInfo, then verify the uri 
     *             can be retrieved using getActiveNotifications
     */
    it('Sub_Notification_Ans_GetUri_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME: string = 'Sub_Notification_Ans_GetUri_static_020';
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case start`);
        let uri: string = '_____WantAgent3____';
        let wantAgent1: WantAgent | undefined = getWantAgentByUri(uri);
        if (wantAgent1) {
          let uri2: string = '_____WantAgent2____';
          let wantAgent2: WantAgent | undefined = getWantAgentByUri(uri2);
          let actionButton: notificationManager.NotificationActionButton = {
            title: TEST_TITLE,
            wantAgent: wantAgent2 as WantAgent
          }
          let notificationRequest: notificationManager.NotificationRequest = {
            notificationSlotType: notificationManager.SlotType.LIVE_VIEW,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
              liveView: {
                title: TEST_TITLE,
                text: TEST_TEXT,
                status: notificationManager.LiveViewStatus.LIVE_VIEW_INCREMENTAL_UPDATE,
              } as notificationManager.NotificationLiveViewContent,
            } as notificationManager.NotificationContent,
            wantAgent: wantAgent1,
            extraInfo: {
              'ohos.notificationManager.wantUri': 'aaa'
            } as Record<string, RecordData>,
            actionButtons: [actionButton],
          } as notificationManager.NotificationRequest;
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError<void> | null) => {
              if (err == null || err.code == PARAM_0) {
                hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification succeeded.`);
                notificationManager.getActiveNotifications((err: BusinessError | null,
                  data: Array<notificationManager.NotificationRequest> | undefined): void => {
                  if (err === null || err.code === PARAM_0) {
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications succeeded`);
                    let dataArray: Array<notificationManager.NotificationRequest> =
                      data as Array<notificationManager.NotificationRequest>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} dataArrayLeng:${dataArray.length}`);
                    expect(dataArray.length).assertLarger(PARAM_0);
                    let testUri: Record<string, RecordData> = dataArray[0].extraInfo as Record<string, RecordData>;
                    hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} wantUri:${testUri[KEY_URI]}`);
                    if (testUri[KEY_URI]) {
                      expect(testUri[KEY_URI] as string).assertEqual(uri);
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  } else {
                    hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getActiveNotifications failed,
                      code:${err.code} message:${err.message}`);
                    expect().assertFail();
                    done();
                  }
                });
              } else {
                hilog.error(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
                  code:${err.code} message:${err.message}`);
                expect().assertFail();
                done();
              }
            });
          } catch (err: BusinessError) {
            hilog.info(DOMAIN, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} publish notification failed,
              code:${err.code} message:${err.message}`);
            expect().assertFail();
            done();
          }
        } else {
          hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} getWantAgent fail`);
          expect().assertFail();
          done();
        }
        await Utils.msSleep(WAIT_TIME2000);
        hilog.info(DOMAIN, TAG, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
      })
  })
}