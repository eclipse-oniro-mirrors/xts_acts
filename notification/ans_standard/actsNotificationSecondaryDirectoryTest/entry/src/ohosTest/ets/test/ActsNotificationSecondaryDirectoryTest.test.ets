/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import notificationManager from '@ohos.notificationManager'
import notification from '@ohos.notification'
import WantAgent from '@ohos.wantAgent'
import image from '@ohos.multimedia.image'
import { Driver, ON } from '@ohos.UiTest';
import { logGenerator, succeedGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';
import common from '@ohos.app.ability.common';
import wantagent from '@ohos.app.ability.wantAgent';
import { BusinessError } from '@ohos.base'

export default function ActsNotificationSecondaryDirectoryTest() {
describe('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST START')
    let log = logGenerator(TAG);

    beforeAll(async (done: () => void) => {
      log('ActsNotificationSecondaryDirectoryTest beforeAll START');
      await sleep(500);
      let driver = Driver.create();
      await sleep(500)
      let button = await driver.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
      log(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
        done()
      } else {
        log('null button');
        done()
      }
      log('ActsNotificationSecondaryDirectoryTest beforeAll end');
    })

    afterEach(async (done: Function) => {
        console.info(`${TAG} afterEach START`)
        try{
            await notificationManager.cancelAll((err) => {
                if (err) {
                    console.info(`${TAG} cancelAll notification errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} cancelAll notification success`)        
                    done()
                }
            });
        } catch (err) {
            console.info(`${TAG} cancelAll notification errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
        }
        await sleep(500)
        console.info(`${TAG} afterEach END`)
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_3850
     * @tc.number Sub_Notification_Ans_Publish_Publish_3850
     * @tc.desc   use NotificationRequest type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_3850', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 START`);
        let count :number = 0
        let ctx: common.UIAbilityContext | undefined = AppStorage.get('ctx');
        notificationManager.requestEnableNotification(ctx).then(() => {
         let basicContent: notificationManager.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notificationManager.NotificationContent = {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            id: 1
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 PUBLISH`);
        try{
             notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`);
                    count++
                    expect(count).assertEqual(1)
                    done()
                }
            });
        } catch (err) {
            console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
        };
          }).catch((err: Error) => {
            expect(false).assertTrue();
            done();
          });
          await sleep(1500);
          let driver = Driver.create();
          await sleep(1500)
          let button = await driver.findComponent(ON.text('允许'));
          log(`button is ${JSON.stringify(button)}`);
          if (button !== null) {
            await sleep(1500);
            await button.click();
          } else {
            expect(false).assertTrue();
            done();
          }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 END`);
    });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_3950
     * @tc.number Sub_Notification_Ans_Publish_Publish_3950
     * @tc.desc   use NotificationLongTextContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_3950', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3950 START`);
        let count :number = 0
        let longContentText: notificationManager.NotificationLongTextContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish",
            longText: "longText123456",
            briefText: "briefText123456",
            expandedTitle: "expandedTitle123456"
        }

        let notifyContent: notificationManager.NotificationContent = {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: longContentText
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            id: 2,
            slotType: notification.SlotType.SERVICE_INFORMATION,
        }

        try{
            notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    count++
                    expect(count).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4050
     * @tc.number Sub_Notification_Ans_Publish_Publish_4050
     * @tc.desc   use NotificationBasicContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4050', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4050 START`);
        let count :number = 0
        let basicContent: notificationManager.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }

        let notifyContent: notificationManager.NotificationContent = {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            id: 3
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4050 PUBLISH`);
        try{
            notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    count++
                    expect(count).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4150
     * @tc.number Sub_Notification_Ans_Publish_Publish_4150
     * @tc.desc   use NotificationMultiLineContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4150', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4150 START`);
        let count :number = 0
        let multiLineContent: notificationManager.NotificationMultiLineContent = {
            title: "test_title",
            text: "test_text",
            briefText: "notificationMultiLineContent_title",
            longTitle: "notificationMultiLineContent_title_12345678999999999",
            lines: ["thrive", "democracy", "civilization", "harmonious"]
        }

        let notifyContent: notificationManager.NotificationContent = {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: multiLineContent
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            id: 4
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4150 PUBLISH`);
        try{
            notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    count++
                    expect(count).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4250
     * @tc.number Sub_Notification_Ans_Publish_Publish_4250
     * @tc.desc   use NotificationActionButton type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4250', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4250 START`);
        let count :number = 0
        let agentInfo: wantagent.WantAgentInfo = {
            wants: [
                {
                    bundleName: 'com.example.secondaryDirectory',
                    abilityName: 'com.example.secondaryDirectory.MainAbility',
                    action: "usual.event.REMOVAL_WANTAGENT"
                }
              ],
            operationType: WantAgent.OperationType.SEND_COMMON_EVENT,
            requestCode: 0,
            wantAgentFlags:[WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };

        let wantAgentData = await WantAgent.getWantAgent(agentInfo);

        let basicContent: notificationManager.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notificationManager.NotificationContent = {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let userInputContent: notificationManager.NotificationUserInput = {
            inputKey: 'test_NotificationUserInput',
        }

        let actionButton: notificationManager.NotificationActionButton = {
            title:"buttonA",
            wantAgent: wantAgentData,
            userInput: userInputContent
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            actionButtons: [
                actionButton
            ],
            id: 5
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4250 PUBLISH`);
        try{
            notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    count++
                    expect(count).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4350
     * @tc.number Sub_Notification_Ans_Publish_Publish_4350
     * @tc.desc   use NotificationTemplate type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Notification_Ans_Publish_Publish_4350', Level.LEVEL1, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4350 START`);
        let count :number = 0
        let basicContent: notificationManager.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notificationManager.NotificationContent = {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notifyTemplate: notificationManager.NotificationTemplate = {
            name: 'downloadTemplate',
            data: {
                title: 'file',
                fileName: 'music.mp4',
                progressValue: 45
            }
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            template: notifyTemplate,
            id: 6
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4350 PUBLISH`);
        try{
            notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    count++
                    expect(count).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4450
     * @tc.number Sub_Notification_Ans_Publish_Publish_4450
     * @tc.desc   use DistributedOptions type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4450', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4450 START`);
        let count :number = 0
        let options: notificationManager.DistributedOptions = {
            isDistributed: false,
            supportDisplayDevices: ["0"],
            supportOperateDevices: ["0"]
        }

        let basicContent: notificationManager.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notificationManager.NotificationContent = {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            distributedOption: options,
            id: 7
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4450 PUBLISH`);
        try{
            notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    count++
                    expect(count).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4550
     * @tc.number Sub_Notification_Ans_Publish_Publish_4550
     * @tc.desc   use NotificationBasicContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4550', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 START`);
        let count :number = 0
        let picture_opts: image.InitializationOptions  = {
            size: {
            height: 25,
            width: 2,
            },
            alphaType: 0,
            scaleMode: 1,
            pixelFormat: 4,
            editable: true
        }
        let notification_picture: image.PixelMap | undefined = undefined
        let picture_buffer = new ArrayBuffer(picture_opts.size.height * picture_opts.size.width * 4)
        await image.createPixelMap(picture_buffer, picture_opts, (err, pixelMap)=>{
            console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);

            let longContentPicture: notificationManager.NotificationPictureContent = {
                title: "test_title",
                text: "test_text",
                additionalText: "test_Publish",
                briefText: "briefText123456",
                expandedTitle: "expandedTitle123456",
                picture: pixelMap
            }

            let notifyContent: notificationManager.NotificationContent = {
                contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
                picture: longContentPicture
            }

            let notificationRequest : notificationManager.NotificationRequest = {
                content: notifyContent,
                id: 3
            }

            console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 PUBLISH`);
            try{
                notificationManager.publish(notificationRequest, (err) => {
                    if (err) {
                        console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                    } else {
                        console.info(`${TAG} publish AsyncCallback success`)
                        count++
                        expect(count).assertEqual(1)
                        done()
                    }
                });
            } catch (err) {
                console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
            }
        })
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 END`);
    });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4650
     * @tc.number Sub_Notification_Ans_Publish_Publish_4650
     * @tc.desc   use NotificationMultiLineContent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4650', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4650 START`);
        try{
            await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
                console.info(`${TAG} addSlot success`)
                if (err) {
                    console.info(`${TAG} addSlot err: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    notificationManager.getSlots().then((NotificationSlot) => {
                        console.info(`${TAG} getSlots success:` + JSON.stringify(NotificationSlot))
                        for (let i = 0; i < NotificationSlot.length; ++i) {
                            console.info(`${TAG} NotificationSlot[${i}].type:` + JSON.stringify(NotificationSlot[i].type))
                            if (NotificationSlot[i].type == notificationManager.SlotType.SOCIAL_COMMUNICATION) {
                                done()
                                return
                            }
                        }
                        expect(false).assertTrue()
                        done()
                    }).catch((err: BusinessError) => {
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
    });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4750
     * @tc.number Sub_Notification_Ans_Publish_Publish_4750
     * @tc.desc   use BundleOption type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4750', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4750 START`);

        let bundleOpt: notificationManager.BundleOption = {
            bundle: "com.example.secondaryDirectory",
            uid: 101001
        }
        console.info(`${TAG} BundleOption bundle:uid = ${bundleOpt.bundle}${bundleOpt.uid}`);
        expect(typeof bundleOpt.bundle == 'string').assertTrue()
        expect(typeof bundleOpt.uid == 'number').assertTrue()
        expect(bundleOpt.bundle).assertEqual("com.example.secondaryDirectory")
        expect(bundleOpt.uid).assertEqual(101001)
        done()
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4750 END`);
    });

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4850
     * @tc.number Sub_Notification_Ans_Publish_Publish_4850
     * @tc.desc   use NotificationFlags type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4850', Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4850 START`);

        let flags: notificationManager.NotificationFlags = {
            soundEnabled: 1,
            vibrationEnabled: 2
        }
        console.info(`${TAG} NotificationFlags soundEnabled:vibrationEnabled
            = ${flags.soundEnabled}${flags.vibrationEnabled}`);
        expect(typeof flags.soundEnabled == 'number').assertTrue()
        expect(typeof flags.vibrationEnabled == 'number').assertTrue()
        expect(flags.soundEnabled).assertEqual(1)
        expect(flags.vibrationEnabled).assertEqual(2)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT).assertEqual(0)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT).assertEqual(1)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE).assertEqual(2)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_CONVERSATION).assertEqual(3)
        expect(notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE).assertEqual(4)
        done()
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4850 END`);
    });
}) }
