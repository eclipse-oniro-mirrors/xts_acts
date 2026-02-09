/**
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level ,beforeAll ,afterEach ,beforeEach } from "../../../hypium/index"
import notificationManager from '@ohos.notificationManager'
import wantAgent from '@ohos.app.ability.wantAgent'
import image from '@ohos.multimedia.image'
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import wantagent from '@ohos.app.ability.wantAgent';
import { BusinessError, RecordData } from '@ohos.base'
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext | undefined;
let bundle_name: string = 'com.example.secondaryDirectory.static'
let count: int = 0;

export default function ActsNotificationSecondaryDirectoryTest() {
  describe('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST START')


    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      let driver = Driver.create();
      await Utils.msSleep(1500);
      let button = await driver.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
      hilog.info(0x0000, 'testTag', `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await Utils.msSleep(1500);
        await button.click()
        await Utils.msSleep(500)
      }
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      console.info(`${TAG} beforeEach START`)
      await notificationManager.cancelAll()
      await notificationManager.removeAllSlots();
      await Utils.msSleep(1000);
      console.info(`${TAG} beforeEach END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_3850
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_3850
     * @tc.desc   use NotificationRequest type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_3850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_3850 ===>'
        count = 0;
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 START`);
        notificationManager.requestEnableNotification(testAbilityContext!).then(() => {
          let basicContent: notificationManager.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
          }
          let notifyContent: notificationManager.NotificationContent = {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent as notificationManager.NotificationBasicContent
          }

          let notificationRequest: notificationManager.NotificationRequest = {
            content: notifyContent as notificationManager.NotificationContent,
            id: 1,
            creatorBundleName: "creatorBundleName",
            creatorUid: 100,
            creatorPid: 101,
            creatorUserId: 100,
            hashCode: "hashCode",
            source: 0,
            deviceId: undefined,
            notificationFlags: undefined,
            agentBundle: undefined,
            appInstanceKey: undefined,
          }
          console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 PUBLISH`);
          try {
            notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} publish AsyncCallback success`);
                count++;
                expect(count).assertEqual(1);
                done()
              }
            });
          } catch (err) {
            console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          }
          ;
        }).catch((err: Error): void => {
          expect(false).assertTrue();
          done();
        });
        await Utils.msSleep(1500);
        let driver = Driver.create();
        await Utils.msSleep(1500);
        let button = await driver.findComponent(ON.text('允许'));
        hilog.info(0x0000, 'testTag', `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await Utils.msSleep(1500);
          await button.click()
        } else {
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_3950
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_3950
     * @tc.desc   use NotificationLongTextContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_3950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_3950 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3950 START`);

        let longContentText: notificationManager.NotificationLongTextContent = {
          title: "test_title",
          text: "test_text",
          additionalText: "test_Publish",
          longText: "longText123456",
          briefText: "briefText123456",
          expandedTitle: "expandedTitle123456"
        }

        let notifyContent: notificationManager.NotificationContent = {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
          longText: longContentText
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          content: notifyContent,
          id: 2,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          });
        } catch (err) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3950 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4050
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4050
     * @tc.desc   use NotificationBasicContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4050 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4050 START`);

        let basicContent: notificationManager.NotificationBasicContent = {
          title: "test_title",
          text: "test_text",
          additionalText: "test_Publish"
        }

        let notifyContent: notificationManager.NotificationContent = {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: basicContent
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          content: notifyContent,
          id: 3,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4050 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          });
        } catch (err) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4050 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4150
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4150
     * @tc.desc   use NotificationMultiLineContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4150 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4150 START`);

        let multiLineContent: notificationManager.NotificationMultiLineContent = {
          title: "test_title",
          text: "test_text",
          briefText: "notificationMultiLineContent_title",
          longTitle: "notificationMultiLineContent_title_12345678999999999",
          lines: ["thrive", "democracy", "civilization", "harmonious"]
        }

        let notifyContent: notificationManager.NotificationContent = {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
          multiLine: multiLineContent
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          content: notifyContent,
          id: 4,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4150 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          });
        } catch (err) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4150 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4250
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4250
     * @tc.desc   use NotificationActionButton type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4250 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4250 START`);

        let agentInfo: wantagent.WantAgentInfo = {
          wants: [
            {
              bundleName: bundle_name,
              abilityName: bundle_name + '.MainAbility',
              action: "usual.event.REMOVAL_WANTAGENT"
            }
          ],
          actionType: wantAgent.OperationType.SEND_COMMON_EVENT,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };

        let wantAgentData = wantAgent.getWantAgent(agentInfo);

        let basicContent: notificationManager.NotificationBasicContent = {
          title: "test_title",
          text: "test_text",
          additionalText: "test_Publish"
        }

        let notifyContent: notificationManager.NotificationContent = {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: basicContent
        }

        let userInputContent: notificationManager.NotificationUserInput = {
          inputKey: 'test_NotificationUserInput',
        }

        let actionButton: notificationManager.NotificationActionButton = {
          title: "buttonA",
          wantAgent: wantAgentData,
          userInput: userInputContent
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          content: notifyContent,
          actionButtons: [
            actionButton
          ],
          id: 5,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4250 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          });
        } catch (err) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4250 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4350
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4350
     * @tc.desc   use NotificationTemplate type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4350 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4350 START`);

        let data1: Record<string, RecordData> = {
          "title": 'file',
          "fileName": 'music.mp4',
          "progressValue": 45
        }

        let basicContent: notificationManager.NotificationBasicContent = {
          title: "test_title",
          text: "test_text",
          additionalText: "test_Publish"
        }

        let notifyContent: notificationManager.NotificationContent = {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: basicContent
        }

        let notifyTemplate: notificationManager.NotificationTemplate = {
          name: 'downloadTemplate',
          data: data1
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          content: notifyContent,
          template: notifyTemplate,
          id: 6,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4350 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          });
        } catch (err) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4350 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4450
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4450
     * @tc.desc   use DistributedOptions type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4450 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4450 START`);

        let options: notificationManager.DistributedOptions = {
          isDistributed: false,
          supportDisplayDevices: ["0"],
          supportOperateDevices: ["0"],
          remindType: 0
        }

        let basicContent: notificationManager.NotificationBasicContent = {
          title: "test_title",
          text: "test_text",
          additionalText: "test_Publish"
        }

        let notifyContent: notificationManager.NotificationContent = {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: basicContent
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          content: notifyContent,
          distributedOption: options,
          id: 7,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4450 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          });
        } catch (err) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4450 END`);
      });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4550
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4550
     * @tc.desc   use NotificationBasicContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        count = 0;
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4550 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 START`);

        let picture_opts: image.InitializationOptions = {
          size: {
            height: 25,
            width: 2,
          },
          alphaType: image.AlphaType.UNKNOWN,
          scaleMode: image.ScaleMode.CENTER_CROP,
          pixelFormat: image.PixelMapFormat.BGRA_8888,
          editable: true
        }
        let notification_picture: image.PixelMap | undefined = undefined
        let picture_buffer = new ArrayBuffer(picture_opts.size.height * picture_opts.size.width * 4)
        let pixelMap: image.PixelMap = image.createPixelMapSync(picture_buffer, picture_opts);

        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);
        })

        let longContentPicture: notificationManager.NotificationPictureContent = {
          title: "test_title",
          text: "test_text",
          additionalText: "test_Publish",
          briefText: "briefText123456",
          expandedTitle: "expandedTitle123456",
          picture: pixelMap
        }

        let notifyContent: notificationManager.NotificationContent = {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
          picture: longContentPicture
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          content: notifyContent,
          id: 3,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          });
        } catch (err) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 END`)
      })


    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4650
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4650
     * @tc.desc   use NotificationMultiLineContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4650 ===>'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4650 START`);
        try {
          notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
            console.info(`${TAG} addSlot success:` + JSON.stringify(err))
            if (err) {
              console.info(`${TAG} addSlot err: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} addSlot success 111`)
              notificationManager.getSlots().then((NotificationSlot: Array<notificationManager.NotificationSlot>) => {
                console.info(`${TAG} getSlots success:`)
                for (let i = 0; i < NotificationSlot.length; ++i) {
                  console.info(`${TAG} NotificationSlot[${i}].notificationType:` + NotificationSlot[i].notificationType)
                  let num = NotificationSlot[i].notificationType as notificationManager.SlotType
                  if (num == notificationManager.SlotType.SOCIAL_COMMUNICATION) {
                    expect(num == notificationManager.SlotType.SOCIAL_COMMUNICATION).assertTrue()
                    done()
                  }else{
                    expect(false).assertTrue()
                    done()
                  }
                }
                done()
              }).catch((err: Error): void => {
                console.info(`${TAG} getSlots failed err: + ${err.code}`)
                expect(false).assertTrue()
                done()
              })
            }
          })
        } catch (err) {
          console.info(`${TAG} addSlot failed err: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4650 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4750
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4750
     * @tc.desc   use BundleOption type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Publish_Static_4750'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4750 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: bundle_name,
          uid: 101001
        }
        console.info(`${TAG} BundleOption bundle:uid = ${bundleOpt.bundle},${bundleOpt.uid}`);
        expect(typeof bundleOpt.bundle == 'string').assertTrue()
        expect(typeof bundleOpt.uid == 'int').assertTrue()
        expect(bundleOpt.bundle).assertEqual(bundle_name)
        expect(bundleOpt.uid).assertEqual(101001)
        done()
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4750 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4850
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4850
     * @tc.desc   use NotificationFlags type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Publish_Static_4850'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4850 START`);

        let flags: notificationManager.NotificationFlags = {
          soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
          reminderFlags: undefined
        }
        console.info(`${TAG} NotificationFlags soundEnabled:vibrationEnabled
            = ${flags.soundEnabled},${flags.vibrationEnabled}`);
        console.info(`${TAG} NotificationFlags soundEnabled:vibrationEnabled1
            = ${typeof flags.soundEnabled},${typeof flags.vibrationEnabled}`);
        expect(typeof flags.soundEnabled).assertEqual('int')
        expect(typeof flags.vibrationEnabled).assertEqual('int')
        let num1 = flags.soundEnabled as notificationManager.NotificationFlagStatus
        let num2 = flags.vibrationEnabled as notificationManager.NotificationFlagStatus
        expect(num1 == 1).assertTrue()
        expect(num2 == 2).assertTrue()
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT as int).assertEqual(0)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT as int).assertEqual(1)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE as int).assertEqual(2)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_CONVERSATION as int).assertEqual(3)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE as int).assertEqual(4)
        done()
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4850 END`);
      })

  })
}

