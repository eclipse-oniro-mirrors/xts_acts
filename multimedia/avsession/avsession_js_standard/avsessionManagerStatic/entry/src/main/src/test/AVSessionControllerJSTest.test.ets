/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import avSession from '@ohos.multimedia.avsession';
import media from '@ohos.multimedia.media';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext | undefined;
export default function abilityTest() {
    describe("AVSessionControllerJsTest", () => {
        const TAG = "[AVSessionControllerJSTest]";
        let session: avSession.AVSession | null = null;
        let controller: avSession.AVSessionController | undefined;
        let receivedCallback: boolean;
        let receivedCallback2: boolean;
        let receivedString: string = '';
        let receivedString2: string = '';
        let receivedParam: Record<string, Object> = {};
        let receivedParam2: Record<string, Object> = {};
        let receivedExtras: Record<string, Object> = {};
        let receivedExtras2: Record<string, Object> = {};
        const INVALID_STRING = "invalid string";
        const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
        const UPDATE_LYRICS_WANT_PARAMS: Record<string, Object> = {
            'lyrics': "This is my lyrics"
        };
        const COMMON_COMMAND_STRING = "common_command";
        const COMMON_COMMAND_PARAMS: Record<string, Object> = {
            "command": "This is my command"
        };
        const CUSTOM_EXTRAS: Record<string, Object> = {
            'extrasKey': "This is custom media packet"
        };
        const QUEUE_ITEM_ID = 666;
        const QUEUE_ITEM_LENGTH = 1;
        const QUEUE_ITEM_KEY_WORD = "QUEUE_ITEM_RELATE";
        const EXTRAS: Record<string, Object> = {
            'items_author': "name"
        };
        const AVFileDescriptor: media.AVFileDescriptor = {
            fd: 0X00000AC6,
            offset: 0,
            length: 10
        };
        const AVDataSrcDescriptor: media.AVDataSrcDescriptor = {
            fileSize: -1,
            callback: (buffer: ArrayBuffer, length: long, pos?: long): Int =>{}
        };

        const QUEUE_ITEM_DESCRIPTION: avSession.AVMediaDescription = {
            assetId: QUEUE_ITEM_KEY_WORD,
            title: QUEUE_ITEM_KEY_WORD,
            subtitle:'SUB_QUEUE_ITEM_RELATE',
            mediaType: 'audio',
            artist: 'lihua',
            duration: 166,
            fdSrc: AVFileDescriptor,
            dataSrc: AVDataSrcDescriptor,
            extras: EXTRAS,
            mediaSize: 10,
            albumTitle: "albumTitle",
            albumCoverUri: "albumCoverUri",
            lyricContent: "lyricContent",
            lyricUri: "lyricUri",
            mediaUri: "mediaUri",
            startPosition: 0,
            creditsPosition: 0,
            appName: "appName",
            displayTags: avSession.DisplayTag.TAG_AUDIO_VIVID,
            drmScheme: "C83EADEOA7FB9E76B"
        };
        const QUEUE_ITEM: avSession.AVQueueItem = {
            itemId: QUEUE_ITEM_ID,
            description: QUEUE_ITEM_DESCRIPTION
        }
        const ITEMS_ARRAY: avSession.AVQueueItem[] = [QUEUE_ITEM];
        const QUEUE_TITLE = "title";
        const SKIP_ITEM_ID = 200;

        beforeAll(()=> {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async () => {
            try{
                session = await avSession.createAVSession(context!, "AVSessionDemo", 'video_call');
            }catch(err){
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate();
                console.info(`TestLog: Session activate`);
            }catch(err){
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
                console.info(`TestLog: controller getController`);
            } catch (err) {
                console.info(`TestLog: getController error: code: ${err.code}, message: ${err.message}`);
            }
            await Utils.msSleep(800);
            console.info(`TestLog: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`TestLog: afterEach in`);
            if (session != null) {
                try{
                    await session!.destroy()
                    console.info(`TestLog: Session destroy success`);
                } catch (err) {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`TestLog: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller!.destroy()
                    console.info(`TestLog: Controller destroy success`);
                } catch (err) {
                    console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`TestLog: Controller is already destroy`);
            }
            console.info(`TestLog: afterEach out`);
        })

        afterAll(()=> {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        let dynamicLyricsCallback1 = (sessionEvent: string, args: Record<string, Object>) => {
            console.log(TAG + "Callback1 received event: " + JSON.stringify(sessionEvent as string));
            console.log(TAG + "Callback1 received args: " + JSON.stringify(args));
            if (sessionEvent != UPDATE_LYRICS_EVENT) {
                console.error(TAG + "Callback1 lyrics event unmatch");
                expect(true).assertFalse();
            }
            receivedCallback = true;
            receivedString = sessionEvent;
            receivedParam = args;
        }

        let dynamicLyricsCallback2 = (sessionEvent: string, args: Record<string, Object>) => {
            console.log(TAG + "Callback2 received event: " + JSON.stringify(sessionEvent as string));
            console.log(TAG + "Callback2 received args: " + JSON.stringify(args));
            if (sessionEvent != UPDATE_LYRICS_EVENT) {
                console.error(TAG + "Callback2 lyrics event unmatch");
                expect(true).assertFalse();
            }
            receivedCallback2 = true;
            receivedString2 = sessionEvent;
            receivedParam2 = args;
        }

        let extrasChangeCallback1 = (extras: Record<string, Object>)=> {
            console.log(TAG + "Callback1 received args: " + String(extras));
            if (extras['extrasKey'] != CUSTOM_EXTRAS['extrasKey']) {
                console.error(TAG + "Callback1 extras unmatch");
                expect(true).assertFalse();
            }
            receivedCallback = true;
            receivedExtras = extras;
        }

        let extrasChangeCallback2 = (extras: Record<string, Object>)=> {
            console.log(TAG + "Callback2 received args: " + String(extras));
            if (extras['extrasKey'] != CUSTOM_EXTRAS['extrasKey']) {
                console.error(TAG + "Callback2 extras unmatch");
                expect(true).assertFalse();
            }
            receivedCallback2 = true;
            receivedExtras2 = extras;
        }

        let queueTitleCallback1 = (title: string)=> {
            console.log(TAG + "queueTitleCallback1 received Title " + JSON.stringify(title as string));
            if (title != QUEUE_TITLE) {
                console.error(TAG + "queueTitleCallback1 received Title unmatch");
                expect(true).assertFalse();
            }
            receivedCallback = true;
        }

        let queueTitleCallback2 = (title: string)=> {
            console.log(TAG + "queueTitleCallback2 received Title " + JSON.stringify(title as string));
            if (title != QUEUE_TITLE) {
                console.error(TAG + "queueTitleCallback2 received Title unmatch");
                expect(true).assertFalse();
            }
            receivedCallback2 = true;
        }

        let queueItemsCallback1 = (items: Array<avSession.AVQueueItem>)=> {
            console.log(TAG + "queueItemsCallback1 received items length: " + items.length);
            console.log(TAG + "queueItemsCallback1 received items id: " + items[0].itemId );
            console.log(TAG + "queueItemsCallback1 received items title: " + items[0].description?.title);
            if (items.length != QUEUE_ITEM_LENGTH) {
                console.error(TAG + "queueItemsCallback1 received items length unmatch");
                expect(true).assertFalse();
                return;
            }
            if (items[0].itemId != QUEUE_ITEM_ID) {
                console.error(TAG + "queueItemsCallback1 received items id unmatch");
                expect(true).assertFalse();
                return;
            }
            if (items[0].description?.title != QUEUE_ITEM_KEY_WORD) {
                console.error(TAG + "queueItemsCallback1 received items key word unmatch");
                expect(true).assertFalse();
                return;
            }
            receivedCallback = true;
        }

        let queueItemsCallback2 = (items: Array<avSession.AVQueueItem>)=> {
            console.log(TAG + "queueItemsCallback2 received items length: " + items.length);
            console.log(TAG + "queueItemsCallback2 received items id: " + items[0].itemId);
            console.log(TAG + "queueItemsCallback2 received items title: " + items[0].description?.title);
            if (items.length != QUEUE_ITEM_LENGTH) {
                console.error(TAG + "queueItemsCallback2 received items length unmatch");
                expect(true).assertFalse();
                return;
            }
            if (items[0].itemId != QUEUE_ITEM_ID) {
                console.error(TAG + "queueItemsCallback2 received items id unmatch");
                expect(true).assertFalse();
                return;
            }
            if (items[0].description?.title != QUEUE_ITEM_KEY_WORD) {
                console.error(TAG + "queueItemsCallback2 received items key word unmatch");
                expect(true).assertFalse();
                return;
            }
            receivedCallback2 = true;
        }

        let skipToQueueItemCallback1 = (itemId: int)=> {
            console.log(TAG + "skipToQueueItemCallback1 received itemid " + itemId);
            if (itemId != SKIP_ITEM_ID) {
                console.error(TAG + "skipToQueueItemCallback1 received uid unmatch");
                expect(true).assertFalse();
            }
            receivedCallback = true;
        }

        let skipToQueueItemCallback2 = (itemId: int)=> {
            console.log(TAG + "skipToQueueItemCallback2 received itemid " + itemId);
            if (itemId != SKIP_ITEM_ID) {
                console.error(TAG + "skipToQueueItemCallback2 received uid unmatch");
                expect(true).assertFalse();
            }
            receivedCallback2 = true;
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0100
         * @tc.desc   bind one callback on sessionEvent event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            controller!.onSessionEvent(dynamicLyricsCallback1);
            try {
                await session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS);
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0100 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            }
            Utils.msSleep(200).then(() => {
                if (receivedCallback) {
                    console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0100 Received session event change event");
                    expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
                    expect(receivedParam['lyrics'] == UPDATE_LYRICS_WANT_PARAMS['lyrics']).assertTrue();
                } else {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0100 Session event change event not received");
                    expect(true).assertFalse();
                }
                receivedCallback = false;
                receivedString = {};
                receivedParam = {};
                done();
            });
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0200
         * @tc.desc   bind two callback on sessionEvent event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            controller!.onSessionEvent(dynamicLyricsCallback1);
            controller!.onSessionEvent(dynamicLyricsCallback2);
            try {
                await session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0200 Set session event error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0200 Received session event change event");
                expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
                expect(receivedParam['lyrics'] == UPDATE_LYRICS_WANT_PARAMS['lyrics']).assertTrue();
                expect(receivedString2 == UPDATE_LYRICS_EVENT).assertTrue();
                expect(receivedParam2['lyrics'] == UPDATE_LYRICS_WANT_PARAMS['lyrics']).assertTrue();
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_STATIC_0200 Session event change event not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedCallback2 = false;
            receivedString2 = {};
            receivedParam2 = {};
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0100
         * @tc.desc   bind two callbacks on sessionEvent event, off one of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            controller!.onSessionEvent(dynamicLyricsCallback1);
            controller!.onSessionEvent(dynamicLyricsCallback2);
            controller!.offSessionEvent(dynamicLyricsCallback2);
            try{
                await session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS)
            } catch (err) {
                console.error(TAG + "Set session event error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && !receivedCallback2) {
                console.log(TAG + "Received session event change event");
                expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
                expect(receivedParam['lyrics'] == UPDATE_LYRICS_WANT_PARAMS['lyrics']).assertTrue();
                expect(true).assertTrue();
            } else {
                console.error(TAG + "Session event change event not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedString = {};
            receivedParam = {};
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0200
         * @tc.desc   bind two callbacks on sessionEvent event, off two of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            controller!.onSessionEvent(dynamicLyricsCallback1);
            controller!.onSessionEvent(dynamicLyricsCallback2);
            controller!.offSessionEvent(dynamicLyricsCallback1);
            controller!.offSessionEvent(dynamicLyricsCallback2);

            try {
                await session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS)
            } catch (err) {
                console.error(TAG + "Set session event error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "Received session event change event");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "Session event change event not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0300
         * @tc.desc   bind two callbacks on sessionEvent event, off all of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            controller!.onSessionEvent(dynamicLyricsCallback1);
            controller!.onSessionEvent(dynamicLyricsCallback2);
            controller!.offSessionEvent();

            try{
                await session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS)
            } catch (err) {
                console.error(TAG + "Set session event error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "Received session event change event");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "Session event change event not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0100
         * @tc.desc   controller send common command - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            controller!.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                }
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0100 finished");
                expect(true).assertTrue();
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0200
         * @tc.desc   controller send common command - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await controller!.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0100
         * @tc.desc   controller get extras - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0100 start");
            try{
                await session!.setExtras(CUSTOM_EXTRAS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0100 error " + JSON.stringify(err));
                expect(true).assertFalse();
            };
            let extras: Record<string, Object>|undefined;
            controller!.getExtras((err, extras) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                }
                expect(extras!['extrasKey'] == CUSTOM_EXTRAS['extrasKey']).assertTrue();
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0100 finished");
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0200
         * @tc.desc   controller get extras - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0200 start");
            try{
                await session!.setExtras(CUSTOM_EXTRAS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
            };

            let extras: Record<string, Object> = {};
            try {
                extras = await controller!.getExtras()
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            }
            expect(extras['extrasKey'] == CUSTOM_EXTRAS['extrasKey']).assertTrue();
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0100
         * @tc.desc   bind one callback on extrasChange event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0100 start");
            controller!.onExtrasChange(extrasChangeCallback1);
            try {
                await session!.setExtras(CUSTOM_EXTRAS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0100 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            Utils.msSleep(200).then(() => {
                if (receivedCallback) {
                    console.log(TAG + "Received extras change event");
                    expect(receivedExtras['extrasKey'] == CUSTOM_EXTRAS['extrasKey']).assertTrue();
                } else {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0100 extras change event not received");
                    expect(true).assertFalse();
                }
                receivedCallback = false;
                receivedExtras = {};
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0100 finished");
                done();
            })
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0200
         * @tc.desc   bind two callback on extrasChange event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0200 start");
            controller!.onExtrasChange(extrasChangeCallback1);
            controller!.onExtrasChange(extrasChangeCallback2);
            try {
                await session!.setExtras(CUSTOM_EXTRAS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            Utils.msSleep(200).then(() => {
                if (receivedCallback && receivedCallback2) {
                    console.log(TAG + "Received extras change event");
                    expect(receivedExtras['extrasKey'] == CUSTOM_EXTRAS['extrasKey']).assertTrue();
                    expect(receivedExtras2['extrasKey'] == CUSTOM_EXTRAS['extrasKey']).assertTrue();
                } else {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0200 extras change event not received");
                    expect(true).assertFalse();
                }
                receivedCallback = false;
                receivedCallback2 = false;
                receivedExtras = {};
                receivedExtras2 = {};
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_STATIC_0200 finished");
                done();
            })
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0100
         * @tc.desc   bind two callbacks on extrasChange event, off one of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            controller!.onExtrasChange(extrasChangeCallback1);
            controller!.onExtrasChange(extrasChangeCallback2);
            controller!.offExtrasChange(extrasChangeCallback2);
            try{
                await session!.setExtras(CUSTOM_EXTRAS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0100 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && !receivedCallback2) {
                console.log(TAG + "Received extras change event");
                expect(receivedExtras['extrasKey'] == CUSTOM_EXTRAS['extrasKey']).assertTrue();
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0100 Extras change event not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedExtras = {};
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0200
         * @tc.desc   bind two callbacks on extrasChange event, off two of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            controller!.onExtrasChange(extrasChangeCallback1);
            controller!.onExtrasChange(extrasChangeCallback2);
            controller!.offExtrasChange(extrasChangeCallback1);
            controller!.offExtrasChange(extrasChangeCallback2);
            try {
                await session!.setExtras(CUSTOM_EXTRAS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0200 Success, not received extras change event");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0200 failed, extras change event received");
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0300
         * @tc.desc   bind two callbacks on extrasChange event, off all of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            controller!.onExtrasChange(extrasChangeCallback1);
            controller!.onExtrasChange(extrasChangeCallback2);
            controller!.offExtrasChange();
            try{
                await session!.setExtras(CUSTOM_EXTRAS)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0300 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0300 Success, not received extras change event");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0300 failed, extras change event received");
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_STATIC_0300 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0100
         * @tc.desc   bind one callback on queueItemsChange event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            controller!.onQueueItemsChange(queueItemsCallback1);
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0100 setAVQueueItems error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            Utils.msSleep(200).then(() => {
                if (receivedCallback) {
                    console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0100 Received queue items change");
                    expect(true).assertTrue();
                } else {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0100 Session queue items change  not received");
                    expect(true).assertFalse();
                }
                receivedCallback = false;
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0200
         * @tc.desc   bind two callback on queueItemsChange event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            controller!.onQueueItemsChange(queueItemsCallback1);
            controller!.onQueueItemsChange(queueItemsCallback2);
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0200 Received queue items change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_STATIC_0200 Session queue items change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedCallback2 = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0100
         * @tc.desc   bind one callback on queueTitleChange event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            controller!.onQueueTitleChange(queueTitleCallback1);
            try{
                await session!.setAVQueueTitle(QUEUE_TITLE)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0100 setAVQueueTitle error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            Utils.msSleep(200).then(() => {
                if (receivedCallback) {
                    console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0100 Received queue Title change");
                    expect(true).assertTrue();
                } else {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0100 Session queue Title change  not received");
                    expect(true).assertFalse();
                }
                receivedCallback = false;
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0200
         * @tc.desc   bind two callback on queueTitleChange event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            controller!.onQueueTitleChange(queueTitleCallback1);
            controller!.onQueueTitleChange(queueTitleCallback2);
            try{
                await session!.setAVQueueTitle(QUEUE_TITLE)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0200 Received queue Title change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_STATIC_0200 Session queue Title change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedCallback2 = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0100
         * @tc.desc   bind two callbacks on queueItemsChange event, off one of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            controller!.onQueueItemsChange(queueItemsCallback1);
            controller!.onQueueItemsChange(queueItemsCallback2);
            controller!.offQueueItemsChange(queueItemsCallback2);
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0100 setAVQueueItems error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0100 Received queue items change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0100 Session queue items change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0200
         * @tc.desc   bind two callbacks on queueItemsChange event, off two of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            controller!.onQueueItemsChange(queueItemsCallback1);
            controller!.onQueueItemsChange(queueItemsCallback2);
            controller!.offQueueItemsChange(queueItemsCallback1);
            controller!.offQueueItemsChange(queueItemsCallback2);
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0200 setAVQueueItems error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0200 Received queue items change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0200 Session queue items change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0300
         * @tc.desc   bind two callbacks on queueItemsChange event, off all of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            controller!.onQueueItemsChange(queueItemsCallback1);
            controller!.onQueueItemsChange(queueItemsCallback2);
            controller!.offQueueItemsChange();
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0300 setAVQueueItems error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0300 Received queue items change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_STATIC_0300 Session queue items change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0100
         * @tc.desc   bind two callbacks on queueTitleChange event, off one of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            controller!.onQueueTitleChange(queueTitleCallback1);
            controller!.onQueueTitleChange(queueTitleCallback2);
            controller!.offQueueTitleChange(queueTitleCallback2);
            try{
                await session!.setAVQueueTitle(QUEUE_TITLE)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0100 setAVQueueTitle error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0100 Received queue Title change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0100 Session queue Title change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0200
         * @tc.desc   bind two callbacks on queueTitleChange event, off two of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            controller!.onQueueTitleChange(queueTitleCallback1);
            controller!.onQueueTitleChange(queueTitleCallback2);
            controller!.offQueueTitleChange(queueTitleCallback1);
            controller!.offQueueTitleChange(queueTitleCallback2);

            try{
                await session!.setAVQueueTitle(QUEUE_TITLE)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0200 setAVQueueTitle error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0200 Received queue Title change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0200 Session queue Title change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0300
         * @tc.desc   bind two callbacks on queueTitleChange event, off all of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            controller!.onQueueTitleChange(queueTitleCallback1);
            controller!.onQueueTitleChange(queueTitleCallback2);
            controller!.offQueueTitleChange();

            try{
                await session!.setAVQueueTitle(QUEUE_TITLE)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0300 setAVQueueTitle error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0300 Received queue Title change");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_STATIC_0300 Session queue Title change  not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0100
         * @tc.desc   session set Items of AVQueue - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.setAVQueueItems(ITEMS_ARRAY, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                }
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0100 finished");
                expect(true).assertTrue();
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0200
         * @tc.desc   session set Items of AVQueue - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0100
         * @tc.desc   session set title of AVQueue - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.setAVQueueTitle(QUEUE_TITLE, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                }
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0100 finished");
                expect(true).assertTrue();
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0200
         * @tc.desc   session set title of AVQueue - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await session!.setAVQueueTitle(QUEUE_TITLE)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0100
         * @tc.desc   controller skip to QueueItem by queue item id - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            controller!.skipToQueueItem(QUEUE_ITEM_ID, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                }
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0100 finished");
                expect(true).assertTrue();
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0200
         * @tc.desc   controller skip to QueueItem by queue item id - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await controller!.skipToQueueItem(QUEUE_ITEM_ID)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0100
         * @tc.desc   bind one callback on skipToQueueItem event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.onSkipToQueueItem(skipToQueueItemCallback1);
            try{
                await controller!.skipToQueueItem(SKIP_ITEM_ID)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0100 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200)
            if (receivedCallback) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0100 Received skipToQueueItem ");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0100 skipToQueueItem not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0200
         * @tc.desc   bind two callback on skipToQueueItem event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.onSkipToQueueItem(skipToQueueItemCallback1);
            session!.onSkipToQueueItem(skipToQueueItemCallback2);
            try{
                await controller!.skipToQueueItem(SKIP_ITEM_ID)
            } catch (err) {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0200 Received skipToQueueItem ");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_STATIC_0200skipToQueueItem not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedCallback2 = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0100
         * @tc.desc   controller get items of AVQueue - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.setAVQueueItems(ITEMS_ARRAY, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                } else {
                    controller!.getAVQueueItems((err) => {
                        if (err) {
                            console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0100 error " + JSON.stringify(err));
                            expect(true).assertFalse();
                        } else {
                            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0100 finished");
                            expect(true).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0200
         * @tc.desc   controller get items of AVQueue - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
                try{
                    await controller!.getAVQueueItems()
                } catch (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0200 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                };
                done();
            }catch(err){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0100
         * @tc.desc   controller get title of AVQueue - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.setAVQueueTitle(QUEUE_TITLE, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                } else {
                    controller!.getAVQueueTitle((err) => {
                        if (err) {
                            console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0100 error " + JSON.stringify(err));
                            expect(true).assertFalse();
                        } else {
                            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0100 finished");
                            expect(true).assertTrue();
                        }
                        done();
                    });
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0200
         * @tc.desc   controller get title of AVQueue - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await session!.setAVQueueTitle(QUEUE_TITLE)
                try{
                    await controller!.getAVQueueTitle()
                } catch (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0200 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                };
                done();
            }catch(err){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_STATIC_0100
         * @tc.desc   controller get Playback State - async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                let playbackState: avSession.AVPlaybackState = {
                    state: avSession.PlaybackState.PLAYBACK_STATE_INITIAL
                }
                await session!.setAVPlaybackState(playbackState);
                Utils.msSleep(200);
                let currentPlaybackState = controller!.getAVPlaybackStateSync();
                console.log(`Get playback state: ${playbackState}`);
                expect(currentPlaybackState.state).assertEqual(0);
            } catch (err) {
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_STATIC_0100
         * @tc.desc   controller get metadata - async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                let metaData: avSession.AVMetadata = {
                    assetId: "0"
                };
                await session!.setAVMetadata(metaData);
                Utils.msSleep(200);
                let currentMetaData = controller!.getAVMetadataSync();
                console.log(`Get metadata: ${currentMetaData}`);
                expect(currentMetaData.assetId).assertEqual("0");
            }catch(err){
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_STATIC_0100
         * @tc.desc   controller get title of avqueue - async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.setAVQueueTitle(QUEUE_TITLE);
                Utils.msSleep(200);
                let currentQueueTitle = controller!.getAVQueueTitleSync();
                console.log(`Get queue title: ${currentQueueTitle}`);
                expect(currentQueueTitle).assertEqual(QUEUE_TITLE);
            } catch (err) {
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_STATIC_0100
         * @tc.desc   controller get items of avqueue - async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.setAVQueueItems(ITEMS_ARRAY);
                Utils.msSleep(200);
                let currentQueueItem = controller!.getAVQueueItemsSync();
                console.log(`Get queue item: ${currentQueueItem}`);
                expect(currentQueueItem[0].itemId).assertEqual(ITEMS_ARRAY[0].itemId);
            } catch (err) {
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_STATIC_0100
         * @tc.desc   controller get output devices info - async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                let outputDeviceInfo = controller!.getOutputDeviceSync();
                console.log(`Get output device info: ${outputDeviceInfo}`);
                expect(outputDeviceInfo.devices[0].deviceId).assertEqual("0");
            } catch (err) {
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_STATIC_0100
         * @tc.desc   controller get session isActive - async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.activate();
                Utils.msSleep(200);
                let isActive = controller!.isActiveSync();
                console.log(`Get session active state: ${isActive}`);
                expect(isActive).assertEqual(true);
            } catch (err) {
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_STATIC_0100
         * @tc.desc   controller get session support command - async
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.onPlay(() => { });
                Utils.msSleep(200);
                let validCommands = controller!.getValidCommandsSync();
                console.log(`Get valid commands: ${validCommands}`);
                expect(validCommands[0]).assertEqual('play');
            } catch (err) {
                expect(true).assertFalse();
            }
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_STATIC_0100 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0300
         * @tc.desc   controller get items of AVQueue - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY)
                await controller!.getAVQueueItems().then((items: Array<avSession.AVQueueItem>) => {
                    console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0300 data " + String(items));
                    if (items[0].description?.drmScheme === ITEMS_ARRAY[0].description?.drmScheme){
                        console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0300 data success");
                    }else{
                        expect(true).assertFalse();
                        done();
                    }
                    done();
                });
            }catch(err){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_STATIC_0300 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
        })
    })
}