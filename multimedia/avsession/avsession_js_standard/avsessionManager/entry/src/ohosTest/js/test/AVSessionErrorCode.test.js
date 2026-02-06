/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import WantAgent from '@ohos.wantAgent';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSessionErrorCode() {
    describe('AVSessionErrorCode', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        const INVALID_STRING = "invalid string";
		const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
		const UPDATE_LYRICS_WANT_PARAMS = {
			lyric: "This is my lyrics"
		};
        const QUEUE_ITEM_ID = 666;
		const QUEUE_ITEM_KEY_WORD = "QUEUE_ITEM_RELATE";
		const EXTRAS = {
			"items_author": "name"
		};
        const QUEUE_ITEM_DESCRIPTION = {
			mediaId: QUEUE_ITEM_KEY_WORD,
			title: QUEUE_ITEM_KEY_WORD,
			extras: EXTRAS,
			iconUri: "iconUri",
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
		const QUEUE_ITEM_DESCRIPTION_ERROR = {
			mediaId: QUEUE_ITEM_KEY_WORD,
			title: QUEUE_ITEM_KEY_WORD,
			extras: EXTRAS,
			icon: undefined,
			iconUri: "iconUri",
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
		const QUEUE_ITEM = {
			itemId: QUEUE_ITEM_ID,
			description: QUEUE_ITEM_DESCRIPTION
		}
		const QUEUE_ITEM_ERROR = {
			itemId: QUEUE_ITEM_ID,
			description: QUEUE_ITEM_DESCRIPTION_ERROR
		}
		const ITEMS_ARRAY = [QUEUE_ITEM];
		const ITEMS_ARRAY_ERROR = [QUEUE_ITEM_ERROR];
        const QUEUE_TITLE = "title";
		const CUSTOM_EXTRAS = {
			extras: "This is custom media packet"
		};
        let context = featureAbility.getContext();

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function invalidSession(validFunc) {
            await session.destroy().then(async () => {
                console.info('TestLog: session destroy success');
                await validFunc();
                session = null;
            }).catch(err => {
                console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            })
        }

        function callback1() { }
        function callback2() { }

        function offCallbackInvalidParam(eventName) {
            try {
                session.off(eventName, callback1, callback2);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(401);
            }
        }

        async function offCallbackInvalidSession(eventName) {
            await invalidSession(() => {
                try {
                    session.off(eventName)
                    expect().assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(6600102);
                }
            });
        }

        function onCallbackInvalidParam(eventName) {
            try {
                session.on(eventName);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(401);
            }
        }

        async function onCallbackInvalidSession(eventName) {
            await invalidSession(() => {
                try {
                    session.on(eventName, callback1);
                    expect().assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(6600102);
                }
            });
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            if (!session) {
                await avSession.createAVSession(context, tag, type).then((data) => {
                    session = data;
                }).catch((err) => {
                    expect(err.code == 6600101).assertTrue();
                    console.info(avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION);
                    console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });

            controller = await session.getController();
        })

        afterEach(async function (done) {
            console.info('TestLog: Destroy Session And Controller');
            if (session) {
                await session.destroy().then(() => {
                    console.info('TestLog: Session destroy success');
                    session = null;
                }).catch((err) => {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }
            if (controller) {
                await controller.destroy().then(() => {
                    console.info('TestLog: Controller destroy success');
                    controller = null;
                }).catch((err) => {
                    console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0100
         * @tc.desc   test setAVMetadata(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.setAVMetadata({
                    assetId: '121278'
                }).then(() => {
                    console.info('TestLog: Set AVMetadata successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: Set AVMetadata error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0200
         * @tc.desc   test setAVMetadata(promise) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.setAVMetadata().then(() => {
                console.info('TestLog: Set AVMetadata successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: Set AVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0300
         * @tc.desc   test setAVMetadata(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    session.setAVMetadata({ assetId: '121278' }, (err) => {
                        if (err) {
                            console.info(`TestLog: Set AVMetadta error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('TestLog: Set AVMetadta active successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: Set AVMetadta error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            })
        })
        
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0400
         * @tc.desc   test setAVMetadata(callback) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_ERRORCODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.setAVMetadata(err => {
                    if (err) {
                        console.info(`TestLog: Set AVMetadta error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('TestLog: Set AVMetadta active successfully');
                        expect().assertFail();
                    }
                    done();
                });
            } catch (err) {
                console.info(`TestLog: Set AVMetadta error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0100
         * @tc.desc   test setAVPlaybackState(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.setAVPlaybackState({}).then(() => {
                    console.info('TestLog: Set playbackState successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0200
         * @tc.desc   test setAVPlaybackState(promise) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.setAVPlaybackState().then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0300
         * @tc.desc   test setAVPlaybackState(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: 1.0,
                position:{elapsedTime:10, updateTime:(new Date()).getTime()},
                bufferedTime:1000,
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite:true,
            };
            await invalidSession(() => {
                try {
                    session.setAVPlaybackState(PlaybackState, (err) => {
                        if (err) {
                            console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('TestLog: Set playbackState successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0400
         * @tc.desc   test setAVPlaybackState(callback) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_ERRORCODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let PlaybackState = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: -2,
                position:{elapsedTime:-2, updateTime:(new Date()).getTime()},
                bufferedTime:-4,
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite:true,
            };
            try {
                session.setAVPlaybackState(PlaybackState, (err) => {
                    if (err) {
                        console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('TestLog: Set playbackState successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
            
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0100
         * @tc.desc   test setLaunchAbility(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let wantAgentInfo = {
                wants: [
                    {
                        bundleName: 'com.example.myapplication',
                        abilityName: 'com.example.myapplication.MainAbility'
                    }
                ],
                operationType: WantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                wantAgentFlags: [WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent;
            await WantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });
            await invalidSession(async () => {
                await session.setLaunchAbility(agent).then(() => {
                    console.info('TestLog: AVSessionTest : Set LaunchAbility');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: Set LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0200
         * @tc.desc   test setLaunchAbility(promise) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.setLaunchAbility().then(() => {
                console.info('TestLog: AVSessionTest : Set LaunchAbility');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: Set LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0300
         * @tc.desc   test setLaunchAbility(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done) {
            let wantAgentInfo = {
                wants : [
                    {
                        bundleName : 'com.example.myapplication',
                        abilityName: 'com.example.myapplication.MainAbility'
                    }
                ],
                operationType: WantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                wantAgentFlags: [WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent;
            await WantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });
            await invalidSession(() => {
                try {
                    session.setLaunchAbility(agent, err => {
                        if (err) {
                            console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('TestLog: Set launchAbility successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            })
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0400
         * @tc.desc   test setLaunchAbility(callback) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_ERRORCODE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function(done) {
            try {
                session.setLaunchAbility(null, err => {
                    if (err) {
                        console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('TestLog: Set launchAbility successfully');
                        expect().assertFail();
                    }
                    done();
                });
            } catch (err) {
                console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_0100
         * @tc.desc   test session destroy(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    session.destroy(err => {
                        if (err) {
                            console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('TestLog: Session destroy success.');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_0200
         * @tc.desc   test session destroy(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.destroy().then(() => {
                    console.info('TestLog: Session destroy success.');
                    expect().assertFail();
                }).catch(err => {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }); 
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_0100
         * @tc.desc   test activate(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.activate().then(() => {
                    console.info('TestLog: Set session active successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_0200
         * @tc.desc   test activate(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    session.activate((err) => {
                        if (err) {
                            console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('TestLog: Set session active successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            })
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_0100
         * @tc.desc   test deactivate(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.deactivate().then(() => {
                    console.info('TestLog: Deactivate session success.');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_0200
         * @tc.desc   test deactivate(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    session.deactivate((err) => {
                        if (err) {
                            console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('TestLog: Deactivate session');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_0100
         * @tc.desc   test on('play') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidSession('play');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_0200
         * @tc.desc   test on('play') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('play');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_0100
         * @tc.desc   test on('stop') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidSession('stop');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_0200
         * @tc.desc   test on('stop') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSTOP_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('stop');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_0100
         * @tc.desc   test on('pause') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidSession('pause');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_0200
         * @tc.desc   test on('pause') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPAUSE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('pause');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_0100
         * @tc.desc   test on('playNext') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('playNext');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_0200
         * @tc.desc   test on('playNext') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('playNext');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_0100
         * @tc.desc   test on('playPrevious') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('playPrevious');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_0200
         * @tc.desc   test on('playPrevious') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('playPrevious');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_0100
         * @tc.desc   test on('fastForward') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('fastForward');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_0200
         * @tc.desc   test on('fastForward') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('fastForward');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_0100
         * @tc.desc   test on('rewind') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('rewind');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_0200
         * @tc.desc   test on('rewind') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('rewind');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_0100
         * @tc.desc   test on('seek') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('seek');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_0200
         * @tc.desc   test on('seek') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSEEK_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('seek');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_0100
         * @tc.desc   test on('setSpeed') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('setSpeed');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_0200
         * @tc.desc   test on('setSpeed') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('setSpeed');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_0100
         * @tc.desc   test on('setLoopMode') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('setLoopMode');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_0200
         * @tc.desc   test on('setLoopMode') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('setLoopMode');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_0100
         * @tc.desc   test on('toggleFavorite') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('toggleFavorite');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_0200
         * @tc.desc   test on('toggleFavorite') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('toggleFavorite');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0100
         * @tc.desc   test on('handleKeyEvent') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await onCallbackInvalidSession('handleKeyEvent');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0200
         * @tc.desc   test on('handleKeyEvent') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               onCallbackInvalidParam('handleKeyEvent');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_0100
         * @tc.desc   test off('play') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await offCallbackInvalidSession('play');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_0200
         * @tc.desc   test off('play') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               offCallbackInvalidParam('play');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_0100
         * @tc.desc   test off('pause') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await offCallbackInvalidSession('pause');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_0200
         * @tc.desc   test off('pause') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               offCallbackInvalidParam('pause')
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_0100
         * @tc.desc   test off('stop') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await offCallbackInvalidSession('stop');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_0200
         * @tc.desc   test off('stop') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               offCallbackInvalidParam('stop');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_0100
         * @tc.desc   test off('playNext') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await offCallbackInvalidSession('playNext');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_0200
         * @tc.desc   test off('playNext') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               offCallbackInvalidParam('playNext');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_0100
         * @tc.desc   test off('playPrevious') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               await offCallbackInvalidSession('playPrevious');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_0200
         * @tc.desc   test off('playPrevious') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
               offCallbackInvalidParam('playPrevious');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_0100
         * @tc.desc   test off('fastForward') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('fastForward');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_0200
         * @tc.desc   test off('fastForward') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('fastForward');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_0100
         * @tc.desc   test off('rewind') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('rewind');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_0200
         * @tc.desc   test off('rewind') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('rewind');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_0100
         * @tc.desc   test off('seek') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('seek');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_0200
         * @tc.desc   test off('seek') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('seek');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_0100
         * @tc.desc   test off('setSpeed') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('setSpeed');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_0200
         * @tc.desc   test off('setSpeed') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('setSpeed');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_0100
         * @tc.desc   test off('setLoopMode') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('setLoopMode');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_0200
         * @tc.desc   test off('setLoopMode') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('setLoopMode');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_0100
         * @tc.desc   test off('toggleFavorite') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('toggleFavorite');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_0200
         * @tc.desc   test off('toggleFavorite') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('toggleFavorite');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_0100
         * @tc.desc   test off('handleKeyEvent') errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('handleKeyEvent');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_0200
         * @tc.desc   test off('handleKeyEvent') errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('handleKeyEvent');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_0100
         * @tc.desc   test getOutputDevice(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                session.getOutputDevice(err => {
                    if (err) {
                        console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(6600102);
                    } else {
                        console.info('Get device information success.');
                        expect().assertFail();
                    }
                    done();
                });
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_0200
         * @tc.desc   test getOutputDevice(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.getOutputDevice().then(() => {
                    console.info(`Get device success.`);
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                })
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_0100
         * @tc.desc   test getController(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.getController().then(() => {
                    console.info('Get controller successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`Get controller BusinessError: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_0200
         * @tc.desc   test getController(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                session.getController(async err => {
                    if (err) {
                        console.info('Get controller failed');
                        expect(err.code).assertEqual(6600102);
                    } else {
                        console.info('Get controller successfully');
                        expect().assertFail();
                    }
                    done();
                });
            });
        })

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0100
   * @tc.desc   test dispatchSessionEvent(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT).then(() => {
                console.info(`TestLog: dispatchSessionEvent success.`);
				expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0200
   * @tc.desc   test dispatchSessionEvent(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.dispatchSessionEvent(UPDATE_LYRICS_WANT_PARAMS, UPDATE_LYRICS_WANT_PARAMS).then(() => {
                console.info(`TestLog: dispatchSessionEvent success.`);
				expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0300
   * @tc.desc   test dispatchSessionEvent(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidSession(async () => {
                await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).then(() => {
                    console.info(`TestLog: dispatchSessionEvent success.`);
                    expect().assertFail();
                }).catch(err => {
                    console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102)
                });
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0400
   * @tc.desc   test dispatchSessionEvent(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, null, err => {
                    if (err) {
                        console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info(`TestLog: dispatchSessionEvent success.`);
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
			    done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0500
   * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0500
   * @tc.desc   test dispatchSessionEvent(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.dispatchSessionEvent(UPDATE_LYRICS_WANT_PARAMS, UPDATE_LYRICS_WANT_PARAMS, err => {
                    if (err) {
                        console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info(`TestLog: dispatchSessionEvent success.`);
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
			    done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0600
   * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0600
   * @tc.desc   test dispatchSessionEvent(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_ERRORCODE_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidSession(() => {
                try {
                    session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS, err => {
                        if (err) {
                            console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info(`TestLog: dispatchSessionEvent success.`);
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: dispatchSessionEvent error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0100
   * @tc.desc   test setExtras(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.setExtras().then(() => {
                console.info(`TestLog: setExtras success.`);
				expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0200
   * @tc.desc   test setExtras(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.setExtras(INVALID_STRING).then(() => {
                console.info(`TestLog: setExtras success.`);
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0300
   * @tc.desc   test setExtras(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidSession(async () => {
                await session.setExtras(CUSTOM_EXTRAS).then(() => {
                    console.info(`TestLog: setExtras success.`);
                    expect().assertFail();
                }).catch(err => {
                    console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0400
   * @tc.desc   test setExtras(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.setExtras(null, err => {
                    if (err) {
                        console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info(`TestLog: setExtras success.`);
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
			    done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0500
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0500
   * @tc.desc   test setExtras(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.setExtras(INVALID_STRING, err => {
                    if (err) {
                        console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info(`TestLog: setExtras success.`);
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
			    done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0600
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0600
   * @tc.desc   test setExtras(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_ERRORCODE_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                try {
                    session.setExtras(CUSTOM_EXTRAS, err => {
                        if (err) {
                            console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info(`TestLog: setExtras success.`);
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: setExtras error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0100
   * @tc.desc   test on('commonCommand') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('commonCommand');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0200
   * @tc.desc   test on('commonCommand') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			try {
				session.on('commonCommand', callback1, callback2);
                expect().assertFail();
			} catch (err) {
				expect(err.code).assertEqual(401);
			}
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0300
   * @tc.desc   test on('commonCommand') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			try {
				session.on('commonCommand', INVALID_STRING);
                expect().assertFail();
			} catch (err) {
				expect(err.code).assertEqual(401);
			}
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0400
   * @tc.desc   test on('commonCommand') errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidSession('commonCommand');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_0100
   * @tc.desc   test off('commonCommand') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                offCallbackInvalidParam('commonCommand');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_0200
   * @tc.desc   test off('commonCommand') errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await offCallbackInvalidSession('commonCommand');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0100
   * @tc.desc   test setAVQueueItems(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.setAVQueueItems(ITEMS_ARRAY_ERROR).then(() => {
                console.info('setAVQueueItems Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0200
   * @tc.desc   test setAVQueueItems(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.setAVQueueItems(ITEMS_ARRAY).then(() => {
                    console.info('setAVQueueItems Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0300
   * @tc.desc   test setAVQueueItems(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.setAVQueueItems(ITEMS_ARRAY_ERROR, err => {
                    if (err) {
                        console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('setAVQueueItems Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0400
   * @tc.desc   test setAVQueueItems(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(() => {
                try {
                    session.setAVQueueItems(ITEMS_ARRAY, err => {
                        if (err) {
                            console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('setAVQueueItems Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: setAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0100
   * @tc.desc   test setAVQueueTitle(promise) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await session.setAVQueueTitle({}).then(() => {
                console.info('setAVQueueTitle Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0200
   * @tc.desc   test setAVQueueTitle(promise) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await invalidSession(async () => {
                await session.setAVQueueTitle(QUEUE_TITLE).then(() => {
                    console.info('setAVQueueTitle Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0300
   * @tc.desc   test setAVQueueTitle(callback) errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.setAVQueueTitle({}, err => {
                    if (err) {
                        console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('setAVQueueTitle Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0400
   * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0400
   * @tc.desc   test setAVQueueTitle(callback) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_ERRORCODE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			await invalidSession(() => {
                try {
                    session.setAVQueueTitle(QUEUE_TITLE, err => {
                        if (err) {
                            console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('setAVQueueTitle Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: setAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0100
   * @tc.desc   test on('skipToQueueItem') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                onCallbackInvalidParam('skipToQueueItem');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0200
   * @tc.desc   test on('skipToQueueItem') errcode 401
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                session.on('skipToQueueItem', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0300
   * @tc.desc   test on('skipToQueueItem') errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_ERRORCODE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try{
                await onCallbackInvalidSession('skipToQueueItem');
            }catch{
                console.info('TestLog: off callback error');
                expect().assertFail();
                done()
            }
			done();
		})
    })
}