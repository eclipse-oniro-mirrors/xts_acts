/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import avSession from '@ohos.multimedia.avsession';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import wantAgent from '@ohos.app.ability.wantAgent';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { WantAgentInfo } from 'wantAgent.wantAgentInfo';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
export default function AVSessionErrorCode() {
    describe('AVSessionErrorCode', () => {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session: avSession.AVSession | null;
        let controller: avSession.AVSessionController;
        const INVALID_STRING = "invalid string";
        const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
        const UPDATE_LYRICS_WANT_PARAMS: Record<string, Object> = {
            'lyric': "This is my lyrics"
        };
        const QUEUE_ITEM_ID = 666;
        const QUEUE_ITEM_KEY_WORD = "QUEUE_ITEM_RELATE";
        const EXTRAS: Record<string, Object> = {
            'items_author': "name"
        };
        const QUEUE_ITEM_DESCRIPTION: avSession.AVMediaDescription = {
            assetId: QUEUE_ITEM_KEY_WORD,
            title: QUEUE_ITEM_KEY_WORD,
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
            displayTags: avSession.DisplayTag.TAG_AUDIO_VIVID
        };
        const QUEUE_ITEM_DESCRIPTION_ERROR: avSession.AVMediaDescription = {
            assetId: '',
            title: QUEUE_ITEM_KEY_WORD,
            extras: EXTRAS,
            mediaSize: 10,
            albumTitle: "albumTitle",
            albumCoverUri: "albumCoverUri",
            lyricContent: "lyricContent",
            lyricUri: "lyricUri",
            mediaUri: "mediaUri",
            startPosition: 0,
            creditsPosition: 0,
            appName: "appName"
        };
        const QUEUE_ITEM: avSession.AVQueueItem = {
            itemId: QUEUE_ITEM_ID,
            description: QUEUE_ITEM_DESCRIPTION
        }
        const QUEUE_ITEM_ERROR: avSession.AVQueueItem = {
            itemId: QUEUE_ITEM_ID,
            description: QUEUE_ITEM_DESCRIPTION_ERROR
        }
        const ITEMS_ARRAY: avSession.AVQueueItem[] = [QUEUE_ITEM];
        const ITEMS_ARRAY_ERROR: avSession.AVQueueItem[] = [QUEUE_ITEM_ERROR];
        const QUEUE_TITLE = "title";
        const CUSTOM_EXTRAS: Record<string, Object> = {
            'extras': "This is custom media packet"
        };

        let invalidSession = async (validFunc: () => Promise<void>) => {
            try{
                await session!.destroy()
                console.info('TestLog: session destroy success');
                await validFunc();

            }catch(err: BusinessError) {
                console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
            }
        }

        let callback1 = ()=> { }
        let callback2 = ()=> { }

        beforeAll(()=> {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async () => {
            try{
                console.info(`TestLog: createAVSession 1111`);
                session = await avSession.createAVSession(context, tag, 'video_call');
            }catch(err: BusinessError){
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate();
                console.info(`TestLog: Session activate`);
            }catch(err: BusinessError){
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
                console.info(`TestLog: controller getController`);
            } catch (err: BusinessError) {
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
                } catch (err: BusinessError) {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`TestLog: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller.destroy()
                    console.info(`TestLog: Controller destroy success`);
                } catch (err: BusinessError) {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0100
         * @tc.desc   setAVMetadata(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                console.info('TestLog: SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0100');
            try{
                console.info('TestLog: destroy 1');
                await session!.destroy()
                console.info('TestLog: destroy 2');
            }catch(err: BusinessError){
                console.info(`TestLog: Set AVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            try{
                let metadata: avSession.AVMetadata = {
                    assetId: '121278'
                }
                await session!.setAVMetadata(metadata)
                console.info('TestLog: Set AVMetadata successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: Set AVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0300
         * @tc.desc   setAVMetadata(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                let metadata: avSession.AVMetadata = {
                    assetId: '121278'
                }
                session!.setAVMetadata(metadata, (err: BusinessError|null) => {
                    if (err) {
                        console.info(`TestLog: Set AVMetadta error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600102);
                    } else {
                        console.info('TestLog: Set AVMetadta active successfully');
                        expect(true).assertFalse();
                    }
                    done();
                });
            }catch(err: BusinessError){
                console.info(`TestLog: Set AVMetadta error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0100
         * @tc.desc   setAVPlaybackState(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try{
                await session!.setAVPlaybackState({})
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0300
         * @tc.desc   setAVPlaybackState(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: 1.0,
                position:{elapsedTime:10, updateTime:(new Date()).getTime() as long},
                bufferedTime:1000,
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite:true,
            };
            await session!.destroy()
            try {
                session!.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600102);
                    } else {
                        console.info('TestLog: Set playbackState successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            }catch(err: BusinessError){
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0400
         * @tc.desc   setAVPlaybackState(callback) with invalid params(errcode 401)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: -2,
                position:{elapsedTime:-2, updateTime:(new Date()).getTime() as long},
                bufferedTime:-4,
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite:true,
            };
            try {
                session!.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(401);
                    } else {
                        console.info('TestLog: Set playbackState successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            }catch(err: BusinessError){
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }

        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_STATIC_0100
         * @tc.desc   test setLaunchAbility(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let wantAgentInfo: WantAgentInfo = {
                wants: [
                    {
                        bundleName: 'com.example.myapplication.static',
                        abilityName: 'EntryAbility'
                    }
                ],
                actionType: wantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent: WantAgent;
            await wantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });
            await invalidSession(async (): Promise<void> => {
                await session!.setLaunchAbility(agent).then(() => {
                    console.info('TestLog: AVSessionTest : Set LaunchAbility');
                    expect().assertFail();
                }).catch((err: Error) => {
                    console.info(`TestLog: Set LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_STATIC_0300
         * @tc.desc   setLaunchAbility(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let wantAgentInfo: WantAgentInfo= {
                wants: [
                    {
                        bundleName: 'com.example.myapplication.static',
                        abilityName: 'EntryAbility'
                    }
                ],
                actionType: wantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent: WantAgent;
            await wantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });
            await session!.destroy()
            try {
                session!.setLaunchAbility(agent, (err) => {
                    if (err) {
                        console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600102);
                    } else {
                        console.info('TestLog: Set launchAbility successfully');
                        expect(true).assertFalse();
                    }
                    done();
                });
            }catch(err: BusinessError){
                console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
            await Utils.msSleep(800);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_STATIC_0100
         * @tc.desc   session destroy(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.destroy((err) => {
                    if (err) {
                        console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600102);
                    } else {
                        console.info('TestLog: Session destroy success.');
                        expect(true).assertFalse();
                    }
                    done();
                });
            }catch(err: BusinessError){
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_STATIC_0200
         * @tc.desc   session destroy(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try{
                await session!.destroy()
                console.info('TestLog: Session destroy success.');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_STATIC_0100
         * @tc.desc   activate(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try{
                await session!.activate()
                console.info('TestLog: Set session active successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_STATIC_0200
         * @tc.desc   activate(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.activate((err) => {
                    if (err) {
                        console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600102);
                    } else {
                        console.info('TestLog: Set session active successfully');
                        expect(true).assertFalse();
                    }
                    done();
                });
            }catch(err: BusinessError){
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_STATIC_0100
         * @tc.desc   deactivate(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try{
                await session!.deactivate()
                console.info('TestLog: Deactivate session success.');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_STATIC_0200
         * @tc.desc   deactivate(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.deactivate((err) => {
                    if (err) {
                        console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600102);
                    } else {
                        console.info('TestLog: Deactivate session');
                        expect(true).assertFalse();
                    }
                    done();
                });
            }catch(err: BusinessError){
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_STATIC_0100
         * @tc.desc   on('play') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onPlay(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_STATIC_0100
         * @tc.desc   on('stop') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onStop(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_STATIC_0100
         * @tc.desc   on('pause') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onPause(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_STATIC_0100
         * @tc.desc   on('playNext') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onPlayNext(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_STATIC_0100
         * @tc.desc   on('playPrevious') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onPlayPrevious(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_STATIC_0100
         * @tc.desc   on('fastForward') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onFastForward(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_STATIC_0100
         * @tc.desc   on('rewind') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onRewind(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_STATIC_0100
         * @tc.desc   on('seek') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onSeek(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_STATIC_0100
         * @tc.desc   on('setSpeed') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onSetSpeed(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_STATIC_0100
         * @tc.desc   on('setLoopMode') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onSetLoopMode(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_STATIC_0100
         * @tc.desc   on('toggleFavorite') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onToggleFavorite(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_STATIC_0100
         * @tc.desc   on('handleKeyEvent') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.onHandleKeyEvent(callback1);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_0100
         * @tc.desc   off('play') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offPlay()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_STATIC_0100
         * @tc.desc   off('pause') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offPause()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_STATIC_0100
         * @tc.desc   off('stop') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offStop()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_0100
         * @tc.desc   off('playNext') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offPlayNext()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_0100
         * @tc.desc   off('playPrevious') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offPlayPrevious()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_0100
         * @tc.desc   off('fastForward') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offFastForward()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_0100
         * @tc.desc   off('rewind') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offRewind()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_STATIC_0100
         * @tc.desc   off('seek') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offSeek()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_STATIC_0100
         * @tc.desc   off('setSpeed') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offSetSpeed()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_STATIC_0100
         * @tc.desc   off('setLoopMode') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offSetLoopMode()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_STATIC_0100
         * @tc.desc   off('toggleFavorite') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offToggleFavorite()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_STATIC_0100
         * @tc.desc   off('handleKeyEvent') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.offHandleKeyEvent()
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                expect(err.code).assertEqual(6600102);
            }
            done();
        })
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_STATIC_0100
         * @tc.desc   getOutputDevice(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            session!.getOutputDevice((err) => {
                if (err) {
                    console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                    expect(err?.code).assertEqual(6600102);
                } else {
                    console.info('Get device information success.');
                    expect(true).assertFalse();
                }
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_STATIC_0200
         * @tc.desc   getOutputDevice(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
             try{
                 await session!.getOutputDevice()
                 console.info(`Get device success.`);
                 expect(true).assertFalse();
             }catch(err: BusinessError) {
                 console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                 expect(err.code).assertEqual(6600102);
             }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_STATIC_0100
         * @tc.desc   getController(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try{
                await session!.getController()
                console.info('Get controller successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                console.info(`Get controller BusinessError: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_STATIC_0200
         * @tc.desc   getController(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            session!.getController((err: BusinessError|null, data: avSession.AVSessionController|undefined) => {
                if (err) {
                    console.info('Get controller failed');
                    expect(err?.code).assertEqual(6600102);
                } else {
                    console.info('Get controller successfully');
                    expect(true).assertFalse();
                }
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_STATIC_0300
         * @tc.desc   dispatchSessionEvent(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try{
                await session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS)
                console.info(`TestLog: dispatchSessionEvent success.`);
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102)
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_STATIC_0600
         * @tc.desc   dispatchSessionEvent(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.destroy()
            try {
                session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS, err => {
                    if (err) {
                        console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600102);
                    } else {
                        console.info(`TestLog: dispatchSessionEvent success.`);
                        expect(true).assertFalse();
                    }
                    done();
                })
            }catch(err: BusinessError) {
                console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_STATIC_0300
         * @tc.desc   setExtras(promise) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try{
                    await session!.setExtras(CUSTOM_EXTRAS)
                    console.info(`TestLog: setExtras success.`);
                    expect(true).assertFalse();
                }catch(err: BusinessError) {
                    console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                };
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_STATIC_0600
         * @tc.desc   setExtras(callback) with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    session!.setExtras(CUSTOM_EXTRAS, (err) => {
                        if (err) {
                            console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                            expect(err?.code).assertEqual(6600102);
                        } else {
                            console.info(`TestLog: setExtras success.`);
                            expect(true).assertFalse();
                        }
                        done();
                    })
                }catch(err: BusinessError) {
                    console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertFalse();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_STATIC_0400
         * @tc.desc   on('commonCommand') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    session!.onCommonCommand(callback1);
                    expect(true).assertFalse();
                }catch(err: BusinessError) {
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_STATIC_0200
         * @tc.desc   off('commonCommand') with avsession does not exit(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    session!.offCommonCommand()
                    expect(true).assertFalse();
                }catch(err: BusinessError) {
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0100
         * @tc.desc   setAVQueueItems(promise) with invalid params(errcode 401)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await session!.setAVQueueItems(ITEMS_ARRAY_ERROR)
                console.info('setAVQueueItems Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0200
         * @tc.desc   setAVQueueItems(promise) with avsession does not exist(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try{
                    await session!.setAVQueueItems(ITEMS_ARRAY)
                    console.info('setAVQueueItems Successfully');
                    expect(true).assertFalse();
                }catch(err: BusinessError) {
                    console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                };
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0300
         * @tc.desc   setAVQueueItems(callback) with invalid params(errcode 401)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.setAVQueueItems(ITEMS_ARRAY_ERROR, (err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`TestLog: setAVQueueItems error: code: ${err?.code}, message: ${err?.message}`);
                        expect(err?.code).assertEqual(401);
                    } else {
                        console.info('setAVQueueItems Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            }catch(err: BusinessError) {
                console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0400
         * @tc.desc   setAVQueueItems(callback) with avsession does not exist(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    session!.setAVQueueItems(ITEMS_ARRAY, (err) => {
                        if (err) {
                            console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                            expect(err?.code).assertEqual(6600102);
                        } else {
                            console.info('setAVQueueItems Successfully');
                            expect(true).assertFalse();
                        }
                        done();
                    })
                }catch(err: BusinessError) {
                    console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertFalse();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0100
         * @tc.desc   setAVQueueTitle(promise) with invalid params(errcode 401)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await session!.setAVQueueTitle({})
                console.info('setAVQueueTitle Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError) {
                console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0200
         * @tc.desc   setAVQueueTitle(promise) with avsession does not exist(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try{
                    await session!.setAVQueueTitle(QUEUE_TITLE)
                    console.info('setAVQueueTitle Successfully');
                    expect(true).assertFalse();
                }catch(err: BusinessError) {
                    console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                };
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0300
         * @tc.desc   setAVQueueTitle(callback) with invalid params(errcode 401)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.setAVQueueTitle({}, (err) => {
                    if (err) {
                        console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(401);
                    } else {
                        console.info('setAVQueueTitle Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            }catch(err: BusinessError) {
                console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0400
         * @tc.desc   setAVQueueTitle(callback) with session does not exist(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    session!.setAVQueueTitle(QUEUE_TITLE, (err) => {
                        if (err) {
                            console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                            expect(err?.code).assertEqual(6600102);
                        } else {
                            console.info('setAVQueueTitle Successfully');
                            expect(true).assertFalse();
                        }
                        done();
                    })
                }catch(err: BusinessError) {
                    console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertFalse();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_STATIC_0300
         * @tc.desc   on('skipToQueueItem') with avsession does not exist(errcode 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    session!.onSkipToQueueItem(callback1);
                    expect(true).assertFalse();
                }catch(err: BusinessError) {
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })
    })
}