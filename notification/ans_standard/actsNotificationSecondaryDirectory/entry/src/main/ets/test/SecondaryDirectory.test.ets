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
import notify from '@ohos.notificationManager'
import WantAgent from '@ohos.wantAgent'
import image from '@ohos.multimedia.image'

var timeout = 1000;

export default function secondaryDirectoryTest() {
describe('secondaryDirectoryTest', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST START')

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0100
     * @tc.name: NotificationRequest、NotificationContent、NotificationBasicContent
     * @tc.desc: use NotificationRequest type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0100', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0100 START`);

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 1
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0100 PUBLISH`);
        try{
            await notify.publish(notificationRequest, (err) => {
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

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0100 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0200
     * @tc.name: NotificationLongTextContent 
     * @tc.desc: use NotificationLongTextContent type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0200', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0200 START`);

        let longContentText: notify.NotificationLongTextContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish",
            longText: "longText123456",
            briefText: "briefText123456",
            expandedTitle: "expandedTitle123456"
        }

        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: longContentText
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 2,
            slotType: notify.SlotType.SERVICE_INFORMATION,
        }

        try{
            await notify.publish(notificationRequest, (err) => {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0200 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0300
     * @tc.name: NotificationBasicContent
     * @tc.desc: use NotificationBasicContent type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0300', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0300 START`);

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }

        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 3
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0300 PUBLISH`);
        try{
            await notify.publish(notificationRequest, (err) => {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0300 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0400
     * @tc.name: NotificationMultiLineContent
     * @tc.desc: use NotificationMultiLineContent type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0400', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0400 START`);

        let multiLineContent: notify.NotificationMultiLineContent = {
            title: "test_title",
            text: "test_text",
            briefText: "notificationMultiLineContent_title",
            longTitle: "notificationMultiLineContent_title_12345678999999999",
            lines: ["thrive", "democracy", "civilization", "harmonious"]
        }

        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: multiLineContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            id: 4
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0400 PUBLISH`);
        try{
            await notify.publish(notificationRequest, (err) => {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0400 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0500
     * @tc.name: NotificationActionButton、NotificationUserInput
     * @tc.desc: use NotificationActionButton type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0500', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0500 START`);

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

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let userInputContent: notify.NotificationUserInput = {
            inputKey: 'test_NotificationUserInput',
        }

        let actionButton: notify.NotificationActionButton = {
            title:"buttonA",
            wantAgent: wantAgentData,
            userInput: userInputContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            actionButtons: [
                actionButton
            ],
            id: 5
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0500 PUBLISH`);
        try{
            await notify.publish(notificationRequest, (err) => {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0500 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0600
     * @tc.name: NotificationTemplate
     * @tc.desc: use NotificationTemplate type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0600', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0600 START`);

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notifyTemplate: notify.NotificationTemplate = {
            name: 'downloadTemplate',
            data: {
                title: 'file',
                fileName: 'music.mp4',
                progressValue: 45
            }
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            template: notifyTemplate,
            id: 6
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0600 PUBLISH`);
        try{
            await notify.publish(notificationRequest, (err) => {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0600 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0700
     * @tc.name: DistributedOptions
     * @tc.desc: use DistributedOptions type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0700', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0700 START`);

        let options: notify.DistributedOptions = {
            isDistributed: false,
            supportDisplayDevices: ["0"],
            supportOperateDevices: ["0"]
        }

        let basicContent: notify.NotificationBasicContent = {
            title: "test_title",
            text: "test_text",
            additionalText: "test_Publish"
        }
        let notifyContent: notify.NotificationContent = {
            contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: basicContent
        }

        let notificationRequest : notify.NotificationRequest = {
            content: notifyContent,
            distributedOption: options,
            id: 7
        }

        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0700 PUBLISH`);
        try{
            await notify.publish(notificationRequest, (err) => {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0700 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0800
     * @tc.name: NotificationBasicContent
     * @tc.desc: use NotificationBasicContent type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0800', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0800 START`);

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
            console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0800 pixelMap: ${pixelMap}`);

            let longContentPicture: notify.NotificationPictureContent = {
                title: "test_title",
                text: "test_text",
                additionalText: "test_Publish",
                briefText: "briefText123456",
                expandedTitle: "expandedTitle123456",
                picture: pixelMap
            }

            let notifyContent: notify.NotificationContent = {
                contentType: notify.ContentType.NOTIFICATION_CONTENT_PICTURE,
                picture: longContentPicture
            }

            let notificationRequest : notify.NotificationRequest = {
                content: notifyContent,
                id: 3
            }

            console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0800 PUBLISH`);
            try{
                notify.publish(notificationRequest, (err) => {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0800 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0900
     * @tc.name: NotificationMultiLineContent
     * @tc.desc: use NotificationMultiLineContent type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0900', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0900 START`);

        try{
            await notify.addSlot(notify.SlotType.SOCIAL_COMMUNICATION, (err) => {
                console.info(`${TAG} addSlot success`)
                if (err) {
                    console.info(`${TAG} addSlot err: ${err.code}, errMes: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                } else {
                    notify.getSlots().then((NotificationSlot) => {
                        console.info(`${TAG} getSlots success:` + JSON.stringify(NotificationSlot))
                        for (let i = 0; i < NotificationSlot.length; ++i) {
                            console.info(`${TAG} NotificationSlot[${i}].type:` + JSON.stringify(NotificationSlot[i].type))
                            if (NotificationSlot[i].type == notify.SlotType.SOCIAL_COMMUNICATION) {
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
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_0900 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1000
     * @tc.name: BundleOption
     * @tc.desc: use BundleOption type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1000', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1000 START`);

        let bundleOpt: notify.BundleOption = {
            bundle: "com.example.secondaryDirectory",
            uid: 101001
        }
        console.info(`${TAG} BundleOption bundle:uid = ${bundleOpt.bundle}${bundleOpt.uid}`);
        expect(typeof bundleOpt.bundle == 'string').assertTrue()
        expect(typeof bundleOpt.uid == 'number').assertTrue()
        expect(bundleOpt.bundle).assertEqual("com.example.secondaryDirectory")
        expect(bundleOpt.uid).assertEqual(101001)
        done()
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1000 END`);
    });

    /*
     * @tc.number: SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1100
     * @tc.name: NotificationFlags
     * @tc.desc: use NotificationFlags type
     */
    it('SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1100', 0, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1100 START`);

        let flags: notify.NotificationFlags = {
            soundEnabled: 1,
            vibrationEnabled: 2
        }
        console.info(`${TAG} NotificationFlags soundEnabled:vibrationEnabled
            = ${flags.soundEnabled}${flags.vibrationEnabled}`);
        expect(typeof flags.soundEnabled == 'number').assertTrue()
        expect(typeof flags.vibrationEnabled == 'number').assertTrue()
        expect(flags.soundEnabled).assertEqual(1)
        expect(flags.vibrationEnabled).assertEqual(2)
        expect(notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT).assertEqual(0)
        expect(notify.ContentType.NOTIFICATION_CONTENT_LONG_TEXT).assertEqual(1)
        expect(notify.ContentType.NOTIFICATION_CONTENT_PICTURE).assertEqual(2)
        expect(notify.ContentType.NOTIFICATION_CONTENT_CONVERSATION).assertEqual(3)
        expect(notify.ContentType.NOTIFICATION_CONTENT_MULTILINE).assertEqual(4)
        done()
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SECONDARY_DIRECTORY_TEST_1100 END`);
    });
}) }