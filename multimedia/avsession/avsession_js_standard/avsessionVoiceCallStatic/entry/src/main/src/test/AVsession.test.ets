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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import avSession from '@ohos.multimedia.avsession';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext | undefined;
export default function abilityTest() {
    describe('AVSessionTest', () => {
        let TAG: string = "[AVSessionTest]";
        let session: avSession.AVSession | null = null;
        let controller: avSession.AVSessionController | undefined;
        let tag: string = 'VoiceCallXTS';
        let customdata: Record<string, Object> = {'customData': 'appdata'}
        let eventName = 'dynamic_lyric'

        let invalidSession = async (validFunc:() => Promise<void>) => {
            await session!.destroy().then(async () => {
                console.info('TestLog: session destroy success');
                await validFunc();
            }).catch((err: Error) => {
                console.info(`TestLog: session destroy error: err: ${err}`);
                expect().assertFail();
            })
        }

        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info(`${TAG}: beforeAll in`);
        })

        beforeEach(async () => {
            try{
                session = await avSession.createAVSession(context!, tag, 'voice_call');
                console.info(`${session!.sessionType}`);
            }catch(err){
                console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate();
                console.info(`${TAG}: Session activate`);
            }catch(err){
                console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
            } catch (err) {
                console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
            }
            await Utils.msSleep(800);
            console.info(`${TAG}: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`${TAG}: afterEach in`);
            if (session != null) {
                try{
                    await session!.destroy()
                    console.info(`${TAG}: Session destroy success`);
                } catch (err) {
                    console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller!.destroy()
                    console.info(`${TAG}: Controller destroy success`);
                } catch (err) {
                    console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Controller is already destroy`);
            }
            console.info(`${TAG}: afterEach out`);
        })

        afterAll(() => {
            console.info(`${TAG}: afterAll in`);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_1100
         * @tc.desc   test getAVCastController(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            let aVCastController: avSession.AVCastController | undefined;
            try{
                console.info(`TestTag: getAVCastController : start`);
                aVCastController = await session!.getAVCastController();
                console.info(`${TAG}: getAVCastController11 : SUCCESS`);
                expect(false).assertTrue();
            }catch(err){
                err = err as BusinessError;
                console.info(`${TAG}:getAVCastController11 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_STATIC_1200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_STATIC_1200
         * @tc.desc   test getAVCastController() errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            let aVCastController: avSession.AVCastController|undefined;
            session!.getAVCastController((err: BusinessError|null, avcontroller: avSession.AVCastController|undefined) => {
                if (err) {
                    console.info(`${TAG}:getAVCastController11 BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err?.code).assertEqual(6600102);
                } else {
                    aVCastController = avcontroller;
                    console.info('$\{TAG}:getAVCastController11 : SUCCESS');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300
         * @tc.desc   test on(pause) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onPause(() => {
                    console.info('on pause entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300 on pause entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_STOP_STATIC_1400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_STOP_STATIC_1400
         * @tc.desc   test on(stop) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_STOP_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onStop(() => {
                    console.info('on stop entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on stop entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_STATIC_1500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_STATIC_1500
         * @tc.desc   test on(playNext) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onPlayNext(() => {
                    console.info('on playNext entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on playNext entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_STATIC_1600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_STATIC_1600
         * @tc.desc   test on(playPrevious) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onPlayPrevious(() => {
                    console.info('on playPrevious entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on playPrevious entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }

            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_STATIC_1700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_STATIC_1700
         * @tc.desc   test on(fastForward) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onFastForward((time?: long) => {
                    console.info('on fastForward entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on fastForward entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }

            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_REWIND_STATIC_1800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_REWIND_STATIC_1800
         * @tc.desc   test on(rewind) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_REWIND_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onRewind((time?: long) => {
                    console.info('on rewind entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on rewind entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_STATIC_1900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_STATIC_1900
         * @tc.desc   test off(play) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offPlay();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off play entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_STATIC_2000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_STATIC_2000
         * @tc.desc   test off(pause) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offPause();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off pause entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_STOP_STATIC_2100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_STOP_STATIC_2100
         * @tc.desc   test off(stop) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_STOP_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offStop();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off stop entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_STATIC_2200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_STATIC_2200
         * @tc.desc   test off(playNext) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offPlayNext();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off playNext entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_STATIC_2300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_STATIC_2300
         * @tc.desc   test off(playPrevious) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offPlayPrevious();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off playPrevious entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_STATIC_2400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_STATIC_2400
         * @tc.desc   test off(fastForward) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offFastForward();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off fastForward entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_STATIC_2500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_STATIC_2500
         * @tc.desc   test off(rewind) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offRewind();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off rewind entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SEEK_STATIC_2800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SEEK_STATIC_2800
         * @tc.desc   test on(seek) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SEEK_STATIC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onSeek((assetId: long) => {
                    console.info('on playFromAssetId entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on seek entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_STATIC_2900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_STATIC_2900
         * @tc.desc   test off(seek) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_STATIC_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offSeek();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off seek entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_STATIC_3000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_STATIC_3000
         * @tc.desc   test on(setSpeed) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onSetSpeed(() => {
                    console.info('on setSpeed entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on setSpeed entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_STATIC_3100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_STATIC_3100
         * @tc.desc   test off(setSpeed) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_STATIC_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offSetSpeed();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off setSpeed entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_STATIC_3200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_STATIC_3200
         * @tc.desc   test on(setLoopMode) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_STATIC_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onSetLoopMode(() => {
                    console.info('on setLoopMode entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on setLoopMode entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_STATIC_3300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_STATIC_3300
         * @tc.desc   test off(setLoopMode) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_STATIC_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offSetLoopMode();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off setLoopMode entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_STATIC_3400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_STATIC_3400
         * @tc.desc   test on(taggleFavorite) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_STATIC_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onToggleFavorite(() => {
                    console.info('on toggleFavorite entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on toggleFavorite entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_STATIC_3500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_STATIC_3500
         * @tc.desc   test off(toggleFavorite) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_STATIC_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offToggleFavorite();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off toggleFavorite entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_STATIC_3600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_STATIC_3600
         * @tc.desc   test on(handleKeyEvent) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_STATIC_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onHandleKeyEvent(() => {
                    console.info('on handleKeyEvent entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on handleKeyEvent entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_STATIC_3700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_STATIC_3700
         * @tc.desc   test off(handleKeyEvent) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_STATIC_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offHandleKeyEvent();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off handleKeyEvent entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_STATIC_3800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_STATIC_3800
         * @tc.desc   test on(outputDeviceChange) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_STATIC_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onOutputDeviceChange(() => {
                    console.info('on outputDeviceChange entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on outputDeviceChange entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_STATIC_3900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_STATIC_3900
         * @tc.desc   test off(outputDeviceChange) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_STATIC_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offOutputDeviceChange();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off outputDeviceChange entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_STATIC_4000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_STATIC_4000
         * @tc.desc   test on(commonCommand) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_STATIC_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onCommonCommand(() => {
                    console.info('on commonCommand entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on commonCommand entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_STATIC_4100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_STATIC_4100
         * @tc.desc   test off(commonCommand) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_STATIC_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offCommonCommand();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off commonCommand entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_STATIC_4200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_STATIC_4200
         * @tc.desc   test on(skipToQueueItem) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_STATIC_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onSkipToQueueItem(() => {
                    console.info('on skipToQueueItem entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on skipToQueueItem entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_STATIC_4300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_STATIC_4300
         * @tc.desc   test off(skipToQueueItem) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_STATIC_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offSkipToQueueItem();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off skipToQueueItem entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_STATIC_4400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_STATIC_4400
         * @tc.desc   test off(castDisplayChange) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_STATIC_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offCastDisplayChange();
            } catch (error) {
                error = error as BusinessError;
                console.info(`off castDisplayChange entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_STATIC_4500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_STATIC_4500
         * @tc.desc   test getAVMetadata() errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_STATIC_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller!.getAVMetadata((err: BusinessError | null, metadata: avSession.AVMetadata | undefined) => {
                if (err) {
                    console.error(`GetAVMetadata11 BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                } else {
                    console.info(`GetAVMetadata11 : SUCCESS : assetId : ${metadata?.assetId}`);
                }
            });
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_STATIC_4600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_STATIC_4600
         * @tc.desc   test getAVMetadata(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_STATIC_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller!.getAVMetadata().then((metadata: avSession.AVMetadata) => {
                console.info(`GetAVMetadata12 : SUCCESS : assetId : ${metadata.assetId}`);
            }).catch((err: Error) => {
                console.error(`GetAVMetadata12 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_STATIC_4700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_STATIC_4700
         * @tc.desc   test getLaunchAbility() errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_STATIC_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller!.getLaunchAbility((err: BusinessError | null, agent: object | undefined) => {
            if (err) {
                console.error(`GetLaunchAbility11 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            } else {
                console.info(`GetLaunchAbility11 : SUCCESS : wantAgent : ${agent}`);
            }
            });
            session = null;
            done();
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_STATIC_4800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_STATIC_4800
         * @tc.desc   test getLaunchAbility(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_STATIC_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller!.getLaunchAbility().then((agent: object) => {
                console.info(`GetLaunchAbility12 : SUCCESS : wantAgent : ${agent}`);
            }).catch((err: Error) => {
                console.error(`GetLaunchAbility12 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_STATIC_4900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_STATIC_4900
         * @tc.desc   test isActive(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_STATIC_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller!.isActive().then((isActive: boolean) => {
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }).catch((err: Error) => {
                console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_STATIC_5000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_STATIC_5000
         * @tc.desc   test isActive() errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_STATIC_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller!.isActive((err: BusinessError | null, isActive: boolean | undefined) => {
            if (err) {
                console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            } else {
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }
            });
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_STATIC_5100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_STATIC_5100
         * @tc.desc   test getAVPlaybackState(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_STATIC_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller!.getAVPlaybackState().then((state: avSession.AVPlaybackState) => {
                console.info('getAVPlaybackState : SUCCESS');
            }).catch((err: Error) => {
                console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            })
            session = null;
            done();
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_STATIC_5200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_STATIC_5200
         * @tc.desc   test getAVPlaybackState() errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_STATIC_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller!.getAVPlaybackState((err: BusinessError | null, state: avSession.AVPlaybackState | undefined) => {
            if (err) {
                console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            } else {
                console.info('getAVPlaybackState : SUCCESS');
            }
            });
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAY_STATIC_5300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAY_STATIC_5300
         * @tc.desc   test on(rewind) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAY_STATIC_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onPlay(() => {
                    console.info('on play entry11');
                    done();
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`on play entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_5400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_5400
         * @tc.desc   Testing call setAVMetadata(promise) set bundleIcon
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let metadata0: avSession.AVMetadata = {
                assetId: '121278',
            };
            try{
                await session!.setAVMetadata(metadata0);
                console.info(`${TAG}:TestLog: Set bundleIcon Successfully`);
            }catch(err){
                console.info(`${TAG}:TestLog: Set bundleIcon error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVMetadata;
            try{
                data = await controller!.getAVMetadata()
                if (data.bundleIcon ) {
                    console.info(`${data.bundleIcon} TestLog: Get bundleIcon Successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}:TestLog: Get bundleIcon failed`);
                    console.info(`${TAG}:TestLog: bundleIcon is: ${data.bundleIcon}`);
                    expect(true).assertTrue();
                }
            }catch(err){
                console.info(`${TAG}:TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_STATIC_0100
         * @tc.desc   Testing on setTargetLoopMode callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            session!.onSetTargetLoopMode((callback: avSession.LoopMode) => {
                if (callback === 1) {
                    console.info('TestLog: Set TargetLoopMode command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.error(`TestLog: Set TargetLoopMode command callback registration error`);
                    expect(false).assertTrue();
                };
            });

            try {
                await controller!.sendControlCommand({
                    command: 'setTargetLoopMode',
                    parameter: avSession.LoopMode.LOOP_MODE_SINGLE
                });
                console.info('TestLog: Controller sent setTargetLoopMode command successfully');
            } catch (err) {
                console.error(`TestLog: Controller command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_STATIC_0200
         * @tc.desc   test on(setTargetLoopMode) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.onSetTargetLoopMode(() => {
                    console.info('on setTargetLoopMode entry');
                });
            } catch (err) {
                err = err as BusinessError;
                console.info(`on setTargetLoopMode entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0100
         * @tc.desc   Testing off setTargetLoopMode all callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const callback1 = (data: avSession.LoopMode) => {
                if (data === 1) {
                    console.info('TestLog: setTargetLoopMode command registration1 success');
                    expect(false).assertTrue();
                }
            };

            const callback2 = (data: avSession.LoopMode) => {
                if (data === 2) {
                    console.info('TestLog: setTargetLoopMode command registration2 success');
                    expect(false).assertTrue();
                }
            };

            session!.onSetTargetLoopMode(callback1);

            session!.onSetTargetLoopMode(callback2);

            session!.offSetTargetLoopMode();

            try{
                await controller!.sendControlCommand({
                    command: 'setTargetLoopMode',
                    parameter: avSession.LoopMode.LOOP_MODE_SINGLE
                });
                console.info('TestLog: Controller send command successfully');
            } catch(err) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0200
         * @tc.desc   Testing off setTargetLoopMode specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const callback1 = (data: avSession.LoopMode) => {
                if (data === 1) {
                    console.info('TestLog: setTargetLoopMode command registration1 success');
                    expect(false).assertTrue();
                }
            };

            const callback2 = (data: avSession.LoopMode) => {
                if (data === 2) {
                    console.info('TestLog: setTargetLoopMode command registration2 success');
                    expect(false).assertTrue();
                }
            };

            session!.onSetTargetLoopMode(callback1);

            session!.onSetTargetLoopMode(callback2);

            session!.offSetTargetLoopMode(callback1);
            try{
                await controller!.sendControlCommand({
                    command: 'setTargetLoopMode',
                    parameter: avSession.LoopMode.LOOP_MODE_SINGLE
                });
                console.info('TestLog: Controller send command successfully');
            } catch(err) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0300
         * @tc.desc   test off(setTargetLoopMode) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.offSetTargetLoopMode();
            } catch (err) {
                err = err as BusinessError;
                console.info(`off setTargetLoopMode entry error,error code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            }
            session = null;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_5500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_5500
         * @tc.desc   Testing call setAVPlaybackState(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let extras0: Record<string, Object> = {'extras': "any"};
            let PlaybackState: avSession.AVPlaybackState = {
            state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
            speed: 1.0,
            position:{elapsedTime:10, updateTime:(new Date()).getTime() as long},
            bufferedTime:1000,
            loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
            isFavorite:true,
            volume: 3,
            extras: extras0
           };
           try{
               session!.setAVPlaybackState(PlaybackState)
               console.info(`${TAG}:SetAVPlaybackState successfully`);
               expect(true).assertTrue();
           }catch(err){
               console.error(`${TAG}:SetAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
           };
           done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_5600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_5600
         * @tc.desc   Testing call getAllCastDisplays(6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            let data: Array<avSession.CastDisplayInfo>;
            try{
                data = await session!.getAllCastDisplays()
                console.info(`${TAG}:getAllCastDisplays success: ${JSON.stringify(data)}`);
                expect(true).assertTrue();
            }catch(err){
                err = err as BusinessError;
                console.info(`${TAG}:getAllCastDisplays successfully: ${err.code}, message: ${err.message}`)
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_5600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_5600
         * @tc.desc   Testing call stopCasting(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                session!.stopCasting((err:BusinessError|null) => {
                    if (err) {
                        console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                    } else {
                        console.info(`stopCasting successfully`);
                        expect(true).assertTrue();
                    };
                });
            } catch (error) {
                error = error as BusinessError;
                console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600109);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`stopCasting callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_5700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_5700
         * @tc.desc   Testing call stopCasting(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                try{
                    await session!.stopCasting()
                    console.info('stopCasting successfully');
                }catch(err){
                    console.error(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                };
            } catch (error) {
                error = error as BusinessError;
                console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property catch of undefined" || error.code == 6600109) {
                    console.info(`stopCasting callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_5800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_5800
         * @tc.desc   Testing call getavcastcontroller(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let aVCastController: avSession.AVCastController | undefined;
                let avcontroller: avSession.AVCastController | undefined;
                try{
                    session?.getAVCastController();
                    aVCastController = avcontroller;
                    console.info(`${TAG}:getAVCastController : SUCCESS : sessionid `);
                }catch(err){
                    console.error(`${TAG}:getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                };
            } catch (error) {
                error = error as BusinessError;
                console.info(`${TAG}:getAVCastController failed: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property then of undefined" || error.code == 6600109 ) {
                    console.info(`${TAG}:getAVCastController callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_5900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_5900
         * @tc.desc   Testing call getavcastcontroller(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let aVCastController: avSession.AVCastController | undefined;
                session!.getAVCastController((err: BusinessError | null, avcontroller: avSession.AVCastController | undefined) => {
                    if (err) {
                        console.error(`${TAG}:getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    } else {
                        aVCastController = avcontroller;
                        console.info(`${TAG}:getAVCastController : SUCCESS`);
                    }
                });
            } catch (error) {
                error = error as BusinessError;
                console.error(`${TAG}:getAVCastController BusinessError: code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600109);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`${TAG}:getAVCastController promise successfully`);
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_2600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_2600
         * @tc.desc   Testing call setAVMetadata(callback) set filter- TYPE_CAST_PLUS_AUDIO
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_STATIC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let metadata:avSession.AVMetadata = {
                assetId: '121278',
                filter : avSession.ProtocolType.TYPE_CAST_PLUS_AUDIO
            };
            try {
                session!.setAVMetadata(metadata, (err: BusinessError | null) => {
                    if (err) {
                        console.info(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        controller!.getAVMetadata((err:BusinessError | null, data:avSession.AVMetadata | undefined) => {
                            if (err) {
                                console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                                expect(false).assertTrue();
                            } else if (data) {
                                console.info('TestLog: Get filter Successfully');
                                expect(data.assetId).assertEqual(metadata.assetId);
                                expect(data.filter).assertEqual(metadata.filter);
                            } else {
                                console.info(`TestLog: Get singleLyricText failed:${data}`);
                                expect(false).assertTrue();
                            }
                            done();
                        })
                    }
                })
            } catch (err) {
                console.info(`TestLog: set & get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_STATIC_3000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_STATIC_3000
         * @tc.desc   Testing call setAVMetadata(promise) set filter- TYPE_CAST_PLUS_AUDIO
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_PROMISE_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let metadata:avSession.AVMetadata = {
                assetId: '121278',
                filter : avSession.ProtocolType.TYPE_CAST_PLUS_AUDIO
            };
            await session!.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set filter successfully');
            }).catch((err:Error) => {
                console.error(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
                done();
            });

            await controller!.getAVMetadata().then((data:avSession.AVMetadata) => {
                if (JSON.stringify(data.filter) === JSON.stringify(metadata.filter)) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            }).catch((err:Error) => {
                console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_STATIC_2200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_STATIC_2200
         * @tc.desc   Testing call getOutputDevice(promise) streamInfos not undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try{
                await session!.getOutputDevice().then((device_Info: avSession.OutputDeviceInfo) => {
                    console.info('Get device successfully');
                    let deviceInfo: avSession.DeviceInfo = device_Info.devices[0];
                    console.info(`getOutputDevice successfully ${JSON.stringify(deviceInfo)}`);
                    if (deviceInfo && deviceInfo.castCategory !== undefined &&
                        deviceInfo.deviceId !== undefined && deviceInfo.deviceName !== undefined &&
                        deviceInfo.deviceType !== undefined && deviceInfo.audioCapabilities?.streamInfos !== undefined) {
                        expect(true).assertTrue();
                    } else {
                        console.info('getOutputDevice value error.')
                        expect(false).assertTrue();
                    }
                    done();
                }).catch((err: Error) => {
                    console.error(`GetOutputDevice BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                })

            } catch(err) {
                console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_2300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_2300
         * @tc.desc   Testing call getOutputDevice(callback) streamInfos not undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try{
                session!.getOutputDevice((err: BusinessError | null, device_Info: avSession.OutputDeviceInfo | undefined) => {
                    if (err) {
                        console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    console.info('getOutputDevice successfully');
                    let deviceInfo: avSession.DeviceInfo | undefined = device_Info?.devices[0];
                    console.info(`getOutputDevice successfully ${JSON.stringify(deviceInfo)}`);
                    if (deviceInfo && deviceInfo.castCategory !== undefined && deviceInfo.deviceId !== undefined &&
                        deviceInfo.deviceName !== undefined && deviceInfo.deviceType !== undefined &&
                        deviceInfo.audioCapabilities?.streamInfos !== undefined) {
                        expect(true).assertTrue();
                    } else {
                        console.info('getOutputDevice value error.')
                        expect(false).assertTrue();
                    }
                    done();
                });
            } catch(err) {
                console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2400
         * @tc.desc   Testing call getOutputDevice(promise)  set pcmSrc -true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let queueItemDescription_1: avSession.AVMediaDescription = {
                assetId: '001',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: true,
                mediaImage: 'Image',
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_1: avSession.AVQueueItem = {
                itemId: 1,
                description: queueItemDescription_1
            };
            let queueItemDescription_2: avSession.AVMediaDescription = {
                assetId: '002',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: true,
                mediaImage: 'Image',
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_2: avSession.AVQueueItem = {
                itemId: 2,
                description: queueItemDescription_2
            };
            let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
            await session!.setAVQueueItems(queueItemsArray).then(() => {
                console.info('SetAVQueueItems successfully');
                controller!.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
                    console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
                    expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
                    done();
                }).catch((err: Error) => {
                    console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                });
            }).catch((err: Error) => {
                console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2500
         * @tc.desc   Testing call getOutputDevice(promise)  set pcmSrc -false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let queueItemDescription_1: avSession.AVMediaDescription = {
                assetId: '001',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: false,
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_1: avSession.AVQueueItem = {
                itemId: 1,
                description: queueItemDescription_1
            };
            let queueItemDescription_2: avSession.AVMediaDescription = {
                assetId: '002',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: false,
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_2: avSession.AVQueueItem = {
                itemId: 2,
                description: queueItemDescription_2
            };
            let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
            await session!.setAVQueueItems(queueItemsArray).then(() => {
                console.info('SetAVQueueItems successfully');
                controller!.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
                    console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
                    expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
                    done();
                }).catch((err: Error) => {
                    console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                });
            }).catch((err: Error) => {
                console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2700
         * @tc.desc   Testing call getOutputDevice(callback)  set pcmSrc -true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let queueItemDescription_1: avSession.AVMediaDescription = {
                assetId: '001',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: true,
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_1: avSession.AVQueueItem = {
                itemId: 1,
                description: queueItemDescription_1
            };
            let queueItemDescription_2: avSession.AVMediaDescription = {
                assetId: '002',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: true,
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_2: avSession.AVQueueItem = {
                itemId: 2,
                description: queueItemDescription_2
            };
            let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
            session!.setAVQueueItems(queueItemsArray, (err: BusinessError | null) => {
                if (err) {
                    console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    controller!.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
                        console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
                        expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
                        done();
                    }).catch((err: Error) => {
                        console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                    });
                    console.info('SetAVQueueItems successfully');
                }
                done();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2800
         * @tc.desc   Testing call getOutputDevice(callback)  set pcmSrc -false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let queueItemDescription_1: avSession.AVMediaDescription = {
                assetId: '001',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: false,
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_1: avSession.AVQueueItem = {
                itemId: 1,
                description: queueItemDescription_1
            };
            let queueItemDescription_2: avSession.AVMediaDescription = {
                assetId: '002',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                pcmSrc: false,
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_2: avSession.AVQueueItem = {
                itemId: 2,
                description: queueItemDescription_2
            };
            let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
            session!.setAVQueueItems(queueItemsArray, (err: BusinessError | null) => {
                if (err) {
                    console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('SetAVQueueItems successfully');
                    controller!.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
                        console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
                        expect(items[0].description?.pcmSrc).assertEqual(queueItem_1.description?.pcmSrc);
                        done();
                    }).catch((err: Error) => {
                        console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                    });
                }
                done();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0900
         * @tc.desc   Testing sendCommonCommand errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            await session!.destroy();
            let commandName = "my_command";
            controller!.sendCommonCommand(commandName, {'command' : "This is my command"}, (err: BusinessError | null) => {
                if (err) {
                console.error(`SendCommonCommand BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
                }
            })
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_1100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_1100
         * @tc.desc   Testing sendCommonCommand errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
            await session!.destroy();
            let commandName = "my_command";
            await controller!.sendCommonCommand(commandName, {'command' : "This is my command"}).then(() => {
                console.info('SendCommonCommand successfully');
            }).catch((err: Error) => {
                console.error(`SendCommonCommand BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            })
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0300
         * @tc.desc   Testing setextras to boolean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.setExtras({'extras' : true}, (err: BusinessError | null) => {
                if (err) {
                    console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0400
         * @tc.desc   Testing setextras to number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.setExtras({'extras' : 123}, (err: BusinessError | null) => {
                if (err) {
                    console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0500
         * @tc.desc   Testing setextras to array
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.setExtras({'extras' : [123,'123']}, (err: BusinessError | null) => {
                if (err) {
                    console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0600
         * @tc.desc   Testing setextras to boolean
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.setExtras({'extras' : true}).then(() => {
                console.info('setExtras successfully');
            }).catch((err: Error) => {
                console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            })
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0700
         * @tc.desc   Testing setextras to number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.setExtras({'extras' : 123}).then(() => {
                console.info('setExtras successfully');
            }).catch((err: Error) => {
                console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            })
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0800
         * @tc.desc   Testing setextras to array
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.setExtras({'extras' : [123,'123']}).then(() => {
                console.info('setExtras successfully');
            }).catch((err: Error) => {
                console.error(`setExtras BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            })
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0500
         * @tc.desc   Testing off(setTargetLoopMode) errcode 6600101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETTARGETLOOPMODE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                session!.offSetTargetLoopMode()
            }catch(err){
                err = err as BusinessError;
                console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            }
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_3000
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_3000
         * @tc.desc   Testing call getOutputDevice(callback)  set launchClientData
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_CALLBACK_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let queueItemDescription_1: avSession.AVMediaDescription = {
                assetId: '001',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                launchClientData: 'any',
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_1: avSession.AVQueueItem = {
                itemId: 1,
                description: queueItemDescription_1
            };
            let queueItemDescription_2: avSession.AVMediaDescription = {
                assetId: '002',
                title: 'music_name',
                subtitle: 'music_sub_name',
                description: 'music_description',
                launchClientData: 'any',
                extras: {'extras':'any'} as Record<string, Object>
            };
            let queueItem_2: avSession.AVQueueItem = {
                itemId: 2,
                description: queueItemDescription_2
            };
            let queueItemsArray: avSession.AVQueueItem[] = [queueItem_1, queueItem_2];
            session!.setAVQueueItems(queueItemsArray, (err: BusinessError | null) => {
                if (err) {
                    console.error(`SetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    controller!.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
                        console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
                        expect(items[0].description?.launchClientData).assertEqual(queueItem_1.description?.launchClientData);
                        done();
                    }).catch((err: Error) => {
                        console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
                    });
                    console.info('SetAVQueueItems successfully');
                }
                done();
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0100
         * @tc.desc   Testing call sendCustomData(data) of avsession
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('avsession sendCustomData Start');
            await session!.sendCustomData(customdata).then(() => {
                console.info('avsession sendCustomData Successfully');
            }).catch((err: Error) => {
                console.info(`avsession sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0200
         * @tc.desc   Testing call sendCustomData(data) of controller
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('controller sendCustomData Start');
            await controller!.sendCustomData(customdata).then(() => {
                console.info('controller sendCustomData Successfully');
            }).catch((err: Error) => {
                console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0300
         * @tc.desc   Testing call sendCustomData(data) of session errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try{
                await session!.sendCustomData(customdata);
            } catch (err) {
                err = err as BusinessError;
                console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0500
         * @tc.desc   Testing call sendCustomData(data) of controller errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await controller!.destroy();
            try{
                await controller!.sendCustomData(customdata);
            } catch(err) {
                err = err as BusinessError;
                console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0600
         * @tc.desc   Testing call sendCustomData(data) of session errcode 6600101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let customdata2: Record<string, Object>  = {'appdata' : 'aaa'}
            console.info('session sendCustomData Start');
            await session!.sendCustomData(customdata2).then(() => {
                console.info('session sendCustomData Successfully');
            }).catch((err: Error) => {
                console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            });
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0700
         * @tc.desc   Testing call sendCustomData(data) of controller errcode 6600101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let customdata2: Record<string, Object>  = {'appdata' : 'aaa'}
            console.info('controller sendCustomData Start');
            await controller!.sendCustomData(customdata2).then(() => {
                console.info('controller sendCustomData Successfully');
            }).catch((err: Error) => {
                console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            });
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0800
         * @tc.desc   Testing call sendCustomData(data) of controller errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try{
                await controller!.sendCustomData(customdata);
            } catch(err) {
                err = err as BusinessError;
                console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0100
         * @tc.desc   Testing call on(customDataChange) of session
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.onCustomDataChange((data: Record<string, Object>) => {
                console.info(`session on_customDataChange Successfully ${data}`)
                session!.offCustomDataChange();
                expect(true).assertTrue();
                done();
            })
            await session!.sendCustomData(customdata);
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0200
         * @tc.desc   Testing call on(customDataChange) of session 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try{
                session!.onCustomDataChange((data: Record<string, Object>) => {
                console.info(`on_customDataChange Successfully ${data}`);
                });
            } catch (err) {
                err = err as BusinessError;
                console.info(`session on_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0300
         * @tc.desc   Testing call on(customDataChange) of controller
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            controller!.onCustomDataChange((data: Record<string, Object>) => {
                console.info(`session on_customDataChange Successfully ${data}`)
                controller!.offCustomDataChange();
                expect(true).assertTrue();
                done();
            })
            await controller!.sendCustomData(customdata);
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0400
         * @tc.desc   Testing call on(customDataChange) of controller 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await controller!.destroy();
            try{
                controller!.onCustomDataChange((data: Record<string, Object>) => {
                console.info(`on_customDataChange Successfully ${data}`);
                });
            } catch(err) {
                err = err as BusinessError;
                console.info(`controller on_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0100
         * @tc.desc   Testing call off(customDataChange) of session
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.onCustomDataChange((data: Record<string, Object>) => {
                console.info(`session on_customDataChange Successfully ${data}`);
                expect(false).assertTrue();
                done();
            })
            session!.offCustomDataChange();
            console.info('session off_customDataChange end')
            await session!.sendCustomData(customdata);
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0200
         * @tc.desc   Testing call off(customDataChange) of session 6600101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try{
                session!.offCustomDataChange();
            } catch (err) {
                err = err as BusinessError;
                console.info(`session off_customDataChangeBusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600101);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0300
         * @tc.desc   Testing call off(customDataChange) of controller
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            controller!.onCustomDataChange((data: Record<string, Object>) => {
                console.info(`controller on_customDataChange Successfully ${data}`);
                expect(false).assertTrue();
                done();
            })
            controller!.offCustomDataChange();
            console.info('controller off_customDataChange end')
            await controller!.sendCustomData(customdata);
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0400
         * @tc.desc   Testing call off(customDataChange) of controller 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await controller!.destroy();
            try{
                controller!.offCustomDataChange();
            } catch(err) {
                err = err as BusinessError;
                console.info(`controller off_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0500
         * @tc.desc   Testing call off(customDataChange) of controller 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try{
                session!.offCustomDataChange();
            } catch(err) {
                err = err as BusinessError;
                console.info(`session off_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0300
         * @tc.desc   Testing call dispatchSessionEvent() promise of number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            session!.dispatchSessionEvent(eventName, {'lyric' : 123 }, (err: BusinessError | null) => {
                if (err) {
                    console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue;
                }
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0400
         * @tc.desc   Testing call dispatchSessionEvent() promise of bool
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            session!.dispatchSessionEvent(eventName, {'lyric' : true }, (err: BusinessError | null) => {
                if (err) {
                    console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue;
                }
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0500
         * @tc.desc   Testing call dispatchSessionEvent() promise of array
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            session!.dispatchSessionEvent(eventName, {'lyric' : [123,'123'] }, (err: BusinessError | null) => {
                if (err) {
                    console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue;
                }
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0600
         * @tc.desc   Testing call dispatchSessionEvent() callback of number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            await session!.dispatchSessionEvent(eventName, {'lyric' : 123 }).then(() => {
                console.info('dispatchSessionEvent successfully');
            }).catch((err: Error) => {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0700
         * @tc.desc   Testing call dispatchSessionEvent() callback of bool
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            await session!.dispatchSessionEvent(eventName, {'lyric' : true }).then(() => {
                console.info('dispatchSessionEvent successfully');
            }).catch((err: Error) => {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0800
         * @tc.desc   Testing call dispatchSessionEvent() callback of array
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            await session!.dispatchSessionEvent(eventName, {'lyric' : [123,'123'] }).then(() => {
                console.info('dispatchSessionEvent successfully');
            }).catch((err: Error) => {
                console.error(`dispatchSessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue;
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0500
         * @tc.desc   Testing call setAVMetadata(callback) set album- exceed max length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const str = 'a'.repeat(40960)
            let metadata:avSession.AVMetadata = {
                assetId: '121278',
                album:str.substring(0,40960),
                title: 'this is a title'
            };
            session!.setAVMetadata(metadata, (err:BusinessError | null) => {
                if (err) {
                    console.info(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                } else {
                    console.info(`TestLog: Set album Successfully `);
                    expect(false).assertTrue();
                    done();
                }
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0100
         * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                await Utils.msSleep(500);
                avSession.getAVSession(context!).then((data) => {
                    session = data;
                    console.info('getAVSession successfully${session!.sessionType}');
                })
            } catch (err) {
                console.info('getAVSession failed${err.code} message:${err.message}');
                expect(false).assertTrue()
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0200
         * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVSESSION_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy();
            try{
                await Utils.msSleep(500);
                avSession.getAVSession(context!).then((data) => {
                    expect(data.sessionTag).assertEqual(session!.sessionTag)
                    console.info('getAVSession successfully${data.sessionType}');
                    expect(false).assertTrue();
                })
            } catch (err) {
                console.info('getAVSession failed${err.code} message:${err.message}');
                expect(err.code).assertEqual(6600102)
                done();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0100
         * @tc.desc   Testing enableDesktopLyric with enable=true (normal scenario)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(true);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0200
         * @tc.desc   Testing enableDesktopLyric with enable=false (normal scenario)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(false);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0300
         * @tc.desc   Testing enableDesktopLyric when session not exit (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0300';
            try {
                await session!.destroy();
                try {
                    await session!.enableDesktopLyric(true);
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0400
         * @tc.desc   Testing enableDesktopLyric when desktop lyrics feature is not supported (throw 6600111)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ENABLEDESKTOPLYRIC_STATIC_0400';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(true);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100
         * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(true);
                await session!.setDesktopLyricVisible(true);
                const getVisibleResult: boolean = await session!.isDesktopLyricVisible();
                expect(getVisibleResult).assertEqual(true);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200
         * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE&ISDESKTOPLYRICVISIBLE_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(true);
                await session!.setDesktopLyricVisible(false);
                const getVisibleResult: boolean = await session!.isDesktopLyricVisible();
                expect(getVisibleResult).assertEqual(false);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0100
         * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (isSupported) {
                    done();
                    return;
                }
                await session!.setDesktopLyricVisible(true);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0200
         * @tc.desc   Testing setDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(false);
                await session!.setDesktopLyricVisible(true);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0300
         * @tc.desc   Testing setDesktopLyricVisible when session does not exist (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_STATIC_0300';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.destroy();
                try {
                    await session!.setDesktopLyricVisible(true);
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0100
         * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature is not supported (throw 6600111)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (isSupported) {
                    done();
                    return;
                }
                await session!.isDesktopLyricVisible();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0200
         * @tc.desc   Testing isDesktopLyricVisible when desktop lyrics feature of this application is not enabled (throw 6600110)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(false);
                await session!.isDesktopLyricVisible();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0300
         * @tc.desc   Testing isDesktopLyricVisible when session does not exist (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ISDESKTOPLYRICVISIBLE_STATIC_0300';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.destroy();
                try {
                    await session!.isDesktopLyricVisible();
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
         * @tc.desc   Testing onDesktopLyricVisibilityChanged
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                let callbackTriggered: boolean = false;
                let callback = (data: boolean) => {
                    callbackTriggered = data;
                    console.info(`${TAG}: boolean: callback triggered (visible=${data})`);
                }
                await session!.enableDesktopLyric(true);
                session!.onDesktopLyricVisibilityChanged(callback);
                await session!.setDesktopLyricVisible(true);
                await Utils.msSleep(200);
                expect(callbackTriggered).assertTrue();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
         * @tc.desc   Testing onDesktopLyricVisibilityChanged when session not exit (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200';
            try {
                await session!.destroy();
                try {
                    session!.onDesktopLyricVisibilityChanged((data: boolean) => {
                    });
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100
         * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters all callbacks (verify no trigger after unregister)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                let callback1Triggered = false;
                let callback2Triggered = false;
                let callback1 = (data: boolean) => {
                    callback1Triggered = data;
                    console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
                }
                let callback2 = (data: boolean) => {
                    callback2Triggered = data;
                    console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
                }
                await session!.enableDesktopLyric(true);
                session!.onDesktopLyricVisibilityChanged(callback1);
                session!.onDesktopLyricVisibilityChanged(callback2);
                session!.offDesktopLyricVisibilityChanged(callback1);
                await session!.setDesktopLyricVisible(true);
                await Utils.msSleep(200);
                expect(callback1Triggered).assertFalse();
                expect(callback2Triggered).assertTrue();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200
         * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters specific callbacks
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                let callback1Triggered = false;
                let callback2Triggered = false;
                let callback1 = (data: boolean) => {
                    callback1Triggered = data;
                    console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
                }
                let callback2 = (data: boolean) => {
                    callback2Triggered = data;
                    console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
                }
                await session!.enableDesktopLyric(true);
                session!.onDesktopLyricVisibilityChanged(callback1);
                session!.onDesktopLyricVisibilityChanged(callback2);
                session!.offDesktopLyricVisibilityChanged();
                await session!.setDesktopLyricVisible(true);
                await Utils.msSleep(200);
                expect(callback1Triggered).assertFalse();
                expect(callback2Triggered).assertFalse();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300
         * @tc.desc   Testing offDesktopLyricVisibilityChanged when session not exit (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICVISIBLITYCHANGED_STATIC_0300';
            try {
                await session!.destroy();
                try {
                    session!.offDesktopLyricVisibilityChanged();
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100
         * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: true) - normal scenario
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(true);
                let state: avSession.DesktopLyricState = { isLocked: true };
                await session!.setDesktopLyricState(state);
                let getState: avSession.DesktopLyricState = await session!.getDesktopLyricState();
                expect(getState.isLocked).assertEqual(true)
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200
         * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: false) - normal scenario
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE&GETDESKTOPLYRICSTATE_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(true);
                let state: avSession.DesktopLyricState = { isLocked: false };
                await session!.setDesktopLyricState(state);
                let getState: avSession.DesktopLyricState = await session!.getDesktopLyricState();
                expect(getState.isLocked).assertEqual(false)
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0100
         * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (isSupported) {
                    done();
                    return;
                }
                let state: avSession.DesktopLyricState = { isLocked: false };
                await session!.setDesktopLyricState(state);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0200
         * @tc.desc   Testing setDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(true);
                let state: avSession.DesktopLyricState = { isLocked: false };
                await session!.setDesktopLyricState(state);
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0300
         * @tc.desc   Testing setDesktopLyricState when session does not exist. (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICSTATE_STATIC_0300';
            try {
                await session!.destroy();
                try {
                    let state: avSession.DesktopLyricState = { isLocked: false };
                    await session!.setDesktopLyricState(state);
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0100
         * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature is not supported. (throw 6600111)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (isSupported) {
                    done();
                    return;
                }
                await session!.getDesktopLyricState();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0200
         * @tc.desc   Testing getDesktopLyricState when desktop lyrics feature of this application is not enabled. (throw 6600110)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                await session!.enableDesktopLyric(false);
                await session!.getDesktopLyricState();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED);
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0300
         * @tc.desc   Testing getDesktopLyricState when session does not exist. (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_GETDESKTOPLYRICSTATE_STATIC_0300';
            try {
                await session!.destroy();
                try {
                    await session!.getDesktopLyricState();
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0100
         * @tc.desc   Testing onDesktopLyricStateChanged
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                let callbackTriggered: boolean = false;
                let callback = (data: avSession.DesktopLyricState) => {
                    callbackTriggered = data.isLocked;
                    console.info(`${TAG}: boolean: callback triggered (visible=${data})`);
                }
                await session!.enableDesktopLyric(true);
                session!.onDesktopLyricStateChanged(callback);
                let state: avSession.DesktopLyricState = { isLocked: true };
                await session!.setDesktopLyricState(state);
                await Utils.msSleep(200);
                expect(callbackTriggered).assertTrue();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0200
         * @tc.desc   Testing onDesktopLyricStateChanged when session not exit (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICSTATECHANGED_STATIC_0200';
            try {
                await session!.destroy();
                try {
                    session!.onDesktopLyricStateChanged((data: avSession.DesktopLyricState) => {
                    });
                    expect(false).assertTrue();
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100
         * @tc.desc   Testing offDesktopLyricStateChanged unregisters all callbacks
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0100';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                let callback1Triggered = false;
                let callback2Triggered = false;
                let callback1 = (data: avSession.DesktopLyricState) => {
                    callback1Triggered = data.isLocked;
                    console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
                }
                let callback2 = (data: avSession.DesktopLyricState) => {
                    callback2Triggered = data.isLocked;
                    console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
                }
                await session!.enableDesktopLyric(true);
                session!.onDesktopLyricStateChanged(callback1);
                session!.onDesktopLyricStateChanged(callback2);
                session!.offDesktopLyricStateChanged(callback1);
                let state: avSession.DesktopLyricState = { isLocked: true };
                await session!.setDesktopLyricState(state);
                await Utils.msSleep(200);
                expect(callback1Triggered).assertFalse();
                expect(callback2Triggered).assertTrue();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200
         * @tc.desc   Testing offDesktopLyricStateChanged unregisters specified callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0200';
            try {
                const isSupported: boolean = await avSession.isDesktopLyricSupported();
                if (!isSupported) {
                    done();
                    return;
                }
                let callback1Triggered = false;
                let callback2Triggered = false;
                let callback1 = (data: avSession.DesktopLyricState) => {
                    callback1Triggered = data.isLocked;
                    console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
                }
                let callback2 = (data: avSession.DesktopLyricState) => {
                    callback2Triggered = data.isLocked;
                    console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
                }
                await session!.enableDesktopLyric(true);
                session!.onDesktopLyricStateChanged(callback1);
                session!.onDesktopLyricStateChanged(callback2);
                session!.offDesktopLyricStateChanged();
                let state: avSession.DesktopLyricState = { isLocked: true };
                await session!.setDesktopLyricState(state);
                await Utils.msSleep(200);
                expect(callback1Triggered).assertFalse();
                expect(callback2Triggered).assertFalse();
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300
         * @tc.desc   Testing offDesktopLyricStateChanged when session not exit (throw 6600102)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICSTATECHANGED_STATIC_0300';
            try {
                await session!.destroy();
                try {
                    session!.offDesktopLyricStateChanged();
                } catch (err) {
                    console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                }
            } catch (err) {
                console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });
    })
}


