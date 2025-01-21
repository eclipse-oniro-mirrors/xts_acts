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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import notificationManager from '@ohos.notificationManager'
import notification from '@ohos.notification'
import WantAgent from '@ohos.wantAgent'
import image from '@ohos.multimedia.image'

export default function ActsNotificationSecondaryDirectoryTest() {
describe('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST START')

    afterEach(async function (done) {
        console.info(`${TAG} afterEach START`)
        try{
            await notificationManager.cancelAll((err) => {
                if (err) {
                    console.info(`${TAG} cancelAll notification errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} cancelAll notification success`)
                    expect(true).assertTrue()
                    done()
                }
            });
        } catch (err) {
            console.info(`${TAG} cancelAll notification errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
        }
        console.info(`${TAG} afterEach END`)
      })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_3850
     * @tc.name: NotificationRequest、NotificationContent、NotificationBasicContent
     * @tc.desc: use NotificationRequest type
     */
    it('Sub_Notification_Ans_Publish_Publish_3850', 0, async function (done) {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 START`);

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
            await notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(true).assertTrue()
                    done()
                }
            });
        } catch (err) {
            console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3850 END`);
    });

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_3950
     * @tc.name: NotificationLongTextContent 
     * @tc.desc: use NotificationLongTextContent type
     */
    it('Sub_Notification_Ans_Publish_Publish_3950', 0, async function (done) {
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
            contentType: notification.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: longContentText
        }

        let notificationRequest : notificationManager.NotificationRequest = {
            content: notifyContent,
            id: 2,
            slotType: notification.SlotType.SERVICE_INFORMATION,
        }

        try{
            await notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4050
     * @tc.name: NotificationBasicContent
     * @tc.desc: use NotificationBasicContent type
     */
    it('Sub_Notification_Ans_Publish_Publish_4050', 0, async function (done) {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4050 START`);

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
            await notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4150
     * @tc.name: NotificationMultiLineContent
     * @tc.desc: use NotificationMultiLineContent type
     */
    it('Sub_Notification_Ans_Publish_Publish_4150', 0, async function (done) {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4150 START`);

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
            await notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4250
     * @tc.name: NotificationActionButton、NotificationUserInput
     * @tc.desc: use NotificationActionButton type
     */
    it('Sub_Notification_Ans_Publish_Publish_4250', 0, async function (done) {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4250 START`);

        let agentInfo = {
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
            await notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4350
     * @tc.name: NotificationTemplate
     * @tc.desc: use NotificationTemplate type
     */
    it('Sub_Notification_Ans_Publish_Publish_4350', 0, async function (done) {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4350 START`);

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
            await notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4450
     * @tc.name: DistributedOptions
     * @tc.desc: use DistributedOptions type
     */
    it('Sub_Notification_Ans_Publish_Publish_4450', 0, async function (done) {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4450 START`);

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
            await notificationManager.publish(notificationRequest, (err) => {
                if (err) {
                    console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    console.info(`${TAG} publish AsyncCallback success`)
                    expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4550
     * @tc.name: NotificationBasicContent
     * @tc.desc: use NotificationBasicContent type
     */
    it('Sub_Notification_Ans_Publish_Publish_4550', 0, async function (done) {
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 START`);

        let picture_opts = {
            size: {
            height: 25,
            width: 2,
            },
            alphaType: 0,
            scaleMode: 1,
            pixelFormat: 4,
            editable: true
        }
        let notification_picture: image.PixelMap = undefined
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
                        expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4650
     * @tc.name: NotificationMultiLineContent
     * @tc.desc: use NotificationMultiLineContent type
     */
    it('Sub_Notification_Ans_Publish_Publish_4650', 0, async function (done) {
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
                    }).catch((err) => {
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4750
     * @tc.name: BundleOption
     * @tc.desc: use BundleOption type
     */
    it('Sub_Notification_Ans_Publish_Publish_4750', 0, async function (done) {
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4850
     * @tc.name: NotificationFlags
     * @tc.desc: use NotificationFlags type
     */
    it('Sub_Notification_Ans_Publish_Publish_4850', 0, async function (done) {
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
